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
Class BadgeController Extends AppController 
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
		$this->earned();
	}
	
	
	/**
	 * AJAX dispatcher
	 *  Executes the right function according to 'act' POST parameter
	 * 
	 * @see system/lib/baseController#index()
	 * 
	 */
	public function ajax()
	{
		// 	general protection: user must be logged in
		if (!$this->session->isLogged())
		{
			echo jsonRet('100',false);
			return;
		}
		
		$this->model('badges');
		// 	common protection in almost all cases: ID must be valid
		$id = $this->get_post('id','string','','','isId');
		$term = $this->get_post('term','string');
					
		switch ($this->get_post('act'))
		{
			case 'light': 
			case 'view':
			case 'all':
					$me = $this->session->get('user');
					$who=$this->user->getById($id);
					$badges = $this->badges->getEarned($who->id);
					
					if ($this->get_post('act')=='all') $page = 'all';
					else if ($this->get_post('act')=='view') $page = 'ajax';
					else $page = 'inner/displayInColumns'; 
					// rendering
					$view = $this->template->render( '/badge/'.$page,array('keyword'=>'', 'badges'=>$badges,'who'=>$who));
					// then, echo a JSON response
					echo jsonRet(_('DONE'), true,null,getNameObj($who), $view, 1);
				break;
			case 'wishnew':
				echo $this->template->render( '/badge/module/wishNew',array('keyword'=>''));
				break;
			case 'availableName':
				$name = $this->post('title');
				if(Db::read('SELECT name_bdg FROM badge where name_bdg LIKE "'.$name.'"')) echo 'false';
				else echo 'true';
				break;
				
		}
	}
	
	public function one()
	{
		$id = $this->get_post('id','string');
		$this->model('badges');
		$badge = $this->badges->getById($id);
		$this->template->page( 'badge/one',array('cacheMainSearch'=>'0','title'=>'', 'desc'=>'','badge'=>$badge));
	}
	
	public function personalities()
	{
		$this->model('badges');
		$badges = $this->badges->getLike(null,array('PERS'),50);
		$this->template->page( 'badge/all',array('cacheMainSearch'=>'1','title'=>'', 'desc'=>'','badges'=>$badges,'type'=>'PERS'));
	}
	
	public function skills()
	{
		$this->model('badges');
		$badges = $this->badges->getLike(null,array('SKILL'),50);
		$this->template->page( 'badge/all',array('cacheMainSearch'=>'1','title'=>'', 'desc'=>'','badges'=>$badges,'type'=>'SKILL'));
	}
	
	public function actions()
	{
		$this->model('badges');
		$badges = $this->badges->getLike(null,array('ACTION'));
		$this->template->page( 'badge/all',array('cacheMainSearch'=>'1','title'=>'', 'desc'=>'','badges'=>$badges,'type'=>'ACTION'));
	}
	
	public function wish()
	{
		if (!$this->session->isLogged()) return null;
		
		$this->model('badges');
		$badges = $this->badges->getAllWished();
		$this->template->page( 'badge/wish',array('cacheMainSearch'=>'1','title'=>'', 'desc'=>'','badges'=>$badges,'type'=>'WISH'));
	}
	
	
	public function earned()
	{
		$this->model('badges');
		
		$badges = $this->badges->getEarned(who()->id);
		$this->template->page( 'badge/allEarned',array('title'=>'', 'desc'=>'','badges'=>$badges));
	}
	
	/**
	 *  give badge of ask for badge
	 * 
	 *  Gets params from post/get
	 *  
	 *  @return echoes view
	 */
	public function transfert()
	{	
		
			
		$req 	= $this->get_post('typereq', 'string', '', array('GIV','ASK','Y','N'));
		$act 	= $this->post('act');
		if ($act=='save')
		{
			$idbdg 	= $this->post('thebadge', 'string');
			$towho 	= $this->post('towho', 'string',null,null,'isId');
			$msg 	= $this->post('msg', 'string');
			$idmsg 	= $this->post('idmsg', 'string');
			
			
			$this->model('badges');
			
			if ($req == 'ASK')
			{
				$ret = $this->badges->attach($towho,me()->id,$idbdg,$req,($msg==_('ADD_NOTE')?'':$msg));
			}
			else 
			{
				$ret = $this->badges->attach(null,$towho,$idbdg,$req,($msg==_('ADD_NOTE')?'':$msg),$idmsg);
			}
			
			echo jsonRet($ret[0], $ret[1],$ret[2],array('towho'=>$ret[3]));
			//$this->badge->attach($towho)
			
		}
		else // disply view
		{
			$this->model('badges');
			$badges = $this->badges->getLike(null,array('PERS','SKILL'));
			$towho 	= $this->get_post('towho', 'string',null,null,'isId');
			
			if ($badges)
				echo $this->template->render('/badge/module/findBadges',array('badges'=>$badges,'typereq' => $req,'towho'=>$towho));
		}
	}
	
	function attach()
	{
		
	}
	
	/**
	 *  find friend 
	 * 
	 *  Gets params from post/get
	 *  
	 *  @return echoes view
	 */
	public function find()
	{
		$term = $this->post('term','string');
		$this->model('badges');
		$badges = $this->badges->getLike($term, array('PERS','SKILL'));
		if($badges) 
		{
			// rendering
			$view = $this->template->render( '/badge/inner/displayForSelect',array('badges'=>$badges));
			
			// then, echo a JSON response
			echo jsonRet(_('DONE'), true,null,'no meta', $view, 1);
		}
		else echo jsonRet(_('DONE'), true,null,'N/A', '<div></div>', 1);
	}
	
}
?>
