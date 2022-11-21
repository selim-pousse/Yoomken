<?php
/**
 * Manifest
 * 
 * system/lib/baseObject.class.php
 * 
 * Abstract parent base object from which controllers and models inherit
 * 
 * @copyright: Yoomken Li
 * 
 */
Abstract Class baseObject 
{
	/**
	 * Object registry
	 * 
	 * @access protected
	 *
	 */
	protected $registry;
	
	/**
	 * Object router
	 * 
	 * @access protected
	 *
	 */
	protected $router;
	
	/**
	 * Keeps a reference to the user session for further use
	 * 
	 * @access protected
	 */
	protected $session;
	
	/**
	 * Object template
	 * 
	 * @access protected
	 *
	 */
	protected $template;
	
	/**
	 * Default constructor, loads the registry (singleton pattern)
	 * 
	 */
	public function __construct() 
	{
		/*$this->registry = Registry::getInstance();
		$this->session 	= Session::getInstance();
		$this->router	= Router::getInstance();
		$this->template	= Template::getInstance();*/
	}
	
	/**
	 * Loads a model from application or system folders
	 * 
	 * @param string $model name
	 * 
	 * Adds the model as an attribute of $this
	 * 
	 */
	public function model($model)
	{
		$file 	 = __APP_PATH . '/models/' . $model . 'Model.php';
		$adapter = __APP_PATH . '/adapters/' . $model . 'Adapter.php';
		
		if (!is_readable($file))
		{
			$file 	 = __SYSTEM_PATH . '/lib/models/' . $model . 'Model.php';
		}
		
		if (!is_readable($adapter))
		{
			$adapter = __SYSTEM_PATH . '/lib/adapters/' . $model . 'Adapter.php';
		}
		
		if (is_readable($file))
		{
			include_once ($file);
			
			// include adapter if exists
			if (is_readable($adapter))
			{
				include_once ($adapter);				
			}
			
			$modelName = PREFIX_YOO_MODEL.$model . 'Model';
			$this->$model = new $modelName;
		}
		
	}
	
 	/**
	 * Loads a helper from application or system folders
	 * 
	 * @param string $helper name
	 * 
	 * Just loads the file and the functions are available
	 * 
	 */
	public function helper($helper)
	{
		$file = __APP_PATH . '/helpers/' . $helper . '.php';
		
		if (!is_readable($file))
		{
			$file = __SYSTEM_PATH . '/helpers/' . $helper . '.php';
		}
		
		if (is_readable($file))
		{
			include ($file);
		}
		
	}
	

}

?>
