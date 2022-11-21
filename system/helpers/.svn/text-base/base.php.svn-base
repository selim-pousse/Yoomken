<?php 
/**
 * Manifest
 * 
 * system/helpers/base.php
 * 
 * Contains some functions needed for bootstrapping the framework
 * 
 * @copyright: Yoomken Li
 * 
 */

/**
 * Debug function
 * Overloads print_r to have color and indentation on complex variables
 * 
 * @param mixed $variable to strip and show
 * @param boolean $return the result instead of echoing
 * 
 */
if (!function_exists('_debug'))
{
	function _debug($variable = null, $return = false)
	{
		
		/*$sess = Session::getInstance();
		if ( $sess->isLogged && !in_array($sess->session->getUserVar('id'),array('6336f7c9a5474537564ce8ac377dea94','e9cbe929bf1985762ea120515041adeb','3ba9c035775b4a8098f8fe32fc9ac6a9','5a2e49c2d473261fbe3b422116b944fc','2c2aba52813a1c4f112f5ee5d830cb7d','d4ff1f832b7c020c93c4f6c5e0fa9f4b')))
		{
			return false;
		}*/
		
		// never show debug messages in production mode
		if (MAIN_APP_YOO && PRODUCTION_SERVER)
		{
			return false; 
		}
		 
		$variable = str_replace(' ','&nbsp;',print_r($variable, TRUE));
		$variable = str_replace("\n\r","\n",$variable);
		$variable = str_replace("\n",'<br />',$variable);
		$variable = str_replace('[','<strong style="color:black">[',$variable);
		$variable = str_replace(']',']</strong>',$variable);
		$variable = str_replace('=>','<span style="color:green">=></span>',$variable);
		$variable = str_replace('(','<span style="color:red">(</span>',$variable);
		$variable = str_replace(')','<span style="color:red">)</span>',$variable);
		
		// format final result
		$variable = '<div style="font-family:Verdana, Arial, Helvetica, Sans Serif;font-size:0.8em; color: blue">' . $variable . '</div>';
		
		if ($return)
		{
			return $variable;
		}
		// otherwise
		echo $variable;
	}
}

if (!function_exists('getSystemLocation'))
{   
    function getSystemLocation($spot,$compact=false)
	{
		if (is_array($spot)) $spot = new SpotAdapter($spot);
		
		if($spot->id=="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
		{
			return _('SOMEWHERE');
		}
		else if ($compact){
			$name="";
	    	if($spot->city!="" )
	    	{
	    		$name.=$spot->city." ";
	    	}
	    	if($spot->state!="" )
	    	{
	    		$name.= "($spot->state)";
	    	}
	    	if ($spot->city=="" && $spot->state=='')
	    	{
	    		$name = $spot->address;
	    	}
	    	return $name;
		}
		else
		{
			
	    	/*if($spot->country!="" && $compact==null)
	    	{
	    		$name.=$spot->country;
	    	}*/
			if($spot->address!="")
	    	{
	    		return $spot->address;
	    	}
		}
	}
}


if (!function_exists('parse_signed_request'))
{
	function parse_signed_request($signed_request, $secret) {
	  list($encoded_sig, $payload) = explode('.', $signed_request, 2); 
	
	  // decode the data
	  $sig = base64_url_decode($encoded_sig);
	  $data = json_decode(base64_url_decode($payload), true);
	
	  if (strtoupper($data['algorithm']) !== 'HMAC-SHA256') {
	    error_log('Unknown algorithm. Expected HMAC-SHA256');
	    return null;
	  }
	
	  // check sig
	  $expected_sig = hash_hmac('sha256', $payload, $secret, $raw = true);
	  if ($sig !== $expected_sig) {
	    error_log('Bad Signed JSON signature!');
	    return null;
	  }
	
	  return $data;
	}
}

if (!function_exists('base64_url_decode'))
{
	function base64_url_decode($input) {
    	return base64_decode(strtr($input, '-_', '+/'));
	}
}

if (!function_exists('usleep_win'))
{
	function usleep_win($msec) {
	   $usec = $msec * 1000;
	   socket_select($read = NULL, $write = NULL, $sock = array(socket_create (AF_INET, SOCK_RAW, 0)), 0, $usec);
	}
}

if (!function_exists('array_to_json'))
{
	function array_to_json( $array ){
	
	    if( !is_array( $array ) ){
	        return false;
	    }
	
	    $associative = count( array_diff( array_keys($array), array_keys( array_keys( $array )) ));
	    if( $associative ){
	
	        $construct = array();
	        foreach( $array as $key => $value ){
	
	            // We first copy each key/value pair into a staging array,
	            // formatting each key and value properly as we go.
	
	            // Format the key:
	            if( is_numeric($key) ){
	                $key = "key_$key";
	            }
	            $key = "\"".addslashes($key)."\"";
	
	            // Format the value:
	            if( is_array( $value )){
	                $value = array_to_json( $value );
	            } else if( !is_numeric( $value ) || is_string( $value ) ){
	                $value = "\"".addslashes($value)."\"";
	            }
	
	            // Add to staging array:
	            $construct[] = "$key: $value";
	        }
	
	        // Then we collapse the staging array into the JSON form:
	        $result = "{ " . implode( ", ", $construct ) . " }";
	
	    } else { // If the array is a vector (not associative):
	
	        $construct = array();
	        foreach( $array as $value ){
	
	            // Format the value:
	            if( is_array( $value )){
	                $value = array_to_json( $value );
	            } else if( !is_numeric( $value ) || is_string( $value ) ){
	                $value = "'".addslashes($value)."'";
	            }
	
	            // Add to staging array:
	            $construct[] = $value;
	        }
	
	        // Then we collapse the staging array into the JSON form:
	        $result = "[ " . implode( ", ", $construct ) . " ]";
	    }
	
	    return $result;
	}
}
/**
 * Check for a valid email
 * 
 * @param string $email
 * 
 * @return boolean
 * 
 */
if (!function_exists('isEmail'))
{
	function isEmail($email = '')
	{
		$email = trim($email);
		//return preg_match("/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,6})$/", $email);
		$ret = preg_match("/^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9]([-a-z0-9_]?[a-z0-9])*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z]{2})|([1]?\d{1,2}|2[0-4]{1}\d{1}|25[0-5]{1})(\.([1]?\d{1,2}|2[0-4]{1}\d{1}|25[0-5]{1})){3})(:[0-9]{1,5})?$/i", $email);
		return $ret;
	}
}

// genere a unique id from a set of id 
if (!function_exists('getIdSet'))
{
	function getIdSet(array $set = array())
	{
		$set = array_unique($set);
		asort($set);
		$val = implode('',$set);
		
		if (strlen($val)==32 || $val == '00') 
			return $val;
		else 
			return md5($val);
	}
}


// display the name of user according the privacy
if (!function_exists('getName'))
{
	function getName($fname,$pseudo,$privacy,$version = 'full')
	{
		if ($privacy=='P')
		{
			if ($version == 'min')
			{
				$fname = explode(' ', trim($fname));
				return $fname[0];
			}
			else  return $fname;
		}
		else return ucfirst(strtolower($pseudo));
	}
}

// display the name of user according the privacy
if (!function_exists('getNameObj'))
{
	function getNameObj($user,$version = 'full')
	{
		return getName($user->fullname,$user->url,$user->privacy,$version);
	}
}


// return array(Lat,Long) !! ONLY in MVC Context !!!
if (!function_exists('getPositionUser'))
{
	function getPositionUser($user)
	{
		if (is_object($user)){
			$me = Session::getInstance()->me();
			if ($me && $user->id == $me->id)
				if (!isset($user->nearby->spot) || $user->nearby->mode!='A') 
					return array($user->spot->lat,$user->spot->long);
				else return array($user->nearby->spot->lat,$user->nearby->spot->long);
			else return array($user->spot->lat,$user->spot->long);
		}
		return array(0,0);
	}
}

// return country of user (full or in 2 letter) !! ONLY in MVC Context !!!
if (!function_exists('getCountryUser'))
{
	function getCountryUser($user,$_2letter = false)
	{
		if (is_object($user) && isId($user->id))
		{
			if ($user->isme) $me = $user; // evite le look up dans l'ouverture de session
			else $me = Session::getInstance()->me();
			
			if ($me && $user->id == $me->id)
				if (!isset($user->nearby->spot) || $user->nearby->mode!='A') 
					return ($_2letter?$user->spot->state:$user->spot->country);
				else return ($_2letter?$user->nearby->spot->state:$user->nearby->spot->country);
			else return ($_2letter?$user->spot->state:$user->spot->country); 
		}
		return null;
	}
}

if (!function_exists('getCountryAct'))
{
	function getCountryAct($act,$_2letter = false)
	{
		if (is_object($act)){
			if ( !$act->spot->id || ($act->spot->id=='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') ) return getCountryUser($act->user,$_2letter);
			else return ($_2letter?$act->spot->state:$act->spot->country); 
		}
		return null;
	}
}

if (!function_exists('getCurrency'))
{
	function getCurrency($user,$_3letter = false)
	{
		$state = getCountryUser($user,true);
		if ($state=='TN') return 'TND';
		else if ($state=='GB') return 'GBD';
		else if ($state=='CH') return 'CHF';
		else return '€';
	}
}


// return adress fixe or actual !! ONLY in MVC Context !!!
if (!function_exists('getAddressUser'))
{
	function getAddressUser($user,$object = false)
	{
		if (is_object($user)){
			$me = Session::getInstance()->me();
			if ($me && $user->id == $me->id)
				if (!isset($user->nearby->spot) || $user->nearby->mode!='A') 
					return $object?$user->spot:getLocation($user->spot);
				else return $object?$user->nearby->spot:getLocation($user->nearby->spot);
			else return $object?$user->spot:getLocation($user->spot);
		}
		return null;
	}
}


/**
 * return true if the param string is a valid md5 hash
 * 
 * @param $hash
 * 
 * @return unknown_type
 * 
 */
if (!function_exists('isId'))
{
	function isId($hash = '')
	{
		// avoid empty values
		if (empty($hash))
		{
		 	return false;	
		}
		else if ($hash == '00') return true;
   		// if it is not an array, check a string		
   		else return preg_match('#^[0-9a-fX]{32}$#i', $hash);
	}
}


/**
 * Checks if a user is in his space or not
 * 
 * @deprecated this method is an alias for Session::getInstance(), used only when in MVC context !!!!!
 * 
 * TODO: remove calls to this method from MVC context
 *  
 * @return boolean
 */
if (!function_exists('isme'))
{
	function isme()
	{
		$session = Session::getInstance();
		return ($session->me() && $session->who() && $session->who()->id == $session->me()->id);
	}
}

if (!function_exists('ishim'))
{
	function ishim()
	{
		$session = Session::getInstance();
		return ($session->me() && $session->who() && $session->who()->id != $session->me()->id);
	}
}



if (!function_exists('me'))
{
	function me()
	{
		$session = Session::getInstance();
		return ($session->me());
	}
}

if (!function_exists('who'))
{
	function who()
	{
		$session = Session::getInstance();
		return ($session->who());
	}
}




/**
 * Checks if a user is logged in
 * 
 * @deprecated this method is an alias for Session::isLogged(), used only when in MVC context !!!!!
 * 
 * TODO: remove calls to this method from MVC context
 *  
 * @return boolean
 */
if (!function_exists('isSession'))
{
	function isSession()
	{
		$session = Session::getInstance();
		
		return ($session->isLogged());
	}
}

/**
 * Creates a redirection based on current base url
 * 
 * @param string $path
 * 
 * @return redirects user browser
 */
if (MAIN_APP_YOO && !function_exists('redirect'))
{
	function redirect($path = '')
	{
		// resources needed
		$input = Input::getInstance();
		
		// filter path to add a slash
		if (strpos($path,'/') === false)
		{
			$path = '/';
		}
		else
		{
			if (strpos($path,'/') !== 0)
			{
				$path = '/' . $path;
			}
		}
		//_debug('http://' . $input->server('HTTP_HOST')  . $path);
		header( 'Location: http://' . $input->server('HTTP_HOST')  . $path ) ;
		
		exit (0);
	}
}

if (!function_exists('geocoding'))
{
	function geocoding($address) 
    {
        $encodeAddress = urlencode($address);
        $url = "http://maps.google.com/maps/api/geocode/json?address=".$encodeAddress."&sensor=false";

        if(function_exists('curl_init')) {
            $data = getContent_curl($url);
        } else {
            $data = file_get_contents($url);
        }
        $data = json_decode($data);
        //return $data;
        $spot = new SpotAdapter(array());
        if ($data->status=='OK')
        {
        	$data = $data->results[0];
        	$spot->address 	= $data->formatted_address;
        	$spot->lat		= $data->geometry->location->lat;
        	$spot->long		= $data->geometry->location->lng;
        	$data = $data->address_components;
	        for ($i = 0, $I = count($data); $i < $I; ++$i)
	        {
	        	$cp = $data[$i];
		        if ( $cp->types[0]=='street_number') 	{$spot->no = $cp->long_name;continue;}
		        if ( $cp->types[0]=='route') 			{$spot->route = $cp->long_name;continue;}
		        if ( $cp->types[0]=='postal_code') 	{$spot->zip = $cp->long_name;continue;}
		        if ( $cp->types[0]=='locality') 		{$spot->city = $cp->long_name;continue;}
		        if ( $cp->types[0]=='country') {
		        	$spot->country = $cp->long_name;
		        	$spot->state = $cp->short_name;
		        }
	        }	 
			
        }
        return $return = $spot;
    }
}

if (!function_exists('detectPosition'))
{
	function detectPosition($ip = '') 
    {
    	if(empty($ip)) $ip = $_SERVER['REMOTE_ADDR'];
		
        $data = file_get_contents('http://api.ipinfodb.com/v3/ip-city/?key='.APIKEY_IPINFO.'&ip='.$ip.'&format=json');
        $data = json_decode($data);
        //return $data;
        $spot = new SpotAdapter(array());
		
        if ($data && $data->statusCode=='OK')
        {
        	$spot->lat		= $data->latitude;
        	$spot->long		= $data->longitude;
        	$spot->zip 		= $data->zipCode;
		    $spot->city 	= ucfirst(strtolower($data->cityName));
		   	$spot->country 	= ucfirst(strtolower($data->countryName));
		    $spot->state 	= $data->countryCode;
        }
        return $return = $spot;
    }
}

if (!function_exists('getContent_curl'))
{
    function getContent_curl($url)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_TIMEOUT, 10);
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 5);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curl, CURLOPT_URL, $url);
        $data = curl_exec($curl);
        curl_close ($curl);
        return $data;
    }
}

if (!function_exists('reductStr'))
{
	function reductStr($value,$term, $maxlen = 150)
	{
		$pos = stripos($value,$term);
		$curs = (int) ($pos-$maxlen/2);
		return substr($value,$curs>0?$curs:0,$maxlen);
	}
}

if (!function_exists('stripAccents'))
{
	function stripAccents($string){
	return strtr($string,
				'àáâãäçèéêëìíîïñòóôõöùúûüýÿÀÁÂÃÄÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝ',
				'aaaaaceeeeiiiinooooouuuuyyAAAAACEEEEIIIINOOOOOUUUUY');
	}
}
?>