<?php
/**
 * Manifest
 * 
 * system/lib/session.class.php
 * 
 * Session handler, manages all relative to user session,
 *  authentication and information
 * 
 * @copyright: Yoomken Li
 * 
 */

/**
 * Dependencies: user library
 * Auto load it if it has not been loaded before
 *
 */
Class Session
{	
	/**
	 * @var StdClass $this reference
	 * 
	 * @access private
	 */
	private static $singleton 	= null;	
	
	/**
	 * Logged in status
	 * 
	 * @access private
	 */
	private static $logged 		= false;
	private static $syncro		= false;
	
	private $cookie		= null;
	
	/**
	 * Starts session
	 * 
	 * @access public
	 */
	private function __construct()
	{
		$this->cookie = Cookie::getInstance();
		self::startSession();
	}
		
	
	/**
	 * The main destructor erases singleton object
	 * 
	 * @return void
	 */
	public function __destruct() 
	{  			
      	Session::$singleton = null;
  	}
  	
	/**
	 *
	 * Like the constructor, we make __clone private
	 * so nobody can clone the instance
	 *
	 * @access private
	 *
	 */
	private function __clone(){}	
	
	/**
	 *
	 * Return an instance for singleton static use
	 *
	 * @return Session object
	 *
	 * @access public
	 *
	 */
	public static function getInstance() 
	{
		if (!self::$singleton) 
		{
	   		self::$singleton = new Session();
		}
		
		return self::$singleton;
	}
	

	/**
	 * Getter for variables in session
	 * 
	 * @param string the session variable
	 * 
	 * @return mixed the session variable
	 */
	public function get($var = '')
	{
		
		
		if (isset($_SESSION[$var]))
		{
			if ($_SESSION[$var] != '' && $_SESSION[$var] != null)
			{
				return $_SESSION[$var];	
			} 			
		}
		
		return null;
	}
	
	
	public function who()
	{
		return $this->get('who');
	}
	
	public function me()
	{
		return $this->get('user');
	}
	
	/**
	 * Getter specific for User's variables 
	 * 
	 * @param string the attribute of User Object
	 * 
	 * @return mixed the session variable
	 */
	public function getUserVar($var)
	{
		if (isset($_SESSION['user']->$var))
		{
			return $_SESSION['user']->$var;	
		}
		
		return null;
	}
	
	/**
	 * Sets a session variable
	 * 
	 * @param string $var name
	 * @param mixed $value for the variable
	 * 
	 * @return void
	 */
	public function set($var, $value = null)
	{
		$_SESSION[$var] = $value;	
	}
	
	/**
	 * Deletes a session variable
	 * 
	 * @param string $var name
	 *
	 */
	public function delete($var)
	{
		if (isset($_SESSION[$var]))
		{
			unset($_SESSION[$var]);
		}
	}
	
	/**
	 * Setter specific for User's variables 
	 * 
	 * @param string the attribute of User Object
	 * @param mixed $value for the variable
	 * 
	 * @return void
	 */
	public function setUserVar($var, $value = null)
	{
		$_SESSION['user']->$var = $value;
	}
	
	/**
	 * Gets a cookie variable
	 * 	connects with static class Cookie
	 * 
	 * @param string $var name
	 * 
	 * @return mixed the cookie variable
	 */
	private function getCookie($var = '')
	{
		return $this->cookie->get($var);
	}
	
	/**
	 * Sets a cookie variable
	 *  connects with static class Cookie
	 *  
	 * @param string $var name
	 * @param mixed $value for the variable
	 * @param int $time cookie validity
	 * 
	 * @return void
	 */
	private function setCookie($var, $value = null, $time = null)
	{
		return $this->cookie->set($var, $value, $time);
	}

	/**
	 * Starts a PHP session and checks cookie
	 * 
	 * @return void
	 */
	private function startSession()
	{
		ini_set('session.gc_maxlifetime', 3600*24*30);
		if (session_id()=="")
		{
			session_start();
		}
		 // session already exists, the user is logged in 
		if ( isId(self::getUserVar('id')) && isEmail(self::getUserVar('email')) /*&& strlen(self::getUserVar('fullname'))*/ )
		{
			$via = self::getUserVar('via');
	    	switch($via)
	    	{
	    		case 'goo': self::$logged = 3; break;
	    		case 'fb':	self::$logged = 2; break;
	    		default: 	self::$logged = 1; break;
	    	}
			
			//YOO_UserModel::syncronizeVanillaWith(self::getUserVar('pid'));
	    	
	    	return;
    	}
    	// session does not exist, try to load it from cookie
		if ( self::getCookie('sp56') && self::getCookie('ah32') && self::getCookie('sa44') )
		{
			$infos = explode("&",self::getCookie('sp56'));
			
			// besides, they are the right format
			if ( self::getCookie('sa44') == md5($infos[1]) && 
				 md5($infos[1]).$infos[2] == self::getCookie('ah32'))
			{
				$user = new Adapter(array('id'=>$infos[1]));
				$user->isme = true;
				self::set('user',$user); // tres important 
				self::set('who',$user);
				$userModel = new YOO_UserModel($this);
    			$user = $userModel->getByID($user->id);
				
				// and finally, they match the user in database
				if ( md5($user->email) == $infos[2] && $user->id == $infos[1] )
				{
					
					$user->via = self::getCookie('via');
					self::set('user',$user);
					// marked as logged in
					switch($user->via)
	    			{
	    				case 'goo': self::$logged = 3; break;
	    				case 'fb':	self::$logged = 2; break;
	    				default: 	self::$logged = 1; break;
	    			}
				}
				// they don't match the user... 
				else
				{
					self::set('user',null);
					self::set('who',null);
					self::$logged = false;
				}
			}
			// they are not right, let's create them again
			else
			{
				self::eraseCookie();
				
				self::$logged = false;
			}
    	}
    	// values do not exist in cookie, so the user is just not logged in
    	else
    	{
    		self::$logged = false;
    	}	
	}
	
	/**
	 * Erases a cookie content
	 *  connects with static class Cookie
	 *  
	 * @return void
	 */
	private function eraseCookie()
	{
		$this->cookie->erase();
	}
	
	/**
	 * Return true if a user is logged in
	 * 
	 * @return boolean
	 */
	public function isLogged()
	{
		if (!self::$logged) $this->startSession();    	
		return self::$logged;
	}
	
	
	/**
	 * Performs the login actions related to session
	 * 
	 * @param string $user id
	 * @param string $timezone
	 * @param boolean $rememberme
	 * 
	 * @return void 
	 */
	public function logIn($uid, $rememberme, $via = 'Ƃ-Ƌ')
	{
		$userModel = new YOO_UserModel($this);
    	$res = $userModel->getByID($uid,'id',true);
		
		if (isId($res->id))
		{
	    	$res->via = $via;
	    	self::set('user',$res);
	    	
			$input 	= Input::getInstance();				
	   		if($rememberme)
			{

				$this->setCookie('sp56', md5($input->server('REQUEST_TIME')) . '&' . $res->id . '&' . md5($res->email), time()+60*60*24*30);
				$this->setCookie('ah32', md5($res->id) .  md5($res->email) , time()+60*60*24*30);
				$this->setCookie('sa44', md5($res->id), time()+60*60*24*30);
				$this->setCookie('via', $via, time()+60*60*24*30);
			}
		}
	}
	
	/**
	 * Logs user out by destroying session
	 * 
	 * @access public
	 */
	public function logout()
	{
		//db::write('UPDATE `user` SET last_activity_usr= DATE_SUB( NOW( ) , INTERVAL 20 MINUTE)  WHERE id_usr="'.self::getUserVar('id').'"');
		@file_get_contents('http://'.DOMAIN_URL.'/AjaxIM/ajaxim.php/logout?user_id='.self::getUserVar('pid'));
		
		session_destroy();
		
		$this->setCookie('sp56', '', time()-3600, '/');
		$this->setCookie('ah32', '', time()-3600, '/');
		$this->setCookie('sa44', '', time()-3600, '/');
		$this->setCookie('via', '', time()-3600, '/');
	}

}

?>
