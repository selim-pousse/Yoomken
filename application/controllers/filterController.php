<?php
/**
 * Manifest
 * 
 * application/controllers/tagController
 * 
 * Manages the tags
 * 
 * @copyright: Yoomken Li
 * 
 */
Class FilterController Extends AppController 
{
	protected $regextype = array('USR'=>'1..','ACT'=>'.1.','ASK'=>'..1');
	protected $redirect_url = array('USR'=>'network','ACT'=>'timeline','ASK'=>'question');
	/**
	 * Main index, must be implemented
	 * 
	 * @see system/lib/baseController#index()
	 * 
	 */
	public function index()
	{
		$this->model('filter');
		$idfilter = $this->get_post('idfilter','string','',null,'isId');
		$type = $this->get_post('type','string');
		$filter = new FilterAdapter();
		
		// then call for data
		if (!empty($idfilter))
			$filter 		=   $this->filter->getByIdSmart($idfilter);
		$filters		= 	$this->filter->getAll($idfilter);
		$filterdef 		=  	$this->filter->getAllDef($type == 'USR'?'USR':'ACT');
		$operators		= 	$this->filter->getAllOperator();
		$inputs			= 	$this->filter->getAllInput();
		
		// set template params
		$this->template->set('filtersdef', $filterdef);
		$this->template->set('filters',$filters);
		$this->template->set('ftype',$type);
		
			
		// load template
		if ($filterdef)
		{		
			echo $this->template->render('/layout/module/smartFilter',array('operators'=>$operators,'inputs'=>$inputs,'filter'=>$filter));
			//echo $view;
			//echo jsonRet(false,true,null,null,$view,count($results));
		}
		else echo jsonRet(_('ERR_FIELD'),true);
		return;
	}
	
	
	public function nearby()
	{
		$act = $this->get_post('act');
		$type = $this->get_post('type');
		if ($act=='edit')
		{
			echo $this->template->render('/filter/module/nearby',array('type'=>$type));
		}
		else // save
		{
			$me = $this->session->me();
			$me->nearby->mode = $this->get_post('mode');
			$me->nearby->radius = $this->get_post('myradius');
			$this->model('spots');
			foreach ($this->spots->add((array)$this->get_post('addressS')) as $value)
				$me->spot = $value;
			$this->model('user');
			$this->user->paramNearby($me);
			$this->session->set('user',$me);
			$who = $this->session->who();
			if ($who && $who->id == $me->id) $this->session->set('who',$me);
			
			//redirect('/filter/XXX/'.$type);
			$this->model('filter');
			$this->filter->setActive(md5('XXX'.$me->id),FALSE,1);
			redirect('/'.$me->url.'/'.$this->redirect_url[$type]);
		}
	}
	
	public function myservices()
	{
		$act = $this->get_post('act');
		$type = $this->get_post('type');
		if ($act=='edit')
		{
			echo $this->template->render('/filter/module/myservices',array('type'=>$type));
		}
		else // save
		{
			$me = $this->session->me();
			$this->model('user');
			
			//====================SAVE SERVICES=====================
			$tags['C'] = $tags['P'] = array();
			$this->model('tags');
			//print_r($tags['P']);
			if (isset($_POST['service_P']) )
			{
				$services =	$this->tags->add( array('service'=>$_POST['service_P'])  );
				$tags['P']= array_merge($services,$tags['P']);
			}
			if (isset($_POST['service_C']) )
			{
				$services =	$this->tags->add( array('service'=>$_POST['service_C'])  );
				$tags['C'] = array_merge($services,$tags['C']);
			}
			$this->model('user');
			$this->user->updateMyServices($tags);
			
			
			//redirect('/filter/MYS/'.$type);
			$this->model('filter');
			$this->filter->setActive(md5('SRV'.$me->id),FALSE,1);
			redirect('/'.$me->url.'/'.$this->redirect_url[$type]);
		}
	}
	
	
	public function save()
	{
		if (!$this->session->isLogged()) {
			echo jsonRet(_('ERR_NOT_LOGED'),false);
			return;
		}
		$alias = $this->post('alias','string');
		if (!empty($alias))
		{
			$idfilter = $this->post('idfilter','string','');
			$type = $this->get_post('type','string');
			
			$this->model('filter');
			$idusr = $this->session->getUserVar('id');
			$sequence = '';
			$subfilter = array();
			//_debug($idfilter);
			//_debug($idusr);
			
			if(empty($idfilter)) 
			{
				$idfilter = md5(time().$alias.$idusr);
				$activsma = 0;
			}
			else {
				$filtersma 	= $this->filter->getByIdSmart($idfilter,$this->regextype[$type]);
				$activsma 	= $filtersma->active;
			}
			
			foreach ($_POST as $key => $filtre)
			{
				if (substr_compare($key,'dyna_join-',0,10)==0)
				{
					$idsub = explode('-',$key);
					$idsub = $idsub[1];
					if ($this->post('dyna_join-'.$idsub) == _('_AND')) $join = 'AND';
					else if ($this->post('dyna_join-'.$idsub) == _('_OR')) $join = 'OR';
					else $join = '';
					$char_def 	= $this->post('dyna_filtre-'.$idsub);
					$values 	= $this->post('dyna_txt-'.$idsub);
					$labels		= ''; 
					$attach 	= $this->post('attach-'.$idsub)?'OR':$this->post('attach-'.$idsub);
					
					$this->storeData($char_def,$values,$labels);
					
					$subfilter[]= array('id_fil'		=>$idsub,
										'id_filsma_fil'	=>$idfilter,
										'id_fildef_fil'	=>$char_def,
										'id_op_fil'		=>$this->post('dyna_op-'.$idsub),
										'id_in_fil'		=>$this->post('dyna_inp-'.$idsub),
										'value_fil'		=>$values,
										'label_fil'		=>$labels,
										'attach_fil'	=>$attach
										);
					$sequence .= $join.'#'.$idsub;
				}
			}
			
			$this->filter->save(
						array(	'id_filsma'			=>$idfilter,
								'id_user_filsma'	=>$idusr,
								'alias_filsma'		=>$alias,
								'sequence_filsma'	=>$sequence,
								'type_filsma'		=>$this->regextype[$type],
								'active_filsma'		=>$activsma
								),
						$subfilter
			);
			//echo jsonRet(false,true);
			$this->filter->setActive(isId($idfilter)?$idfilter:md5($idfilter.$idusr),FALSE,1);
			redirect('/'.$this->session->who()->url.'/'.$this->redirect_url[$type]);
			//redirect('/filter/'.$idfilter.'/'.$type);
		}
		else echo jsonRet(false,true,null,null,'nothing',0);		
		//_debug($_POST);
	}
	
	private function storeData($char_def,&$values,&$labels)
	{
		$datas = explode ('!+!',$values);
		
		if ($char_def=='l') // if localisation
		{
			$values = '';	
			$this->model('spots');
			$spots = $this->spots->add($datas);
			$labels = implode('!+!',$spots);
			$values = implode('!+!',array_keys($spots));
		}
		else if ($char_def=='t') // if tags
		{
			$this->model('tags');
			$tags = $this->tags->add(array('other'=>$datas));
			$labels = implode('!+!',$tags);
		}
		else if ($char_def=='p') // if tags
		{
			foreach ($datas as $usr)
			{
				if 		($usr == 'ME')  $labels .= 'moi';
				else if ($usr == 'ME>') $labels .= 'je piste';
				else if ($usr == '>ME') $labels .= 'me pistent';
				else if (isId($usr))
				{
					$res=Db::read('SELECT fullname_usr,url_usr,privacy_usr FROM `user` WHERE id_usr="'.$usr.'"');
					$labels .= getName($res[0]['fullname'],$res[0]['url_usr'],$res[0]['privacy_usr']);
				}
				$labels.='!+!';	
			}
			$labels = (string) substr($labels,0,-3);
			
		}
		else if ($char_def=='c') // if tags
		{
			foreach ($datas as $data)
			{
				$labels .= $data.'!+!';	
			}
			$labels = (string) substr($labels,0,-3);
			
		}
		//$labels = (string) substr($labels,0,-3);
	}
	

	public function attach()
	{
		$ret = array('message'=>_('ERR_NOT_LOGED'),'success'=>false);
		if ($this->session->isLogged())
		{
			$idsmart = $this->post('idsmart', 'string', '', null, 'isId');
			$idact = $this->post('idact', 'string', '', null, 'isId');
			$type = $this->post('type', 'string');
			
			$ret['message']='ID soumis erroné';
			if (!empty($idsmart))
			{
				$this->model('filter');
				$ret	=	$this->filter->attach($idsmart,$idact,$type =='USR'?'usr':'act');
			}
		}
		echo json_encode($ret);
	}
	
	/**
	 *  request from an user to unfollow someone
	 * 
	 *  Gets params from post/get
	 *  
	 *  @return echoes a JSON response to the browser
	 */
	public function dettach()
	{
		$ret = array('message'=>_('ERR_NOT_LOGED'),'success'=>false);
		if ($this->session->isLogged())
		{
			$idsmart = $this->get_post('idsma', 'string', '', null, 'isId');
			$idact = $this->get_post('idact', 'string', '', null, 'isId');
			$type = $this->get_post('type', 'string');
							
			$ret = array('message'=>'ID soumis erroné','success'=>false);
			if (!empty($idsmart))
			{
				$this->model('filter');
				$ret	=	$this->filter->dettach($idsmart,$idact,$type=='USR'?'usr':'act');
			}
		}
		echo json_encode($ret);
		//redirect('/');
	}
	
	public function rem()
	{
		$ret = array('message'=>_('ERR_NOT_LOGED'),'success'=>false);
		if ($this->session->isLogged())
		{
			$idsmart = $this->get_post('idsmart', 'string', '', null, 'isId');
							
			$ret = array('message'=>'ID soumis erroné','success'=>false);
			if (!empty($idsmart))
			{
				$this->model('filter');
				$ret	=	$this->filter->remove($idsmart);
				//if ($ret['success']) redirect('/');
			}
		}
		echo json_encode($ret);
	}
}
?>