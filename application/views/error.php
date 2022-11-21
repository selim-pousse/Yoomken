<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title><?=$title?></title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="description" content="Tell to the world what matters to you!" />
		<meta name="keywords" content="social networking, community, hobby, matters, passion, interests" />

		<link rel="image_src" href="/media/img/logo/yoomlogo.png" />
		<link rel="icon" href="/media/img/logo/yoomlogo.png" type="image/x-icon" />
		<link rel="shortcut icon" href="/media/img/logo/yoomlogo.png" type="image/x-icon" /> 
		
		<link rel="stylesheet" media="screen,projection" href="/css/errors.css" type="text/css" />
		<link rel="stylesheet" media="screen,projection" href="/css/style.css" type="text/css" />

		<!--[if lte IE 8]><script type="text/javascript" charset="utf-8" > window.location="/noie8\</script><![endif]-->
		
	</head>
	<body>
			<div id='blackoutContainer' class=" " style="position: fixed;top:0;bottom: 0;right: 0;left: 0;background-color: rgba(240, 238, 237, 0.95);overflow-y:scroll;z-index: 600;">
				<div style="margin:30px auto 10px;" class="span960">
					<a href="/" class="left" >
			   			<img src="/media/img/logo/logoTitle_dark.png">
			   		</a>
			   		<div class="clear"></div>
				</div>
				
			   	<div class="entry drop-shadow curved ui-corner-all span960" style="margin:0px auto;border-radius: 7px">
			   		
			   		<div class="clear"></div>
					<?=$content_for_layout?>
				</div>	
			</div>
	</body>
</html>
   		 