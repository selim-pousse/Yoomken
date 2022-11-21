<?php
/**
 * Manifest
 * 
 * fw.php
 * 
 * Framework entry point.
 *  Defines paths
 *  Initializes the framework
 *  Excutes selected controller/method
 * 
 * @copyright: Yoomken Li
 * 
 */
 
// phpinfo();	die();



if ($_SERVER['REMOTE_ADDR']!='217.162.205.43' && $_SERVER['REMOTE_ADDR']!='81.157.52.55') 
{
	//header('Location: maintenance.php'); return;
}

 define ('MAIN_APP_YOO',1);
 require_once ('autoload.sys.php');
 
 // for profiling and debugging purposes
 define('TIME_START',microtime(true)); 
 

// END LOGIN VIA GOOGLE

 // Initialize the framework by including config and instancing objects
 include 'system/init.php';

 // set the controller path
 $router->setPath (__APP_PATH . '/controllers');
 

if (PRODUCTION_SERVER) {
	$cache_expire = 60*60*24*365;
	header("Pragma: public");
	header("Cache-Control: max-age=".$cache_expire);
}
else {
	header("Expires: on, 01 Jan 1970 00:00:00 GMT");
	header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
	header("Cache-Control: no-store, no-cache, must-revalidate");
	header("Cache-Control: post-check=0, pre-check=0", false);
	header("Pragma: no-cache");
}


 // start the session at first/
 Session::getInstance();
 
 //_debug($actual_link = $_SERVER['QUERY_STRING']);
 
 //include('test.php');die();
 
 // LOGIN VIA GOOGLE ACCOUNT
 if (isset($_REQUEST['popup']) && !isset($_SESSION['redirect_to'])) {
  $query_params = '';	  
  if($_POST) {
    $kv = array();
    foreach ($_POST as $key => $value) {
      $kv[] = "$key=$value";
    }
    $query_params = join('&', $kv);
  } else {
    $query_params = substr($_SERVER['QUERY_STRING'], strlen('popup=true') + 1);
  }
  $_SESSION['redirect_to'] = "http://{$_SERVER['SERVER_NAME']}/app.php?go=home/login_goo&{$query_params}";
  echo '<script type = "text/javascript">window.close();</script>';
  exit;
} else if (isset($_SESSION['redirect_to'])) {
  $redirect = $_SESSION['redirect_to'];
  unset($_SESSION['redirect_to']);
  //$_SESSION['redirect_to'] = '/';
  header('Location: ' .$redirect);
}

 // load the controller
 $router->loader();
 
 exit(0);
 
?>
