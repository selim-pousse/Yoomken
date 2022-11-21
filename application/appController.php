<?php
/**
 * Manifest
 * 
 * application/appController.php
 * 
 * This file defines the application's parent class controlller
 * 
 * @copyright: Yoomken Li
 * 
 */
Abstract Class appController Extends baseController 
{
	/**
	 * Keeps a reference of an Input object which allows variables POST and GET filtering
	 * 
	 * @access protected
	 */
	protected $input = null;
	
	/**
	 * Main constructor, initializes the session attribute
	 * 
	 * @return void
	 * 
	 * @access public
	 */
	public function __construct()
	{
		parent::__construct();

		
		// auto load most used helpers
		// TODO: load these helpers only when needed
		$this->helper('format');
		$this->helper('json');
		$this->helper('input');
		$this->helper('legacy');
		
		// load input class
		$this->input = Input::getInstance();
	}
	
	public function _init(&$router)
	{	
		date_default_timezone_set("Europe/Paris");
		
		if (MAINTENANCE && $this->template->action !='maintenance' && $_SERVER["REMOTE_ADDR"]!='217.162.205.43') redirect('/maintenance');
		
		$me = $this->session->get('user');
		
		//Update language
		$switch = $this->get_post('swtlang');
		if ($this->session->isLogged()){
			if ($switch) {
				$lang = SelectLang($this->get_post('swtlang'));
				db::write('UPDATE user SET lang_usr="'.$lang.'" WHERE id_usr="'.$me->id.'"');
			}
			else {
				$res = db::read('SELECT lang_usr FROM `user` WHERE id_usr="'.$me->id.'"');
				$lang=SelectLang($res[0]['lang_usr']);
				// save in DB if first connexion
				db::write('UPDATE user SET lang_usr="'.$lang.'" WHERE id_usr="'.$me->id.'"');
			}
			$this->session->setUserVar('lang',$lang);
			
			// initialise les filtres du nouvel utilisateur si ce n'ai déjà fait
			$this->model('filter');
			$this->filter->initStaticSmart();
		}
		else{//is not logged
			if ($switch) {
				$lang=SelectLang($this->get_post('swtlang'));
			}
			else {
				$lang=SelectLang($this->session->get('lang'));
			}
		}
		$this->session->set('lang',$lang);
		
		if ($this->session->isLogged())
		{
			$me = $this->session->get('user');
			$who = $this->session->who();
			if (($who && $who->id == $me->id) || !$who) $this->session->set('who', $me);
			if ($who) {
				// update my statics relation network
				$update = array($who);
				$this->model('people');
				$this->people->getPeopleCount($update);
			}
			//_debug($me);die();
		}
			
		//Update profil
		$switch = $this->get_post('swtprofil');
		if ($switch && $me) {
			
			$me->profil = $this->get_post('swtprofil');
			db::write('UPDATE user SET profil_usr="'.$me->profil.'" WHERE id_usr="'.$me->id.'"');
			$this->model('user');
			$this->session->set('user',$this->user->getByID($me->id));
			//_debug($me);
		}
		$this->model('user');
		//redirect to the timeline if URL is a username
		$url = trim($_SERVER['REQUEST_URI'],'/');
		if ($url)
		{
			$url = explode('/', $url);
			$usr = $this->user->getByUrl($url[0]);
			
			if (isId($usr->id)) {
				$this->session->set('who',$usr);
				$this->template->set('who',$usr);
				if (count($url)==1) $this->template->action = $router->action = 'timeline';
			}
			elseif($me && $me->old_url == $url[0]){
				unset($me->old_url); 
				$this->session->set('who',$me);
				$this->template->set('who',$me);
				if (count($url)==1) $this->template->action = $router->action = 'timeline';
			}
		}
		if ($this->session->isLogged()) // update the session who if is empty
		{
			if ( $this->session->who()==null) 
				$this->session->set('who',$this->session->get('user'));
		}
		else if ($router->controllerName == 'content' & $router->action == 'timeline' || $router->controllerName == 'people' & $router->action == 'index') redirect('/');
		
		//_debug(who());die();
		
		//$whounread
	}
	
	/**
	 * Filters post input to recover the selected index
	 * 
	 * @param mixed $index
	 * @param string optional $format to force casting
	 * 
	 * @return mixed the filtered post paramenter
	 */
	protected function post($index = '', $format = 'string', $default = null, $allowed = null, $postFilter = null)
	{
		// vars
		$return = null;
		
		// filter default values
		// check the good format
		switch ($format)
		{
			case 'int':
				$default = intval($default);
				break;
			case 'float':
				$default = floatval($default);
				break;
			case 'boolean':
				$default = ($default === 'false' || !$default ? false : true);
			case 'string':
			default:
				$default = strval($default);
		}
		
		// halt if the post message does not exist
		if ( ! $this->input->post($index) )
		{
			// break execution!
			return $default;
		}
	
		$return = $this->input->escape($this->input->post($index));
		
		// check the good format
		switch ($format)
		{
			case 'int':
				$return = intval($return);
				break;
			case 'float':
				$return = floatval($return);
				break;
			case 'boolean':
				$return = ( $return === 'false' || !$return ? false : true);
				break;
			case 'string':
			default:
				$return = strval($return);
		}
		
		// check for allowed values
		if (is_array($allowed) && sizeof($allowed))
		{
			if (! in_array($return,$allowed))
			{
				// break execution!!
				return $default;
			}
		}
		
		if (is_array($postFilter) && sizeof($postFilter) )
		{
			foreach ($postFilter as $filter)
			{
				if (! $filter($return) )
				{
					// break execution
					return $default;
				}
			}
		}
		
		return $return;
	}
	
	
	
	protected function get_post($index = '', $format = 'string', $default = null, $allowed = null, $postFilter = null)
	{
		// vars
		$return = null;
		
		// filter default values
		// check the good format
		switch ($format)
		{
			case 'int':
				$default = intval($default);
				break;
			case 'float':
				$default = floatval($default);
				break;
			case 'boolean':
				$default = ($default === 'false' || !$default ? false : true);
			case 'string':
			default:
				$default = strval($default);
		}
		
		// halt if the post message does not exist
		$input = $this->input->get($index);
		$input2 = $this->input->post($index);
		if ( !$input  ) 
		{
			if (!$input2)
			// break execution!
				return $default;
			else $input = $input2;
		}
	
		$return = $this->input->escape($input);
		
		// check the good format
		switch ($format)
		{
			case 'int':
				$return = intval($return);
				break;
			case 'float':
				$return = floatval($return);
				break;
			case 'boolean':
				$return = ( $return === 'false' || !$return ? false : true);
				break;
			case 'string':
			default:
				$return = strval($return);
		}
		
		// check for allowed values
		if (is_array($allowed) && sizeof($allowed))
		{
			if (! in_array($return,$allowed))
			{
				// break execution!!
				return $default;
			}
		}
		
		if (is_array($postFilter) && sizeof($postFilter) )
		{
			foreach ($postFilter as $filter)
			{
				if (! $filter($return) )
				{
					// break execution
					return $default;
				}
			}
		}
		
		return $return;
	}
	
	protected function loadFilters(&$filters,&$params)
	{
		// initialize variables	
		if (!$this->session->isLogged()) return -1;
		$me = $this->session->me();
		$idme = $me? $me->id : md5('visitor'.time());
		$isowner = $this->session->who()->id == $idme;
		$filters = array();
		
		//!!!!!!!!!!!!!
		$this->template->set('typeFilter',$this->type);
		
		$mdl = $this->mdl;
		$cstatic = '';
		
		$params = $this->getCommonInput();
		
		$this->model($mdl);
		
		//_debug($params);	die();
		if ($params['journal']!='WALL')
		{
			$this->model('filter');
			
			
			/*switch ($this->input->get_post('init')) {
				case 1: $this->filter->setMultiActive(-1,$inverse= false,$tochecked = 1);break;
				case 2: $this->filter->setMultiActive(-1,$inverse= false,$tochecked = 0); break;
				default: break;
			}*/
				
			if ($this->input->get_post('checked')){
				$fchecked = $this->input->get_post('checked');
				if ($fchecked == 'AL') $this->filter->setMultiActive($all = 0,$inverse= false,$tochecked = 0);
				else $this->filter->setActive(isId($fchecked)?$fchecked:md5($fchecked.$idme));
			}
			
			$smarts = array();
			if ($this->session->isLogged())
			{
				if (empty($params['filter']))
				{
					$smarts = $this->filter->getActiveSmart($this->filter_type);
					//_debug($smarts);die();
					//$smarts = array_merge($smartse() di,$factivs);
				}
				else {
					// filtre actionné (!!attention different de activé - actionné c'est clicked sur l'etiquette et non sur la choche)
						$clicked = $this->filter->getByIdSmart($params['filter'],$this->filter_type);
						if ($clicked) $smarts[$clicked->id] = $clicked;
					//}
				}
			}
			$customFilters = $this->filter->getAllSmart($this->filter_type);
			$this->template->set('filters',$customFilters);
			Registry::getInstance()->set('filters',$customFilters);
			
			$nbfilters = count($smarts);
			if ($nbfilters == 1 && isset($smarts[md5('AL'.$idme)])) $nbfilters = 0;
			$this->template->set('nbfilters',$nbfilters);
			
			$filters = $this->$mdl->prepareFilter_smart($smarts,$params);
		}	
		//_debug($filters);
	
		//_debug($filters);
		$search 	= $this->input->get_post('term');
		if (!empty($search))
		{
			$filters 	= 	array_merge($this->$mdl->prepareFilter_Search($search,$params),$filters);
		}
		//$limit = $this->registry->get('nbresults');
	}
	
	
	public function searchby()
	{
		$mdl = $this->mdl;
		$filters = array();	
		$this->loadFilters($filters,$params/*,$mdl,$this->type*/);
		$results	= 	$this->$mdl->processSearch($filters,$params,$this->get_post('by'));
		$activities = &$results[1];
		$isAct = ($mdl == 'contents');
		$maxlen = 50;
		
		$arr=array();
		//print_r($activities);die();
		foreach($activities as $a){
			if ($isAct)
				$tumbnail = getPictureThumb($a->user->id, $a->thumbnail, 40, '',$a->user->id_img);
			else 
				$tumbnail = getUserPic($a->id,$a->id_img,40,$a->email);
			$title = $isAct? $a->shortdesc : $a->name;
			$title = strlen($title)>$maxlen? reductStr($title,$this->get_post('keyword'),$maxlen).'..':$title;
			//echo $title.' '.strlen($title).'<br/>';
			$url = ($isAct)? '/ads/'.$a->id:$a->url;
			$template = "<a href='$url' class='search-item'>
							<img src='$tumbnail' class='search-img'></img>
							<div class='search-text'>
								<span class='search-title'>{0}</span>
								<span class='search-title'>{1}</span>
								<span class='search-title'>{2}</span>
							</div>
							<div class='cleared'></div>
						</a>";
			$vars = array('/\{0\}/','/\{1\}/','/\{2\}/');
			$type = '';
			$ida = $a->id;
			$id= $value = $view = $search = '';
			//print_r($a);
			switch ($a->reason)
			{
				case 'c':
					$desc = '..'.reductStr($isAct? $a->shortdesc:$a->shortdesc,$this->get_post('keyword'),$maxlen).'..';
					$id = $this->get_post('keyword');
					$search = $isAct? $title.$desc : $a->job.$desc;
					$written = $isAct? '✑ '.$a->user->name :'';
					$job = $isAct? '' : $a->job;
					$view = preg_replace($vars,array($desc,$job,$written),$template);
					$value = $this->get_post('keyword');
					break;
				case 's':
					$type = 'service';
				case 't':
					$tag = $this->$mdl->which_tag($ida,$this->get_post('keyword'),$type);
					$id =  $tag->id;
					$value = $tag->title;
					$tags = '';
					if (isset($a->tags)) foreach ($a->tags as $t){
						$tags .= ' # '._($t);
					}
					$view  = preg_replace($vars,array($title,$tags,''),$template);
					$search = $tag->title.$tags;
					break;
				case 'l':
					if ($isAct){
						$spot = isset($a->spot->id) && $a->spot->id!='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'? $a->spot:$a->user->spot;
					}
					else $spot = $a->spot;
					$id = $spot->id;
					//$value = getLocation($spot,true);
					if (preg_match('/'.$this->get_post('keyword').'/i',$spot->country)) $value = $spot->country; 
					else $value = $spot->city;
					$view = preg_replace($vars,array($title,'❂ '.getLocation($spot),''),$template);
					$search = getLocation($spot);
					break;
				case 'p':
					$id = $isAct? $a->id_usr:$a->id;
					$value = $isAct? $a->user->name:$a->name;
					$tags = '';
					if (isset($a->service)) foreach ($a->service as $tag){
						$tags .= ' # '._($tag);
					}
					$pluscontent = (($a->job && isset($a->service))?$a->job.'<br>'.$tags:$a->job.$tags);
					$content = $isAct? '✑ '.$a->user->name :  $pluscontent;
					$search = $title.$content;
					$isonrel = false;
					if (!preg_match('/^'.$this->get_post('keyword').'/i',$value)) {
						if (!$isAct)	
							$value = ($a->privacy == 'P'? $a->url:$a->fullname);
						else 
							$value = ($a->user->privacy == 'P'? $a->user->url:$a->user->fullname);
						
						if ($isAct && $a->type=='AV' && !preg_match('/^'.$this->get_post('keyword').'/i',$value)){
							$isonrel = true;
							$id = $a->related->id;
							$value = $a->related->name;
							if (!preg_match('/^'.$this->get_post('keyword').'/i',$value))
								$value = ($a->related->privacy == 'P'? $a->related->url:$a->related->fullname);
						}
						$content = $isAct? '✑ '.($isonrel?$a->user->name.' ➫ ':'').$value :  $pluscontent;
						if (!$isAct) $title = $value;
						//$search = $title.$content;
					}
					$view = preg_replace($vars,array($title,$content,''),$template);
					$search = $value;
				break;
				default:
					continue;
			}
			$arr[]=array(
						$id,
						$value,
						$search,
						$view,
						$a->reason
						);
			//print_r($arr);die();
		}
		echo json_encode($arr);
	}
	
	protected function getCommonInput()
	{
		// the first for are common
		$me = $this->session->me();
		$params = array('beg'		=> $this->get_post('beg', 'int') ,
						'limit'		=> $this->get_post('lim', 'int', $me->option->nbresult? $me->option->nbresult:10) ,
						'sorting'	=> $this->post('sorting', 'string', 'newest', array('newest','oldest', 'aup', 'adown', 'actup', 'actdown', 'withPic')) ,
										
						// for searches
						'term'		=> $this->get_post('term', 'string'),
						'flux'		=> $this->get_post('flux', 'string', '', array('SV','JB')) ,
						'type'		=> $this->get_post('type', 'string', 'ALL', array('NW','AV','OF','QU','CR','AC','ALL','FF')) ,
						'journal'	=> $this->get_post('journal', 'string', 'BASE', array('BASE','OFFR','WALL')) ,
						'context'	=> $this->get_post('context', 'string', 'all') ,
						'domain'	=> $this->get_post('domain', 'string', 'all', array('people','groups', 'contents', 'all')),		

		
						// they may filter content or people
						'user'		=> $this->post('user', 'string', '', null, 'isId'),
						'filter'	=> $this->get_post('filter', 'string', '', null, 'isId'),
						'group'		=> $this->post('group', 'string', '', null, 'isId'),
						'activity'	=> $this->post('act', 'string', '', null, 'isId'),
		
						//'nearby'	=> $this->post('nearby', 'boolean', false),
						'withPic'	=> $this->post('withPic', 'boolean', false),
		);
		
		//die($_SERVER['QUERY_STRING']);
		//die($this->get_post('journal', 'string', 'BASE', array('BASE','OFFR','WALL')));
		
		Registry::getInstance()->set('nbresults',$params['limit']);
		return $params;
				
	}
	
	public function _end()
	{
		$secure = new Adapter();
		$secure->domain_url 	= $_SERVER['HTTP_HOST'];
		$secure->path_url 		= trim($_SERVER['REQUEST_URI'],' /');
		$this->session->set('secure',$secure);
	}
}
?>
