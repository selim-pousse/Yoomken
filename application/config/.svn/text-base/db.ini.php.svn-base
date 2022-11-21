<?php
/**
 * Manifest
 * 
 * application/config/db.ini.php
 * 
 * This file contains the application's database configuration
 * 
 * @copyright: Yoomken Li 
 * 
 */

 // $force_live must be passed from the function which includes this file
 if (!isset($force_live))
 {
	$force_live = false;
 }
 
 // all configurations are in this array, it is easier to process later
 $_db = array('live'=> array('host'	 	=> 'localhost',
										 'user'	 	=> 'root',
										 'pass' 	=> 'selahmsam',
										 'base'		=> 'yoomlive',
										 'errors' 	=> false )	,
 			  'val'	=> array('host' 	=> 'localhost',
										 'user' 	=> 'root',
										 'pass' 	=> 'selahmsam',
										 'base' 	=> 'yoomval',
										 'errors'	=> true ) 	,
 			 'dev'	=> array('host' 	=> 'localhost',
										 'user' 	=> 'root',
										 'pass' 	=> 'selahmsam',
										 'base' 	=> 'yoomdev',
										 'errors'	=> true ) 	,
			  'local'	=> array('host' 	=> 'localhost',
										 'user'		=> 'root',
										 'pass' 	=> 'root',//'toto',
										 'base' 	=> 'yoomken.li',
										 'errors'	=> true) );

 $_server = SERVER_ENV;
 
 // force to live server
 if ($force_live)
 {
	$_server = 'live';
 }

 // do not allow values out of the configured ones
 if (!in_array($_server,array_keys($_db)))
 {
	$_server = 'local';
 }
 
 // finally, assign the values to $db
 if (isset($_db[$_server]))
 {
	$db = $_db[$_server];		
 }
?>