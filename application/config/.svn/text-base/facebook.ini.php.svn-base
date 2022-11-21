<?php
switch (SERVER_ENV){
	case 'live':
		// yoomken.com
		define('FB_APP', '186451991375093');
		define('FB_SECRET', '9f6ea99d1023f95ad6e90ad1e396d957');
		define('OAUTH_CALLBACK', 'http://' . $_SERVER["HTTP_HOST"] . '/ajax/fb_callback');
		break;
	case 'qual':
		//val.yoomken.com
	case 'dev':
		// dev.yoomken.com
		define('FB_APP', '107112586030061');
		define('FB_SECRET', '13bc7d6bfe4be0f14cba8e9fae7f2edb');
		define('OAUTH_CALLBACK', 'http://' . $_SERVER["HTTP_HOST"] . '/ajax/fb_callback');
		break;
	case 'local':
	default:
		// localhost (and yoomkenli)
		define('FB_APP', '192498564109100');
		define('FB_SECRET', '5d68fafb4287dda997b443ccbefbd66f');
		define('OAUTH_CALLBACK', 'http://' . $_SERVER["HTTP_HOST"] . '/ajax/fb_callback');
		break;
}
?>
