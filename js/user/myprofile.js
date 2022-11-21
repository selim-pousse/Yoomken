$(document).ready(function() { 
	
	// this one requires the text "checkResource", we define a default message, too
	$.validator.addMethod("checkServiceP", function(value) {
		return true;
		return ($('#myprofil-serv_input .resumeview input').size() != 0);
		}, sharebox.services.provider // '- Antant que travailleur, selectionner au minimun un service proné'
	);
	$.validator.addMethod("checkServiceC", function(value) {
		return true;
		return ($('#myprofil-serv-c_input .resumeview input').size() != 0);
		}, sharebox.services.asker // '- Antant que recruteur, selectionner au minimun un service recherché'
	);
	
	$.validator.addMethod("checkUrls", function(value,elem) {
			if (elem.value=='')return true;
			
			var values = elem.value.split('!+!');
			var areUrl = true;
			for (var i = 0, I = values.length; i < I; i++){
				var val = values[i];
				var isId = /^[0-9a-f]{32}$/i.test(val);
				var isUrl = /^((https?|ftp):\/\/){0,1}(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(val);
				if (!isUrl && !isId) {
					var idcore = $(elem).attr('id').split('_',1);
					$('#' + idcore + '_fix a[index="'+i+'"]').addClass('textboxlist-bit-red');
					areUrl = false; 
				}
			};
			return areUrl;
		}, signup.weburls.unvalid //'- Un ou plusieurs de vos URL sont invalides.'
	);
	
	
});

function enableTabs(id) {
	$(id).find( ".profil-tabs" ).tabs().removeClass('ui-widget ui-widget-content').find('ul').removeClass('ui-corner-all');
	$(id).find( ".profil-tabs .ui-state-default" ).removeClass('ui-widget ui-widget-content ui-corner-top');
}	
	
function enableComponentsMySpace(id) { 
		toggleEditFields(id);
		
		enableTabs(id);
		
		$(id).find('#myprofil-serv_input').viewedit(
		{	
			profondeur: 2,
			name:'service_P',
			json_url:'/services/P'
		});
		
		$(id).find('#myprofil-serv-c_service').viewedit(
		{	
			profondeur: 2,
			name:'service_C',
			json_url:'/services/C'
		});

		var validator  = $(id).find("#profil-form")
			.bind("invalid-form.validate", function() {
				var the_validator = $.data(validator[0], 'validator');
				var msg_nberrors = signup.resumy.nberrors; //= "Votre formulaire contient " + the_validator.numberOfInvalids() + " erreur(s) :";
				msg_nberrors = msg_nberrors.replace(/\{#n\}/,the_validator.numberOfInvalids());
				$("#profil-summary .red-left").html("<b style='color:#8F4343'>"+msg_nberrors+"</b>");
				})
			.validate({
				errorElement: "em",
				errorContainer: $("#warning, #profil-summary"),
				errorPlacement: function(error, element) {
					error.appendTo( $('#profil-summary .red-left'));
					var _id = coreId(element);
					//$('#'+_id+'_label').addClass('error');
				}, 
		        rules: {
		                fullname: {
							minlength: 5,
		                	required: true
		                },
		            	address: {
	                        required: true
		                },
		                birth:{
		                	date: true
		                },
		                yearsexp: {
		                    number: true
		            	},
		                servhide: { 
			                checkServiceP: true
		            	},
		            	servhide_c: { 
			                checkServiceC: true
		            	},
		                website: { 
		            		checkUrls: true
		            	},
		            	datedispo: {
		            		date: true
		            	},
		            	pseudo: {
							minlength: 2,
							required: true,
							remote:'/ajax/availablePseudo',
							pseudoRegex: true
						}
		        },
		        messages: {
		                fullname: {
		                	required: signup.fullname.required, //"- Le nom complet (prénom et nom de famille) est requis."
							minlength: signup.fullname.minlength//"- Le nom complet doit contenir au minimum n charactères.",
		                },
		            	address: signup.location.required, //"- Précisser le lieu de votre localisation.",
		            	yearsexp: "",
		            	birth: signup.birthdate.unvalid, //"- La date de naissance est non valide, doit correspondre à la forme dd/mm/aaaa.",
		                email: signup.email.required, //"- L'adresse electronique est non valide",
		                datedispo: signup.datedispo.unvalid,  //"- La date de disponibilité est non valide, doit correspondre à la forme dd/mm/aaaa.",
						pseudo: {
							minlength: signup.pseudo.minlength,//"- Le pseudonyme doit contenir au minimum n charactères.",
							required: signup.pseudo.required,//"- Saisisser un nom d'utilisateur unique.",
							remote: signup.pseudo.remote,//"- Le nom d'utilisateur est déjà enregistré.",
							pseudoRegex: signup.pseudo.pseudoRegex//"- Le nom d'utilisateur est non valide, seul les caractères alphanumériques sont acceptés."
						}
		        },
		        submitHandler: function(form) {
		        	$(form).filter('input[name="file"]').remove();
			         jQuery(form).ajaxSubmit({
			             dataType:  'json',
			             data : {json:1},
			             success:   saveProfil
			         });			         
			     },
			     debug:false
			});
		
		if ($(id).find('#myprofilupload').length)
		{
			createUploader('myprofilupload','content/upload/','profile','summary',false);
		}

		$(id).find("input.date").mask("99/99/9999");
		
		$(id).find(".focusout").focus(function() {
			/*
			 *  focusout from the current one
			 */
			var input = $(this).parent();
			var idmain = input.attr('id').split('_',1);
			idmain = idmain[0];
			var split = idmain.split('-',3);
			if (split[1]=='serv')
			{
				blurInputService(split[2]=='c'?'-c':'');	
			}
			else if ($('#'+idmain).hasClass('setinput')) hideAfterBlur('#'+idmain+'_input');
			
			/*
			 *  focusin to the next one
			 */	
			var id = $(this).attr('next');
	  		if (id && id.substr(0,2)=='my')
	  		{
		  		//elem_click = null;
		  		clickEditFields('#'+id);
		  	}
	  		else {
	  			$('[tabindex='+id+']').focus();
	  		}
		});
		
		$(id).find(".focusin").focus(function() {
			var id = $(this).attr('id').split('_',1);
	  		clickEditFields('#'+id);
		});
		
		$(id).find(".costfree").change(function() {
	  		var id = $(this).attr('id').split('_',1);
	  		if($(this).is(':checked')) {
	  			$(this).parent().find('select,input:text').attr('disabled','disabled').addClass('disabled');
	  			$('#'+id+'_amont').val('0');
	  		} 
	  		else $(this).parent().find('select,input:text').removeAttr('disabled').removeClass('disabled');
		});
		
		$(id).find( "#my-selectable" ).calendar({stop: function() {
			//debugger;
			$( "#my-calendar-result" ).val('');
			$( ".ui-selectee", this ).each(function() {
				var index = $( ".ui-selectee" ).index( this );
				if ( ((index % 16) == 0) && index!=0) $( "#my-calendar-result" ).val($( "#my-calendar-result" ).val()+',');
				$( "#my-calendar-result" ).val($( "#my-calendar-result" ).val() + ($(this).hasClass('ui-selected')? '1':'0') );
			});
		}});
		
		$(id).find('#form-opt').ajaxForm({
			dataType:  'json',
	        success:   saveSetting
		});
}

function saveProfil(data,nothing,form)
{ 
	if (data.success) 
	{	
		$('#profil-success').fadeIn().delay(3000).fadeOut('slow',function(){});
	}
	else 
	{
		$('<em>Ooops, erreur survenue: '+data.message+'</em>').appendTo( $('#profil-summary  .red-left'));
		$('#profil-summary').fadeIn().delay(1000).fadeOut('slow',function(){$('#profil-summary .red-left').html('');});
	}
    // return false to prevent normal browser submit and page navigation 
    return false; 
};

function saveSetting(data,nothing,form)
{ 
	if (data.success) 
	{	
		$('#myoption-success').fadeIn().delay(3000).fadeOut('slow',function(){});
	}
	else 
	{
		$('<em>Ooops, erreur survenue: '+data.message+'</em>').appendTo( $('#profil-summary  .red-left'));
		$('#myoption-summary').fadeIn().delay(1000).fadeOut('slow',function(){$('#profil-summary .red-left').html('');});
	}
    // return false to prevent normal browser submit and page navigation 
    return false; 
};

function blurInputService(num)
{	
		$("#profil-form").valid();
 		$('#myprofil-serv'+num+'_edit').removeClass('hide');
 		$('#myprofil-serv'+num+'_input').addClass('hide');
 		$('#myprofil-serv'+num+'_box .yoo-icon').removeClass('hide');
		var bulles ='', values = $('#myprofil-serv'+num+'_input .resumeview input').gather(true,'alias');
		$.each(values, function(i, p){                
            bulles += "<a class='textboxlist-bit textboxlist-bit-box' style='text-decoration: none;color:#685840;cursor:pointer'>"+p+"</a>";
		});
		$('#myprofil-serv'+num+'_fix').removeClass('hide')
		   .html(bulles);
}

function availability(status)
{
	$.getJSON('/ajax/status/'+status,function(data){
		if (data.success) 
		{	
			var clas,lblst;
			switch(status)
			{
				case -1: clas = 'caseOut';lblst = label.status__1;break;
				case  3: clas = 'caseBusy';lblst = label.status_2;break;
				case  4: clas = 'caseIndispo';lblst = label.status_4;break;
				default: clas = 'caseDispo';lblst = label.status_1;break; //status=2
			}
			$('.me-isaware').attr('class',clas + ' me-isaware caseBigger');
			$('.tooltips .me-isaware').next().text(lblst);
		}
		else 
		{
			//something wrong
		}
	})
}

function keepFocus(elem,elem_click)
{
	//if (edit_click==false) return false;
	var edit_isclicked = false;
	$.each($('._input'),function(){
		if (!$(this).hasClass('hide')) edit_isclicked = true;
	});
	if (edit_isclicked==false) return false;
	
	var id = elem.attr('id').split('_',1);
	id = (typeof id=='string')?id:id[0];
	var isfocus = (id==elem_click);
	if (!isfocus) 
	{
		var split = elem_click.split('-',3);
		if (split[1]=='serv')
		{
			blurInputService(split[2]=='c'?'-c':'');	
		}
		else if ($( '#'+ elem_click).hasClass('setinput')) hideAfterBlur($( '#'+ elem_click + "_input" ));
	}
	return isfocus;
	/*
	 $.each(node.find( ".blurinput" ), function() {
   		if ($(this).is( ":focus" )) return isfocus = true; 
  	 }); 
  	 return isfocus;*/
  	 
}
