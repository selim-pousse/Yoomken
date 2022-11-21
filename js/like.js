

function repeatForLike(id)
{
 	$(id).find('.form-like').ajaxForm({
		dataType:  'json',
        success:   saveLike
	});
};
 
 
//validate signup form on keyup and submit
 function saveLike(data,nothing,form) { 
 	if (data.success) 
 	{	
 		var sort = $(form).find('input[name=sort]').val();
 		var idact = $(form).find('input[name=idactlike]').val();
 		var countlik = $('.count-like[val=count-'+sort+'-'+idact+']');
 		var typelik = $(form).find('input[name=typelike]');
 		var buttonlik = $(form).find('.button-like');
 		var linklik = $(form).find('.link-like');
 		if(countlik.length){
	 		if (typelik.val()=='L' && countlik.text()!='99') countlik.text(sprintf('%02d',eval(countlik.text()+'+1')));
	 		else countlik.text(sprintf('%02d',eval(countlik.text()+'-1')));
	 		countlik.parent().show();
 		}
 		if (buttonlik.length) {
 			buttonlik.css({'backgroundImage': 'url(/css/images/'+ (typelik.val()=='L'?'minus':'plus') +'_like2.png)'});
 			buttonlik.attr('title',data.meta.title);
 		}
 		if (linklik.length) {
 			linklik.text(data.meta.text);
 			linklik.attr('title',data.meta.title);
 		}
 		if (typelik.val()=='L') typelik.val('N');
 		else typelik.val('L');
 		
 		//sendMail('00',data.meta);
 		return true;      
 	}
 	else 
 	{
 		// TODO error
 	}
     // return false to prevent normal browser submit and page navigation 
     return false; 
 };
