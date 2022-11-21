<?php
/**
 * Manifest
 * 
 * application/config/config.ini.php
 * 
 * This file contains the application main configuration
 * 
 * @copyright: Yoomken li.
 * 
 */

 $gre=array("Ni hao,","Hola,","Hallo,","Salam,","Aloha,","Kia ora,","Szia,","Hello,","Yasou,","Moyo,","Salut,","Bonjour,","Hi,","Konichiwa,","Jambo,","Howdy,","salvação,");
 
 //define('HI',$gre[rand(0,count($gre)-1)]);
 define('HI',"Hi,");
 
 /***
  *  MODE_SIGNUP = Le mode d'incription de la page d'acceuil
  *    -1 => mode d'inscription en liste d'attente
  * 	0 => mode d'inscription par invitation
  * 	1 => mode d'inscription  normal à tout le public
  **/
 switch (SERVER_ENV){
	case 'live':
		define('DOMAIN_URL','yoomken.com');
		define('MODE_SIGNUP', -1);
		define('SERV_ENV_NO',3);
		define('GETTEXT_CACHING',0);
		define('MAINTENANCE',1);
		ini_set('display_errors', 1);
		define('ONLINE',1);
		define('PRODUCTION_SERVER',  1);
		break;
	case 'val':
		define('DOMAIN_URL','val.yoomken.com');
		define('MODE_SIGNUP', 0);
		define('SERV_ENV_NO',2);
		define('MAINTENANCE',0);
		define('GETTEXT_CACHING',1);
		ini_set('display_errors', 0);
		define('ONLINE',1);
		define('PRODUCTION_SERVER',  0);
		break;
	case 'dev':
		define('DOMAIN_URL','dev.yoomken.com');
		define('MODE_SIGNUP', 1);
		define('SERV_ENV_NO',1);
		define('MAINTENANCE',0);
		define('GETTEXT_CACHING',0);
		ini_set('display_errors', 1);
		error_reporting(-1);
		define('ONLINE',1);
		define('PRODUCTION_SERVER',  0);
		break;
	case 'local':
	default:
		// localhost (and yoomkenli)
		define('DOMAIN_URL','localhost');
		define('MODE_SIGNUP', 1);
		define('SERV_ENV_NO',0);
		define('MAINTENANCE',0);
		define('GETTEXT_CACHING',0);
		ini_set('display_errors', 1);
		error_reporting(-1);
		define('ONLINE',1);
		define('PRODUCTION_SERVER',  0);
		break;
}

define ('WEBSNAPR_KEY','K5c3g8TEk1z8');

define('OT_APP', '22017932'); // for opentok
define('OT_SECRET', '3e94441add2db57153f9d7753b0a2ca561e1af6b');
 
//$config['force_live'] = false;

/**
 * Enables profiler, used to collect information about the framework footprint
 * 
 */

$config['enable_profiler'] = false;

/**
 * Enables profiler for ajax requests (requires enable_profiler to be true)
 * 
 */
$config['enable_profiler_ajax'] = false;

/**
 * Cross scripting filter, avoids JS and PHP to be executed in our server
 * 
 */
$config['global_xss_filtering'] = false;

/**
 * Enable GET parameters
 * 
 */
$config['enable_query_strings'] = true;

/**
 * Production server configuration, for further actions like showing errors
 * 
 */
$config['production_server'] = PRODUCTION_SERVER;

/**
 * Default charset for this application
 * 
 */
$config['charset'] = 'utf-8';

/**
 * Default page layout
 * 
 */
$config['page_layout'] = 'main';

/**
 * Default page title
 * 
 */
$config['page_title'] = _('PAGE_TITLE');

/**
 * Default page description
 * 
 */
$config['page_description'] = _('WHATS_YOO_DETAIL');

/**
 * Default page keywords
 * 
 */
$config['page_keywords'] = "Services à la personne
Travaux manuels intérieur ou extérieur du domicile, peinture, pose de revêtement de sol, montage cuisine aménagée, carrelage, faïence, pose d'étagères, électricité courante, plomberie courante, remise en état fin de bail, rénovation des meubles, petit bricolage, petit jardinage, pose de térasse, nettoyage à haute pression terrasse, pose de terrasse, pose de clôture, de murets, traitement des bois,
Travaux ménagers,
Soutien scolaire ou cours à domicile,
Garde d’enfant,
Relais Maman (accompagnement et garde d'enfant après l'école),
Soins esthétiques à domicile pour les personnes dépendantes,
Préparation de repas à domicile  (y compris le temps passé aux commissions),
Livraison de repas à domicile,
Collecte et livraison à domicile de linge repassé,
Livraison de courses à domicile,
Assistance informatique et internet à domicileSoins et promenade d’animaux de compagnie pour les personnes dépendantes (hors toilettage et soins vétérinaires)
Maintenance, entretien et vigilance temporaires à domicile de la résidence principale et secondaire
Assistance administrative à domicile, Activités qui concourent directement et exclusivement à coordonner et délivrer les services à la personne
Conception de site web 
Developpement d’outil informatiques,
Création de produits artisanales,
Gestion des comptes (comptabilité),
Gestion administratives à distance
";
?>