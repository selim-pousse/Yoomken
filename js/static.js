$(document).ready(function() { 
	$('.team').hover(
			function () {
				var img = $(this).find('.profil-usr');
				img.attr('src','/media/img/'+img.attr('switch')+'.jpg');
		  	}, 
		  	function () {
		  		var img = $(this).find('.profil-usr');
		  		img.attr('src','/media/img/'+img.attr('switch')+'g.jpg');
		  	}
		);
});