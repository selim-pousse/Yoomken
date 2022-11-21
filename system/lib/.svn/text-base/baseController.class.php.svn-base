<?php
/**
 * Manifest
 * 
 * system/lib/baseController.class.php
 * 
 * Abstract parent base controller
 * 
 * @copyright: Yoomken Li
 * 
 */
Abstract Class baseController extends baseObject
{	
	/**
	 * all controllers must contain an index method
	 * 
	 */
	abstract public function index();
	
	/**
	 * It keeps a record for further profiling
	 * 
	 */
	public function __construct()
	{
		parent::__construct();
		
		$this->registry = Registry::getInstance();
		$this->session 	= Session::getInstance();
		$this->router	= Router::getInstance();
		$this->template	= Template::getInstance();
		
		// if profiler is activated, load microtime
        if ($this->registry->get('enable_profiler'))
        {
        	Profiler::addLog('loading controller');
        }
	}
	
	abstract public function _init(&$router);
	abstract public function _end();
	
}

?>
