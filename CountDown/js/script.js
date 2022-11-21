$(function(){
	
	var note = $('#note'),
		ts = new Date(2012, 11, 2,20),
		newYear = true;
		console.debug(ts);
	
		
	$('#countdown').countdown({
		timestamp	: ts,
		callback	: function(days, hours, minutes, seconds){
			
			var message = "";
			
			message += days + " Jour" + ( days==1 ? '':'s' ) + ", ";
			message += hours + " Heure" + ( hours==1 ? '':'s' ) + ", ";
			message += minutes + " Minute" + ( minutes==1 ? '':'s' ) + " and ";
			message += seconds + " Seconde" + ( seconds==1 ? '':'s' ) + " <br />";
			
			if(newYear){
				//message += "left until the new year!";
			}
			else {
				//message += "left to 10 days from now!";
			}
			
			note.html(message);
		}
	});
	
});
