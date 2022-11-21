/*
Script: TextboxList.js
    Displays a textbox as a combination of boxes an inputs 

    Authors:
        Guillermo Rauch
*/

(function($){
    
$.TextboxList = function(element, _options){
    
    var original, container, list, current, focused = false, index = [], blurtimer, events = {};
    var options = $.extend(true, {
    prefix: 'textboxlist',
    max: null,
    afterBlur : function() {},
    scroll:false,
	onlyStrictValues:false,
    title:'plus..',
        unique: false,
        uniqueInsensitive: true,
    endEditableBit: true,
        startEditableBit: false,
        hideEditableBits: true,
    inBetweenEditableBits: false,
        keys: {previous: 37, next: 39},
        bitsOptions: {editable: {}, box: {}},
    plugins: {},
        // tip: you can change encode/decode with JSON.stringify and JSON.parse
        encode: function(o,isvalue){ 
            return $.grep($.map(o, function(v){     
                v = (isvalue || isvalue ==undefined) ? (chk(v[0]) ? v[0] : v[1]):v[1];
                //v = v.toString().replace(/,/, '');
                return chk(v) ? v.toString().replace(/!\+!/, '') : null;
            }), function(o){ return o != undefined; }).join('!+!'); 
        },
        decode: function(o){ return o.split('!+!'); }
  }, _options);
    
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
        self.plugins[name] = new $.TextboxList[camelCase(capitalize(name))](self, options);
    };
    
    var afterInit = function(){
        if (options.endEditableBit) create('editable', null, {tabIndex: original.tabIndex}).inject(list);
        addEvent('bitAdd', update, true);
        addEvent('bitRemove', update, true);
        $(document).click(function(e){
            if (!focused || focused == undefined) return;
            if (e.target.className.indexOf(options.prefix) != -1){              
                if (e.target == $(container).get(0)) return;                
                var parent = $(e.target).parents('div.' + options.prefix);
                if (parent.get(0) == container.get(0)) return;
            }
            if (element.hasClass('blur')==false) blur();
            if (element.hasClass('blur')) element.removeClass('blur');
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
        if (b) b.focus();
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
        _fire('afterBlur');
        return fireEvent('blur');
    };
    var _fire = function(event) {
        options[event].call(element);
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
            if (v) add.apply(self, $.isArray(v) ? [v[1], v[0], v[2]] : v==''? v:v.split('!#!'));
        });     
    };
    
    var update = function(){
        original.val(options.encode(getValues()));
        original.attr('label',options.encode(getValues(),false));
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
        if (current) {
        	current.blur();
        }
        clearTimeout(blurtimer);
        current = bit;
        container.addClass(options.prefix + '-focus');      
        if (!focused){
            focused = true;
            fireEvent('focus', bit);
        }
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
    	//console.log(bit);
        var value = current.getValue();
    	if (value[1] != '' && bit.is('editable') )
    	{
			var b = this.create('box', value);
			if (b){
				b.inject(current.toElement(), 'before');
				current.setValue([null, '', null]);
			}
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
    
    this.isDuplicate = isDuplicate;
    this.addEvent = addEvent;
    this.removeEvent = removeEvent;
    this.fireEvent = fireEvent;
    this.create = create;
    this.add = add;
    this.getValues = getValues;
    this.element = element;
    this.current = function(){return current;};
    this.plugins = [];
    init();
    //if (element.hasClass('hide')) container.hide();
};

$.TextboxListBit = function(type, value, textboxlist, _options){
    
    var element, bit, prefix, typeprefix, close, hidden, focused = false, name = capitalize(type); 
    var growingInput = null;
    var options = $.extend(true, type == 'box' ? {
        deleteButton: true
  } : {
        tabIndex: null,
        growing: true,
        growingOptions: {},
        stopEnter: true,
        addOnBlur: false,
        addKeys: [13,188]
    }, _options);
    
    this.type = type;
    this.value = value;

    var self = this;
    var init = function(){
        prefix = textboxlist.getOptions().prefix + '-bit';
        typeprefix = prefix + '-' + type;
        bit = $('<li />').addClass(prefix).addClass(typeprefix)
            .data('textboxlist:bit', self)
            .hover(function(){ 
                bit.addClass(prefix + '-hover').addClass(typeprefix + '-hover'); 
            }, function(){
                bit.removeClass(prefix + '-hover').removeClass(typeprefix + '-hover'); 
            });
        
        if (type == 'box'){
            bit.html(chk(self.value[2]) ? self.value[2] : self.value[1]).click(focus);
            if (options.deleteButton){
                bit.addClass(typeprefix + '-deletable');
                close = $('<a href="#" class="'+ typeprefix +'-deletebutton" />').click(remove).appendTo(bit);
            }
            if (textboxlist.current()!=undefined)
            {
	            var editable = textboxlist.current().toElement().children();
	            editable.attr('placeholder','plus?');
	            editable.data('growing').setOptions({title:'plus?'}).resize();
            }
            bit.children().click(function(e){ e.stopPropagation(); e.preventDefault(); });        
        } else { 	
        	var optplus = { title : textboxlist.getOptions().title, scroll: textboxlist.getOptions().scroll};
            element = $('<input type="text" class="'+ typeprefix +'-input infieldlabel" autocomplete="off" placeholder="'+optplus.title+'"/>').val(self.value ? self.value[1] : '').appendTo(bit);
            if (chk(options.tabIndex)) element.tabIndex = options.tabIndex;
            //element.addClass('tordu').val(title);
            if (options.growing) growingInput = new $.GrowingInput(element, $.extend(optplus,options.growingOptions));
            element.focus(function(){ focus(true); }).blur(function(){
                blur(true);
                if (options.addOnBlur) toBox(); 
            });             
            if (options.addKeys || options.stopEnter){
                element.keydown(function(ev){
                    if (!focused) return;
                    var evStop = function(){ ev.stopPropagation(); ev.preventDefault(); };
                    if ($.inArray(ev.which, splat(options.addKeys)) != -1){
                    	if (ev.which === 13 && element.val()=='') ;// don't stop nothing => submit the search's form
                    	else evStop();
                        toBox();
                    }
                });
            }
        }
        
    };
    
    var inject = function(el, where){
        switch(where || 'bottom'){
            case 'top': bit.prependTo(el); break;
            case 'bottom': bit.appendTo(el); break;
            case 'before': bit.insertBefore(el); break;         
            case 'after': bit.insertAfter(el); break;                       
        }
        textboxlist.onAdd(self);    
        return fireBitEvent('add');
    };
    var focus = function(noReal){
        if (focused) return self;
        show();
        focused = true;
        textboxlist.onFocus(self);
        bit.addClass(prefix + '-focus').addClass(prefix + '-' + type + '-focus');
        fireBitEvent('focus');
        if (type == 'editable' && !noReal) element.focus();
        
        return self;
    };
    
    var blur = function(noReal){
    	if (type == 'editable')
        {
        	var plus = '';
            if (textboxlist.getValues().length){
            	if (textboxlist.getOptions().max == textboxlist.getValues().length) plus = '';
            	else plus = 'plus?';
            }
            else plus = textboxlist.getOptions().title;
            element.attr('placeholder',plus);
            growingInput.setOptions({title:plus}).resize();
        }
        if (focused==false) return self;
        focused = false;
        textboxlist.onBlur(self);
        bit.removeClass(prefix + '-focus').removeClass(prefix + '-' + type + '-focus');
        fireBitEvent('blur');
        if (type == 'editable'){
            if (!noReal) {element.blur();}
            if (hidden && !element.val().length) hide();
        }
        
        
        return self;
    };
    
    var remove = function(){
        blur();     
        textboxlist.onRemove(self);
        bit.remove();
        return fireBitEvent('remove');
    };
    
    var show = function(){
        bit.css('display', 'block');
        return self;
    };
    
    var hide = function(){
        bit.css('display', 'none');     
        hidden = true;
        return self;
    };
    
    var fireBitEvent = function(type){
        type = capitalize(type);
        textboxlist.fireEvent('bit' + type, self).fireEvent('bit' + name + type, self);
        return self;
    };
    
  this.is = function(t){
    return type == t;
  };

    this.setValue = function(v){
        if (type == 'editable'){
            element.val(chk(v[0]) ? v[0] : v[1]);
            if (options.growing) element.data('growing').resize();
        } else value = v;
        return self;
    };

    this.getValue = function(){
        return type == 'editable' ? [null, element.val(), null] : value;
    };
    
    if (type == 'editable'){
        this.getCaret = function(){
            var el = element.get(0);
            if (el.createTextRange){
            var r = document.selection.createRange().duplicate();       
            r.moveEnd('character', el.value.length);
            if (r.text === '') return el.value.length;
            return el.value.lastIndexOf(r.text);
          } else return el.selectionStart;
        };

        this.getCaretEnd = function(){
            var el = element.get(0);            
            if (el.createTextRange){
                var r = document.selection.createRange().duplicate();
                r.moveStart('character', -el.value.length);
                return r.text.length;
            } else return el.selectionEnd;
        };
        
        this.isSelected = function(){
            return focused && (self.getCaret() !== self.getCaretEnd());
        };
        
        var toBox = function(){
            var value = self.getValue();
            if (value[1] != '' )
        	{
	            var b = textboxlist.create('box', value);
	            if (b){
	                b.inject(bit, 'before');
	                self.setValue([null, '', null]);
	                return b;
	            }
        	}
            return null;
        };
        
        this.toBox = toBox;
    }
    
    this.toElement = function(){
        return bit;
    };
    
    this.focus = focus;
    this.blur = blur;
    this.remove = remove;
    this.inject = inject;
    this.show = show;
    this.hide = hide;
    this.fireBitEvent = fireBitEvent;
    init();
};

var chk = function(v){ return !!(v || v === 0); };
var splat = function(a){ return $.isArray(a) ? a : [a]; };
var camelCase = function(str){ return str.replace(/-\D/g, function(match){ return match.charAt(1).toUpperCase(); }); };
var capitalize = function(str){ return str.replace(/\b[a-z]/g, function(A){ return A.toUpperCase(); }); };

$.fn.extend({
    textboxlist: function(options){
        return this.each(function(){
        	// check if a textboxlist for this form was already created
	        var textboxlist = $.data(this, 'textboxlist-sep');
	        if ( textboxlist ) {
	            return textboxlist;
	        }
	        
            textboxlist =  new $.TextboxList(this, options);
            $.data(this, 'textboxlist-sep', textboxlist); 
            return textboxlist;
        });
    }
    
});

})(jQuery);