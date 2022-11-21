      
      var stylesMap = [
  		  {
			stylers: [
			      { saturation: -63 }
			    ]
		  }
		];
	  
      var styles = [[{
        url: 'http://google-maps-utility-library-v3.googlecode.com/svn/tags/markerclusterer/1.0/images/people35.png',
        height: 35,
        width: 35,
        opt_anchor: [16, 0],
        opt_textColor: '#ff00ff',
        opt_textSize: 10
      }, {
        url: 'http://google-maps-utility-library-v3.googlecode.com/svn/tags/markerclusterer/1.0/images/people45.png',
        height: 45,
        width: 45,
        opt_anchor: [24, 0],
        opt_textColor: '#ff0000',
        opt_textSize: 11
      }, {
        url: 'http://google-maps-utility-library-v3.googlecode.com/svn/tags/markerclusterer/1.0/images/people55.png',
        height: 55,
        width: 55,
        opt_anchor: [32, 0],
        opt_textSize: 12
      }]];

	  var geocoder = null;
      var markerClusterer = null;
      var userPosition = null;
      var map = null;
      var imageUrl = 'http://chart.apis.google.com/chart?cht=mm&chs=24x32&' +
          'chco=FFFFFF,F8D080,000000&ext=.png';

      function refreshMap(limit) {
	        if (markerClusterer) {
	          markerClusterer.clearMarkers();
	        }
	
	        var markers = [];
	        
	        var markerImage = new google.maps.MarkerImage(imageUrl,
	          new google.maps.Size(24, 32));
	          
	          $.getJSON('/ajax/people/map/'+limit,function(data){
					if (data.success) 
					{
						/* Déclaration de l'objet qui définira les limites de la map */ 
   						var bounds = new google.maps.LatLngBounds();
						for (var i = 0; i < data.meta.nbread; i++) {
					          var latLng = new google.maps.LatLng(data.meta.people[i].latitude,
					              								  data.meta.people[i].longitude);
					          bounds.extend(latLng);
					          var marker = new google.maps.Marker({
					           position: latLng,
					           draggable: false,
					           animation: google.maps.Animation.DROP,
					           icon: markerImage,
					           title: data.meta.people[i].name,
					           data:{id:data.meta.people[i].id}
					          });
					          //new google.maps.MarkerImage(data.photos[i].photo_file_url, new google.maps.Size(100, 100))
					          markers.push(marker);
					          google.maps.event.addListener(marker, 'click', toggleBounce);
					          function toggleBounce() {
					          	$.each(markers,function(){this.setAnimation(null)});
						   		this.setAnimation(google.maps.Animation.BOUNCE);
						        $('#timeline .bulle-selected').removeClass('bulle-selected');
						        $('#'+this.data.id+'-usr .bulle').addClass('bulle-selected');
						        var offsetTop = $('#'+this.data.id+'-usr').offset().top - $('#timeline').offset().top;
						        $('body').scrollTo(offsetTop,{axis:'y'});
						      }
				          }
				          bounds.extend(userPosition);
				          
				          markerClusterer = new MarkerClusterer(map, markers, {
					          zoomOnClick : true,
					          maxZoom: 19,
					          gridSize: 50,
					          styles: null
					      });
					      /* Ici, on ajuste le zoom de la map en fonction des limites  */ 
   						  map.fitBounds(bounds);
					      
					  }
					
			}) 
      }


	  function clearClusters(e) {
        e.preventDefault();
        e.stopPropagation();
        markerClusterer.clearMarkers();
      }
      
      function initializeMap(curentPosition,myname,limit_result) {
      	// Create a new StyledMapType object, passing it the array of styles,
	  // as well as the name to be displayed on the map type control.
	  var styledMap = new google.maps.StyledMapType(stylesMap,{name: "Yoomap"});
    	
      var myLatlng = new google.maps.LatLng(curentPosition[0], curentPosition[1]);
      userPosition = myLatlng;
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 11,
          center: myLatlng,
          mapTypeControlOptions: {
	       mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
	     }
        });
        
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: myname,
            animation:google.maps.Animation.BOUNCE
        });
        
        //Associate the styled map with the MapTypeId and set it to display.
	    map.mapTypes.set('map_style', styledMap);
	    map.setMapTypeId('map_style');

        /*var refresh = document.getElementById('refresh');
        google.maps.event.addDomListener(refresh, 'click', refreshMap);

        var clear = document.getElementById('clear');
        google.maps.event.addDomListener(clear, 'click', clearClusters);*/

        refreshMap(limit_result);
      }

      

    