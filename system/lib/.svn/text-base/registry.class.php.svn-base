<?php
/**
 * Manifest
 * 
 * system/lib/registry.class.php
 * 
 * The application's registry, which keeps a status configuration
 * 
 * @copyright: Yoomken Li
 * 
 */
Class Registry 
{
	/**
	 * @var array configuration
	 * 
	 * @access private
	 * 
	 */
 	private static $config = array();
 	
    /**
     * Registry object provides storage for shared objects.
     * 
     * @var Registry
     * 
     */
    private static $registry = null;
    
    /**
     * The initialization time, for profiling purposes
     * 
     * @access public
     * 
     */
    public static $loadTime = null;
    
    /**
     * Default constructor, loads configuration from a config file 
     * 
     */
    public function __construct()
    {
    	$this->loadDBConfig();         
        // if profiler is activated, load microtime
        if (self::get('enable_profiler'))
        {
        	Profiler::addLog('loading registry');
        }
    }
    
    public function __init(){
    }
    
 	/**
     * Retrieves the default registry instance.
     *
     * @return Registry
     * 
     */
    public static function getInstance()
    {
        if (self::$registry === null) 
        {
            self::$registry = new Registry();
        }

        return self::$registry;
    }

	/**
	 * Loads the main config.ini.php file
	 *
	 * @access	private
	 * @return	array
	 */
	public static function loadConfig()
	{
		include_once __APP_PATH . '/config/facebook.ini.php';
		include_once __APP_PATH . '/config/google.ini.php';
		$file = __APP_PATH . '/config/config.ini.php';
		
		//if ( ! (self::$config))
		//{
			if ( ! file_exists($file))
			{
				exit('The configuration file config.ini.php does not exist.');
			}
	
			require($file);
	
			if ( ! isset($config) OR ! is_array($config))
			{
				exit('Your config file does not appear to be formatted correctly.');
			}
		//}
		
		foreach ($config as $k=>$v)
		{
			self::set($k, $v);
		}
	}
	
	/**
	 * Loads the database db.ini.php file
	 *
	 * @access	private
	 * @return	array
	 */
	public static function loadDBConfig()
	{
		$file = __APP_PATH . '/config/db.ini.php';
		
		if ( ! file_exists($file))
		{
			exit('The configuration file config.ini.php does not exist in : '.$file);
		}
	
		require_once($file);
	
		if ( ! isset($db) OR ! is_array($db))
		{
			return false;
			//exit('Your DB config file does not appear to be formatted correctly.');
		}

		self::set('db', $db);
		
	}
    
	/**
	 * It can be used in static environments
	 * @set undefined vars
	 *
	 * @param string $index
	 * @param mixed $value
	 *
	 * @return void
	 * 
	 * @access public
	 *
	 */
	public static function set($index, $value)
	{
		self::$config[$index] = $value;
	}
	
	/**
	 * Alias for __set, used in dynamic environments
	 * @set undefined vars
	 *
	 * @param string $index
	 * @param mixed $value
	 *
	 * @return void
	 * 
	 * @access public
	 *
	 */
	public function __set($index, $value)
	{
		self::set($index,$value);
	}

	/**
	 * @get variables
	 *
	 * @param mixed $index
	 *
	 * @return mixed
	 * 
	 * @access public
	 *
	 */
	public function get($index)
	{
		if (!isset(self::$config[$index])) 
		{
			return null;
		}
	
	    return self::$config[$index];
	}
	
	/**
	 * Alias for __get, used in dynamic environments
	 * @get variables, null if undefined
	 *
	 * @param string $index
	 *
	 * @return mixed
	 * 
	 * @access public
	 *
	 */
	public function __get($index)
	{
		return self::get($index);
	}
     
}

?>
