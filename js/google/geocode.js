
  var shortAddress = true;
  /*function initialize_Geocoder() {
    geocoder = new google.maps.Geocoder();
    //var latlng = new google.maps.LatLng(-34.397, 150.644);
  }*/

  function contains(array, item) 
  {
	  for (var i = 0, I = array.length; i < I; ++i) {
		  if (array[i] == item) {return true;}
		}
		return false;
  }
  
  function codeAddress(address,response,shortAd) {
	shortAddress = shortAd;
    geocoder.geocode( { 'address': address,'language':'fr'}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
    	  response( $.map( results, formatAddress ));
      } 
    });
  }

  function formatAddress (_item) {
	  var route='',zip='',city='',no_street='',country='', state ='';
	  for (var i = 0, I = _item.address_components.length; i < I; ++i) 
	  {
		  var component = _item.address_components[i];
		  /*if (contains(component.types, 'political')) {
			  bits.push('<b>' + component.long_name + '</b>');
			}*/
		  if ( contains(component.types, 'street_number')) {no_street = component.long_name;continue;}
		  if ( contains(component.types, 'route')) {route = component.long_name;continue;}
		  if ( contains(component.types, 'postal_code')) {zip = component.long_name;continue;}
		  if ( contains(component.types, 'locality')) {city = component.long_name;continue;}
		  if ( contains(component.types, 'country')) {
			  country = component.long_name;
			  state = component.short_name;
		}
	  }
	  var kurzLabel = jQuery.trim(shortAddress? city +' ('+state+')' : _item.formatted_address);
		  return {
		         id: 'lat!:!'+_item.geometry.location.lat()+'!#!'+
		         'long!:!'+_item.geometry.location.lng()+'!#!'+
		         'city!:!'+city+'!#!'+
		         'state!:!'+ state+'!#!'+
		         'country!:!'+ country+'!#!'+
		         'zip!:!'+ zip+'!#!'+
		         'address!:!'+ _item.formatted_address+'!#!'+
		         'no_street!:!'+ no_street+'!#!'+
		         'street!:!'+ route,
		         plain: kurzLabel,
		         html_bit:kurzLabel,
		         html_auto:_item.formatted_address
		         }
	 // }
	  
	}

  function initializeNearby() {
    // Try HTML5 geolocation
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
       /* var pos = new google.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude);*/
    	  var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    	  geocoder.geocode( { 'latLng': latlng}, function(results, status) {
    		  if ( status == 'OK') 
    		  {
    			  var obj = formatAddress(results[0]);
		    	  $.ajax({
		    		  	type:'POST',
						dataType: 'json',
						data: {status:'OK',spot:obj.id},
						url:'/ajax/user/nearby/',
						success: function(data){
							if (data.success){
								if ($('#nearbyA').size()){
									$('#nearbyA').val(obj.html_auto);
								}
							}
						}
		    	  });
    		  }
    		  else if (status == 'OVER_QUERY_LIMIT') alert('Sorry, quota of google exceeded!');
    	  });
      }, function() {
    	  handleNoGeolocation(true);
    	  $.ajax({
    		  	type:'POST',
				dataType: 'json',
				data: {status:'NO',spot:null},
				url:'/ajax/user/nearby/',
				success: function(data){
				}});
        
      });
    } else {
      // Browser doesn't support Geolocation
      handleNoGeolocation(false);
    }
  }

  function handleNoGeolocation(errorFlag) {
    if (errorFlag) {
      var content = 'Error: The Geolocation service failed.';
    } else {
      var content = 'Error: Your browser doesn\'t support geolocation.';
    }
  }

  

































// script by Josh Fraser (http://www.onlineaspect.com)


/*
function calculate_time_zone() {

    var rightNow = new Date();

    var jan1 = new Date(rightNow.getFullYear(), 0, 1, 0, 0, 0, 0);  // jan 1st

    var june1 = new Date(rightNow.getFullYear(), 6, 1, 0, 0, 0, 0); // june 1st

    var temp = jan1.toGMTString();

    var jan2 = new Date(temp.substring(0, temp.lastIndexOf(" ")-1));

    temp = june1.toGMTString();

    var june2 = new Date(temp.substring(0, temp.lastIndexOf(" ")-1));

    var std_time_offset = (jan1 - jan2) / (1000 * 60 * 60);

    var daylight_time_offset = (june1 - june2) / (1000 * 60 * 60);

    var dst;

    if (std_time_offset == daylight_time_offset) {

        dst = "0"; // daylight savings time is NOT observed

    } else {

        // positive is southern, negative is northern hemisphere

        var hemisphere = std_time_offset - daylight_time_offset;

        if (hemisphere >= 0)

            std_time_offset = daylight_time_offset;

        dst = "1"; // daylight savings time is observed

    }

    var i;

    // check just to avoid error messages

    if (document.getElementById('timezone')) {

        for (i = 0; i < document.getElementById('timezone').options.length; i++) {

            if (document.getElementById('timezone').options[i].value == convert(std_time_offset)+","+dst) {

                document.getElementById('timezone').selectedIndex = i;

                break;

            }

        }

    }

}



function convert(value) {

    var hours = parseInt(value);

    value -= parseInt(value);

    value *= 60;

    var mins = parseInt(value);

    value -= parseInt(value);

    value *= 60;

    var secs = parseInt(value);

    var display_hours = hours;

    // handle GMT case (00:00)

    if (hours == 0) {

        display_hours = "00";

    } else if (hours > 0) {

        // add a plus sign and perhaps an extra 0

        display_hours = (hours < 10) ? "+0"+hours : "+"+hours;

    } else {

        // add an extra 0 if needed 

        display_hours = (hours > -10) ? "-0"+Math.abs(hours) : hours;

    }

    

    mins = (mins < 10) ? "0"+mins : mins;

    return display_hours+":"+mins;

}



onload = calculate_time_zone;*/
	
	
	
