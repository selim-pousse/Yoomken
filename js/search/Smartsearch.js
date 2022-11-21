/*
Script: TextboxList.Smartsearch.js
	TextboxList Autocomplete plugin

	Authors:
		Guillermo Rauch
*/

(function($){
	
$.Smartsearch = function(element, _options){
    
    var original, container, list, current, focused = false, index = [], blurtimer, events = {};
    var options = $.extend(true, {
    prefix: 'textboxlist',
    max: null,
    scroll:true,
    title:'Recherche...',
        unique: false,
        uniqueInsensitive: true,
    endEditableBit: true,
        startEditableBit: false,
        hideEditableBits: true,
    inBetweenEditableBits: false,
        keys: {previous: 37, next: 39},
        bitsOptions: {editable: {}, box: {}},
        // tip: you can change encode/decode with JSON.stringify and JSON.parse
        encode: function(o){ 
            return $.grep($.map(o, function(v){     
                v = (chk(v[0]) ? v[0] : v[1]);
                return chk(v) ? v.toString().replace(/\//, '') : null;
            }), function(o){ return o != undefined; }).join('/'); 
        },
        decode: function(o){ return o.split('/'); }
  }, _options);
    
    if (element.length==0) return null;
    element = $(element);
    
    var self = this;
    var init = function(){      
        original = element.css('display', 'none').attr('autocomplete', 'off').focus(focusLast);
        container = $('<div class="'+options.prefix+'" />')
            .insertAfter(element)
            .click(function(e){ 
                if ((e.target == list.get(0) || e.target == container.get(0)) && (!focused || (current && current.toElement().get(0) != list.find(':last-child').get(0)))) focusLast();             
            });         
        list = $('<ul class="'+ options.prefix +'-bits" />').appendTo(container);
        for (var name in options.plugins) enablePlugin(name, options.plugins[name]);   
        afterInit();
    };
    
    var enablePlugin = function(name, options){
        self.plugins[name] = new $.Smartsearch[camelCase(capitalize(name))](self, options);
    };
    var afterInit = function(){
        if (options.endEditableBit) create('editable', null, {tabIndex: original.tabIndex}).inject(list);
        addEvent('bitAdd', update, true);
        addEvent('bitRemove', update, true);
        $(document).click(function(e){
            if (!focused) return;
            if (e.target.className.indexOf(options.prefix) != -1){              
                if (e.target == $(container).get(0)) return;                
                var parent = $(e.target).parents('div.' + options.prefix);
                if (parent.get(0) == container.get(0)) return;
            }
            blur();
        }).keydown(function(ev){
            if (!focused || !current) return;
            var caret = current.is('editable') ? current.getCaret() : null;
            var value = current.getValue()[1];
            var special = !!$.map(['shift', 'alt', 'meta', 'ctrl'], function(e){ return ev[e]; }).length;
            var custom = special || (current.is('editable') && current.isSelected());
            var evStop = function(){ ev.stopPropagation(); ev.preventDefault(); };
            switch (ev.which){
                case 8:
                    if (current.is('box')){ 
                        evStop();
                        return current.remove(); 
                    }
                case options.keys.previous:
                    if (current.is('box') || ((caret == 0 || !value.length) && !custom)){
                        evStop();
                        focusRelative('prev');
                    }
                    break;
                case 46:
                    if (current.is('box')){ 
                        evStop();
                        return current.remove(); 
                    }
                case options.keys.next: 
                    if (current.is('box') || (caret == value.length && !custom)){
                        evStop();
                        focusRelative('next');
                    }
            }
        });
        setValues(options.decode(original.val()));
    };
    
    var create = function(klass, value, opt){
        if (klass == 'box'){
        	//var prefix = $('#input_bysearch').attr('key');
        	var prefix = value[4];
        	//if (prefix==undefined) prefix = $('#input_bysearch').attr('key'); // input_bysearch not used anymore
        	if (prefix==undefined) prefix = 'a'; // je force le critere à automatique
        	value[0] = value[0]+'-'+prefix;
        	value[2] = '<span style="color:white">('+prefix+') </span>'+value[1];
        	
            if (chk(options.max) && list.children('.' + options.prefix + '-bit-box').length + 1 > options.max) return false;
            if (options.unique && $.inArray(uniqueValue(value), index) != -1) return false;     
        }       
        return new $.TextboxListBit(klass, value, self, $.extend(true, options.bitsOptions[klass], opt));
    };
    
    var uniqueValue = function(value){
        return chk(value[0]) ? value[0] : (options.uniqueInsensitive ? value[1].toLowerCase() : value[1]);
    }
    
    var add = function(plain, id, html, afterEl){
        var b = create('box', [id, plain, html]);
        if (b){
            if (!afterEl || !afterEl.length) afterEl = list.find('.' + options.prefix + '-bit-box').filter(':last');
            b.inject(afterEl.length ? afterEl : list, afterEl.length ? 'after' : 'top');
        } 
        return self;
    };
    
    var focusRelative = function(dir, to){
        var el = getBit(to && $(to).length ? to : current).toElement();
        var b = getBit(el[dir]());
        if (b) {  	
        	var elem = b.toElement();
        	if (elem.offset().top != el.offset().top){
        		$("#mainsearch .textboxlist-bits").scrollTo(elem,{ axis:'y', offset:-2 ,duration:100});
        	}
        	b.focus();
        }
        return self;
    };
    
    var focusLast = function(){
        var lastElement = list.children().filter(':last');
        if (lastElement) getBit(lastElement).focus();
        return self;
    };
    
    var blur = function(){
        if (! focused) return self;
        if (current) current.blur();
        focused = false;
        return fireEvent('blur');
    };
    
    var getBit = function(obj){   
        return (obj.type && (obj.type == 'editable' || obj.type == 'box')) ? obj : $(obj).data('textboxlist:bit');
    };
    
    var getValues = function(){
        var values = [];
        list.children().each(function(){
            var bit = getBit(this);
            if (!bit.is('editable')) values.push(bit.getValue());
        });
        return values;
    };
    
    var setValues = function(values){
        if (!values) return;
        $.each(values, function(i, v){
            if (v) add.apply(self, $.isArray(v) ? [v[1], v[0], v[2]] : [v]);
        });     
    };
    
    var update = function(){
        original.val(options.encode(getValues()));
    };
    
    var addEvent = function(type, fn){
        if (events[type] == undefined) events[type] = [];
        var exists = false;
        $.each(events[type], function(f){
            if (f === fn){
                exists = true;
                return;
            };
        });
        if (!exists) events[type].push(fn);
        return self;
    };
    
    var fireEvent = function(type, args, delay){
        if (!events || !events[type]) return self;
        $.each(events[type], function(i, fn){       
            (function(){
                args = (args != undefined) ? splat(args) : Array.prototype.slice.call(arguments);
                var returns = function(){
                    return fn.apply(self || null, args);
                };
                if (delay) return setTimeout(returns, delay);
                return returns();
            })();
        });
        return self;
    };
    
    var removeEvent = function(type, fn){
        if (events[type]){
            for (var i = events[type].length; i--; i){
                if (events[type][i] === fn) events[type].splice(i, 1);
            }
        } 
        return self;
    };
    
    var isDuplicate = function(v){
        return $.inArray(uniqueValue(v), index);
    };
    
    this.onFocus = function(bit){
        if (current) current.blur();
        clearTimeout(blurtimer);
        current = bit;
        container.addClass(options.prefix + '-focus');      
        if (!focused){
            focused = true;
            fireEvent('focus', bit);
        }
    	$("#mainsearch .textboxlist-bits").css('background-color','white');
    	$("#mainsearch .textboxlist-bit-editable").css('border','1px solid white');
    	$("#mainsearch .textboxlist-bit-editable-input").css('background-color','white');
    };
    
    this.onAdd = function(bit){
        if (options.unique && bit.is('box')) index.push(uniqueValue(bit.getValue()));
        if (bit.is('box')){
            var prior = getBit(bit.toElement().prev());
            if ((prior && prior.is('box') && options.inBetweenEditableBits) || (!prior && options.startEditableBit)){               
                var priorEl = prior && prior.toElement().length ? prior.toElement() : false;
                var b = create('editable').inject(priorEl || list, priorEl ? 'after' : 'top');
                if (options.hideEditableBits) b.hide();
            }
        }
        // something perso
        if (bit.is('box')){
        	elem = bit.toElement();
        	var next = bit.toElement().next();
        	if (next)
        	{
	            if (next.offset().top != elem.offset().top)
	            {
	        		$("#mainsearch .textboxlist-bits").scrollTo(next,{ axis:'y', offset:-2 ,duration:100});
	        	}
        	}
        }
    };
    
    this.onRemove = function(bit){
        if (!focused) return;
        if (options.unique && bit.is('box')){
            var i = isDuplicate(bit.getValue());
            if (i != -1) index = index.splice(i + 1, 1);
        } 
        var prior = getBit(bit.toElement().prev());
        if (prior && prior.is('editable')) prior.remove();
        focusRelative('next', bit);
    };
    
    this.onBlur = function(bit, all){
        var value = current.getValue();
    	if (value[1] != '' && bit.is('editable') )
    	{
			var b = this.create('box', value);
			if (b){
				b.inject(current.toElement(), 'before');
				current.setValue([null, '', null]);
			}
    	}
    	if (self.getValues().length==0){
    		var bgcolor = $("#mainsearch").attr('bgcolor');
	    	$("#mainsearch .textboxlist-bits").css('background-color',bgcolor);
	    	$("#mainsearch .textboxlist-bit-editable").css('border','1px solid '+bgcolor);
	    	$("#mainsearch .textboxlist-bit-editable-input").css('background-color',bgcolor);
    	}
        current = null;
        container.removeClass(options.prefix + '-focus');       
        blurtimer = setTimeout(blur, all ? 0 : 200);
    };
    
    this.setOptions = function(opt){
        options = $.extend(true, options, opt);
    };
    
    this.getOptions = function(){
        return options;
    };
    
    this.getContainer = function(){
        return container;
    };
    
    this.isFocus = function(){
        return focused;
    };
    
    this.isDuplicate = isDuplicate;
    this.addEvent = addEvent;
    this.removeEvent = removeEvent;
    this.fireEvent = fireEvent;
    this.create = create;
    this.add = add;
    this.getValues = getValues;
    this.current = function(){return current;};
    this.plugins = [];
    init();
};

var chk = function(v){ return !!(v || v === 0); };
var splat = function(a){ return $.isArray(a) ? a : [a]; };
var camelCase = function(str){ return str.replace(/-\D/g, function(match){ return match.charAt(1).toUpperCase(); }); };
var capitalize = function(str){ return str.replace(/\b[a-z]/g, function(A){ return A.toUpperCase(); }); };

$.fn.extend({ 
    smartsearch: function(options){
        return this.each(function(){
            if (this != undefined) new $.Smartsearch(this, options);
        });
    }
    
});

})(jQuery);