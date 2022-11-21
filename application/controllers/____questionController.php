<?php
/**
 * Manifest
 * 
 * application/controllers/contentController
 * 
 * Manages the content requests for videos, pictures and other elements
 * 
 * @copyright: Yoomken Li
 * 
 */
Class QuestionController Extends ContentController
{
	protected $mdl = 'questions';
	protected $type = 'ASK';
	protected $filter_type = '..1';
	/**
	 * Main index, currently redirects to $this->ajax()
	 * 
	 * @see system/lib/baseController#index()
	 * @see ajax()
	 */
	
	public function index()
	{
		$this->ajax();
	}
	
	/**
	 * 
	 */
	public function timeline($ajax = false)
	{
		$mdl = $this->mdl;	
		if ($this->session->isLogged())
		{
			$me = $this->session->get('user');
			//_debug($me);die();
			$this->template->set('postAct',$me->profil=='P'?'SV':($me->profil=='N'?'NE':'JB'));
		}
		$filters = array();
		$this->loadFilters($filters,$params);
		$results	= 	$this->$mdl->processSearch($filters,$params);	
		
		$nbread = count($results[1]);
		if ($ajax)
			return $this->template->render( 'question/inner/displayDash',array('activities'=>$results[1],'nbread'=>$nbread,'nbtot'=>$results[0]),array('title'=>'flux d\'offre de', 'desc'=>''));
		else 
			$this->template->page( '/question/all',array('activities'=>$results[1],'nbread'=>$nbread,'nbtot'=>$results[0]),array('title'=>'flux d\'offre de', 'desc'=>''));
	}
}
?>