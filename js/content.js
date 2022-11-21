

$(document).ready(function() { 
	/*
	 *  For controller journal
	 */
	$( "#post-offer").buttonset();
	
	toggleEditFields('#art-main');
	repeatForFollow('#art-main');
	
	createUploader('postupload','content/upload/','share','error-post', true); 
	
	jQuery.validator.addMethod("empty", function(value, element) { 
		var idgen = $(element).attr('id').split('_',1);
		var type = $('#'+ idgen + '_flux').val();
		if ($(element).attr('name')=='desc'){
			var _desc = type=='SV'? label.desc_sv:label.desc_jb;
			if (element.value == _desc)  return false;
			 return true;
		}
		if ($(element).attr('name')=='title'){
			var _desc = type=='SV'? label.title_sv:label.title_jb;
			if (element.value == _desc)  return false;
			 return true;
		}
		else if ($(element).attr('name')=='alias'){
			if (element.value == 'Alias du filtre...')  return false;
			 return true;
		}
		else return true;
	});
   
  	function split( val ) {
		return val.split( /,\s*/ );
	}
	function extractLast( term ) {
		return split( term ).pop();
	}


	$('.sharebox-desc').focus(function() {
	  $('#1-share_Block').find('.sharebox-footer,.grp_tag_loc').fadeIn(1000);
	  $('#error-post').css('position','absolute');
	});
	mentionsPeople($('.sharebox-desc'));
	
	$( "#presta_tags").textboxlist({title:label.tags,unique: true, plugins: {autocomplete: {
		queryRemote: true,
		remote: {url: '/ajax/tags'}
	}},afterBlur : function(){}});
	
	$( "#presta_address" ).textboxlist({title:label.location,max:1,unique: true, plugins: {autocomplete: {
		queryRemote: true,
		source: codeAddress,
		onlyFromValues :true
	}}});
	
	$( "#textbox_collabo" ).textboxlist({title:label.collaborator,max:1,unique:true, plugins: {autocomplete: {
		queryRemote: true,
		remote: {url: '/ajax/collaborator/like'},
		onlyFromValues :true
	}}});
	
	$.validator.addMethod("checkCollaborator", function(value,elm) {
		if ($('#post-avis:checked').length)
		{
			if ($('input[name=collaborator]').val()) return true;
			else return false;
		}
		else return true;
	}, "");
	$.validator.addMethod("existCollaborator", function(value,elm) {
		if ($('#post-avis:checked').length)
		{
			if ($('#exist_collaborator').val()=='0') {
				return false;
			}
			else return true;
		}
		else return true;
	}, "");
	$.validator.addMethod("myRequired", function(value,element) {
		if ($('#post-avis:checked').length)
		{
			if ($('#exist_collaborator').val()=='0') {
				return true;
			}
		}
		return $.trim(value).length > 0 && value != $(element).attr('placeholder');;
	}, "");	
	
	$.validator.addMethod("checkServiceQ", function(value) {
			if ($('#post-ask:checked').length)
			{
				return ($('#question-service_input .resumeview input').size() != 0);
			}
			else return true;
		}, sharebox.services.required // '- Choisir au moins une catégorie de service pour votre question.'
	);
	
				
	$("#presta_form").validate({
		errorElement: "em",
		errorContainer: $("#warning, #error-post"),
		errorPlacement: function(error, element) {
			error.appendTo( $('#error-post .red-left'));
		}, 
		rules: {
			title: {
				maxlength: 60,
			},
			desc: {
				myRequired: true,
				//empty: true
				maxlength: 1500
			},
			countColla: {
				existCollaborator: true
			},
			collaborator: {
				checkCollaborator :true
			},
			servhide_q: { 
			                checkServiceQ: true
		            	}
		},
		messages: {
			title: {
				maxlength: sharebox.title.maxlength//"-La description doit contenir au maximum {#n} caractères.",
			},
			desc: {
				myRequired: sharebox.description.required,//"- Une description est requise.",
				maxlength: sharebox.description.maxlength//"-La description doit contenir au maximum {#n} caractères.",
			},
			collaborator: {
				checkCollaborator : sharebox.collaborator.required//"- La critique doit nécessairement référencer un collaborateur."
			},
			countColla: {
				existCollaborator : sharebox.collaborator.notexist //"- Vous ne pouvez pour l'instant pas déposer d'avis vu que vous n'avez encore collaboré avec personne."
			}
		},
		submitHandler: function(form) {
			var  mentions = null;
			$(form).find('textarea.mention').mentionsInput('val', function(text){mentions = text});
			jQuery(form).ajaxSubmit({
				dataType:  'json',
				data:{desc:mentions},
		        success:   shareAd
			});
		}
	});
	
		
		
	repeatForPost('#art-main','');
	listenGetMore('#art-main','act');
	repeatForComment('#art-main');
	repeatForLike('#art-main');
});


function repeatForPost(id,sufix)
{
	inFieldLabel(id);
	$(id).find(".ad_form textarea[name='desc'],.ad_form input[name='title']").blur(function() {
		$(this).valid();
	});
	$(id).find(".close-red").click(function() { 
		$(this).parents('.area-error').fadeOut(500);
	});

	// init toolbox of addthis
	addthis.toolbox( $(id).find('.addthis_toolbox').get(0));

	deletePost(id,sufix);
	
	mentionsPeople($(id).find(".form-save-post .mention"));
	$('.txtmention').addClass('hide');
	
	
	$(id).find(".form-save-post").validate({
		errorElement: "em",
		errorContainer: $("#warning, #error-ad-save"),
		errorPlacement: function(error, elm) {
			var id = coreId(elm,'-');	
			var valids = $('#'+id+'_form'+sufix).witchIsValid();
			
			valids.push(elm);
			valids.each(function(){
				var em_exist = $('#error-ad-save .red-left').find('em[name='+$(this).attr('name')+']');
				if (em_exist.size()){
					em_exist.remove();
				}
			});
			//var em_exist = $('#error-ad-save .red-left').find('em[name='+elm.attr('name')+']');
			/*if (em_exist.size()){
				em_exist.remove();
			}*/
			error.attr('name',elm.attr('name'));
			//$('#error-ad-save .red-left').html('');
			error.appendTo( $('#error-ad-save .red-left'));
			
			var id = coreId(elm,'-');
			
			var offset_togo = $('#'+id+'_form'+sufix).offset();
			$('#error-ad-save').show().offset({top:offset_togo.top});
			if (!$('#error-ad-save').hasClass('waiting')) 
					$('#error-ad-save')	.addClass('waiting')
										.fadeIn()
										.delay(1000)
										.fadeOut('slow',function(){$(this).removeClass('waiting')});
			
			//$('#profil-'+element.attr('name')+'_label').addClass('error');
		}, 
		rules: {
			title: {
				required: true,
				maxlength: 50
			},
			desc: {
				required: true
				//maxlength: 240
			}
			
		},
		messages: {
			title: {
				required: "- Un titre est requis",
				maxlength: "- Le titre doit comporter au maximum 50 charactéres"
			},
			desc: {
				required: "- Une description est requise",
				maxlength: "-La description doit comporter au maximum 240 charactéres"
			}
		},
		submitHandler: function(form) {
			var  mentions = null;
			$(form).find('textarea.mention').mentionsInput('val', function(text){mentions = text});
			jQuery(form).ajaxSubmit({
				dataType:  'json',
				data: {sufix: sufix,desc:mentions},
				/*beforeSubmit:  showRequest,*/
		        success:   saveAd
			});
		}
	});
}


//validate signup form on keyup and submit
function shareAd(data,nothing,form) { 
	if (data.success) 
	{	
		toggleShareBox();
		data.html = Encoder.htmlDecode(data.html);
		var elm = $(data.html).css('opcaity',0);
		$('#timeline').prepend(elm);
		
		elm.find('img').imagesLoaded(function() {
				elm.css( 'opacity',1);
			  	//$isotope.isotope('appended', elm);
			  	$isotope.prepend( elm).isotope( 'reloadItems' ).isotope({ sortBy: 'original-order' });
  
				repeatForSlider(elm.find('.widget-slider .flexslider'));
				
				repeatForPost(elm,'');
				toggleEditFields(elm);
				listenGetMore(elm,'act');
				repeatForFilter(elm);
				repeatForLike(elm);
				
		});
			
		//elm.show('highlight');
		
		// vider le formulaire
		var form = $("#presta_form");
		if (form.length)
		{
			$("#presta_form").clearForm();
			$('#presta_form input:radio[name=type]')[0].checked = true;
			$('#postupload-hidden').val('');
			$('#postupload-img').attr('src','/media/img/nopic120.png');
		}
		else 
		{
			$("#question_form").clearForm();
		}
		$(form).find('textarea.mention').val('').mentionsInput('reset');
		$(form).find('.pile-img').html('');

		
		
		var beg = eval($('.fetch-more').attr('beg'))+1;
		var tot = eval($('.fetch-more').attr('total'))+1;
		$('.fetch-more').attr('total',tot)
						 .attr('beg',beg);
		$('#nbread').text(beg);
		
		$.each(data.meta.mentionedPeople, function(index, value) {  // prévenir ceux qui ont été mentionné
		 	sendMail('00',value);
		});
		
		return true;
	}
	else 
	{
		$('<em>Ooops, erreur survenue: '+data.message+'</em>').appendTo( $('#error-post2 .red-left'));
		$('#error-post2').fadeIn().delay(1000).fadeOut('slow',function(){$('#error-post2 .red-left').html('');});
	}
    // return false to prevent normal browser submit and page navigation 
    return false; 
};


function saveAd(data,nothing,form) 
{ 
	var offset_togo = $(form).offset();
	if (data.success) 
	{	
		/*$('#post-success').show().offset({top:offset_togo.top});
		$('#post-success').fadeIn().delay(3000).fadeOut('slow',function(){});
		$('#'+data.id+'_form .date').text(' '+label.time.now);
		var elm = $('#'+data.id+'-act').show('highlight')
								.hide('slow',function(){
									$(this).detach()
									.prependTo('#timeline')
									.show('slow',function(){
										$(this).show('highlight');
									});
								});*/
		//$('#'+data.id+'-act')
		
		$('#post-success').show().offset({top:offset_togo.top});
		$('#post-success').fadeIn().delay(3000).fadeOut('slow',function(){});
		
		$isotope.isotope('remove',$('#'+data.meta.pidold+'-act'),function(){
			$('#'+data.meta.pidold+'-act').remove();
			
			data.html = Encoder.htmlDecode(data.html);
			var elm = $(data.html).css('opcaity',0);
			$('#timeline').prepend(elm);
			
			elm.find('img').imagesLoaded(function() {
					elm.css( 'opacity',1);
				  	//$isotope.isotope('appended', elm);
				  	$isotope.prepend( elm).isotope( 'reloadItems' ).isotope({ sortBy: 'original-order' });
	  
					repeatForSlider(elm.find('.widget-slider .flexslider'));
					
					repeatForPost(elm,'');
					toggleEditFields(elm);
					listenGetMore(elm,'act');
					repeatForFilter(elm);
					repeatForLike(elm);
					
			});
		})
				
		return true;
	}
	else 
	{
		$('<em>Ooops, erreur survenue: '+data.message+'</em>').appendTo( $('#error-post .red-left'));
		$('#error-post').show().offset({top:offset_togo.top});
		$('#error-post').fadeIn().delay(1000).fadeOut('slow',function(){$('#error-post .red-left').html('');});
	}
    // return false to prevent normal browser submit and page navigation 
    return false; 
};


//pre-submit callback 
function showRequest(formData, jqForm, options) { 
    var queryString = $.param(formData); 
    var idgen = $(jqForm).attr('id').split('_',1);
	var type = $('#'+ idgen + '_form input[name=type]').val();
	var _title = type=='SV'? label.title_sv:label.title_jb;
	var _addr = label.location;
	var _tags = label.tags;
	var title = $('#' + idgen + '_title');
	var tags = $('#' + idgen + '_tags');
	var addr = $('#' + idgen + '_adress');
	if (title.val() == _title) title.attr('value','');
	if (addr.val() == _addr) addr.attr('value','');
	if (tags.val() == _tags) tags.attr('value','');
    // here we could return false to prevent the form from being submitted; 
    // returning anything other than false will allow the form submit to continue 
    return true; 
} 


function toggleShareBox()
{
		var prestaButt,prestaBloc;
  		if ($('#1-share_Button').length)
		{
	  		prestaButt  = $('#1-share_Button');
	  		prestaBloc =  $('#1-share_Block');
	  	}
	  	else {
	  		prestaButt  = $('#share-question_Button');
	  		prestaBloc =  $('#share-question_Block');
	  	}
	  	
		prestaBloc.toggleClass('hide');
		prestaButt.toggleClass('down');
}

function changeShareBox(sv,show,profil)
{
	//var prestaButt  = $('#1-share_Button');
  	//var prestaBloc =  $('#1-share_Block');
  	var _textarea = $('#presta_form').find('textarea');
  	//debugger;
  	if ($(_textarea).attr('placeholder')==$(_textarea).val())  _textarea.val('');
	eval("_textarea.attr('placeholder',label.textaera_" + sv + ")");
	
	$('#presta_form .textboxlist').css({'width':'502px'});
	
	if (show == 'TAG'){
		$('.textbox-TAG').show();
		$('.textbox-COL,.textbox-SEV').hide();
		if (sv == 'NW' || sv=='CR') {
			$('#presta_form .textboxlist').css({'width':'502px'});
			$('#presta_form .sharebox-paie').hide();
		}
		else {
			$('#presta_form .textboxlist').css({'width':'385px'});
			$('#presta_form .sharebox-paie').show();
			
		}
	}
	else if (show=='COL'){
		$('.textbox-COL').show();
		$('.textbox-TAG,.textbox-SEV').hide();
	}
	else {
		if (!$('#question-service_input .resumeview').length)
		{
			$('#question-service_input').viewedit(
				{	
					profondeur: 2,
					name:'service',
					json_url:'/services/E'
				}
			);
		}
		
		$('.textbox-SEV').show();
		$('.textbox-TAG,.textbox-COL').hide();
	}
	
	if (profil=='N' || profil=='B') {
		if (sv == 'NW' || sv=='CR' || sv=='QU') {
			$('.sharebox-footer').find('.asker,.provider').hide();
			$('.sharebox-footer').find('.neutral').show();
		}
		else {
			$('.sharebox-footer').find('.asker,.provider').show();
			$('.sharebox-footer').find('.neutral').hide();
		}
	}
	
	if (sv == 'NW') $('#post-news').attr('checked',true);
	else if (sv == 'AV') $('#post-avis').attr('checked',true);
	else if (sv == 'CR') $('#post-creation').attr('checked',true);
	else if (sv == 'QU') $('#post-ask').attr('checked',true);
	else $('#post-job').attr('checked',true);
	
	/*if (	$('#error-post .red-left').html() || 
			$('#post-avis:checked').length && $('#exist_collaborator').val()=='0'
		) $('#presta_form').valid();*/
	$('#error-post').fadeOut(500);
	
	_textarea.trigger('change'); 
}



