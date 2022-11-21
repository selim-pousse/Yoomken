<?php
/**
 * Manifest
 * 
 * system/lib/router.class.php
 * 
 * The router class used to execute the desired controller/method
 * 
 * @copyright: Yoomken Li
 * 
 */
class router
{
	/**
	 * the controller path
	 * 
	 * @access private
	 */
	private $path;
	
	/**
	 * array of arguments
	 * 
	 * @access private
	 * 
	 */
	private $args = array();
	
	/**
	 * the file to load
	 * 
	 * @access private
	 * 
	 */
	private $file;
	
	/**
	 * the controller name to use
	 * 
	 * @access private
	 * 
	 */
	public $controllerName;
	
	/**
	 * A reference to the controller being executed
	 * 
	 * @access private
	 * 
	 */
	public $controller;
	
	/**
	 * the action to execute
	 * 
	 * @access private
	 * 
	 */
	public $action; 
	
	/**
     * Router object provides storage for shared objects.
     * 
     * @var Router
     * 
     */
    private static $router = null;
    
    /**
     * The initialization time, for profiling purposes
     * 
     * @access public
     * 
     */
    public static $loadTime = null;
    
    /**
     * The execution starting time, for profiling purposes
     * 
     * @access public
     * 
     */
    public static $executeTime = null;
    
    /**
     * Keeps a reference to registry
     * 
     * @access private
     */
    private $registry = null;
    
    /**
     * Keeps a reference to template
     * 
     * @access public
     */
    public $template = null;
	
	/**
	 * Constructs and loads router and controller path
	 * 
	 * @return void
	 * 
	 */
	function __construct() 
	{
		$this->setPath (__APP_PATH . '/controllers');
		
		$this->registry = Registry::getInstance();
		Registry::loadConfig();        
        Registry::loadDBConfig();
		
	    // if profiler is activated, load microtime
        if ($this->registry->get('enable_profiler'))
        {
        	Profiler::addLog('loading router');
        }
	}
	
	/**
     * Retrieves the default router instance.
     *
     * @return Router
     * 
     */
    public static function getInstance()
    {
        if (self::$router === null) 
        {
            self::$router = new Router();
        }

        return self::$router;
    }
	
	/**
	 *
	 * @set controller directory path
	 *
	 * @param string $path
	 *
	 * @return void
	 *
	 */
	function setPath($path) 
	{
		// check if path is a directory
		if (is_dir($path) == false)
		{
			throw new Exception ('Invalid controller path: "' . $path . '"');
		}
		// set the path
	 	$this->path = $path;
	}
	
	/**
	 *
	 * @load the controller
	 *
	 * @access public
	 *
	 * @return void
	 *
	 */
	public function loader()
	{
		// check the route
		$this->parseController();
	
		// if the file is not there diaf
		
		if (is_readable($this->file) == false)
		{
			//$this->file 			= $this->path . '/../errorController.php';
	        $this->controllerName 	= 'error';
		}
		// include the controller
		else include_once $this->file;
		
		// a new controller class instance
		$class 				= $this->controllerName . 'Controller';
		$this->controller 	= new $class();
		
		$this->controller->_init($this);
		
		// check if the action is callable
		if (is_callable(array($this->controller, $this->action)) == false)
		{
			$this->action = 'index';
		}
		
		// if profiler is activated, show some debug info
        if ($this->registry->get('enable_profiler'))
        {
        	Profiler::addLog('launching action');
        	Profiler::checkpoint('total to launch action');
        	Profiler::setAction($this->action);
        	Profiler::setController($this->controllerName);
        }
		
		// run the action
		$action = $this->action;
		$this->controller->$action();
		
		$this->controller->_end();
		
		// if profiler is activated, show some debug info
        if ($this->registry->get('enable_profiler'))
        {
        	//Profiler::checkpoint('executing action');
        	Profiler::finish('total execution time');
        	Profiler::show();
        }
     
        
	}
		
	/**
	 *
	 * @get the controller
	 *
	 * @access private
	 *
	 * @return void
	 *
	 */
	private function parseController() 
	{
		// get the route from the url
		$route = (empty($_GET['go'])) ? '' : $_GET['go'];
	
		if (empty($route))
		{
			$route = 'home';
		}
		else
		{
			// get the parts of the route
			$parts = explode('/', $route);
			$this->controllerName = $parts[0];
			if(isset( $parts[1]))
			{
				$params = explode('?', $parts[1]);
				$this->action = $params[0];
			}
		}
	
		if (empty($this->controllerName))
		{
			$this->controllerName = 'home';
		}
	
		// Get action
		if (empty($this->action))
		{
			$this->action = 'welcome';
		}
		/*else if ($this->action=='notfound')
		{
			$_GET['journal']='BASE';
			$_GET['type']='ALL';
		}*/
	
		// set the file path
		$this->file = $this->path .'/'. $this->controllerName . 'Controller.php';
	}
	
	/**
	 * Basic getter for $this->action
	 * 
	 * @return string $this->action
	 * 
	 * @access public
	 * 
	 */
	public function getAction()
	{
		return $this->action;
	}
	
	/**
	 * Basic getter for $this->controllerName
	 * 
	 * @return string $this->controllerName
	 * 
	 * @access public
	 * 
	 */
	public function getController()
	{
		return $this->controllerName;
	}
	
}

?>
