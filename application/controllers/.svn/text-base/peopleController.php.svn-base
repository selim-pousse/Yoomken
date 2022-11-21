<?php
/**
 * Manifest
 * 
 * application/controllers/peopleController
 * 
 * Manages the content requests for people
 * 
 * @copyright: Yoomken Li
 * 
 */
Class PeopleController Extends AppController 
{
	protected $mdl = 'people';
	protected $type = 'USR';
	protected $filter_type = '1..';
	
	/**
	 * Main index, currently redirects to $this->ajax()
	 * 
	 * @see system/lib/baseController#index()
	 * @see ajax()
	 */
	public function index($format='full')
	{	
		$mdl = $this->mdl;
		$this->model('people');
		
		if ($this->session->isLogged())
		{
			$idusr = $this->session->getUserVar('id');
			$me = $this->session->get('user');
			//_debug(json_encode($me));die();
		}
		else $me = null;
		
		$this->template->set('me',$me);
		
		$filters = array();
		$this->loadFilters($filters,$params);
		$sequence = '';		
		$results	= 	$this->$mdl->processSearch($filters,$params);	
		
		$this->template->set('people',$results[1]);
		$nbread = count($results[1]);
		
		if ($format == 'json')
			return $this->map($results[1]);
		elseif ($format == 'part') 
		{
			$view = $this->template->render( '/people/inner/displayList');
			
			if (!$view) $view = "<h3 class='none' style=''>None</h3>";
			
			$return = array ('view' => $view,'meta' => array('nbread'=>$nbread,'nbtot'=>$results[0]));;
			if (isSession())
			{
				$who = $this->session->who();
				$filters = Registry::getInstance()->get('filters');
				$isnearby = $this->session->isLogged() && isset($filters) && $filters[md5('XXX'.$me->id)]->active;
				$return['meta']['nearby'] = array('active'=>$isnearby,'position'=>getPositionUser($who),'username'=>$who->shortname);
			}
			else $return['meta']['nearby'] = array('active'=>0);
			return $return;
		}
		else
			$this->template->page( '/people/all',array('nbread'=>$nbread,'nbtot'=>$results[0],'keyword'=>'', 'error'=>''), array('title'=>_('NETWORK') ));
	}
	
	public function display($format='icon')
	{
		//_debug($_GET);	
		$this->model('colloborator');
		$iduser = $this->get_post('iduser');
		
		if ($this->session->isLogged())
		{
			$idusr = who()->id;
			$me = $this->session->get('user');
			//_debug(json_encode($me));die();
		}
		else return null;
		
		$this->template->set('me',$me);
		
		switch ($this->get_post('task')) {
			case 'likers':
					$results	= 	$this->collaborator->getLikers($iduser);	
				break;
			case 'followed':
					$results	= 	$this->collaborator->getProfilSuivis($iduser);
				break;	
			case 'followedOnly':
					$results	= 	$this->collaborator->getRelations(null,'ME->');	
				break;
			case 'followers':
					$results	= 	$this->collaborator->getSuiveurs($iduser);
				break;
			case 'followersOnly':
					$results	= 	$this->collaborator->getRelations(null,'<-ME');
				break;
			case 'coupleOnly':
					$results	= 	$this->collaborator->getRelations(null,'<-ME->');
				break;
			case 'collaborators':
					$results	= 	$this->collaborator->getAll($iduser);
				break;
			case 'collaboratorsOnly':
					$results	= 	$this->collaborator->getRelations(null,'ME->>');	
				break;
			case 'relations':
					$this->model('people');
					$results	= 	$this->people->getRelations($iduser,'->ME<-');
				break;
			default:
					$results = array(0,array());
				break;
		}
		
		$this->template->set('people',$results[1]);
		$nbread = count($results[1]);
		
		if ($format == 'iconpur') {
			return $this->template->render( '/people/inner/displayIcon',array('nbread'=>$nbread,'nbtot'=>$results[0]));
		}
		else if ($format == 'iconrel')
		{
			$view = $this->template->render( '/people/inner/displayRelations',array('nbread'=>$nbread,'nbtot'=>$results[0],'people'=>$results[1]));
			// then, echo a JSON response
			echo jsonRet(_('DONE'), true,null,null, $view, 1);
			return;
		}
		else return null;		
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
		switch ($this->get_post('act'))
		{ 
			case 'suggest':
				$this->suggest();
				break;
			case 'attach':
				$this->attach(true);
				break;
			case 'dettach':
				$this->attach(false);
				break;
			case 'timeline':
				$data = $this->index('part');
				echo jsonRet(_('DONE'), true,null,$data['meta'], $data['view'], 1);
				break;
			case 'map':
				$meta = $this->index('json');
				echo jsonRet(_('DONE'), true,null,$meta);
				break;
			case 'display':
				$view = $this->display($this->get_post('format'));
				if ($view) echo $view;
				else echo null;
				break;
			/*case 'isEmailPseudo':
				$email = $this->post('pseudo');
				if(Db::read('SELECT email_usr FROM user where email_usr LIKE "'.$email.'" OR  url_usr LIKE "'.$email.'"' )) echo 'true';
				else echo 'false';
				break;*/ 
			case 'availableEmail':
				$email = $this->post('email');
				if(Db::read('SELECT email_usr FROM user where email_usr LIKE "'.$email.'" AND status_usr <> 0' )) echo 'false';
				else echo 'true';
				break;
			case 'availablePseudo':
				$url = $this->post('pseudo');
				if(YOO_UserModel::urlAvailable($url,$this->session->getUserVar('id')))
					echo 'true';
				else 
					echo 'false';
				break;
			case 'relations':
					$term = $this->get_post('term');
					$this->model('user');
					$myrel = $this->user->getRelations($term);
					if($myrel) 
					{
						// rendering
						$view = $this->template->render( '/people/inner/displayRelations',array('myrelations'=>$myrel));
						
						// then, echo a JSON response
						echo jsonRet(_('DONE'), true,null,'no meta', $view, 1);
					}
					else echo jsonRet(_('DONE'), true,null,'N/A', '<div style="margin:5px 5px;">'._('NO_MATCH_RELATIONS').'<div>', 1);
				break;
			default:
				return;
		}
	}

	protected function loadFilters(&$filters,&$params)
	{	
		if ($this->mdl=='people') // gere les types de flux wall, offre, avis et activités..
		{
			if ($this->get_post('type')) {
				$type = $this->get_post('type');
				$this->session->set('type',$type);
				$this->template->set('typeStream',$type);
			}
			else if ($this->session->get('type')){
				$_GET['type'] = $_POST['type'] =$this->session->get('type');
				$this->template->set('typeStream',$this->session->get('type'));
			}
		}
		parent::loadFilters($filters,$params);
	}
	
	
	private function map($people)
	{
		$array = array();
		$i = 0;
		foreach($people as $usr) :	
			//$latLong = getPositionUser($usr);
			$array[] = 
						array(
							'id'			=>	$usr->id,
							'latitude' 		=> 	$usr->spot->lat,
							'longitude' 	=> 	$usr->spot->long,
							'name' 			=> 	$usr->shortname,
							'url'			=>	$usr->url,
							'img'			=>	getUserPic($usr->id,$usr->id_img,24,$usr->email),
							'distance' 		=>  $usr->distance
						);
			$i++;
		endforeach;
		
		return array ('people' => $array,
					  'nbread' => $i
					  ); 
	}
	
	public function inviteToWork()
	{
		$towho = $this->get_post('towho', 'string', '', null, 'isId');
		$contact = $this->get_post('contact','int');
		
		$this->model('user');
		$towho = $this->user->getById($towho);
		echo $this->template->render('/people/module/inviteToWork',array('towho'=>$towho,'contact'=>$contact));
	}
	
	/**
	 *  request from an user to follow someone
	 * 
	 *  Gets params from post/get
	 *  
	 *  @return echoes a JSON response to the browser
	 */
	public function attach($follow = true)
	{
		$id = $this->post('id', 'string', '', null, 'isId');
		$deal = $this->get_post('deal','string','');
		$idmsg = $this->post('idmsg','string','');
		$msg = $this->post('msg','string','');
		
		//$id = '6fb70e74da73fa019ba907df955f6c94';
		//$deal = '+';
		//print_r($_REQUEST);die();
		
		$this->model('user');
		if ($follow)
			$ret	=	$this->user->attach(null,$id,$deal,$msg==_('ADD_NOTE')?'':$msg, $idmsg);
		else
			$ret 	= 	$this->user->dettach($id);
		//_debug($ret);
		$view = '';
		if ($ret[1]) {// if 
			$view = $this->template->render('people/inner/actions-follow',array('usr'=>$ret[3]));
			echo jsonRet($ret[0],$ret[1],$ret[2],array('isFollowed'=>$follow,'towho'=>$id),$view);
			//echo $view;
		}
		else echo jsonRet($ret[0],$ret[1]);		
		
	}
	
	
	/**
	 *  recommand someome to other 
	 * 
	 *  Gets params from post/get
	 *  
	 *  @return echoes view
	 */
	public function recommand()
	{
		
		$id = $this->get_post('id', 'string', '', null, 'isId');
		$act = $this->post('act');
		$mode = $this->post('mode');
		if ($act=='save')
		{
			
			$towho = $this->post('towho');
			$msg = $this->post('msg','string','');
			
			$this->model('user');
			$ret = $this->user->iRecommandTo($id,$towho,($msg==_('ADD_NOTE')?'':$msg));
			
			if ($ret) echo jsonRet($ret[0], $ret[1],$ret[2],array('towho'=>$ret[3]));
			else echo jsonRet('Oops! Something wrong is happened..', false);
			
		}
		else // disply view
		{
			$this->model('people');
			$friends = $this->people->getRelations(me()->id,null,null,16,array($id));
			if ($friends)
			{
				echo $this->template->render('/people/module/findFriends',array('friends'=>$friends[1],'typereq'=> null, 'thebadge' => null,'who'=>$id));
			}
		}
	}
	
	/**
	 *  give or ask this badge 
	 * 
	 *  Gets params from post/get
	 *  
	 *  @return echoes view
	 */
	public function transfertBadge()
	{
		
		$idbdg 	= $this->get_post('name', 'string');	
		$req    = $this->get_post('typereq', 'string', '', array('GIV','ASK'));
		
		$act 	= $this->post('act');
		
		$this->model('people');
		$friends = $this->people->getRelations(me()->id,null);
		if ($friends)
			echo $this->template->render('/people/module/findFriends',array('friends'=>$friends[1],'typereq'=> $req, 'thebadge' => $idbdg,'who'=>''));
	}
	
	/**
	 *  find friend 
	 * 
	 *  Gets params from post/get
	 *  
	 *  @return echoes view
	 */
	public function findFriends()
	{
		$term = $this->post('term','string');
		$listignore = $this->post('listignore','string');
		$mode = $this->post('mode');
		
		$this->model('people');
		$friends = $this->people->getRelations(me()->id,null,$term,16,explode(',',$listignore));
		if ($mode !='json')
		{
			if($friends) 
			{
				// rendering
				$view = $this->template->render( '/people/inner/displayForSelect',array('friends'=>$friends[1]));
				
				// then, echo a JSON response
				echo jsonRet(_('DONE'), true,null,'no meta', $view, 1);
			}
			else echo jsonRet(_('DONE'), true,null,'N/A', '<div></div>', 1);
		}
		else {
			if ($friends) echo $this->template->render('/people/inner/displayJson',array('friends'=>$friends[1],'term'=>$term));
			else echo '';
		}
	}
	
	
	
	public function like()
	{
		$mdl = $this->get_post('mdl');
		$this->model($mdl);
		$error = '';
		$term = $this->post('term','string','');		
		if ($this->session->isLogged() && !empty($term))
		{
			echo $this->$mdl->getLike($term);
		}
		else echo '{"success":false,"message":"non connecté!"}';
	}
	
	
	/**
	 * Creates an error / not found for people
	 * 
	 * Calls $this->all()
	 * 
	 * @return writes the HTML page
	 */
	public function error()
	{
		die('error people');
	}
	
	
	
	/**
	 * This function generates an initial dashboard (display activities of my following,groups...) , it is based on appController::processContent()
	 * 
	 * @return string a dashboard formatted in HTML
	 * 
	 * @access private
	 * 
	 * @see appController:processContent()
	 * 
	 */
	private function getDashboard()
	{
		return $this->processContent(	array(	'wall'		=>1,
												'layout'	=>'dash',
												'sorting'	=>'Oldup' ) );		
	
	}
	
	public function notFound(){
		redirect('/notfound');
	}
}
?>
