<?php
/**
 * Manifest
 * 
 * system/lib/cookie.class.php
 * 
 * Cookie handler, manages all relative to client cookie
 * 
 * @copyright: Yoomken Li
 * 
 */
Class Cookie
{	
	private static $singleton = null;
	
	
	/**
	 * The main destructor erases singleton object
	 * 
	 * @return void
	 */
	public function __destruct() 
	{  			
      	Cookie::$singleton = null ;
  	}
  	
	/**
	 * we make __clone private so nobody can clone the instance
	 *
	 * @access private
	 *
	 */
	private function __clone(){}	
	
	/**
	 *
	 * Return DB instance or create intitial connection
	 * 
	 * @return Db object
	 *
	 * @access public
	 */
	public static function getInstance() 
	{
		if (!Cookie::$singleton) 
		{
	   		Cookie::$singleton = new Cookie();
		}
		
		return Cookie::$singleton;
	}
	
	/**
	 * Getter for variables in cookies
	 * 
	 * @param string $var
	 * 
	 * @return mixed the cookie variable value
	 * 
	 */	
	public function get($var = '')
	{
		if (isset($_COOKIE[$var]))
		{
			return $_COOKIE[$var];
		}
		
		return null;
	}
	
	/**
	 * Setter for variables in cookies
	 * 
	 * @param string $variable name
	 * @param mixed $value the value to store
	 * @param int $time
	 * 
	 * @return boolean
	 * 
	 */
	public function set($var, $value = null, $time = null)
	{
		$time = intval($time);
		
		if ($time <= 0)
		{
			$time = time()-3600;
		}
		
		return setcookie($var, $value, $time, "/");
	}
	
	/**
	 * Erases a cookie's content 
	 * 
	 * @return void
	 */
	public function erase()
	{
		self::set("bc56", "");
		self::set("tq32", "");
		self::set("bx44", "");
	}
}

?>
