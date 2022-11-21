<?php
/**
 * Manifest
 * 
 * system/lib/template.class.php
 * 
 * The template class manages the views loading
 * 
 * @copyright: Yoomken Li
 * 
 */
Class Template
{
	/**
	 * StdClass $this reference
	 * 
	 * @access private 
	 */
	private static $singleton = null;
	
	/**
	 * Variables array
	 * 
	 * @access private 
	 */
	private $vars 			= array();
	
	/**
	 * Keeps a reference to the user session for further use
	 * 
	 * @access private
	 */
	private $session 		= null;
	
	/**
	 * Keeps a reference to the registry object, so that configurations can be gotten easily
	 * 
	 * @access private
	 */
	private $registry		= null;
	
	/**
	 * Keeps a reference to the input class
	 * 
	 * @access private
	 */
	private $input			= null;
	
	/**
	 * The name of the controller in use
	 * 
	 * @access private
	 */
	private $controller 	= '';
	
	/**
	 * The name of the action executed
	 * 
	 * @access private
	 */
	public  $action 		= '';
	
	/**
	 * The logged in user, for faster access
	 * 
	 * @access private
	 */
	private $user			= null;
	
	/**
	 * Search keywords
	 * 
	 * @access private
	 */
	private $keyword 		= '';
	
	/**
	 * If an ID is requested, it is stored here for faster access within the template
	 * 
	 * @access private
	 */
	private $rid			= '';
	
	/**
	 * Sometimes, a group object is needed to base views on its configuration
	 * 
	 * @access private
	 */
	private $group			= null;
	
	/**
	 * Layout used to render the views
	 * 
	 * @access private
	 */
	private $layout 		= '';
	
	/**
	 * Title used to label the page
	 * 
	 * @access private
	 */
	public $title 			= '';
	
	/**
	 * Description used to label the page
	 * 
	 * @access private
	 */
	public $description 	= '';
	
	/**
	 * Keywords used to label the page
	 * 
	 * @access private
	 */
	private $keywords 		= '';
	
	/**
	 * Particular CSS style to apply to the page
	 * 
	 * @access private
	 */
	private $css 			= '';
	
	/**
	 * Particular JS file to load with the page
	 * 
	 * @access private
	 */
	private $js 			= '';	
	
	/**
	 * Whether to include the menu or not
	 * 
	 * @access private
	 */
	private $menu 			= false;	
	
	/**
	 * Constructor, we avoid external instantiation of this class
	 * 
	 * @return void
	 */
	private function __construct()
	{
		// session
		$this->session 	= Session::getInstance();
		
		// input
		$this->input	= Input::getInstance();
		
		// registry
		$this->registry	= Registry::getInstance();
		
		// search keywords		
		$keyword 		= urldecode($this->input->get('skw'));		
		if ($keyword)
		{
			$this->keyword 	= $keyword;
		}
		
		// controller name
		$router 			= Router::getInstance();
		$this->controller 	= $router->getController();
		
		// action name
		$this->action 	= $router->getAction();
		
		// session user
		$this->user		= $this->session->get('user');
		
		// requested ID
		$rid 			= $this->input->get('id');
		$url			= $this->input->get('url');
		
		if (isId( $rid ))
		{
			$this->rid 		=  (isId( $rid ) ? $rid : ''); 
		}
		else $this->rid 		=  $url; 

		// concerned group

		
		
		// menus depend on controllers
		if ( $this->controller != 'home' || $this->session->isLogged())
		{
			$this->menu = true;
		}
		
		// finally load some defaults from config
		$this->layout 		= $this->registry->get('page_layout');
		$this->title 		= $this->registry->get('page_title');
		$this->description 	= $this->registry->get('page_description');
		$this->keywords 	= $this->registry->get('page_keywords');
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
	 * Return Template instanc
	 * 
	 * @return Template object
	 *
	 * @access public
	 */
	public static function getInstance() 
	{
		if (Template::$singleton===null) 
		{
	   		Template::$singleton = new Template();
		}
		
		return Template::$singleton;
	}
	
	/**
	 *
	 * @set undefined vars
	 *
	 * @param string $index
	 *
	 * @param mixed $value
	 *
	 * @return void
	 *
	 */
	 public function set($index, $value)
	 {
	        $this->vars[$index] = $value;
	 }
	 
	 /**
	  * Allows to set the default layout to be used
	  * 
	  * @param string $layout
	  * 
	  * @access public
	  * 
	  */
	 public function layout($layout = '')
	 {
	 	$path = __APP_PATH . '/views/' . $layout . '.php';
		
		if (file_exists($path))
		{
			$this->layout = $layout;	
		}
	 	
	 }
	
	/**
	 * Renders the selected view
	 * 
	 * @param string $name of the view
	 * @param mixed $vars optional array of variables to set for the view
 	 * @param boolean $return whether to return the content instead of showing it
 	 * 
 	 * @important!!! this method is overloaded so that third parameter can be passed in second position;
 	 * 					Then, to force return of output without passing parameters, use show('view',true);
 	 * 					Force return is disables by default and variables are null also by default
	 * 
	 * @return string the rendered view code
	 * 
	 */	 
	public function show($name, $vars = array(), $return = false) 
	{
		$path 	= __APP_PATH . '/views' . '/' . $name . '.php';
		$buffer = '';
		$start	= microtime(true);
		
		$this->title 		= _('PAGE_TITLE');
		$this->description 	= _('WHATS_YOO_DETAIL');
		
		if (file_exists($path) == false)
		{
			$exception = new Exception();
			if ($this->registry->get('enable_profiler'))
			{
				Profiler::error('Template not found in '. $path . ' >> ' . $exception);
			}

			return false;
		}
		
		// prefilter (third parameter might have been passed in second position)
		if ($vars === true || $vars === false)
		{
			$return = $vars;
			$vars 	= array();
		}		
		
		// vars always an array
		if (!is_array($vars))
		{
			$vars = array();
		}
		
		// set input variables, if any
		foreach ($vars as $key => $value)
		{
			$this->set($key,$value);
		}
	
		// Load variables
		foreach ($this->vars as $key => $value)
		{
			$$key = $value;
		}
		
		// start output buffering
	    ob_start();
			
		include ($path);
		
		$html = ob_get_clean();
		//
				
		$html = str_replace("\n",'',$html);
		$html = str_replace("\t",'',$html);
		$html = str_replace('  ',' ',$html);
		
		if ($this->registry->get('enable_profiler'))
		{
			if (Profiler::$firstView)
			{ 
				Profiler::$firstView = false;
				Profiler::checkpoint('Total to execute queries');
			}
			Profiler::addLog('Loading view ' . $name);	
		}
		
		if ($return)
		{
			return $html;
		}
		
		// otherwise
		echo $html;	
		          
	}

	/**
	 * Renders the selected block of view and returns the output
	 * Alias for $this->show('name','vars',true);
	 * 
	 * @param string $name of the view
	 * @param mixed $vars optional array of variables to set for the view
	 * 
	 * @return string the rendered view code
	 * 
	 * @access public
	 *  
	 */	 
	public function render($view = '', $params = array())
	{	
		return $this->show( $view, $params, true);
	}
	
	/**
	 * Renders a whole page by inserting the content into the layout
	 * 
	 * @param string $view the view to render
	 * 
	 * @param mixed array of parameters for the view to process
	 * 
	 * @param mixed array of settings for the page to process
	 * @param string $settings['title'] 
	 * @param string $settings['description']
	 * @param string $settings['keywords']
	 * @param string $settings['css']
	 * @param string $settings['js']
	 * 
	 * @access public
	 */
	public function page($view = '', $params = array(), $settings = array())
	{
		// overwrite attributes with settings, if available
		$this->title 		= isset( $settings['title'] ) ? $settings['title'] : $this->title;
		$this->description	= isset( $settings['description'] ) ? $settings['description'] : $this->description;
		$this->keywords		= isset( $settings['keywords'] ) ? $settings['keywords'] : $this->keywords;
		$this->css			= isset( $settings['css'] ) ? $settings['css'] : $this->css;
		$this->js			= isset( $settings['js'] ) ? $settings['js'] : $this->js;
		
		$content 			= $this->render($view, $params); // pregenerate the content
		
		echo $this->render($this->layout,array('content_for_layout'=>$content));
		
		if ($this->registry->get('enable_profiler'))
		{
			Profiler::checkpoint('Total to load views');
		}
	}
	
	/**
	 * get the current page
	 * 
	 * @access public
	 */
	public function getPage()
	{
		return $this->page;
	}
	
	/**
	 * get the current controller
	 * 
	 * @access public
	 */
	public function getController()
	{
		return $this->controller;
	}

}

?>
