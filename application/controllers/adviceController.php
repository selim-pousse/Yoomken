<?php
/**
 * Manifest
 * 
 * application/controllers/adviseController
 * 
 * Describe some advises
 * 
 * @copyright: Yoomken Li
 * 
 */
Class AdviceController Extends AppController 
{
	public function _init(&$router){
		parent::_init($router);
		$this->template->set('cacheMainSearch',1);
	}
	
	/**
	 * Main index, must be implemented
	 * 
	 * @see system/lib/baseController#index()
	 * 
	 */
	public function index()
	{
		$this->aboutus();
	}
	
	public function aboutus()
	{
		$this->template->page( '/advice/aboutus',null,array('title'=>'A propos de nous', 'desc'=>''));
	}
	
	public function team()
	{
		$this->template->page( '/advice/team',null,array('title'=>'Notre team', 'desc'=>''));
	}
	
	public function presta()
	{
		$this->template->page( '/advice/presta',null,array('title'=>'Nos conseils', 'desc'=>''));
	}
	
	public function terms()
	{
		$format = $this->get_post('format');
		if ($format == 'part')
			$this->template->show( '/advice/terms',null);
		else 
			$this->template->page( '/advice/terms',null,array('title'=>_('POLICY'), 'desc'=>''));
	}
	
	public function recruiter()
	{
		$this->template->page( '/advice/recruiter',null,array('title'=>'Nos conseils', 'desc'=>''));
	}
	
}
?>
