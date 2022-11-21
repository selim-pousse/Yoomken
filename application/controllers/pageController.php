<?php
/**
 * Manifest
 * 
 * application/controllers/pageController
 * 
 * Controller for static pages
 * 
 * @copyright: Yoomken Li
 * 
 */
Class PageController Extends AppController 
{
	/**
	 * It has to be declared, does nothing
	 * 
	 * @see system/lib/baseController#index()
	 */
	public function index(){}
	
	/**
	 * Creates the 'news' page
	 * 
	 */
	public function news()
	{
		$this->template->page('static/news', null, array('title'=>'eegoes | News') );
	}
	
	
	/**
	 * Creates the 'contact' page
	 * 
	 */
	public function contact()
	{
		$this->template->page('static/contact');
	}
	
	/**
	 * Creates the 'team' page
	 * 
	 */
	public function team()
	{
		$this->model('people');
		
		$users		= $this->people->getByID(array(	'nos ids...'));
		$this->people->getPeopleSpot($users,true);	
		
		$this->template->page('static/team', array('users'=>$users));
	}
	
	/**
	 * Creates the 'help' page
	 * 
	 */
	public function help()
	{
		$this->template->page('static/help');
	}
	
	/**
	 * Creates the 'faq' page
	 * 
	 */
	public function faq()
	{
		$this->template->page('static/faq');
	}
	
	/**
	 * Creates the 'communityguidelines' page
	 * 
	 */
	public function communityguidelines()
	{
		$this->template->page('static/community-guidelines');
	}
	
	/**
	 * Creates the 'support' page
	 * 
	 */
	public function support()
	{
		$this->template->page('static/support');
	}
	
	/**
	 * Creates the 'terms' page
	 * 
	 */
	public function terms()
	{
		$this->template->page('static/terms');
	}
	
	/**
	 * Creates the 'privacy' page
	 * 
	 */
	public function privacy()
	{
		$this->template->page('static/privacy');
	}

}
?>
