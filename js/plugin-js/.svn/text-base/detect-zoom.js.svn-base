function hasPageBeenResized() {
	var isResized;
	var zoomcurrent = 1;
	var sizemin_screen = 1170;

	function mediaQueryMatches(property, r) {
		var styles = document.createElement('style');
		document.getElementsByTagName("head")[0].appendChild(styles);

		var dummyElement = document.createElement('div');
		dummyElement.innerHTML="test";
		dummyElement.id="mq_dummyElement";
		document.body.appendChild(dummyElement);

		styles.sheet.insertRule('@media('+property+':'+r+'){#mq_dummyElement{text-decoration:underline}}', 0);
		var matched = getComputedStyle(dummyElement, null).textDecoration == 'underline';
		styles.sheet.deleteRule(0);
		document.body.removeChild(dummyElement);
		document.getElementsByTagName("head")[0].removeChild(styles);
		return matched;
	};

	function mediaQueryBinarySearch(property, unit, a, b, maxIter, epsilon) {
		var mid = (a + b)/2;
		if (maxIter == 0 || b - a < epsilon) return mid;
		if (mediaQueryMatches(property, mid + unit)) {
			return mediaQueryBinarySearch(property, unit, mid, b, maxIter-1, epsilon);
		} else {
			return mediaQueryBinarySearch(property, unit, a, mid, maxIter-1, epsilon);
		}
	};

	if($.browser.msie){
		if($.browser.version==7){
			//IE7
			var r = document.body.getBoundingClientRect();
			zoomcurrent = 
			isResized = ((r.right-r.left)/document.body.offsetWidth)!==1;
		}else if($.browser.version==8){
			//IE 8
			zoomcurrent = 
			isResized= (screen.deviceXDPI / screen.logicalXDPI)!==1;
		}else if($.browser.version>=9){
			//IE9+
			zoomcurrent = 
			isResized=(screen.deviceXDPI / screen.systemXDPI)!==1;
		}
	}else if($.browser.webkit){
		//Webkit
		var documentWidthCss = Math.max(
			document.documentElement.clientWidth,
			document.documentElement.scrollWidth,
			document.documentElement.offsetWidth
		);
		zoomcurrent = document.width / documentWidthCss;
		isResized=(document.width / documentWidthCss)!==1;
	}else if($.browser.opera){
		//Opera - No good way to detect :(

	}else if($.browser.mozilla){
		if($.browser.version > "1.9.1" && $.browser.version < "1.9.2"){
			//Firefox 3.5 only
			zoomcurrent = screen.width / mediaQueryBinarySearch('min-device-width', 'px', 0, 6000, 20, .0001);
			isResized=(screen.width / mediaQueryBinarySearch('min-device-width', 'px', 0, 6000, 20, .0001))!==1;
		}else if(parseFloat($.browser.version)>=4){
			//Firefox 4+
			zoomcurrent = (Math.round(1000 * mediaQueryBinarySearch('min--moz-device-pixel-ratio','', 0, 10, 20, .0001)) / 1000);
			isResized=(Math.round(1000 * mediaQueryBinarySearch('min--moz-device-pixel-ratio','', 0, 10, 20, .0001)) / 1000)!==1;
		}else{
			//Firefox 3.6 and lower than 3.5 - No good way to detect :(
		}
	}
	
	//document.getElementById("zoomLevel").innerHTML=isResized;
	// update the position of the menu (fxed or normal)
	if ( (screen.width/zoomcurrent) < sizemin_screen) 
		$('.can-be-fixed').css({'position':'static','marginBottom':-36});
	else 
		$('.can-be-fixed').css({'position':'fixed','marginBottom':0});
	//return isResized;
};

$(function(){
	//run on page load
	hasPageBeenResized();

});

//run when page is resized
onresize = hasPageBeenResized;