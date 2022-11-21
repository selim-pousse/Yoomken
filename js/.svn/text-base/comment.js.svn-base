function repeatForComment(id)
 {				
	 $(id).find(".form-cmt")
	 	.validate({
			errorContainer: $("#warning, #summary"), 
			rules: {
				msg: {
					required: true,
					differentTo: label.cmt
				}
				
			},
			messages: {
				msg: "",
			},
			submitHandler: function(form) {
				var  mentions = null;
				$(form).find('textarea.mention').mentionsInput('val', function(text){mentions = text});
				jQuery(form).ajaxSubmit({
					dataType:  'json',
					data:{txtcmt:mentions},
			        success:   addCmt
				});
			}
		});
	
 	inFieldLabel(id);
	mentionsPeople($(id).find(".form-cmt .mention"));
	
	
	$(id).find('.dellk-cmt-getall').click(function(e){
		var url = $(this).attr('href');
		$.getJSON (url,addCmt);
		$(this).hide();
	});
 }
 
//validate signup form on keyup and submit
function addCmt(data,nothing,form) { 
 	if (data.success) 
 	{	
 		data.html = Encoder.htmlDecode(data.html);
 		var elm = $('<div>'+data.html+'</div><div class="cleared"></div>').hide();
 		$('.start-cmt-'+ data.meta.idact).after(elm);
 		elm.show('highlight');
 		$(form).find('textarea').val('').mentionsInput('reset');
 		deletePost(elm,'');
 		repeatForLike(elm);
 		
 		sendMail('00',data.meta.idowner); // prevenir l'auteur
 		if (data.meta.idgrp) sendMail('00',data.meta.idgrp); // prevenir ceux qui ont participé  à la discussion
 		$.each(data.meta.mentionedPeople, function(index, value) { // prévenir ceux qui ont été mentionné
		 	sendMail('00',value);
		});
 		return true;
 	}
 	else 
 	{
 		// TODO error
 	}
     // return false to prevent normal browser submit and page navigation 
     return false; 
};