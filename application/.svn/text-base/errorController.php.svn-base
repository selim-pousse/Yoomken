<?php
/**
 * Manifest
 * 
 * application/errorController
 * 
 * This controller manages the application error like 404 not found, JS support, browser support
 * 
 * @copyright: Yoomken Li
 * 
 */
Class errorController Extends appController 
{
	/**
	 * Implements the default action from baseController
	 * 
	 * @see system/lib/baseController#index()
	 * 
	 */
	public function index() 
	{
		$this->notFound();
	}
	
	public function notFound()
	{
		$params = array( 'title' => 'Yoomken - Page not found' );
	    
		$this->template->layout('error');
		$this->template->page('/errors/notFound', $params);
	}
	
	public function js()
	{
		$params = array( 'title' => 'Yoomken - Javascript required' );
	    
		$this->template->layout('error');
		$this->template->page('/errors/js', $params);
	}
	
	public function browser()
	{
		$params = array( 'title' => 'Yoomken - Unsupported browser' );
	    
		$this->template->layout('error');
		$this->template->page('/errors/browser', $params);
	}
	
	public function maintenance()
	{
		$params = array( 'title' => 'Yoomken - Under construction' );
	    
		$this->template->layout('error');
		$this->template->page('/errors/maintenance', $params);
	}

}
?>
