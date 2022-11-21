

$(document).ready(function () {
	 
	 	repeatForTchat('#art-main');
		//deletePost('#art-main','');
		
		/* get news messages */
		$(document).everyTime(60000, function(i) {
			$.ajax({
					global:false,
					dataType: 'json',
					url:'/ajax/message/countnew',
					success: function(data)
				  			{
					  			if (data.success){
						  			if (data.meta != unread)
						  			{
							  			unread = data.meta;
							  			if (unread) $('#unread').addClass('positive').show().html(eval(unread));
							  			else $('#unread').hide();
							  			$.ajax({
											global:false,
											dataType: 'json',
											url:'/ajax/message/countnew/'+idwho,
											success: function (data,statusText) {
								  				var usrnews = $('#'+idwho+'-unread');
								  				if (usrnews.size()) {
									  				if (data.meta) usrnews.show().html(eval(data.meta));
									  				else usrnews.hide();
								  				}
							  				}
							  			});
							  			$.ajax({
											global:false,
											dataType: 'json',
											url:'/ajax/message/news',
											success: function (data,statusText) {
								  				$('#not-read_Block').html(data.html);
							  				}
							  			});
						  			}
					  			}
					  			// send email in waiting if there is
					  			sendMail('00',idme);
				  			}
				});
			
		},null);
		
		listenGetMsgContact('#block-recent-contact');
		$("input[name='searchcontact']").change(function() {
		   $.getJSON('/ajax/message/contacts/'+$(this).val(), function (data,statusText) {
					$('#block-recent-contact .recent-contact').unbind('click');
	  				$('#block-recent-contact').html(data.html);
	  				listenGetMsgContact('#block-recent-contact');
  			});
		});
	
 });
 
 function repeatForTchat(id)
 {
	 $(id).find(".form-msg").validate({
			errorContainer: $("#warning, #summary"), 
			rules: {
				msg: {
					required: true,
					differentTo: label.msg + '...'
				}
			},
			messages: {
				msg: "",
			},
			submitHandler: function(form) {
				jQuery(form).ajaxSubmit({
					dataType:  'json',
			        success:   addMsg
				});
			}
		});
	
 	inFieldLabel(id);
	$(id).find('.autoresize').autoResize({}).trigger('change');
	deletePost(id,'');
 }
 
 function accept(that,answer,destinataire,typedeal,badge)
 {
 	 var bulle = $(that).parents('.msg-bulle');
	 $.ajax({
		  type: 'POST',
		  url: (typedeal=='DEAL'?'/ajax/attach/'+answer :'/ajax/badges/transfert/user/'+answer),
		  data: {id:destinataire,thebadge:badge, towho:destinataire,typereq:answer,act:'save',idmsg:bulle.attr('idmsg')},
		  dataType: 'json',
		  success: function(data, statusText, form)
					{
					 	if (data.success)
					 	{
					 		if (typedeal=='DEAL') attach(data,statusText,form);
					 		else sendMail('00',destinataire);
					 		
					 		bulle.find('.ask-todeal.no-answer')	.removeClass('no-answer')
					 									.hide('slow',function(){
					 										$(this).html( "<span style='display:inline-block;margin-bottom:-3px' class='ui-icon ui-icon-"+(answer=='Y'?'check':'cancel') +" '></span>"
						 											+"<b>"+ (answer=='Y'?button.accepted:button.rejected) + '</b>')
						 											.show('slow');
					 									});
					 	}
					}
	 });
 }
 
//validate signup form on keyup and submit
 function addMsg(data,nothing,form) { 
 	if (data.success) 
 	{	
 		data.html = Encoder.htmlDecode(data.html);
 		var elm = $('<div>'+data.html+'</div><div class="cleared"></div>').hide();
 		$(form).parent().parent().find('.start-tchat').after(elm);
 		elm.show('highlight');
 		$(form).find('textarea').val('');
 		deletePost(elm,'');
 		
 		sendMail('00',data.meta);
 		return true;
 	}
 	else 
 	{
 		// TODO error
 	}
     // return false to prevent normal browser submit and page navigation 
     return false; 
 };
 
 
 
 function listenGetMsgContact(id){
	$(id).find('.recent-contact').click(function(){
		var that = $(this);
		var idusr = that.attr('idusr');
		var action = '/ajax/message/light/'+ idusr;
		var sideleft = $('.'+idusr+'-subsub-msg');
		$(id).find('.recent-contact').removeClass('active');
		that.addClass('active');
		$('.art-content .msg-All').hide();
		$('body').scrollTo(0,{axis:'y'})  
		
		if (sideleft.size()) {
			sideleft.show();													
		} 
		else { 
			$.getJSON(action,function(data){
				if (data.success)
			 	{
			 		var div = $('<div/>');
			 		div.html(data.html);
			 			
			 		$('.art-content').append(div);
			 		repeatForTchat('.'+idusr+'-subsub-msg');
			 		sideleft.show();	
			 	}
			});
		}
	});
	
};
