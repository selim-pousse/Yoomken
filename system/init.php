<?php
/**
 * Manifest
 * 
 * system/init.php
 * 
 * Framework initialization
 * Loads the base files and creates a registry and a database connection
 * 
 * @copyright: Yoomken Li.
 * 
 */
  
 // first of all, some helper functions
 require_once __SYSTEM_PATH . '/helpers/base.php';
 
 // include the controller class
 include __SYSTEM_PATH . '/lib/baseController.class.php';
 
 // include the model class
 require_once __SYSTEM_PATH . '/lib/baseModel.class.php';
 
 // application appController and appModel classes
 include __APP_PATH . '/appController.php';
 include __APP_PATH . '/errorController.php';
 require_once __APP_PATH . '/appModel.php';

 setlocale (LC_TIME, 'fr-FR.utf8','fra'); 
 		
 // a new registry object which loads application configuration (not needed, but suggested)
 $registry 	= Registry::getInstance();
  
 // a new router object ready to execute the controller/method url
 $router 	= Router::getInstance();


?>
