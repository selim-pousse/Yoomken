/*
Script: Smartsearch.Autocomplete.js
	Based on the composant Textboxlist created by Guillermo Rauch

	Authors:
		Sélim Pousse 
	
*/

(function(){
	
$.Smartsearch.Autocomplete = function(textboxlist, _options){
	
  var index, prefix, method, container, list, values = [], searchValues = [], results = [], placeholder = false, current, currentInput, hidetimer, doAdd, currentSearch, currentRequest;
	var options = $.extend(true, {
		minLength: 2,
		maxResults: 16,
		insensitive: true,
		highlight: true,
		highlightSelector: null,
		mouseInteraction: true,
		onlyFromValues: false,
		queryRemote: false,
    remote: {
			url:'/{0}/by',
			param: 'term',
			controller: 'content',
			extraParams: {},
			loadPlaceholder: 'Chargement...'
    },
		method: 'standard',
		placeholder: ''
	}, _options);
	
	var init = function(){
		//console.log(options.remote.controller);
		textboxlist.addEvent('bitEditableAdd', setupBit)
			.addEvent('bitEditableFocus', search)
			.addEvent('bitEditableBlur', hide)
			.setOptions({bitsOptions: {editable: {addKeys: false, stopEnter: false}}});
		if ($.browser.msie) textboxlist.setOptions({bitsOptions: {editable: {addOnBlur: false}}});
		prefix = textboxlist.getOptions().prefix + '-autocomplete';
		method = $.Smartsearch.Autocomplete.Methods[options.method];
		container = $('<div class="'+ prefix +'" />').width(textboxlist.getContainer().width()).appendTo(textboxlist.getContainer());
		if (chk(options.placeholder)) placeholder = $('<div class="'+ prefix +'-placeholder" />').html(options.placeholder).appendTo(container);		
		list = $('<ul class="'+ prefix +'-results" />').appendTo(container).click(function(ev){
			ev.stopPropagation(); ev.preventDefault();
		});
	};
	var blocksearch = false;
	var setupBit = function(bit){
		bit.toElement().keydown(navigate).keyup(function(ev){ 
			if (ev.which!=38 && ev.which!=40) {
				search(bit,ev); 
			}
			else {
			}
		});
	};
	
	var search = function(bit,ev){
		if (bit) currentInput = bit;
		if (!options.queryRemote && !values.length) return;
		var search = $.trim(currentInput.getValue()[1]);
		if (search.length < options.minLength) showPlaceholder();
		//if (search == currentSearch) return;
		currentSearch = search;
		list.css('display', 'none');
		if (textboxlist.getOptions().max != null && textboxlist.getValues().length == textboxlist.getOptions().max) return;

		if (search.length < options.minLength) return;
		if (options.queryRemote){
			/*if (searchValues[search]){
				values = searchValues[search];
			} else {*/
				var data = options.remote.extraParams;
				//var by = $('#input_bysearch').attr('key'); // ne sert à rien pour l'instant car input_bysearch supprimé
				var by = 'a'; // forcer le by en automatique  (soit all)
				data['term'] = search+'-'+by;
				data['by'] = by;
				data['keyword'] = search; 
				data['journal'] = system.journal;
				if (currentRequest && (search=='' || search=='plus?') ) currentRequest.abort();
				currentRequest = $.ajax({
					url: jQuery.format(options.remote.url,options.remote.controller) ,
					type: 'POST',
					data: data,
					dataType: 'json',
					success: function(r){
						var value = currentInput.getValue();
						if (value[1]!='')
						{
							searchValues[search] = r;
							values = r;
							showResults(search);
						}
					}
				});
			//}
		}
		showResults(search);
	};
	
    
	var showResults = function(search){
		search = stripAccent(search);// !important d'enlever les accesnts
		var results = method.filter(values, search, options.insensitive, options.maxResults);
		if (textboxlist.getOptions().unique){
			results = $.grep(results, function(v){ return textboxlist.isDuplicate(v) == -1; });		
		}
		hidePlaceholder();
		if (!results.length) {
			current =null;
			return;
		}
		blur();
		list.empty().css('display', 'block');
		
		//console.log(results); // ------------------TODO  improve by sorting the criteria
		$.each(results, function(i, r){ addResult(r, search); });
		if (options.onlyFromValues) focusFirst();
		results = results;
	};
	
	var showMyResults = function(results){
		hidePlaceholder();
		if (!results.length) return;
		blur();
		list.empty().css('display', 'block');
		$.each(results, function(i, r){ addResult([r.id,r.plain,r.html_bit,r.html_auto], ''); });
		if (options.onlyFromValues) focusFirst();
		results = results;
	};
	
	var addResult = function(r, searched){
		var element = $('<li class="'+ prefix +'-result" />').html(r[3] ? r[3] : r[1]).data('textboxlist:auto:value', r);		
		element.appendTo(list);
		if (options.highlight) $(options.highlightSelector ? element.find(options.highlightSelector) : element).each(function(){
			if ($(this).html()) method.highlight($(this), searched, options.insensitive, prefix + '-highlight');
		});
		if (options.mouseInteraction){
			element.css('cursor', 'pointer').hover(function(){ focus(element); }).mousedown(function(ev){
				ev.stopPropagation(); 
				ev.preventDefault();
				clearTimeout(hidetimer);
				doAdd = true;
			}).mouseup(function(e){
				if (doAdd && e.button==0){
					addCurrent();
					currentInput.focus();
					search();
					doAdd = false;
				}
			});
			if (!options.onlyFromValues) element.mouseleave(function(){ if (current && (current.get(0) == element.get(0))) blur(); });	
		}
	};
	
	var hide = function(){
		hidetimer = setTimeout(function(){
			hidePlaceholder();
			list.css('display', 'none');
			currentSearch = null;			
		}, $.browser.msie ? 150 : 0);
	};
	
	var showPlaceholder = function(){
		if (placeholder) placeholder.css('display', 'block');		
	};
	
	var hidePlaceholder = function(){
		if (placeholder) placeholder.css('display', 'none');
	};
	
	var focus = function(element){
		if (!element || !element.length) return;
		blur();
		current = element.addClass(prefix + '-result-focus');
	};
	
	var blur = function(){
		if (current && current.length){
			current.removeClass(prefix + '-result-focus');
			current = null;
		}
	};
	
	var focusFirst = function(){
		return focus(list.find(':first'));
	};
	
	var focusRelative = function(dir){
		if (!current || !current.length) return self;
		return focus(current[dir]());
	};
	
	var addCurrent = function(){
		var value = current.data('textboxlist:auto:value');
		var b = textboxlist.create('box', value);
		if (b){
			b.autoValue = value;
			if ($.isArray(index)) index.push(value);
			currentInput.setValue([null, '', null]);
			b.inject(currentInput.toElement(), 'before');
		}
		blur();
		return self;
	};
	
	var navigate = function(ev){
		var evStop = function(){ ev.stopPropagation(); ev.preventDefault(); };
		switch (ev.which){
			case 38:			
				evStop();
				(!options.onlyFromValues && current && current.get(0) === list.find(':first').get(0)) ? blur() : focusRelative('prev');
				break;
			case 9:
				var value = currentInput.getValue();
				if (value[1]!='')
				{
					var b = textboxlist.create('box', value);
					if (b){
						b.inject(currentInput.toElement(), 'before');
						currentInput.setValue([null, '', null]);
						currentInput.focus();
					}
				}
				current = null;
				evStop();
				break;
			case 40:			
				evStop();
				(current && current.length) ? focusRelative('next') : focusFirst();
				break;
			case 188:
			case 13:
				var electron = currentInput.getValue();
				if (current && current.length) {
					addCurrent();
					evStop();
				}
				else if (1 || !options.onlyFromValues){
					var value = currentInput.getValue();
					if (value[1]!='')
					{
						var realvalue = [value[1],value[1],value[1],value[1],"a"];
						var b = textboxlist.create('box', realvalue);
						if (b){
							b.autoValue = value;
							if ($.isArray(index)) index.push(realvalue);
							b.inject(currentInput.toElement(), 'before');
							currentInput.setValue([null, '', null]);
							//currentInput.setValue(value);
							currentInput.focus();
						}
						evStop();
					}
				}
		}
	};
	
	this.setValues = function(v){
		values = v;
	};
	
	init();
};


function stripAccent(r) {
	if (r!=null) {
	    r = r.replace(new RegExp(/[àáâãäå]/g),"a");
	    r = r.replace(new RegExp(/æ/g),"ae");
	    r = r.replace(new RegExp(/ç/g),"c");
	    r = r.replace(new RegExp(/[èéêë]/g),"e");
	    r = r.replace(new RegExp(/[ìíîï]/g),"i");
	    r = r.replace(new RegExp(/ñ/g),"n");                
	    r = r.replace(new RegExp(/[òóôõö]/g),"o");
	    r = r.replace(new RegExp(/œ/g),"oe");
	    r = r.replace(new RegExp(/[ùúûü]/g),"u");
	    r = r.replace(new RegExp(/[ýÿ]/g),"y");
	}
    return r;
};

$.Smartsearch.Autocomplete.Methods = {
	standard: {
		filter: function(values, search, insensitive, max){

			var newvals = [], regexp = new RegExp('\\b' + escapeRegExp(search), insensitive ? 'i' : 'i');
			for (var i = 0; i < values.length; i++){
				if (newvals.length === max) break;
				var newval = stripAccent(values[i][2]);
				if (regexp.test(newval)) newvals.push(values[i]);
			}
			return newvals;
		},
		
		highlight: function(element, search, insensitive, klass){
			var regex = new RegExp('(<[^>]*>)|(\\b'+ escapeRegExp(search) +')', insensitive ? 'ig' : 'g');
			var valstriped = stripAccent(element.html());
			//valstriped = element.html();
			klass = 'orange';
			return element.html(valstriped.replace(regex, function(a, b, c){
				return (a.charAt(0) == '<') ? a : '<strong class="'+ klass +'">' + c + '</strong>'; 
			}));
		}
	}
	
};

var chk = function(v){ return !!(v || v === 0); };
var escapeRegExp = function(str){ return str.replace(/([-.*+?^${}()|[\]\/\\])/g, "\\$1"); };

})(jQuery);