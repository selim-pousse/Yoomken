
$(document).ready(function() { 
	$('.name-usr').click(function() {
		document.location.href=$(this).attr('href'); 
	});
	
	repeatForFollow('#art-main');
	listenGetMore('.list-people','usr');
	listenGetMore('.sub-menu','profil');
	repeatForLike('#art-main');
});


function listenSubSubMenu(id){
	$(id).find('.subsub-li-js').click(function(e){
		e.preventDefault();
		var that = $(this);
		if (that.parent().hasClass('active')) return;
		
		var idusr = that.parent().parent().attr('idusr');
		var action = that.attr('href');
		var ctrl = that.attr('ctrl');
		
		that.parent().parent().find('li').removeClass('active');
		that.parent().addClass('active');

		
		$('#'+idusr+'-more .ajax-js').hide();
		
			 		
		
		var target = $('.ajax-'+idusr+'-'+ctrl+'-js');
		if (target.size()) {
			target.show();	
			var newheight = $('#'+idusr+'-more').parent().css('height');
			$('#'+idusr+'-more .get-more').css('height',newheight);							
		} 
		else { 
			$.getJSON(action,function(data){
				if (data.success)
			 	{
			 		var div = $('<div class="ajax-js ajax-'+idusr+'-'+ctrl+'-js"/>');
			 		div.html(data.html);
					
					repeatForBoxyAndTooltip(div);
					
			 		$('#'+idusr+'-more .ajax-usr-js').append(div);
			 		if (ctrl=='message') repeatForTchat('#'+idusr+'-more');
			 		
			 		var newheight = $('#'+idusr+'-more').parent().css('height');
			 		$('#'+idusr+'-more .get-more').css('height',newheight);
			 		
			 		
			 		if (ctrl == 'badge') {
						$('#'+idusr+'-more .isotope').css( 'opacity',1);
					  	$('#'+idusr+'-more .isotope').isotope( $setupIsotope);
			 		}
			 	}
			});
		}
	});
	
};				
