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
Class ContentController Extends ErrorController 
{
	protected $mdl = 'contents';
	protected $type = 'ACT';
	protected $filter_type = '.1.';
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
	
	
	protected function loadFilters(&$filters,&$params)
	{
		
		$this->template->set('journal','BASE');
		$this->template->set('typeJournal','ALL');
		
		if ($this->mdl=='contents') // gere les types de flux wall, offre, avis et activités..
		{
			if ($this->get_post('type') && $this->get_post('journal')) {
				$type = $this->get_post('type');
				if (!isme() && $this->get_post('type')=='BASE') $type = $_GET['type'] = $_POST['type'] = 'WALL';
				$this->session->set('type',$type);
				$this->template->set('typeJournal',$type);
				$this->session->set('journal',$this->get_post('journal'));
				$this->template->set('journal',$this->get_post('journal'));
			}
			else if ($this->session->get('journal')){
				if (!isme() && $this->session->get('journal')) $this->session->set('journal','WALL');
				$_GET['journal'] = $_POST['journal']  = $this->session->get('journal');
				$_GET['type'] = $_POST['type'] =$this->session->get('type');
				
				$this->template->set('journal',$this->session->get('journal'));
				$this->template->set('typeJournal',$this->session->get('type'));
			}
		}
		
		parent::loadFilters($filters,$params);
	}
	
	/**
	 *
	 */
	public function timeline($ajax = false)
	{
		$mdl = $this->mdl;	
		$this->model($mdl);
		if ($this->session->isLogged())
		{
			$me = $this->session->get('user');
			$this->template->set('postAct',$me->profil=='P'?'SV':'JB');
			
			$this->template->set('countColla',$me->count_collaborator);
		}
		$filters = array();
		$this->loadFilters($filters,$params);
		$results	= 	$this->$mdl->processSearch($filters,$params);	
		$nbread = count($results[1]);
		if ($ajax) {
			$view = $this->template->render( trim($mdl,'s').'/inner/displayDash',
											array('activities'=>$results[1]),
											array('title'=>'Journal des actualités', 'desc'=>''));
			
			if (!$view) $view = "<h3 class='none' style=''>None</h3>";
			
			return array ('view' => $view,'meta' => array('nbread'=>$nbread,'nbtot'=>$results[0]));
		}
		else 
			$this->template->page( trim($mdl,'s').'/all',array('activities'=>$results[1],'nbread'=>$nbread,'nbtot'=>$results[0]),array('title'=>'flux d\'offre de', 'desc'=>''));
	}
	
	
	
	/**
	 * Requests the activity's details to show for AJAX calls
	 * 
	 * Gets params from post
	 * 
	 * @return echoes a JSON response to the browser
	 * 
	 */
	public function ajax() 
	{
		$mdl = $this->mdl;	
		$this->model($mdl);
		$id = $this->get_post('id');
		switch ($this->get_post('act'))
		{ 
			case 'view' :
				$result	= 	$this->$mdl->getById($id);	
				if($result) {
					// and finish
					$this->template->set('act', $result);
			
					$view = $this->template->render('content/ajax');
					// then, echo a JSON response
					echo jsonRet(_('DONE'), true,null,null, $view, 1);
				}
				else echo jsonRet('not exist', false);
				break;
			case 'critiques' :
				$result	= 	$this->$mdl->getCritiquesTo($id);	
				if($result) {
					// and finish
					$this->template->set('activities', $result);
					$this->template->show('content/inner/displayAllCritiques');
				}
				else echo jsonRet('not exist', false);
				break;
			case 'timeline' :
				$data = $this->timeline(true);
				echo jsonRet(_('DONE'), true,null,$data['meta'], $data['view'], 1);
				break;
			default:
				echo jsonRet('no action', false);
		}	
	}
		
	/**
	 * Process a content request
	 * 	This is an alias for parent::processContent, created with the sole purpose of code visibility
	 * 
	 * @param mixed $params
	 * @param string $layout
	 * 
	 * @return mixed array with rendered HTML inside
	 * 
	 * @see appController::processContent();
	 */
	protected function processContent($params)
	{
		return parent::processContent($params);
	}
	
	/**
	 * 
	 */
	public function jobFlux() 
	{
		$this->session->set('flux','JB');		
		$this->timeline();
	}
	
	/**
	 * 
	 */
	public function serviceFlux() 
	{	
		$this->session->set('flux','SV');	
		$this->timeline();
	}
	
	
	/**
	 * 
	 */
	public function home() 
	{	
		
		$this->session->set('flux',null);
		$this->session->set('who',$this->session->get('user'));
		$this->session->set('fstatic',null);	
		$this->timeline();
		
	}
	
	/**
	 * 
	 */
	public function ad() 
	{		
		$this->item($this->input->get('id'));
	}
	
	public function services()
	{
		if($this->session->isLogged())
		{
			$init = array();
			list($deep,$code) = explode('/',$this->input->get('params'));
			$profil = $this->input->get('profil');
	    	$deep++;
	    	$me = $this->session->get('user');
			$this->model('service');
	    	
	        $json = '[{ "deep":'.$deep.', "caption":"","value": "null"},';
	        
	    	if ($deep == 1) {
	    		$services = $this->service->getAll();
		    	foreach ($services as $serv) {
		    		$checked = isset($me->idservice[$serv->id.'_'.$profil]);
					$json .= '{ "caption":"'._($serv->title).'","value": "'.$serv->id.'","selected": "'.$checked.'"},';
				}
	    	}
	    	
	        if ($deep == 2) {
	    		$services = $this->service->getAll($code);
	    		foreach ($services as $serv) {
		    		$checked = isset($me->idservice[$serv->id.'_'.$profil]);
					$json .= '{ "caption":"'._($serv->title). '","value": "'.$serv->id.'","selected": "'.$checked.'"},';
				}
	    	}
	    	$json = trim($json,',').']';
			echo $json;
		}
	}	
	
	
	/**
	 * Internally manages the content page generation
	 * 
	 * @param string $id
	 * @param string $type
	 * 
	 * @access private
	 */
	private function item($id = '', $type = '')
	{
		// first check
		if (!is_numeric($id))
		{
			redirect('/');
		}
		
		// vars
		$content 		= '';
		$shrt 	 		= '';
		$viewDetails	= '';
		$error			= '';
		
		// load activity
		$this->model('contents');
		$act	= $this->contents->getById($id,true);
		if ($act==false)
		{
			redirect('/notfound');
		}
		$title	= $act->title;

		// the right type has been relected?
		if ( 1 || $act->type==$type )
		{
			// user is allowed to view?
			if ( 1 || $this->contents->isAllowed2View($act)) 
			{	
				// increment views, only if user is not owner
				if ($this->session->isLogged() && $act->user->id!=$this->session->getUserVar('id')) 
				{	
					//$this->contents->incrementViews($act->id); // views for the content
				}
				$this->template->page( $this->type=='ACT'?'content/view':'content/view', array('act'=>$act), array('title'=>$title, 'description'=>$act->desc) );
				
				// break execution here
				return true;
			}
			else 
			{
				$error="private";
			}
		}
		else 
		{
			$error="removed";
		}
	
		// end
		return true;
		
	}

	/**
	 * show media in wide sreen
	 * 
	 * @param takes the variables from POST
	 * 
	 * @access public
	 */
	public function showmedia()
	{
		$mdl = $this->mdl;	
		$this->model($mdl);
		$result	= 	$this->$mdl->getById($this->get_post('idact'));	
		print_r($result);
		if($result) {
			// and finish
			$this->template->set('act', $result);
			$this->template->set('selected', $this->get_post('idimg'));
	
			$this->template->show('image/watchmedia');
		}
		else echo jsonRet('not exist', false);
	}
	
	
	/**
	 * Shares a content
	 * 
	 * @param takes the variables from POST
	 * 
	 * @access public
	 */
	public function share()
	{
		// only for logged in users
		if (!$this->session->isLogged())
		{
			echo jsonRet(_('ERR_NOT_LOGED'),false);
			return;
		}
		$mdl = $this->mdl;
		// get params
		$data	= array(	
							'pid_vac'	    	=> $this->post('id', 'int', '', null),
							//'id_vac'	    	=> $this->post('id', 'string', '', null, 'isId'),
							'id_usr_vac'		=> $this->session->getUserVar('id') ,
							'date_vac'			=> date("Y-m-d H:i:s"),
							'privacy_vac'		=> $this->post('privacy','string','P',array('P','G','R')),  
							'media_vac'			=> $this->post('media','string') ,
							'thumbnail_vac'		=> implode(',',isset($_POST['thumb'])?$_POST['thumb']:array()),
						 	'title_vac'   		=> $this->post('title','string') ,
							'shortdesc_vac'		=> $this->post('desc','string') ,
							'desc_vac'	    	=> $this->post('desc','string'), 
							'type_vac'	    	=> $this->post('type','string'), 
							'flux_vac'	    	=> $this->post('flux','string',null,array('SV','JB','NE')),
							'related_vac'	    => $this->post('collaborator', 'string', '', null, 'isId'),
							'jumpcnt_vac'	 	=> $this->post('jumpcnt','int',0,array(1,0)) ,
							'paie_vac'	 		=> $this->post('paie','int'),
							'currency_vac'	 	=> $this->post('currency','string','EUR') 
						);
						
		$act = new CommonAdapter($data,array('_vac'));
		
		if ($act->type == 'WB')  $act->related = $act->title;
		
		if ( $act->title == _('Title of your content') ) $act->title = '';
		//if (empty($act->title)) {echo jsonRet('One of the fields is empty',false); return;}
		//die(utf8_decode($_POST['desc']));
		// Location
		if ($this->post('address','string')) {
			$address = (array) $this->post('address','string');
			$this->model('spots');
			$act->id_spt = key($this->spots->add($address));
		}
		else $act->id_spt = getAddressUser(me(),true)->id;

		// tags pour les scoops, les offres et les critiques
		$tags	= $this->post('tags','string');
		if ( $tags == _('LABEL_TAGS')) $tags = '';
		if(is_string($tags))
		{
			$this->model('tags');
			
			if ($act->type == 'AV') 
				$act->tags		= $this->tags->add(array('other'=>explode('!+!',$tags),'service'=>who()->idservice));
			else if ($act->type != 'QU')
				$act->tags		= $this->tags->add(array('other'=>explode('!+!',$tags)));
		}
		
		/* pour les questions */
		if (isset($_POST['service']))
		{
			$services = $_POST['service'];
			if (!empty($services))
			{
				$act->tags = $this->tags->add(array('service' => $services));
			}
		}

		$new = ($act->pid==0);
		
		// then, save the content
		$this->model($mdl);
		if ( !$this->$mdl->saveOne($act))
		{
			echo jsonRet(_('ERR_SAVE_ACT'),false);
			return;
		} 
		
		if ($new)
		{
			// Picture
			if (isset($_POST['thumb']))
			 foreach ($_POST['thumb'] as $thumb)
				if ( isId($thumb))
				{	
					if ( !( $this->movePicture($thumb, '') &&
							/*$this->movePicture($thumb, '24') &&
							$this->movePicture($thumb, '40') &&
							$this->movePicture($thumb, '75') && 
							$this->movePicture($thumb, '120') && */
							$this->movePicture($thumb, '246') && 
							$this->movePicture($thumb, '120') &&
							$this->movePicture($thumb, '306') ) )
					{
						echo jsonRet(_('ERR_MOV_PIC'),false);
						return;
					}
				}
			$act	= 	$this->$mdl->getById($act->pid);	
			
			// and finish
			$this->template->set('act', $act);
			$view = $mdl=='contents'?'content':'question';
			$results = $this->template->render($view.'/inner/types/displayIsotope_Content');
					
			
			// notify people mentioned
			$this->model('people');
			$mentionedPeople = $this->people->notifyMentionedPeople(me(),$act->shortdesc,'/journal/'.$act->pid);
					
			// then, echo a JSON response		
			//die($results);
			echo jsonRet(_('DONE'), true,null,array('act'=> $act->pid,'mentionedPeople'=>$mentionedPeople), $results, 1);
			
			
		}
		else {
			$actnew	= 	$this->$mdl->getById($act->pid);	
			
			// and finish
			$this->template->set('act', $actnew);
			$view = $mdl=='contents'?'content':'question';
			$results = $this->template->render($view.'/inner/types/displayIsotope_Content');
			
			echo jsonRet(_('DONE'), true,null, array('pidold'=> $act->pidold),$results, 1, $actnew->pid);
		}
		
		
		
	}
	
	/**
	 * Moves a user picture from cache to user folder
	 * 
	 * @param string $size
	 * @param string $pid the picture ID
	 * 
	 * @return boolean
	 * 
	 * @access private
	 */
	private function movePicture( $pid = '', $size = '')
	{
		$root 	= $this->input->server('DOCUMENT_ROOT');
		$uid	= $this->session->getUserVar('id');
		
		if(!is_dir($root . '/u/' . $uid))
		{
			mkdir($root . '/u/' . $uid, 0755);
		}
		return rename(	$root . '/cache/' . $pid . $size . '.png', $root . '/u/' . $uid . '/' . $pid . $size . '.png' );
	}
	
	private function pathPic( $pid = '', $size = '')
	{
		$root 	= $this->input->server('DOCUMENT_ROOT');
		$uid	= $this->session->getUserVar('id');
		
		return $root . '/u/' . $uid . '/' . $pid . $size . '.png' ;
	}
	
	/**
	 * Adds a like from a user for a content
	 * 	AJAX response
	 * 
	 * @access public
	 */
	public function like()
	{
		if(isSession())
		{
			//Default error
			$res=jsonRet('102',false);
			
			$idactlike 	= $this->post('idactlike','string','','','isId');
			$typeAct 	= $this->post('idactlike','string','','','isId');
			$typelike	= $this->post('typelike','string','N',array('L','N')); 
			$suffixe	= $this->post('sort','string','ACT',array('ACT','CMT','USR')); 
			
			$meta = array();
			switch ($suffixe) {
				case 'ACT':
					if ($typelike == 'L') {
						$meta['title'] = _('DISLIKE');
						$meta['text'] = _('DISLIKE');
						$meta['alias'] = '▬';
					}
					else {
						$meta['title'] = _('LIKE');
						$meta['text'] = _('LIKE');
						$meta['alias'] = '✚';
					}
					break;
				case 'USR':
					if ($typelike == 'L') {
						$meta['title'] = _('I_NOT_RECOMMAND');
						$meta['text'] = _('I_NOT_RECOMMAND');
						$meta['alias'] = '▬';
					}
					else {
						$meta['title'] = _('I_RECOMMAND');
						$meta['text'] = _('I_RECOMMAND');
						$meta['alias'] = '✚';
					}
					break;
				default:
					if ($typelike == 'L') {
						$meta['title'] = '';
						$meta['text'] = '';
						$meta['alias'] = '▬';
					}
					else {
						$meta['title'] = '';
						$meta['text'] = '';
						$meta['alias'] = '✚';
					}	
					break;
			}
			//if session and params are valid
			if($idactlike && $typelike)
			{
				//create like
				$this->model('like');
				$lik = new LikeAdapter();
				$lik->id=$idactlike;
				$lik->id_usr=$this->session->getUserVar('id');
				$lik->date=date("Y-m-d H:i:s");
		    	$lik->type=$typelike;
		    	$lik->suff=$suffixe;
				
				$this->model('like');
				if($typelike=="N")
				{
					//del it in DB
					if($this->like->delLike($lik))
					{
						//"return" valide result
						$res=jsonRet(false,true,'delete',$meta);
					}
					else
					{
						//"return" error while deleting
						$res=jsonRet('104',false,'delete');
					}	
				}
				elseif($typelike=="L" )
				{
					//save it in DB
					if($this->like->saveLike($lik))
					{
						if(in_array($lik->suff,array('ACT','USR')))
						{
							$tabact = array( 
	   								'id_vac' 			=> null, 
	   								'id_usr_vac' 		=> $lik->id_usr,
	   								'date_vac'			=> date("Y-m-d H:i:s"),
	   								'id_spt_vac'		=> null,
	   								'type_vac'			=> $lik->suff=='ACT'?'LA':'LU',
	   								'related_vac'		=> $lik->id
	   								); 
	   					   				
		   					$this->model('activities');
		   					$ret	=	$this->activities->saveOne($tabact);
						}
					
						//"return" valide result
						$res=jsonRet(false,true,'save',$meta);
					}
					else
					{
						//"return" error while saving
						$res=jsonRet('104',false,'save');
					}
				}
			}
			else
			{
				//"return" error of parameters
				$res=jsonRet('101',false);
			}
				
			//Display/Send to Ajax the result
			echo $res;
		}
		else
		{
			echo jsonRet('100',false);
		}
	}
	
	/**
	 * Reads an external image into our system using WideImage
	 * 	AJAX response
	 * 
	 * @access public
	 */
	static function _awesomize($url,$uid)
	{
		include_once __SYSTEM_PATH . '/vendor/wideimage/WideImage.php';
		$image = WideImage::load($url);
		$idphotos = md5($url);
		
		if($image->getHeight()<150 || $image->getWidth()<150)
		{
			$base = WideImage::load($_SERVER['DOCUMENT_ROOT']."/med/img/base.jpg");
			$image=$base->merge($image->resize(150, 150,'inside','down'),'center','center',100);
		}
		else
		{
			$image = $image->resize(150, 150,'outside','down');
		}
		
		$image = $image->crop('center','center',150,150);
		
		$image7=$image6=$image5=$image4=$image3=$image2=$image1=$image;
		
		$root 	= $this->input->server('DOCUMENT_ROOT');
		
		$image->saveToFile($root . '/u/' . $uid . '/' . $idphotos . '150.png',100);
		$image2->resize(120, 120)->saveToFile($root . '/u/' . $uid . '/' . $idphotos . '120.png',100);
		$image3->resize(100, 100)->saveToFile($root . '/u/' . $uid . '/' . $idphotos . '100.png',100);
		$image4->resize(75, 75)->saveToFile($root . '/u/' . $uid . '/' . $idphotos . '75.png',100);
		$image5->resize(50,50)->saveToFile($root . '/u/' . $uid . '/' . $idphotos . '50.png',100);
		$image6->resize(40,40)->saveToFile($root . '/u/' . $uid . '/' . $idphotos . '40.png',100);
		$image7->resize(24,24)->saveToFile($root . '/u/' . $uid . '/' . $idphotos . '24.png',100);
		
		return true;
	}
	
	/**
	 * Store image from the cache to the member space of the user
	 * 	AJAX response
	 * 
	 * @access public
	 */
	public function awesomize()
	{
		include_once __SYSTEM_PATH . '/vendor/wideimage/WideImage.php';
		if(isset($_GET['url']) && isset($_GET['type']))
		{
			try
			{
				$path=$_SERVER['DOCUMENT_ROOT']."/cache/".md5($_GET['url']);
				if(file_exists($path."_200.png") && file_exists($path."_480.png") && file_exists($path."_120.png")) 
				{
					if($_GET['type']=="a") 
					{
						$img = WideImage::load($path."_200.png");
						$img->output('jpg');
					}
					elseif($_GET['type']=="d") 
					{
						$img = WideImage::load($path."_480.png");
						$img->output('jpg');
					}
					elseif($_GET['type']=="t")
					{
						$img = WideImage::load($path."_120.png");
						$img->output('jpg');
					}
				}
				else
				{
					$img = WideImage::load($_GET['url']);
					$img1=$img->resize(150, 150, 'outside', 'down');
					$img1->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".md5($_GET['url'])."_200.png");
					$img2=$img->resize(480, 1000, 'inside', 'down');
					$img2->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".md5($_GET['url'])."_480.png");
					$img3=$img->resize(120, 120,'outside');
					$img3=$img3->crop('center', 'center', 120, 90);
					$img3->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".md5($_GET['url'])."_120.png");
						
					if($_GET['type']=="a") $img1->output('jpg', 90);
					elseif($_GET['type']=="d") $img2->output('jpg', 90);
					elseif($_GET['type']=="t") $img3->output('jpg', 90);
				}			
			}
			catch (Exception $e){}
		}
	}
	
	/**
	 * Deletes a content
	 * 	AJAX response
	 * 
	 * @access public
	 */
	public function rem()
	{
		if (!$this->session->isLogged())
		{
			echo json_encode(array('message'=>_('ERR_NOT_LOGED'),'success'=>false));
			return false;
		}
		
		$id = $this->input->get_post('idact','string','','','isId');
		if (!$id)
		{
			echo json_encode(array('message'=>_('ERR_FIELD'),'success'=>false));
			return false;
		}
		
		$this->model('activities');
		
		if( $this->activities->deleteOne( $id ) )
		{
			echo json_encode(array('message'=>'ad deleted','success'=>true));
			return true;
			//redirect('/');
		}
		echo json_encode(array('message'=>_('MESS_HELP_TEAM'),'success'=>false));
	}
	
	/**
	 * Creates a gateway to connect with Facebook and share the content
	 * 
	 * @param ActivityAdapter $act
	 * 
	 * @access private
	 */
	private function shareOnFacebook($act)
	{
		$facebook	= $this->input->post('facebook','boolean','false');
		// share on Facebook management
		if ( $facebook=='true' && $this->session->getUserVar('fb_connect') == 'Y' && $this->session->getUserVar('fb_oauth_token') )
		{	
			//we prepare the post
			$params = 'access_token=' . $_SESSION['user']->fb_oauth_token . '&caption=yoomken.li | Flux d\'offres?';
			switch ($act->type)
			{
				case 'VI':
					
					if($act->note)
					{
						$params .= '&message=' . stripslashes($act->note);
					}
					
					$params .= '&link=' . $_SERVER['HTTP_HOST'] . '/video/' . $act->id;
					$params .= '&picture=' . $act->thumbnail;
					
					break;
					
				case 'PI':
					
					if($act->note)
					{
						$params .= '&message=' . stripslashes($act->note);
					}
					else
					{
						$params .= '&message=I\'ve shared a picture on yoomken, check it out!';
					}
					
					$params .= '&link=' . $_SERVER['HTTP_HOST'] . '/picture/' . $act->id;
					
					$srcImg 	= getPictureThumb($_SESSION['user']->id,$act->thumbnail,120,'/med/img/default.png');
					if(stripos($srcImg,'http://') !== 0 )
					{
						$params .= '&picture=' . $_SERVER['HTTP_HOST'] . $srcImg;
					}
					else
					{
						$params .= '&picture=' . $srcImg;
					}
					
					break;
					
				case 'LI':
					
					if($act->note)
					{
						$params .= '&message=' . stripslashes($act->note);
					}
					else
					{
						$params .= '&message=I\'ve shared a link via yoomken, check it out!';
					}
					
					$params .= '&link=' . $act->media;
					$params .= '&picture=' . $act->thumbnail;
					break;
					
				case 'NT':
					$params.="&message=".stripslashes($act->note);
					
					break;
					
				case 'SR':
					
					$params    .= '&message=' . stripslashes($act->note);
					
					$actModel 	= newActivitiesModel();
					$spread		= $actModel->getById($act->related);
					switch ($spread->type)
					{
						case 'VI':
							$params .= '&link=' . $_SERVER['HTTP_HOST'] . '/video/' . $spread->id;
							$params .= '&picture=' . $spread->thumbnail;
							break;
						
						case 'PI':
							$params .= '&link=' . $_SERVER['HTTP_HOST'] . '/picture/' . $spread->id;
							$srcImg 	= getPictureThumb($spread->id_usr,$spread->thumbnail,120,'/med/img/default.png');
							if(stripos($srcImg,'http://') !== 0 )
							{
								$params .= '&picture=' . $_SERVER['HTTP_HOST'] . $srcImg;
							}
							else
							{
								$params .= '&picture=' . $srcImg;
							}
							break;
							
						case 'LI':
							$params .= '&link=' . $spread->media;
							$params .= '&picture=' . $spread->thumbnail;
							break;
						default:		
					}
					break;
					
				default:
					$params = null;		
			}
		
			//we send the post on facebook
			if($params!=null)
			{
				$ch = curl_init();
				curl_setopt ($ch, CURLOPT_URL, 'https://graph.facebook.com/me/feed/');
				curl_setopt ($ch, CURLOPT_POST, 1);
				curl_setopt ($ch, CURLOPT_POSTFIELDS,$params);
				curl_setopt ($ch, CURLOPT_FOLLOWLOCATION, 1);
				curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
				
				curl_exec ($ch);
				curl_close ($ch);
			}
		}
	
	}
	
	/**
	 * Creates a gateway to connect with Twitter and share the content
	 * 
	 * @param ActivityAdapter $_activity
	 * 
	 * @access private
	 */
	private function shareOnTwitter($_activity)
	{
		$twitter	= $this->input->post('twitter','boolean','false');
		// share on Twitter management
		if ( $twitter=='true' && $this->session->getUserVar('tw_connect') == 'Y' && $this->session->getUserVar('tw_oauth_token') && $this->session->getUserVar('tw_oauth_token_secret') )
		{
			include_once __SYSTEM_PATH . '/vendor/twitter/twitteroauth.php';
			include_once __APP_PATH . '/config/twitter.ini.php';
	
			$note	= stripslashes($_activity->note);
			$title	= stripslashes($_activity->title);
			
			if( $note )
			{
				$tweet = shortenString($note,100,true)." > ";
			}
			else if ( $title )
			{
				$tweet = shortenString($title,100,true)." > ";
			}
			else
			{
				$tweet = false;
			}
			
			/* we prepare the tweet */
			switch ($_activity->type)
			{
				case 'VI':
					if(!$tweet)
					{
						$tweet 	= 'I\'ve shared a video on #yoomken, check it out: ';
					} 
					$urltoshort = $this->input->server('HTTP_HOST') . '/video/' . $_activity->id;
					break;
					
				case 'PI':
					if(!$tweet)
					{
						$tweet 	= 'I\'ve shared a picture on #yoomken, check it out: ';
					}
					$urltoshort = $this->input->server('HTTP_HOST') . '/picture/' . $_activity->id;
					break;
					
				case 'LI':
					if(!$tweet)
					{
						$tweet	= 'I\'ve shared a link on #yoomken, check it out: ';
					}
					$urltoshort	= $this->input->server('HTTP_HOST') . '/link/' . $_activity->id;
					break;
					
				case 'EV':
					if(!$tweet)
					{
						$tweet	= 'I\'ve shared an event on #yoomken, check it out: ';
					}
					$urltoshort	= $this->input->server('HTTP_HOST') . '/event/' . $_activity->id;
					break;
					
				case 'NT':
					if(strlen($title)<100) 
					{
						$tweet	= $note;
					}
					else
					{
						$urltoshort = $this->input->server('HTTP_HOST') . '/note/' . $_activity->id;
					}
					break;
					
				case 'SR':
					$note	= $_activity->note;
					$srcid	= $_activity->related;
					
					$type	= $_activity->type;
					if($note)
					{
						$tweet	= shortenString( $_activity->note, 100, true )." > ";
					}
					else
					{
						$tweet = 'Check this out! ';
					}
					
					$actModel 	= newActivitiesModel();
					$spread		= $actModel->getById($_activity->related);
					switch ($spread->type)
					{
						case 'VI':
							$urltoshort = $this->input->server('HTTP_HOST') . '/video/' . $srcid;
							break;
							
						case 'PI':
							$urltoshort = $this->input->server('HTTP_HOST') . '/picture/' . $srcid;
							break;
							
						case 'LI':
							$urltoshort = $this->input->server('HTTP_HOST') . '/link/' . $srcid;
							break;
							
						case 'EV':
							$urltoshort = $this->input->server('HTTP_HOST') . '/event/' . $srcid;
							break;
					}
					
					break;
					
				default:
					$tweet = false;
			}
			
			/*we get the short_url*/
			if(!empty($urltoshort))
			{
				$stamp=time();
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, 'http://eego.es/api.php');
				curl_setopt($ch, CURLOPT_HEADER, 0);				
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
				curl_setopt($ch, CURLOPT_POST, 1); 
				curl_setopt($ch, CURLOPT_POSTFIELDS, array(
						'action'   => 'shorturl',
						'url'      => $urltoshort,
						'format'   => 'json',						
						'token2' => md5('70309df5cd'.$stamp),
						'token1' => $stamp
				));
				$data = curl_exec($ch);
				curl_close($ch);
				$data=json_decode(stripcslashes($data),true);
				if(empty($data['shorturl']))
				{
					$tweet="";
				}
				else
				{
					if(strlen($_activity->note)<141 && $_activity->type=='NT') 
					{
						$tweet=$_activity->note;
					}
					else 
					{
						$tweet=$tweet.$data['shorturl'];
					}
				}
			}		
			
			/* we send the tweet */
			if($tweet!=="")
			{
				$connection = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET, $this->session->getUserVar('tw_oauth_token'), $this->session->getUserVar('tw_oauth_token_secret') );
				$parameters = array('status' => $tweet);
				$res = $connection->post('statuses/update', $parameters);
			}
		}
	}
	
	public function progressUpload()
	{
		$key = ini_get("session.upload_progress.prefix").'123';
		echo $key;
		var_dump($_SESSION[$key]);
	}
	
	/**
	 * Uploads a file to the server
	 * 	AJAX response
	 * 
	 * @access public
	 */
	public function upload()
	{
		if($this->session->isLogged())
		{
			include_once __SYSTEM_PATH . '/vendor/wideimage/WideImage.php';
			include_once __SYSTEM_PATH . '/vendor/uploader/qqFileUploader.class.php';
			include_once __SYSTEM_PATH . '/vendor/uploader/qqUploadedFileForm.class.php';
			include_once __SYSTEM_PATH . '/vendor/uploader/qqUploadedFileXhr.class.php';
			
			// HTTP headers for no cache etc
			header('Content-type: text/html; charset=UTF-8');
			header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
			header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
			header("Cache-Control: no-store, no-cache, must-revalidate");
			header("Cache-Control: post-check=0, pre-check=0", false);
			header("Pragma: no-cache");
		
			// list of valid extensions, ex. array("jpeg", "xml", "bmp")
			$allowedExtensions = array("jpeg", "jpg", "png", "gif");
			// max file size in bytes
			$sizeLimit = 4 * 1024 * 1024;
			
			//$idphotos=md5(time().$this->session->getUserVar('id')."pic");
			$idphotos=md5(uniqid());
			
			$uploader = new qqFileUploader($allowedExtensions, $sizeLimit);
			
			$result = $uploader->handleUpload($_SERVER['DOCUMENT_ROOT']."/cache/",$idphotos);
			
			if(isset($result['error']))
			{
				echo htmlspecialchars(jsonRet('111',false,$result['error']), ENT_NOQUOTES);
			}
			elseif(isset($result['success']) && $result['success']==true && isset($result['file']) && $result['file']!=="")
			{
				$image = $image0 = WideImage::load($result['file']);
				$image0->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos.".png",100);
				//rename(	$result['file'], $_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos.".png" );
				
				if($_REQUEST['type']=="profile")
				{
					if (ONLINE && 0)
					{
						$api = new Gravatar();
						$pathinfo = pathinfo($_GET['qqfile']);
		        		$ext = $pathinfo['extension'];
						$res = $api->saveData($_SERVER['DOCUMENT_ROOT']."/cache/" . $idphotos . '.' . $ext);
						$api->useUserimage($res,$this->session->getUserVar('email'));
					}
					
					if($image->getHeight()<150 || $image->getWidth()<150)
					{
						$base = WideImage::load($_SERVER['DOCUMENT_ROOT'].'/media/img/nopic120.png');
						$image=$base->merge($image->resize(150, 150,'inside','down'),'center','center',100);
					}
					else
					{
						$image = $image->resize(150, 150,'outside','down');
					}
					
					$image = $image->crop('center','center',150,150);
					
					$image7=$image6=$image5=$image4=$image3=$image2=$image1=$image;
					
					
					$image->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."150.png",100);
					$image2->resize(120, 120)->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."120.png",100);
					$image3->resize(100, 100)->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."100.png",100);
					$image4->resize(80,80)->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."75.png",100);
					$image5->resize(50,50)->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."50.png",100);
					$image6->resize(40,40)->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."40.png",100);
					$image7->resize(24,24)->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."24.png",100);
				}
				elseif($_REQUEST['type']=="share")
				{
					/*if($image->getHeight()<150 || $image->getWidth()<150)
					{
						$base = WideImage::load($_SERVER['DOCUMENT_ROOT'].'/media/img/nopic120.png');
						$image=$base->merge($image->resize(150, 150,'inside','down'),'center','center',100);
					}*/
					
					
					//if($image->getHeight()<229) $image = $image->resize(229*$image->getWidth()/$image->getHeight(),229,'fill','any'); // 306*$image->getHeight()/$image->getWidth()
					$image = $image->resize(306,(int)(306*$image->getHeight()/$image->getWidth()),'fill','any');
					if ($image->getHeight()>510) $image = $image->crop('center', 'center', 306, 229);
					$image2 = $image->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."306.png",100);
					
					$image3 = $image->crop('center', 'center', 246, 246)->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."246.png",100);
					/*$image3 = $image->resize(150, 150,'inside','down')->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."150.png",100);*/
					$image4 = $image->resize(120, 120,'outside','down');
					$image4 = $image4->crop('center', 'center', 120, 90);
					$image4->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."120.png",100);
					/*$image5 = $image5->resize(75, 75)->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."75.png",100);
					$image6 = $image6->resize(40, 40)->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."40.png",100);
					$image7 = $image7->resize(24, 24)->saveToFile($_SERVER['DOCUMENT_ROOT']."/cache/".$idphotos."24.png",100);*/
				}
				else
				{	
					echo htmlspecialchars(jsonRet('101',false), ENT_NOQUOTES);
					unlink ($result['file']);
					exit;
				}
				
				
				//unlink ($result['file']);
				echo htmlspecialchars(jsonRet(false,true,false,false,false,false,$idphotos), ENT_NOQUOTES);
			}
		}
		else
		{
			echo htmlspecialchars(jsonRet('100',false), ENT_NOQUOTES);
		}
	}
	
	
	public function notFound(){
		redirect('/notfound');
	}
	
}
?>