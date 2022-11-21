<?php

define('GOO_KEY', 'ABQIAAAAd2IIN2LO_LBqhdjsDIwcvhT2yXp_ZAY8_ufC3CFXhHIE1NvwkxRCy5lC824u5m_urN1SIJFchLAqww');

switch (SERVER_ENV)
{
	case 'live':
		define('GOO_OAUTH_KEY', 'www.yoomken.fr');
		define('GOO_OAUTH_SECRET', 'G/paX4RdXbjG+p6XSS3Sp40q');
		break;
		// www.yoomken.fr or  yoomken.com
	case 'qual':
		//val.yoomken.fr
		define('GOO_OAUTH_KEY', 'val.yoomken.fr');
		define('GOO_OAUTH_SECRET', 'azAO4eZJlxKF7r29d_ESrfbi');
		break;
	case 'dev':
	// dev.yoomken.com
	define('GOO_OAUTH_KEY', '904509111654.apps.googleusercontent.com');
	define('GOO_OAUTH_SECRET', 'QoQc1K7mmA3BdSV-Ncr7VVHZ');
	break;
	case 'local':
	// localhost
	//
	//define('GOO_OAUTH_KEY', 'dev.yoomken.fr');
	//define('GOO_OAUTH_SECRET', 'shTDumC5FApBXkGefKN5ZU0W');
	define('GOO_OAUTH_KEY', '904509111654-8ldmu7tm992dhv3gp5q4eln5a9cnccdn.apps.googleusercontent.com');
	define('GOO_OAUTH_SECRET', 'EjRtyDDKOc31ebb6MfTWzUan');
}


Registry::getInstance()->set('openid_params', array(
		  'openid.ns'                => 'http://specs.openid.net/auth/2.0',
		  'openid.claimed_id'        => 'http://specs.openid.net/auth/2.0/identifier_select',
		  'openid.identity'          => 'http://specs.openid.net/auth/2.0/identifier_select',
		  'openid.return_to'         => "http://{$_SERVER['SERVER_NAME']}/app.php",
		  'openid.realm'             => "http://{$_SERVER['SERVER_NAME']}",
		  'openid.mode'              => @$_REQUEST['openid_mode'],
		  'openid.ns.ui'             => 'http://specs.openid.net/extensions/ui/1.0',
		  'openid.ns.ext1'           => 'http://openid.net/srv/ax/1.0',
		  'openid.ext1.mode'         => 'fetch_request',
		  'openid.ext1.type.email'   => 'http://axschema.org/contact/email',
		  'openid.ext1.type.first'   => 'http://axschema.org/namePerson/first',
		  'openid.ext1.type.last'    => 'http://axschema.org/namePerson/last',
		  'openid.ext1.type.country' => 'http://axschema.org/contact/country/home',
		  'openid.ext1.type.lang'    => 'http://axschema.org/pref/language',
		  'openid.ext1.required'     => 'email,first,last,country,lang',
		  'openid.ns.oauth'          => 'http://specs.openid.net/extensions/oauth/1.0',
		  'openid.oauth.consumer'    => GOO_OAUTH_KEY,
		  'openid.oauth.scope'       => implode(' ', array(
		  													'http://www-opensocial.googleusercontent.com/api/people/'
															)
												)
		));
		
Registry::getInstance()->set('openid_ext', array(
		  'openid.ns.ext1'           => 'http://openid.net/srv/ax/1.0',
		  'openid.ext1.mode'         => 'fetch_request',
		  'openid.ext1.type.email'   => 'http://axschema.org/contact/email',
		  'openid.ext1.type.first'   => 'http://axschema.org/namePerson/first',
		  'openid.ext1.type.last'    => 'http://axschema.org/namePerson/last',
		  'openid.ext1.type.country' => 'http://axschema.org/contact/country/home',
		  'openid.ext1.type.lang'    => 'http://axschema.org/pref/language',
		  'openid.ext1.required'     => 'email,first,last,country,lang',
		  'openid.ns.oauth'          => 'http://specs.openid.net/extensions/oauth/1.0',
		  'openid.oauth.consumer'    => GOO_OAUTH_KEY,
		  'openid.oauth.scope'       => implode(' ', array(
		  													'http://www-opensocial.googleusercontent.com/api/people/'
															)),
		  'openid.ui.icon'           => 'true'
		));
		
define('APIKEY_IPINFO','45ec4384a08013ae29769c3ca2688aac6fa19fd49a4bcceb61e3211d78f28d13');
?>
