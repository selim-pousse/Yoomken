<?php
    // The backend engine library.
    define('DB_ENGINE', 'MySQL');
    
    // The IM server library.
    define('IM_LIBRARY', 'Default');
    
	$conf 		= Registry::getInstance()->get('db');
	
    // If you're using the default MySQL server, change the below to
    // match your settings.
    define('MYSQL_USERNAME', $conf['user']);
    define('MYSQL_PASSWORD', $conf['pass']);
    define('MYSQL_HOSTNAME', $conf['host']);
    define('MYSQL_DATABASE', $conf['base']);
    define('MYSQL_PREFIX_VIEW', 'im_view_');
    define('MYSQL_PREFIX_IM', 'im_');
    // Session cookie used by Ajax IM
    define('COOKIE_NAME', 'ajaxim_session');
    
    // Cookie period, in days
    define('COOKIE_PERIOD', 365);
    
    // Cookie domain (e.g.: .domain.com, if you want it to work for
    // all domains and subdomains), if any.
    define('COOKIE_DOMAIN', false);
    
    // If you're using the NodeJS server, change the below to match
    // your settings.
    $nodejs_memcache_server = array('127.0.0.1', 11998);
?>