$isotope = null;
$setupIsotope = null;

$(document).ready(function() { 
		repeatNewLoad($('#blackoutContainer .close,#touchOuside'));
		
		// Check if Mobile or Tablet device  
		function is_touch_device() {
			return !!('ontouchstart' in window) // works on most browsers 
			|| !!('onmsgesturechange' in window); // works on ie10
		};
	    
		// If touch device, disable transforms.
		if (is_touch_device() && jQuery(window).width() < 800) { 
			var bubu = {
				animationEngine: 'best-available',
				filter: '',
				sortBy: 'original-order',
				sortAscending: true,
				transformsEnabled: false,
				layoutMode: 'masonry'
			};
			
	     } else {
		     var bubu = {
			     animationEngine: 'best-available',
			     filter: '',
				sortBy: 'original-order',
				sortAscending: true,
				transformsEnabled: true,
				layoutMode: 'masonry',
				animationOptions: {
					queue: false,
					easing: 'linear',
					duration: 800			},
			};
		}
	
	// Settings for the grid
    jQuery(function(){
	  // Settings for the grid
	    var $container = jQuery('.isotope'),
	    // object that will keep track of options
	    isotopeOptions = {},
	    // defaults, used if not explicitly set in hash
	    defaultOptions = bubu;
	    
	    $setupIsotope = jQuery.extend( {}, defaultOptions, {
		    itemSelector : '.isotope-post',
		    masonry: {
			    gutterWidth: 306,
			    columnWidth: 1,
			   },
		});
		
		// set up Isotope when the images are loaded
		//$( window ).load(function() {
		var loadIsotop = function () {
			$container.find('img').imagesLoaded(function() {
				$container.css( 'opacity',1);
			  	$isotope = $container.isotope( $setupIsotope);
				repeatForSlider('.widget-slider .flexslider');
				
			});
		}
		loadIsotop();
		
	});
	
	
	
	  
	
	  // BOX Login
	  var outLogin = true;
	  $(".toogle").click(function() { 
		  	var id = $(this).attr('id').split('_',1);
		  	var current = $(this);
		  	var hisBlock =  $('#' + id[0] + '_Block');
	 		
	 		hisBlock.toggleClass('hide');
	 		current.toggleClass('down');
	  }); 
	  
	  var current_date = new Date();
 	  var tzoffset = parseInt(-current_date.getTimezoneOffset() / 60);
 	  $.post("/ajax/tz", { tzoffset: tzoffset});
	  
	  $('#disconnect,#not-read,#available,#type-profil,#language').hover(
				function () {
					$(this).addClass('down');
					$('#'+$(this).attr('id')+'_Block').removeClass('hide');
			  	}, 
			  	function () {
			  		$(this).removeClass('down');//.css('margin','0px');
			  		$('#'+$(this).attr('id')+'_Block').addClass('hide');
			  	}
			);
		  
	$("#login_form").validate({
		rules: {
			password: {
				required: true
			},
			email: {
				required: true
			}
		},
		messages: {
			password: {
				required: signup.password.required
			},
			email: label.login_email_pseudo
		},
		submitHandler: function(form) {
			var myDate = new Date();
			var offset = myDate.getTimezoneOffset();
			jQuery(form).ajaxSubmit({
				dataType:  'json', 
				success:   login,
				data : {date:offset}
			});
		}
	});
	
	$(document).keyup(function(e){
		if (e.which==16) TABUL_BACK = false;
	}).keydown(function(e){
		if (e.which==16) TABUL_BACK = true;
		if(!$(document.activeElement).is(':input') 
				&& e.which!=8 && e.which!=37 && e.which!=39 && e.which!=13
				&& !e.ctrlKey && e.which!=54 && e.which!=9 && e.which!=16) 
		{
			$('#input_mainsearch').focus();
			$("#connect_Block").removeClass('show');
	    	$("#connect_Button").removeClass('down');
		}
	});
	
	//$('#menu-smartFilter .active').addClass('tmp-brillance');
	$('#rappel-filter').slideUp(5000,function(){
		$(this).hide('highlight');
		//$('#menu-smartFilter .active').removeClass('tmp-brillance');
	});
	
	repeatForBoxyAndTooltip('#art-main');
	
	$("input[name='searchrelation']").change(function() {
		   $.getJSON('/ajax/people/relations/'+$(this).val(), function (data,statusText) {
					//$('#block-relationship .relations').unbind('click');
	  				$('#block-relationship').html(data.html);
	  				//listenGetMsgContact('#block-recent-contact');
  			});
		});
});

//var edit_click = false;
$(document).click(function (e) { // when anywhere in the doc is clicked
        var clickedOut_connect = true; // found
        var clickedOut_serv = true; // found
        var clickedOut_serv_c = true; // found
        var clickedOut_price = true; // found
        var clickedOut_price_c = true; // found
        //edit_click = false;
        var last = null;
        $(e.target).parents().andSelf().each(function () { // search parents and self
            // if the original dialog selector is the click's target or a parent of the target
            // we have not clicked outside the box
            //if ($(this).hasClass('edit')) edit_click = true;
            if ($(this).attr('id') == "connect_Block" || $(this).attr('id') == "connect_Button") {
            	clickedOut_connect = false; // found
                return false; // stop searching
            }
            if ($(this).attr('id') == "disconnect_Block" || $(this).attr('id') == "disconnect_Button") {
            	clickedOut_connect = false; // found
                return false; // stop searching
            }
            if ($(this).children(':first-child').attr('id') == "myprofil-serv" 
            	|| $(this).hasClass('enveloppe')) {
            	clickedOut_serv = false; // found
                return false; // stop searching
            }
            if ($(this).children(':first-child').attr('id') == "myprofil-serv-c" 
            	|| $(this).hasClass('enveloppe')) {
            	clickedOut_serv_c = false; // found
                return false; // stop searching
            }
            if ($(this).children(':first-child').attr('id') == "myprofil-price-c" ) {
                clickedOut_price_c = false;
                return false; // stop searching
            }
            if ($(this).children(':first-child').attr('id') == "myprofil-price" ) {
                clickedOut_price = false;
                return false; // stop searching
            }
            last  = $(this);
        });
        
        if ($('#my-profil').size() && $('#my-profil').css('display')=='block' && $('#myprofil-serv_fix').hasClass('hide'))
	        if (clickedOut_serv ){
	        	blurInputService('');
	        }
	    if ($('#my-profil').size() && $('#my-profil').css('display')=='block' && $('#myprofil-serv-c_fix').hasClass('hide'))
	    {
	        if (clickedOut_serv_c ){
	        	blurInputService('-c');
	        }
	    }
	    if ($('#my-profil').size() && $('#my-profil').css('display')=='block' && $('#myprofil-price_fix').hasClass('hide'))
	        if (clickedOut_price ){
	        	hideAfterBlur('#myprofil-price_input');
	        }
	    if ($('#my-profil').size() && $('#my-profil').css('display')=='block' && $('#myprofil-price-c_fix').hasClass('hide'))
	        if (clickedOut_price_c ){
	        	hideAfterBlur('#myprofil-price-c_input');
	        }
	         
	        
        if (clickedOut_connect) {
        	$("#connect_Block").addClass('hide');
        	$("#connect_Button").removeClass('down');
        	//$("#disconnect_Block").removeClass('show');
        	//$("#disconnect_Button").removeClass('down');
        }
    });	 

//validate signup form on keyup and submit
function login(data) { 
    // submit the form
	if (data.success) 
	{
		document.location.href="/"; 
		return true;
	}
	else 
	{
		$('#login_form .error').text(data.message);
	}
    // return false to prevent normal browser submit and page navigation 
    return false; 
};


function mentionsPeople(objElm,prefill)
{
	$(objElm).mentionsInput({
	 	onDataRequest:function (mode, query, callback) {
	 		$.ajax({
			  url:'/ajax/people/friends',
			  dataType: 'json',
			  type:'POST',
			  data : {term:query, mode:'json'},
			  success:function(responseData){
			        responseData = _.filter(responseData, function(item) { return item.name.toLowerCase().indexOf(query.toLowerCase()) > -1 });
			        callback.call(this, responseData);
		     	 }
		    });
		},
		prefillMention: prefill //{name: "Hakim", id: "Kim", type: "contact", avatar: "http://www.gravatar.com/avatar/41acc27cdbfcd9f116ac66b4d489d29b?s=24&d=identicon&r=g", value: "Hakim"}
	});
}

var sideoffset = null;
var sideLeftHeight = null;
function listenGetMore(id,stream){
	/*$(id).find('.get-more').click(function(){
		var that = $(this);
		var id = $(this).attr('idact');
		var action = $(this).attr('action');
		var sideright = $('#'+id+'-more');
		$('#'+id+'-act').css('backgroundColor','#F1EEE9');
		$('.sub-sub-menu').hide();
		
		if (sideright.size()) {
			$('.get-more').hide();
			sideright.removeClass('hide');
			var newheight = $('#'+id+'-more').css('height');
			
			$('body').scrollTo(0,{axis:'y'});
			$(".side-left").animate({marginLeft:'-=50%'},"slow", function(){
																	$('.art-Post').css({'overflow':'visible'});
																	if ($(this).hasClass('side-right')) return;
																	$(".side-left").hide();
																	//$(".side-right").css('position','static');
																	$('.get-more').show();
																	
																	if ($('.side-right-who').size())
																		$('.side-right-who').show()
			 																				.find('.who').text(sideright.attr('meta'));
																});
		} 
		else { 
			$.getJSON(action+id,function(data){
				if (data.success)
			 	{
			 		var div = $('<div/>');
			 		div.attr('id',id+'-more')
			 			.attr('sufix','more')
			 			.css({position:'relative'})
			 			.html(data.html);
			 		$('.side-right').prepend(div);
			 		var newheight = $('#'+id+'-more').css('height');
					//$(".side-cache").css('height',newheight);
			 		$('.get-more').hide();
					// 
					
			 		$('body').scrollTo(0,{axis:'y'});
					//$('.art-Post').css({'overflow':'visible'});      
			 		$(".side-left").animate({marginLeft:'-=50%'},"slow",function(){
			 																$('.art-Post').css({'overflow':'visible'});
			 																//$('.art-contentLayout').css({'overflow-x':'visible'});
			 																if ($(this).hasClass('side-right')) return;
			 																$(".side-left").hide();
			 																//$(".side-right").css('position','static');
			 																
			 																sideright = $('#'+id+'-more');
			 																sideright.attr('meta',data.meta);
			 																//initSideRight();
			 																repeatNewLoad(sideright.find('.get-more'),newheight,stream);
			 																$('.get-more').show();
			 																if ($('.side-right-who').size())
			 																	$('.side-right-who').show()
			 																					 	.find('.who').text(data.meta);
			 																					 	
			 																
			 															});
			 		if (stream == 'usr') {
			 			repeatForTchat('#'+id+'-more');
			 			listenSubSubMenu('#'+id+'-more');
			 		}
			 		else {
			 			repeatForPost('#'+id+'-more','more');
			 			toggleEditFields('#'+id+'-more');
			 			repeatForComment('#'+id+'-more');
			 			repeatForLike('#'+id+'-more');
			 			repeatForFollow('#'+id+'-more');
			 			repeatForBoxyAndTooltip('#'+id+'-more');
			 		}
			 	}
			});
		}
	});*/
	
	$(id).find('.get-more').click(function(){
		var that = $(this);
		var id = $(this).attr('idact');
		var action = $(this).attr('action');
		var sideright = $('#'+id+'-more');
		
		var bcontainer = $('#blackoutContainer').show('slow').find('.entry');
		$('body').addClass('noScroll');
		
		if (sideright.size()) {
			sideright.show();
		} 
		else { 
			$.getJSON(action+id,function(data){
				if (data.success)
			 	{
			 		var div = $('<div/>');
			 		div.attr('id',id+'-more')
			 			.attr('sufix','more')
			 			.addClass('post-more')
			 			.css({position:'relative'})
			 			.html(data.html);
			 		bcontainer.prepend(div);
					
					sideright = $('#'+id+'-more');
					sideright.attr('meta',data.meta);
					
			 		if (stream == 'usr') {
			 			repeatForTchat('#'+id+'-more');
			 			listenSubSubMenu('#'+id+'-more');
			 		}
			 		else if (stream == 'profil') {
			 			enableComponentsMySpace(data.meta);
			 		}
			 		else {
			 			repeatForPost('#'+id+'-more','more');
			 			toggleEditFields('#'+id+'-more');
			 			repeatForComment('#'+id+'-more');
			 			repeatForLike('#'+id+'-more');
			 			repeatForFollow('#'+id+'-more');
			 			repeatForBoxyAndTooltip('#'+id+'-more');
			 		}
			 	}
			});
		}
	});
};

function repeatForSlider(id, runCallback, newData) {
	"use strict";
	
	//if (jQuery(id).length==0 && runCallback!=undefined) return runCallback.call(this, newData);
	
	jQuery(id).flexslider({
		animation: "slide",
		slideshow: "false", 
		slideshowSpeed: 2000,
		animationSpeed: 600, 
		easing: "swing", 
		directionNav: false,
		start: function(slider) {
			
			//if (runCallback!=undefined) runCallback.call(this, newData);
			
			if (slider.count != undefined) 
			{
				
				slider.pause();
				slider.hover( function(){slider.play();}, function(){slider.pause();} );
			}
	     } 
	});
			
}

function repeatForBoxyAndTooltip(id)
{
	$(id).find(".boxy").click(function(e) {
		e.preventDefault();
		if ($(this).attr('content'))
		{
			var box = new Boxy($(this).attr('content'),{show:false,modal:true,unloadOnHide:true,title:$(this).attr('titlebox'),center:true});
			$(box.getContent()).load(function(){ box.center('y');box.center('x'); box.show()});
		}
		else 
			Boxy.load($(this).attr('href'),
						{afterShow:function(){initBoxy()},modal:true,unloadOnHide:true,title:$(this).attr('titlebox'),center:true}
					 );
	});
	
	$(id).find('.tooltips').each(function()
    {
   	  $(this).css({'cursor':'help'});
      $(this).qtip(
      {
         content: {
            // Set the text to an image HTML string with the correct src URL to the loading image you want to use
            text: $(this).attr('content')?"<div style='padding:1px'>"+$(this).attr('content')+'</div>':'',
            url: $(this).attr('rel')?$(this).attr('rel'):undefined, // Use the rel attribute of each element for the url to load
            title: {
               text: $(this).attr('head')? $(this).attr('head'):$(this).attr('title'), // Give the tooltip a title using each elements text
            }
         },
         position: {
            corner: {
               target: $(this).attr('targetposition')?$(this).attr('targetposition'):'bottomMiddle', // Position the tooltip above the link
               tooltip: $(this).attr('toolposition')?$(this).attr('toolposition'):'leftMiddle'
            },
            adjust: {
               screen: false // Keep the tooltip on-screen at all times
            }
         },
         show: { 
            when: 'click', 
            solo: true // Only show one tooltip at a time
         },
         hide: {
         	when: 'inactive',
         	delay:500
         },
         style: {
            tip: true, // Apply a speech bubble tip to the tooltip at the designated tooltip corner
            border: {
               width: 0,
               radius: 4
            },
            name: 'cream', // Use the default light style
            title: { 'width': 200 } 
         }
      })
   });
}

function loadDynamicScript(src,alias)
{
	if (!$('script[alias='+alias+']').length)
	{
		var script = document.createElement('script');
		script.type = 'text/javascript';
		script.src = src;
		document.getElementsByTagName('head')[0].appendChild(script);
		$(script).attr('alias',alias);
	}
}

jQuery.cachedScript = function(url, options) {
  // allow user to set any option except for dataType, cache, and url
  options = $.extend(options || {}, {
    dataType: "script",
    cache: true,
    url: url
  });
  // Use $.ajax() since it is more flexible than $.getScript
  // Return the jqXHR object so we can chain callbacks
  return jQuery.ajax(options);
};

// Usage


function fetchMore(controller,objdata,debut)
{
	if (objdata == undefined)
		objdata = {beg : beg};
	else {
		objdata['beg'] = beg;
	}
		
	//var limit = $(that).attr('limit');
	if (controller=='USR') ctrl = 'people';
	else if (controller=='ACT') ctrl = 'content';
	else ctrl = 'question';
	
	$.ajax({
	  url: '/ajax/'+ctrl+'/timeline',
	  dataType: 'json',
	  type:'POST',
	  data: objdata,
	  success:function(data){
		if (data.success) 
		{	
			var tot = data.meta.nbtot;
			var nbread = eval(beg+'+'+data.meta.nbread);
			var newData = $(data.html);
			newData.css("opacity","0");
			
			
			
			var loadIsotop = function (newData) {
				if (newData.css("opacity")=="0")
				{
					newData.find('img').imagesLoaded(function(){
						newData.css("opacity","1");
						$isotope.isotope('appended', newData, function(){$isotope.removeClass('no-transition');});
						repeatForSlider(newData.find('.widget-slider .flexslider'));	
					});
				}
			}
			
			if (debut) {
				$('#timeline').append(newData);	
				loadIsotop(newData);
				
			}
			else { 
				//$isotope.isotope( 'destroy');
				$isotope.addClass('no-transition').find('.isotope-item').addClass('no-transition');
				$isotope.isotope('remove', $('#timeline .isotope-post'),function(){
					$('#timeline').html(newData);
					loadIsotop(newData);
				});
			}
			
			
				
			
		
			if (debut)
			{
				if (controller=='USR') refreshMap(nbread);
			}
			else 
			{
						
						
						if (controller=='USR') 
						{
							if (data.meta.nearby.active)
							{
								if (lib.map) {
									refreshMap(nbread);
								}
								
								if(!lib.map){
									/* chargement dynamique du script s'il n'est pas chargé */
									$.cachedScript('/js/google/markerClusterer.js',{success: function(script, textStatus) {
										  initializeMap(data.meta.nearby.position,data.meta.nearby.shortname,nbread);
									}});
								}
								//$('#head-people').css({position:'fixed',marginTop:'-315px'}).parent().css({marginTop:'300px'});
								$('#wrap-map').fadeIn('slow');
							}
						}
					//});
					
					
					if (controller=='USR') 
					{
							if (!data.meta.nearby.active)
							{
								$('#wrap-map').fadeOut('slow');
							}
					}
					
					
					
				}
			
			
			// réinitialisation des variables beg, nbread et nbtot
			$('#nbread').text(nbread);
			$('#nbtot').text(tot);
			if (nbread >= tot){
				nbread = tot;
				$('.fetch-more').hide();
			}
			else {
				//$(that).attr('beg',nbread);
				$('.fetch-more').show();
				beg = nbread;
			}
			
			if (controller=='USR')
			{
				repeatForFollow(newData);
				listenGetMore(newData,'usr');
				$(newData).find('.art-button-wrapper').removeClass('hide');
			}
			else {
				repeatForPost(newData,'');
				toggleEditFields(newData);
				listenGetMore(newData,'act');
			}
			repeatForFilter(newData);
			repeatForBoxyAndTooltip(newData);
			
		}
		else 
		{
			//something wrong
		}
	  }
	});
}

/*function repeatNewLoad(butback,newheight,stream)
{
	butback	.css('height',newheight)
			.click(function(){
				//$(".side-right").css('position','fixed');
				var id = $(this).attr('idact');
				var sideright = $('#'+id+'-more');
				$(".side-left").show();
				
				// let's now scroll to the initial element 
				//location.href = '#'+id+'-' + stream;
				var shift = $('#'+id+'-' + stream).offset().top - $('#timeline' ).offset().top;
			 	$('body').scrollTo(shift,{axis:'y'});
			 	
				$('.get-more').hide();
				$('.get-more').show();
				
				
				$('.art-Post').css({'overflow':'hidden'});
				$(".side-left").animate({marginLeft:'+=50%'},"slow", function(){
																			//$('.art-Post').css({'overflow':'visible'});
																			if ($(this).hasClass('side-right')) return;
																			sideright.addClass('hide');
																			$('.sub-sub-menu').show();
																			
																			$('#'+id+'-act').css('backgroundColor','transparent');
																			if ($('.side-right-who').size()) $('.side-right-who').hide();
																		});
			});
}*/
function repeatNewLoad(butback)
{
	butback.click(function(){
				$('.post-more').hide();
				$('#blackoutContainer').hide();
				$('body').removeClass('noScroll');
	});
}

function repeatForFollow(id){
	$(id).find('.form-attach').submit(function() {
		// submit the form 
		
		$(this).ajaxSubmit({
			dataType:  'json', 
			success:   attach
		});
		return false;
	});
}

function clickEditFields(that,blur)
{
	if( typeof clickEditFields.elem_click == 'undefined' ) {
        clickEditFields.elem_click = null;
    }
    
	var id = $(that).attr('id');
	var input = $('#' + id + '_input');
	 
	if (keepFocus(input,clickEditFields.elem_click)) return;
	clickEditFields.elem_click = id;
	//edit_click = true;

	$('#' + id + '_box .yoo-icon').addClass('hide');
	content = $('#' + id + '_fix').addClass('hide')
								  .parent().removeClass('fix_content');//.text();
	input.removeClass('hide');
	
	if (input.is(':input'))	{
		input.focus(); 
	}
	else if (input.hasClass('price'))
	{
		if ($('#' + id + '_free').is(':checked'))  $('#' + id + '_free').focus();
		else $('#' + id + '_amont').focus();
	}
	else if (input.hasClass('distance'))
	{
		$('#' + id + '_distance').focus();
	}
	else if (input.hasClass('serviceinp'))
	{
		input.find('.service').focus();
	}
	else if (input.hasClass('txtmention'))
	{
		var txtarea = input.find('.mention'); 
		txtarea.focus();
		
		var txt = txtarea.val();
		// Object {name: "Selim Pousse", id: "Selimpousse2", type: "contact", avatar: "http://www.gravatar.com/avatar/79f5749fb3e6e26285f00e3788596861?s=24&d=identicon&r=g", value: "Selim Pousse"}
		var regex = /\@\[([\s\w@\.]+)\]\(\w+:(\w+)\)/gi;
		var nb = txt.match(regex).length;
		if (nb)
		{
			txtarea.val('');
			for (var i = 0; i < nb ;i++)
			{
				var match = regex.exec(txt);
				txtarea.mentionsInput('addMention',{name: match[1], id: match[2], type: "contact", value: match[1]});
			}
			if (txt){
				txt = txt.replace(/\@\[([\s\w@\.]+)\]\((\w+):(\w+)\)/ig, "", txt);	
				txtarea.val(txtarea.val() + txt);
			}
		}
		txtarea.focus();
	}
	else {
		$('#' + id + '_input2').addClass('blur').focus();
	}
}

function toggleEditFields(id)
{
	$(id).find(".edit").click(function() { 
		if (!$(this).hasClass('withfocus')) clickEditFields(this);
	});
  
	$(id).find(".content_input").blur(function() {
	  	hideAfterBlur(this);
	});
	
	$(id).find(".input-tags").textboxlist({title:label.tags,unique: true, plugins: {autocomplete: {
		queryRemote: true,
		remote: {url: '/ajax/tags'}
	}},afterBlur : function(el){
		hideAfterBlur(this);
		focusNext($(this).parent());
	}});
	
	$(id).find(".input-loc" ).textboxlist({title:label.location,max:1,unique: true, plugins: {autocomplete: {
		queryRemote: true,
		source: codeAddress,
		shortLabel:false,
		onlyFromValues :true
	}},afterBlur : function(el){
		hideAfterBlur(this);
		focusNext($(this).parent());
		
	}});
	
	$(id).find(".input_bulle").tabulTextBox(function(nextOrPrev){
		$(this).addClass(nextOrPrev);
	});
		
	$(id).find(".input-url" ).textboxlist({bitsOptions:{editable:{addKeys: [188,13]}},afterBlur : function(el){
		hideAfterBlur(this);
		focusNext($(this).parent());
		$(this).valid();
	}});
	
	
	//$(id).find('.mention')/*.autoResize({})*/.elastic();
	//$(id).find('.autoresize')/*.autoResize({})*/.trigger('change');
	
	/*$(id).find('.yoo-icon').hover(
		function () {
			$(this).addClass('ui-state-default ui-corner-all').css('margin','-1px');
	  	}, 
	  	function () {
	  		$(this).removeClass('ui-state-default ui-corner-all').css('margin','0px');
	  	}
	);*/
}


function hideAfterBlur(that)
{
	that = $(that);
	var id = that.attr('id').split('_',1);
	$('#' + id + '_box .yoo-icon').removeClass('hide');
	$('#' + id + '_input').addClass('hide');
	if (that.attr('bulle')=='true'){
		var bulles ='', values = that.attr('label')? that.attr('label').split('!+!'):'';
		if ($.isArray(values)){
			$.each(values, function(i, p){                
	            bulles += "<a class='textboxlist-bit textboxlist-bit-box' index='"+i+"' style='text-decoration: none;color:#685840;cursor:pointer'>"+p+"</a>";
			});
		}
		$('#' + id + '_fix').removeClass('hide')
	   .html(bulles);
	}
	else if (that.hasClass('price'))
	{
		var price = null;
		if ($('#' + id + '_free').is(':checked')) price = label.serviceFree;
		else {
			var price = $('#' + id + '_amont').val() + ' ' + system.currency + ' / ' + label.hour;
			/*price += $('#' + id + '_ccy').val();
			var select = $('#' + id + '_freq');
			var freq = $(select.get(0).options[select.get(0).selectedIndex]).text();
			price += (freq!='-'?' / ' + freq :'');*/
		}
		$('#' + id + '_fix').removeClass('hide').text(price);
	}
	else if (that.hasClass('distance'))
	{
		var distance = $('#' + id + '_distance').val() + ' ';
		var select = $('#' + id + '_unity');
		distance += $(select.get(0).options[select.get(0).selectedIndex]).text();
		$('#' + id + '_fix').removeClass('hide').text(distance);
	}
	else {
		var txt ='';
		if (that.attr('birthdate')=='true') {
			var birth = convertDateFR(that.val());
			if (!/^(Invalid|NaN)/.test(birth)){
				var today = new Date();
				txt = today.getFullYear() - birth.getFullYear();
				txt = (txt==0 || txt==1)? txt+' an':txt+ ' ans';
			}
		}
		else if (that.hasClass('level')) {
			eval('txt = level.' + that.val());
		}
		else if (that.hasClass('gender')) {
			if (that.val()=='F') txt = label.woman;
			else txt = label.man;
		}
		else {
			txt = that.hasClass('input-loc')? that.attr('label'):that.val();
		}
		txt = txt.replace(/\n/g, "¦");
		var _fix = $('#' + id + '_fix');
		_fix.removeClass('hide')
			.text(txt)
			.parent().addClass('fix_content');
		txt = _fix.text().replace(/¦/g,' <br />');
  		_fix.html( addActivePeople(addActiveLinks(txt)) );
	}
}

sum = function(arr){//function to sum an array
    var sum = 0;
	$.each(arr, function(i, elem) {
		if (elem!=undefined) sum += elem;
	});
	return sum;
};

function createUploader(id,url,typ,iderror,multi){
	var nbfilesxhr = 0;
	var dicoloading = new Array();
	var dicoloaded = new Array();
	var delay5s = 0;
	var delayloading = 0;
	var idsimg = new Array();
	
	if(!$('#'+id).length) return;
    var uploader = new qq.FileUploader({
                element: document.getElementById(id),
                //listElement:$('#'+id+'-result').get(0),
                multiple : multi,
                action: '/app.php',
                params: {type: typ, go: url},
    	onSubmit: function(_id, _fileName) {
    		var nbphoto = $('#'+id+'-grp-img .pile-img').size();
    		if (nbphoto>=7) {
    			$('#'+iderror).find('.red-left')
	    					   .html('<em>- Le seuil maximum de 7 images a été atteint.</em>');
	    		$('#'+iderror).fadeIn();
    			return false;
    		}
    		$('#'+id+'-img').attr('src','js/images/loading.gif').show('slow');
			$('.qq-upload-drop-area').css('display','none');
			$('.post-img .meter').fadeIn(100);    //fade in progress bar   
			
			newimg = $('<div class="sub-menu-multi pile-img left hide" pid="'+_id+'" ">' +
							'<input class="postupload-hidden" type="hidden" name="thumb[]" value=""/>'+
						    '<img class="photo postupload-img left" src="/media/img/nopic120.png" style="margin-right:-20px"/>'+
						    '<span class="delete-img yoo-icon right alert button light" title="Supprimer la photo" onclick="$(this).parent().remove()" style="margin-top:2px"><span class="ui-icon ui-icon-closethick"></span></span>'+
					      '</div>');
		   $('#'+id+'-grp-img .meter').after(newimg);
		  
		   nbfilesxhr++;
    	},

    	onProgress: function(_id, _fileName, loaded, total) {
    		//if (loaded < total) {
    			if (dicoloading[_id]==undefined)  idsimg.push(_id);
    			dicoloading[_id] = loaded;
    			dicoloaded[_id] = total;
    			
    		//}
    		if (loaded >= total && delay5s == 0 /*&& idsimg.length == nbfilesxhr*/){
    			delay5s = setInterval(function(){
    				delayloading += (sum(dicoloaded)*100/(idsimg.length*6000));
    				$('.post-img .meter > span').width((sum(dicoloading)+delayloading)*100/(2*sum(dicoloaded))+'%');
    			},100);
    		}
    		
    		$('.post-img .meter > span').width((sum(dicoloading)+delayloading)*100/(2*sum(dicoloaded))+'%');
    	},
		 onUpload: function(id, fileName, xhr){
		 },
		 
    	onComplete: function(_id, _fileName, response) {
    		//if (delayloading[_id]== undefined) delayloading[_id]= 0;
    		//delayloading[_id]= dicoloaded[_id];
    		//if (sum(dicoloading) + delayloading >= 2*sum(dicoloaded)) { 
    		if (--nbfilesxhr == 0) {
    			
    			clearInterval(delay5s);
    			$('.post-img .meter').fadeOut(100);    //fade in progress bar
    			dicoloading.length = 0;
				dicoloaded.length = 0;
				delayloading = 0;
				delay5s = 0;
				idsimg.length = 0;
				$('.post-img .meter > span').width('0');
    		}
    		
    		newimg = $('#'+id+'-grp-img .pile-img[pid="'+_id+'"]');
    		
    		if (multi)
    		{    
    			if (response && response !== 'null') {
	    			if (response.success && response.id !== 'null' && response.id!=undefined) {
	    				var thumbnail_url = '/cache/' + response.id + '120.png';
	    				
	    				newimg.find('.postupload-img').attr('src',thumbnail_url);
	    				newimg.find('.postupload-hidden').attr('value',response.id);
	    				newimg.show();
	    				
	    				
	    				$('#'+iderror).addClass('hide').find('.red-left').html('');
	    				return true;
	    			}
	    		}
    		}
    		else {
	    		if (response && response !== 'null') {
	    			if (response.success && response.id !== 'null' && response.id!=undefined) {
	    				var thumbnail_url = '/cache/' + response.id + '120.png';
	    				$('.'+id+'-img').attr('src',thumbnail_url);
	    				$('#'+id+'-hidden').attr('value',response.id);
	    				newimg.show();
	    				
	    				$('#'+iderror).addClass('hide').find('.red-left').html('');
	    				return true;
	    				} else {
	    			}
	    		} else {
	    		}
	    	}
	    	
	    	newimg.remove();
	    	$('.qq-upload-drop-area').css('display','none');
	    	$('#'+iderror).fadeIn().delay(2000).fadeOut('slow',function(){$(this).find('.red-left').html('');})
	    						.find('.red-left')
	    						.html('<em>- L\'upload de votre photo a échoué! <br/>('+response.txt+')</em>');
    	}
	});           
}


function deletePost(id,sufix)
{
	/*$(id).find(".delete-act").click(function(e) {
		var url = $(this).attr('href');
		var title = $(this).attr('title');
		var alias = $(this).attr('alias');
		var actid = '#'+$(this).attr('act');
		var actrow = '#'+$(this).attr('act')+'-'+$(this).attr('type');
		if (alias == undefined) alias ='';
		else alias = "'"+alias+"'";
			Boxy.ask("Êtes-vous certain de vouloir "+title+" "+alias+"?", ['Oui', 'Annuler'], function(response) {
	            if (response == 'Oui') {
	            	$.getJSON (url,function(data){
	            		if (data.success) {
	            			if ($(actrow).size()) {
		            			$(actrow).show('highlight').fadeOut('slow',function(){
		            				$(actrow).remove();
		            			});
		            			if (sufix == 'more') {
		            				$(actid+'-more').find('.get-more').trigger('click');
		            				$(actid+'-more').show('highlight').fadeOut('slow',function(){
			            				$(actid+'-more').remove();
			            			});
		            			}
	            			}
	            			else {
	            				document.location.href='/';
	            			}
	            		}
	            	});
	            }
	        });
	});*/
	$(id).find(".delete-act").click(function(e) {
		var url = $(this).attr('href');
		var title = $(this).attr('title');
		var alias = $(this).attr('alias');
		var actid = '#'+$(this).attr('act');
		var actrow = '#'+$(this).attr('act')+'-'+$(this).attr('type');
		if (alias == undefined) alias ='';
		else alias = "'"+alias+"'";
			Boxy.ask("Êtes-vous certain de vouloir "+title+" "+alias+"?", ['Oui', 'Annuler'], function(response) {
	            if (response == 'Oui') {
	            	$.getJSON (url,function(data){
	            		if (data.success) {
	            			if ($(actrow).size()) {
		            				$(actrow).show('highlight').fadeOut('slow',function(){
		            				//$(actrow).remove();
		            				$isotope.isotope('remove',$(actrow));
		            			});
	            			}
	            			else {
	            				document.location.href='/';
	            			}
	            		}
	            	});
	            }
	        });
	});
}

function loadMyProfil()
{
	
	if ($('#my-profil').length) {
		if ( !$('#my-options').length || $('#my-options').is(':hidden') ) {
			if ($('#my-profil').is(':hidden')) $('#my-profil').fadeIn('slow');
			else $('#my-profil').slideUp('slow');
		}
		else 
			$('#my-options').slideUp('slow',function(){$('#my-profil').fadeIn('slow')});
	}
	else loadMySpace('#myspace','/ajax/myprofil','loadMyProfil');
}
function loadMyOptions()
{
	if ($('#my-options').length) {
		if (!$('#my-profil').length || $('#my-profil').is(':hidden')) 
			if ($('#my-options').is(':hidden')) $('#my-options').fadeIn('slow');
			else $('#my-options').slideUp('slow');
		else 
			$('#my-profil').slideUp('slow',function(){$('#my-options').fadeIn('slow')});
		
	}
	else loadMySpace('#myspace','/ajax/myoptions','loadMyOptions');
	
}
function loadMySpace(elem,action,callback)
{
	$.getJSON(action,function(data){
				if (data.success)
			 	{ 
			 		data.html = Encoder.htmlDecode(data.html);
			 		$(elem).append(data.html);
			 		enableComponentsMySpace(data.meta);
			 		window[callback]();
			 	}
			 }
			);
}

// connect and deconnect people
function attach(data, statusText, form) { 
    // submit the form
	if (data.success) 
	{
 		data.html = Encoder.htmlDecode(data.html);
 		//var id = $(form).find('input[name=id]').val();
 		var id = data.meta.towho;
 		$('.'+id+'-follow').html(data.html);
 		if ($('#'+id+'-status').size()) $('#'+id+'-status').text(data.txt);

 		repeatForFollow('.'+id+'-follow');
 		repeatForBoxyAndTooltip('.'+id+'-follow');
 		
 		// s'il est suivi par quelqu'un le notifier par mail.
 		if(data.meta.isFollowed) sendMail('00',id);
		return true;
	}
	else 
	{
		// TODO 
		error
	}
    // return false to prevent normal browser submit and page navigation 
    return false; 
};



function sendMail(sender,recever)
{
	$.getJSON('/ajax/message/sendmail/'+sender+'/'+recever);
}

var loader;
jQuery(function() {
	loader = $('<div id="loader" class="hide" style="position:absolute;right:0;bottom:0;"> <img style="border:none" src="/css/images/loading.gif" alt="loading.." /></div>');  
	
	$('body').append(loader);					
	// show a simple loading indicator
	/*loader = jQuery('<span id="loader"><img src="js/images/loading.gif" alt="loading..." /></span>')
		.css({position: "relative", top: "0", left: "0"})
		.appendTo(".art-button-wrapper")
		.hide();*/
	loader.ajaxStart(function(ex) {
		//$('.art-button-wrapper span').hide();
		loader.show();
	}).ajaxStop(function() {
		//$('.art-button-wrapper span').show();
		loader.hide();
	}).ajaxError(function(a, b, e) {
		//loader.hide();
		//throw e;
	});
	
});

function isEmail(value) {
	return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(value);
}



function coreId(elem,split){
	if (split==undefined) split = '_';
	return $(elem).attr('id').split(split,1);
}

function convertDateFR(strDate){	  
	    day = strDate.substring(0,2);
		month = strDate.substring(3,5);
		year = strDate.substring(6,10);
		d = new Date();
		d.setDate(day);
		d.setMonth(month);
		d.setFullYear(year); 
		return d;  
}

function focusNext(that)
{
	var next = null;
	if ($(that).hasClass('next')) next = $(that).attr('next');
	if ($(that).hasClass('prev')) next = $(that).attr('prev');
	$(that).removeClass('prev next');
	if (typeof next!='undefined'){
		$('[tabindex='+next+']').focus();
	}		
}


var TABUL_BACK = false;
(function($){
$.fn.extend({ 
	ctrl : function(key,shine, callback, args) {
	    var isCtrl = false;
	    $(this).keydown(function(e) {
	        if(!args) args=[]; // IE barks when args is null
	        if(e.which == 16 || e.which == 54) isCtrl = true;
	        if(e.keyCode == key.charCodeAt(0) && isCtrl) {
	        	if(!$(document.activeElement).is(':input') || mainsearch.isFocus())
	        	{
		        	if (shine) $('#input_bysearch').effect("bounce", {}, 'fast'); 
		            callback.apply(this, args);
		            return false;
	        	}
	        }
	    }).keyup(function(e) {
	        if(e.which == 16 || e.which == 54) isCtrl = false;
	    });
	},
	tabulTextBox : function(callback, args) {
	    //var isprevious = false;
	    var last = null;
	    $(this).keydown(function(e) {
	        if(!args) args=[]; // IE barks when args is null
			//if(e.which == 16) return isprevious = true; 
	        if(e.which == 9 && TABUL_BACK) {
	        	 callback.apply (this, ['prev']);
	        }
		    else if (e.which == 9) callback.apply(this, ['next']);
	    });
	}
	
});
})(jQuery);




// $('img.photo',this).imagesLoaded(myFunction)
// execute a callback when all images have loaded.
// needed because .load() doesn't work on cached images
 
// mit license. paul irish. 2010.
// webkit fix from Oren Solomianik. thx!
 
// callback function is passed the last image to load
//   as an argument, and the collection as `this`
 
 
$.fn.imagesLoaded = function(callback){
  var elems = this.filter('img'),
      len   = elems.length,
      blank = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
  
  if (!elems.length) return callback.call(elems,this); 
      
  elems.bind('load.imgloaded',function(){
      if (--len <= 0 && this.src !== blank){ 
        elems.unbind('load.imgloaded');
        callback.call(elems,this); 
      }
  }).each(function(){
     // cached images don't fire load sometimes, so we reset src.
     if (this.complete || this.complete === undefined){
        var src = this.src;
        // webkit hack from http://groups.google.com/group/jquery-dev/browse_thread/thread/eee6ab7b2da50e1f
        // data uri bypasses webkit log warning (thx doug jones)
        this.src = blank;
        this.src = src;
     }  
  }); 
 
  return this;
};