<?php
/**
 * Manifest
 * 
 * application/models/peopleModel
 * 
 * Model for people used in people section
 * 
 * @copyright: Yoomken Li
 * 
 */
class YOO_PeopleModel extends AppModel
{
	
	protected $allowed = array(	
								'journal'=>'','type'=>'','person'=>'','sorting'=>'newest','beg'=>0,'limit'=>0,'date_up'=>'','date_down'=>''
								);
								
	protected $fields = '	U.id_usr,
							U.status_usr,
							U.fullname_usr,
							U.privacy_usr,
							U.url_usr,
							U.email_usr,
							U.shortdesc_usr,
							U.profil_usr,
							U.regdate_usr,
							U.id_spt_usr,
							U.id_img_usr';
							/*count_act,
							regdate_usr ';*/
	
	protected $model 	= 'people';
	protected $view 	= 'view_user';
	protected $sfx  	= 'usr';
	protected $sfx2 	= 'usr';
	protected $pfx_MT 	= 'U';
	protected $filter_type = '1..';
   	
	/**
	 *
	 * Return baseModel instanc
	 * 
	 * @return baseModel object
	 *
	 * @access public
	 */
	public static function getInstance() 
	{
		if (PeopleModel::$singleton===null) 
		{
	   		PeopleModel::$singleton = new YOO_PeopleModel();
		}
		
		return PeopleModel::$singleton;
	}
   	/** 
   	 * It accepts an ID hash to load people data from database
   	 * 	This function is an alias of UserModel::getByID($id)
	 * 
	 * @param string $id
	 * 
	 * @return array including the User's datas
	 * 
	 * @see UserModel::getByID()
	 */
   	public function getByID(array $ids=null)
   	{
   		$this->model('user');
   		$res = array();
   		foreach ($ids as $id)
   			$res[$id]	=  $this->user->getById($id);
   		return $res;
   	}
	
	public function getBy($typId = 'Id',array $ids=null, $all=false)
   	{
   		$this->model('user');
		$getByTypId = 'getBy'.$typId;
   		$res = array();
   		foreach ($ids as $id) {
   				$res[$id]	=  $this->user->$getByTypId($id);
				if ($all) {
					$opt = Db::read("SELECT * FROM user_more where id_usr_mor='".$res[$id]->id."'");
					if (count($opt)==1) {
						$res[$id]->option = new MoreAdapter($opt[0]);
					}
				}
   		}
   		return $res;
   	}
	
	public function getByUrl(array $ids=null)
   	{
   		$this->model('user');
   		$res = array();
   		foreach ($ids as $id)
   			$res[$id]	=  $this->user->getById($id,'url');
   		return $res;
   	}
   	
	public function _6_init($reason)
	{
		$me = $this->session->who();
		if ($me && isId($me->id))
		{
			$query = '
					SELECT  '.$this->fields.',
							"'.$reason.'" as reason_usr, 
							IFNULL(u_.status_usrusr,0) as me__usr,
							IFNULL(_u.status_usrusr,0) as _me_usr
						FROM `'.$this->view.'` as  U
					LEFT JOIN  user_user AS u_ ON ( u_.id_follower_usrusr="'.$me->id.'" AND u_.id_followed_usrusr = U.id_usr )
					LEFT JOIN  user_user AS _u ON ( _u.id_followed_usrusr="'.$me->id.'" AND _u.id_follower_usrusr = U.id_usr )
					{#sql_mycollaborators}
					{#sql_myservices}
					{#sql_countries} 
					{#sql_nearby}
	    			';
		}
		else $query = 'SELECT  '.$this->fields.',"'.$reason.'" as reason_usr FROM `'.$this->view.'` as  U ' ;
		//SELECT uu.id_followed_usrusr FROM user_user AS uu 
		//			WHERE uu.id_follower_usrusr="'.$user.'" AND uu.status_usrusr IN ("A","F")
		return $query;
	}	
	
	public function _6_c(&$query,$filter,$idsmart = null)
	{
		$terms = $filter->values;
		$op = $filter->op;
		$glues = $filter->glues;
		$attach = $filter->attach;
   		if(sizeof($terms))
   		{  
   			$query .= ' INNER JOIN `view_user` as A'.$this->nb.' ON '; 
   			$query .= '( (';				   				
   			foreach($terms as $kw) 
   			{
   				$query	.=	' (
   								A'.$this->nb.'.job_presta '.$op.' '.$glues[2].$kw.$glues[3].' OR 
   								A'.$this->nb.'.shortdesc_'.$this->sfx.' '.$op.' '.$glues[2].$kw.$glues[3].'
   							  ) '.$attach.' ' ;
   			}
   			$query = (string) substr($query,0,$attach == 'AND'?-4:-3);
   			$query .= ' )';
   			$query	.= ' AND U.id_usr = A'.$this->nb.'.id_'.$this->sfx.' ) ';
   		}
	}
	
	// filtrer par service
	// Pour people, les services sont un sous ensemble de tags, on a donc juste à rappeller la fonction génarale _6_t()
	public function _6_s(&$query,$filter,$idsmart = null)
	{
		$this->_6_t($query,$filter);	
	}
	
	public function setSql_myServices()
	{
		$who = $this->session->who();
		if(!$who) return;
		$this->sql_myservices  = 
							'LEFT JOIN  tag_usr AS tu ON (tu.id_usr_tagusr = U.id_usr)
						     INNER JOIN tag tmys ON (tu.id_tag_tagusr = tmys.id_tag AND lang_tag = "'.me()->lang.'"  
								  	AND ( tmys.id_tag IN ("'.implode('","',$who->idservice).'") 
									OR tmys.id_parent_tag IN ("'.implode('","',$who->idservice).'") ) )';	
	}
	
	/**
	 * Creates a query bit for the content destinated for campany or seeker
	 * 
	 * @param string Profil One of P (prestaire) or C (campagny)
	 * @return string the query bit
	 */
	public function getWhereFlux($flux = '')
	{
		$where = '1';
		$where .= ' AND id_usr <> "00" ';
		$me = $this->session->who();
		if ($me) $where .= ' AND id_usr <> "'.$me->id.'" ';
		return $where;
	}
	
	public function getOrder()
	{
		$query='';
		switch ($this->sorting)
		{
			case 'actup':
				$query.='count_act DESC,count_cmt DESC, RAND() ';
				break;
			
			case 'actdown':
				$query.=' count_act ,count_cmt, RAND() ';
				break;
				
			case 'aup':
				$query.=' fullname_usr ';
				break;
				
			case 'adown':
				$query.=' fullname_usr DESC ';
				break;
				
			case 'newest':
				$query.=' regdate_usr DESC ';
				break;
			
			case 'nearest':
				$query.= 'distance_'.$this->sfx.' ';
			break;
			
			case 'oldest':
			default:
				$query.=' regdate_usr  ';
		}
		return $query;
	}	
   	
   	
	
	//return an array containing people who match with my services  (MY)
   	/*public function getPeopleServices(array $service)
	{
		$query = '	SELECT tu.id_usr_tagusr FROM tag_usr AS tu 
					WHERE tu.id_tag_tagusr IN ("'.implode(",",$service).'") ';
	   	$res = Db::read($query);
	   	$nokey = array();
	   	if (count($res))
	   	{
	   		foreach($res as $usr)
	   		{
	   			$nokey [] = $usr['id_usr_tagusr'];
	   		}
	   	}
	   	if (count($nokey)==0) $nokey[] = 'XX';
	   	return $nokey;
    }*/
    	
   /**
   	 * Get all spot for user 
   	 * 
   	 * @param array $people
   	 * 
   	 * @return mixed array of group
   	*/  	
    public function getPeopleSpots(&$people)
	{
		// set vars
		$orSpt 		= array('NULL');
		$orUsr 		= '';
		$size 		= sizeof($people);
		$i 			= 0;
   		
		// create complex query
		foreach ($people as $usr) 
   		{
   			$i ++;
   			
   			if(isId($usr->id_spt))
			{
				$orSpt[] = $usr->id_spt;
				
				
				$usrIDs[] 	= $usr->id;
				$usr->set('spot',null);
		   	}
   		}
	
		$orSpt = array_unique($orSpt); 		
   		// remove Somewhere spot   		
   		if (in_array('99999999999999999999999999999999',$orSpt))
   		{
   			$key = array_search('99999999999999999999999999999999',$orSpt);
   			unset($orSpt[$key]);
   		}
				
   		// run both queries
   		$spts = Db::read('SELECT * FROM `spot` as spt WHERE id_spt IN ("' . join('","',$orSpt) .'")');

		// create final array:
   		// for every spot in database (filtered by activity)
   		foreach ($spts as $spt) 
   		{
   			// run on activities array to match elements with id_act
   			$spt = new SpotAdapter($spt);
   			foreach ($people as $usr)
   			{	
				if ($usr->id_spt == $spt->id)
				{
					$usr->spot = $spt;			
				}				
   			}   			
   		}
	}   
	
	
	public function getPeopleTags(&$activities,$type ='')
	{
		$this->getTags($activities,$type);	 
	   	//return $activities;
	}
	
	
	public function getPeopleFilters(&$activities)
	{
		parent::getFilters($activities);
	}
	
	
	public function getpeopleInfoRelated(&$activities){}
	
	
	/**
   	 * Adds count information to an user
	 * 
   	 *  !! Atention ne pas utiliser la function me() ou getInstance() ici car c'est une fonction qui est appellé pendant la session => peut causer un lookup infini !!!
	 * 
   	 * @param mixed $people array
   	 * 
   	 * @return mixed $people array with count information added
   	 */
   	public function getPeopleCount(&$people)
   	{	  		
   		// get counts
		$usrWhere = array('NULL'); // important to have this value by default
		foreach ($people as $usr)
		{
			$usrWhere[] = '"' . $usr->id . '"';
			$adrUsers[$usr->id] = $usr;
			$usr->set('count_fr',0);
			$usr->set('count_fd',0);
			$usr->set('count_msg',0);
			$usr->set('count_avis',0);
			$usr->set('count_bdg',0);
			$usr->set('best_bdg',array());
			$usr->set('count_like',0);
			$usr->set('count_collaborator',0);
			$usr->set('count_collaboWithMe',0);		
			$usr->set('isLiked',false);
		}
		$usrWhere = join(',',$usrWhere);
		
		$lang = $this->session->get('lang');
		
		if ($this->session->me()) $countryCond = 'pays.state_spt = "'.getCountryUser($this->session->me(),true).'"';
		else $countryCond = '1';
		
		$counts_followed 	 = Db::read('SELECT id_follower_usrusr, COUNT(DISTINCT id_followed_usrusr) as count_fd 
											FROM `user_user`
											INNER JOIN user U ON (id_followed_usrusr = id_usr AND status_usr >=2) 
											INNER JOIN spot pays ON ( pays.id_spt = U.id_spt_usr AND '.$countryCond.' ) 
											WHERE status_usrusr<>"0" AND  id_follower_usrusr IN ('.$usrWhere.') 
											GROUP BY id_follower_usrusr');
		
		$counts_follower	 = Db::read('SELECT id_followed_usrusr, COUNT(DISTINCT id_follower_usrusr) as count_fr 
											FROM `user_user` 
											INNER JOIN user U ON (id_follower_usrusr = id_usr AND status_usr >=2) 
											INNER JOIN spot pays ON ( pays.id_spt = U.id_spt_usr AND '.$countryCond.' ) 
											WHERE status_usrusr<>"0" AND  id_followed_usrusr IN ('.$usrWhere.') 
											GROUP BY id_followed_usrusr');
		
		$counts_avis  		 = Db::read('SELECT related_act as user_avis, COUNT(DISTINCT id_act) as count_avis FROM `activity` a 
											WHERE related_act IN ('.$usrWhere.') AND type_act = "AV" 
											GROUP BY user_avis');
											
		$counts_bdg 		= Db::read('SELECT id_meta_lik , COUNT(DISTINCT pid_lik) AS count_bdg 
										FROM `like` l
										WHERE type_lik IN ("L","A") 
											AND id_meta_lik IN ('.$usrWhere.')
											AND meta_lik = "BDG"
										GROUP BY id_meta_lik ');
		
		
		
		$best_bdg 			= Db::read('
										SELECT * FROM (
											SELECT IFNULL(name_bdg,"no_badge") as name_2nd,IFNULL(id_meta_lik,"no_user") as id_meta_lik, MAX(count_bdg) AS count_bdg FROM (
													SELECT  name_bdg ,id_meta_lik,  COUNT(DISTINCT pid_lik) AS count_bdg  FROM `like` l 
													INNER JOIN badge b ON (name_bdg = bdg_lik AND lang_bdg= "'.$lang.'") WHERE type_lik IN ("L","A") AND id_meta_lik IN ('.$usrWhere.') AND meta_lik = "BDG" AND type_bdg="PERS"
													GROUP BY bdg_lik,id_meta_lik HAVING COUNT(DISTINCT id_usr_lik) > 0
													ORDER BY COUNT(DISTINCT pid_lik) DESC
													) sub GROUP BY id_meta_lik
											UNION
											SELECT IFNULL(name_bdg,"no_badge") as name_2nd,IFNULL(id_meta_lik,"no_user") as id_meta_lik, MAX(count_bdg) AS count_bdg FROM (
													SELECT  name_bdg ,id_meta_lik,  COUNT(DISTINCT pid_lik) AS count_bdg  FROM `like` l 
													INNER JOIN badge b ON (name_bdg = bdg_lik AND lang_bdg= "'.$lang.'") WHERE type_lik IN ("L","A") AND id_meta_lik IN ('.$usrWhere.') AND meta_lik = "BDG" AND type_bdg="SKILL"
													GROUP BY bdg_lik,id_meta_lik HAVING COUNT(DISTINCT id_usr_lik) > 0
													ORDER BY COUNT(DISTINCT pid_lik) DESC
													) sub GROUP BY id_meta_lik
											UNION
												SELECT * FROM (SELECT  name_bdg ,id_meta_lik,  COUNT(DISTINCT pid_lik) AS count_bdg  FROM `like` l 
													INNER JOIN badge b ON (name_bdg = bdg_lik AND lang_bdg= "'.$lang.'") WHERE type_lik IN ("L","A") AND id_meta_lik IN ('.$usrWhere.') AND meta_lik = "BDG" AND type_bdg="SKILL"
													GROUP BY bdg_lik,id_meta_lik HAVING COUNT(DISTINCT id_usr_lik) > 0
													ORDER BY COUNT(DISTINCT pid_lik) DESC) sub
											UNION
												SELECT * FROM (SELECT  name_bdg ,id_meta_lik,  COUNT(DISTINCT pid_lik) AS count_bdg  FROM `like` l 
													INNER JOIN badge b ON (name_bdg = bdg_lik AND lang_bdg= "'.$lang.'") WHERE type_lik IN ("L","A") AND id_meta_lik IN ('.$usrWhere.') AND meta_lik = "BDG" AND type_bdg="PERS"
													GROUP BY bdg_lik,id_meta_lik HAVING COUNT(DISTINCT id_usr_lik) > 0
													ORDER BY COUNT(DISTINCT pid_lik) DESC) sub
											) sub1 
											INNER JOIN  badge b ON (name_bdg = name_2nd AND lang_bdg= "'.$lang.'")
											WHERE count_bdg is not null
											');
										
		if ($this->session->me())
		{
			$counts_message  = Db::read('SELECT id_usr_grpusr as id_usr_msg, COUNT(DISTINCT id_msg) as count_msg FROM `message` m 
											INNER JOIN grp_usr mu ON (mu.id_grpusr = m.id_grp_msg AND mu.id_usr_grpusr IN ('.$usrWhere.'))
											WHERE id_usr_msg  = "'.$this->session->me()->id.'" 
											GROUP BY id_usr_grpusr');
		}
		if ($this->session->who())
		{
			// count nb collaborations foreach person and me
			$counts_collaboWithMe  = Db::read('SELECT DISTINCT gp_u.id_usr_grpusr as idusr, COUNT(DISTINCT id_coll) as count_collabo 
											FROM histo_collaborator hc
											INNER JOIN grp_usr gp_u ON (hc.id_grpusr_coll = gp_u.id_grpusr )
	   										INNER JOIN grp_usr gp_g ON (hc.id_grpusr_coll = gp_g.id_grpusr )
											INNER JOIN user U ON (id_coll = id_usr AND status_usr >=2) 
											INNER JOIN spot pays ON ( pays.id_spt = U.id_spt_usr AND '.$countryCond.' ) 
	   										WHERE  gp_u.id_usr_grpusr IN ('.$usrWhere.') 
											AND gp_g.id_usr_grpusr <> gp_u.id_usr_grpusr
											AND gp_g.id_usr_grpusr = "'.$this->session->who()->id.'"
											AND ( 1 OR date_end_coll IS NOT NULL)
											GROUP BY gp_u.id_usr_grpusr');
		}
		// count nb collaborators which the user have already collaborated								
		$counts_collaborator     = Db::read('SELECT DISTINCT gp_u.id_usr_grpusr as idusr, COUNT( DISTINCT gp_g.id_usr_grpusr) as count_collabo 
									FROM histo_collaborator hc
									INNER JOIN grp_usr gp_u ON (hc.id_grpusr_coll = gp_u.id_grpusr )
									INNER JOIN grp_usr gp_g ON (hc.id_grpusr_coll = gp_g.id_grpusr )
									INNER JOIN user U ON (gp_g.id_usr_grpusr = id_usr AND status_usr >=2) 
									INNER JOIN spot pays ON ( pays.id_spt = U.id_spt_usr AND '.$countryCond.' ) 
									WHERE  gp_u.id_usr_grpusr IN ('.$usrWhere.') 
									AND gp_g.id_usr_grpusr <> gp_u.id_usr_grpusr
									AND ( 1 OR date_end_coll IS NOT NULL)
									GROUP BY gp_u.id_usr_grpusr');
		
		$count_nbrelations	 = Db::read(' SELECT DISTINCT IFNULL(u_.id_follower_usrusr,_u.id_followed_usrusr) as userid, COUNT(DISTINCT U.id_usr) as count_rel
												FROM `user` as  U
											LEFT JOIN  user_user AS u_ ON ( u_.id_follower_usrusr IN ('.$usrWhere.')  AND u_.id_followed_usrusr = U.id_usr )
											LEFT JOIN  user_user AS _u ON ( _u.id_followed_usrusr IN ('.$usrWhere.')  AND _u.id_follower_usrusr = U.id_usr ) 
											INNER JOIN spot pays ON ( pays.id_spt = U.id_spt_usr AND '.$countryCond.' ) 
											WHERE (  u_.status_usrusr <> 1 OR _u.status_usrusr <> 1 )
											GROUP BY IFNULL(u_.id_follower_usrusr,_u.id_followed_usrusr) and U.status_usr >=2');
		
		// parse
		//foreach ($people as $k=>$a)
		{
			// count nb relations
			foreach ($count_nbrelations as $c=>$cmt)
			{
				//if ($a->id == $cmt['id_followed_usrusr'])
				{
					$adrUsers[$cmt['userid']]->count_rel = $cmt['count_rel'];
				}						 
			}

			foreach ($counts_bdg as $c=>$cmt)
			{
				//if ($a->id == $cmt['id_followed_usrusr'])
				{
					$adrUsers[$cmt['id_meta_lik']]->count_bdg = $cmt['count_bdg'];
				}						 
			}
			
			
			
			foreach ($best_bdg as $c=>$cmt)
			{
				if (count($adrUsers[$cmt['id_meta_lik']]->best_bdg)==2) continue;	 // 2 suffit
				$adrUsers[$cmt['id_meta_lik']]->best_bdg[] = new BadgeAdapter($cmt);
			}
	
			// count follower
			foreach ($counts_follower as $c=>$cmt)
			{
				//if ($a->id == $cmt['id_followed_usrusr'])
				{
					$adrUsers[$cmt['id_followed_usrusr']]->count_fr = $cmt['count_fr'];
				}						 
			}

				
			// count followed
			foreach ($counts_followed as $c=>$cmt)
			{
				//if ($a->id == $cmt['id_follower_usrusr'])
				{
					$adrUsers[$cmt['id_follower_usrusr']]->count_fd = $cmt['count_fd'];
				}						
			}
			
			if ($this->session->me()){ 
				// count message
				foreach ($counts_message as $c=>$cmt)
				{
					//if ($a->id == $cmt['id_usr_msg'])
					{
						$adrUsers[$cmt['id_usr_msg']]->count_msg = $cmt['count_msg'];
						
					}					
				}
			}
			
			foreach ($counts_collaborator as $c=>$cmt)
			{
				$adrUsers[$cmt['idusr']]->count_collaborator = $cmt['count_collabo'];					 
			}
				

			if ($this->session->who()){ 
				foreach ($counts_collaboWithMe as $c=>$cmt)
				{
					$adrUsers[$cmt['idusr']]->count_collaboWithMe = $cmt['count_collabo'];						 
				}
			}
			
			foreach ($counts_avis as $c=>$cmt)
			{
				
				//if ($a->id == $cmt['id_followed_usrusr'])
				{
					$adrUsers[$cmt['user_avis']]->count_avis = $cmt['count_avis'];
				}						 
			}

			
		}
		$this->getLiked($adrUsers,$usrWhere,'USR');
   	}
	
	
	
	public function saveOne($data,$opts,$needActivate)
   	{
   		if (!is_array($data)) return null;
   		$obj = new UserAdapter($data);
   		//If user doesn't already have an account
   		$res=Db::read("SELECT id_usr,status_usr,activate_code_usr FROM `user` WHERE email_usr='".$obj->email."'");
   		if(sizeof($res)>0 && (($res[0]['status_usr']==0  && !$res[0]['activate_code_usr']) || $res[0]['status_usr']!=0) )
   		{
   			//user already exist
   			// update the DB
   			$data['password_usr'] = sha1($data['password_usr']);
   			//unset($data['fullname_usr']);
   			
   			$fields = '';
			foreach($data as $field => $value)
			{	
				$fields    .= '`'.$field.'`="'.$value.'",';
			}
			$fields=substr($fields,0,-1);//delete the last ','
			$res2=Db::write('UPDATE `user` SET '.$fields.', fb_id_usr="'.$obj->fb_id.'" 
										WHERE email_usr="'.$obj->email.'"');
			$res2=Db::write('UPDATE `user_more` SET fb_oauth_token_mor="'.$opts['fb_oauth_token_mor'].'" 
										WHERE id_usr_mor="'.$res[0]['id_usr'].'"');
   			return array(_('ERR_USR_EXIST'),true);
   		}
   		else
   		{
   			// insert in the DB
   			//$uid=md5($obj->email.$_SERVER['REQUEST_TIME']);
			$uid=md5($obj->email);
			
   			if ($needActivate) 
   			{
   				$activate = $data['activate_code_usr']= md5($uid.$_SERVER['REQUEST_TIME']);
   				$data['status_usr']='0';	
   			}
   			else $data['status_usr']='2';	
 			
   			//$url = changeUrlMap("user",array($obj->firstname,$obj->lastname),$uid);
   			$data['id_usr'] =  $uid;
   			//$data['url_usr'] = $url;
   			$data['password_usr'] = sha1($data['password_usr']);
   			$data['regdate_usr'] = date("Y-m-d H:i:s");

   			/*$fields = $values = '';
			foreach($data as $field => $value)
			{
				if (substr($field,-4)=='_usr') {	
					$fields    .= '`'.$field.'`,';
					$values	   .= '"'.$value.'",';
				}
			}
			$fields=substr($fields,0,-1);//delete the last ','
   			$values=substr($values,0,-1);//delete the last ','*/
   			
   			
   			$res2=Db::write('DELETE FROM `user` WHERE id_usr="'.$uid.'"');
			$res2=Db::write('DELETE FROM `user_more` WHERE id_usr_mor="'.$uid.'"');
			
   			$res2=Db::write('INSERT INTO `user` ('.implode(',', array_keys($data)).') VALUES ("'.implode('","', $data).'");');
			$res3=Db::write('INSERT INTO `user_more` (id_usr_mor,'.implode(',', array_keys($opts)).') 
								   VALUES ("'.$data['id_usr'].'","'.implode('","', $opts).'");');
   		
   			if($res2==1 && $res3 == 1)
   			{
   				
				$this->model('message');
   				if($needActivate)
   				{
   					if (ONLINE)
					{
	   					//Send Activation email
		   				$mail = new Mailer(true);
						$mail->IsSMTP();
						$mail->AddAddress($obj->email);
						$mail->hi_receiver = $obj->name;
						$mail->Subject = _('MAIL_WELC_TXT1')." ".$obj->name." "._('MAIL_WELC_TXT2');
						
						$data = array('firstname'=>$obj->name,'email'=>$obj->email,'activate'=>$activate);
			   			$message = Template::getInstance()->render('message/mail/welcome',$data);
			   			
						
						$mail->MsgHTML($message);
						$mail->Send();
					}
   				}
				else {
					$this->model('message');
	   				$this->message->sendNewRegistering($obj);
				}
				
				$msg = new MessageAdapter();
				$msg->id_usr 	= '00'; 
				$msg->content 	= (preg_replace('/\{#user\}/',$obj->name,_('WELCOME_TO_YOOMKEN')));
				$msg->smail		= '1';
    			$this->message->saveOne($msg,array($uid));
				
				//Create user's folder
				if(is_writable($_SERVER['DOCUMENT_ROOT']."/u"))
				{
					if (!is_writable($_SERVER['DOCUMENT_ROOT']."/u/".$uid)) mkdir($_SERVER['DOCUMENT_ROOT']."/u/".$uid, 0755);
				}
   				
   				return array($uid,true);
   			}
   			else
   			{
   				return array('ECHEC sytem during inserstion of new user',false);
   			}
   		}
   	}
   	
   	
	function getLike($_str)
   	{
   		$_str = strtolower ($_str);
		$res=Db::read('SELECT id_usr,fullname_usr,privacy_usr,url_usr FROM user 
							WHERE ( fullname_usr LIKE(\'%'.$_str.'%\') OR ('.$this->aproximate.' AND SOUNDEX(fullname_usr) = SOUNDEX(\''.$_str.'\') ) 
										AND privacy_usr=\'P\') OR
								  ( url_usr LIKE(\'%'.$_str.'%\') OR ('.$this->aproximate.' AND SOUNDEX(url_usr) = SOUNDEX(\''.$_str.'\') ) )
							LIMIT 0,5
					');
		
		$arr=array(); 
		$arr[] = array('ME','moi',"<span class='orange'>moi</span>","moi"); 
		$arr[] = array('ME>','suivis',"<span class='orange'>suivis</span>","suivis"); 
		$arr[] = array('>ME','suiveurs',"<span class='orange'>suiveurs</span>","suiveurs"); 
		if(count($res)>=1)
		{	
			foreach($res as $r)
			{
				$usr = new UserAdapter($r);
				if (!preg_match('/'.$_str.'/i',$usr->name)) {
					$usr->name = ($usr->privacy == 'P'? $usr->url:$usr->fullname);
				}
				$arr[]=array($r['id_usr'],$usr->name,$usr->name,$usr->name);
			}
		}
		return json_encode($arr);
   	}

	// retourne tous les relations d'une personne (profil suiveurs, suivis et collaborateurs)
	public function getRelations($idwho,$relation=null,$term=null, $limit = 16, $listingnore = array())
	{
		if ($idwho)
		{
			if (isEmail($term)) {
				$relation = null;
				$termsql = 'email_usr LIKE(\'%'.$term.'%\')';
			}
			else if (empty($term)) $termsql = 1;
			else $termsql = '( fullname_usr LIKE \'%'.$term.'%\' AND privacy_usr=\'P\' ) OR ( url_usr LIKE(\'%'.$term.'%\')) ';
			
			if ($relation == 'ME->') 
				$condition_relation = 'u_.status_usrusr IN ("W","F") AND (_u.status_usrusr IS NULL OR _u.status_usrusr="0") ';
			else if ($relation == '<-ME') 
				$condition_relation = '_u.status_usrusr IN ("W","F") AND (u_.status_usrusr IS NULL OR u_.status_usrusr="0")';
			else if ($relation == '<-ME->') 
				$condition_relation = 'u_.status_usrusr IN ("W","F") AND _u.status_usrusr IN ("W","F")';
			else if ($relation == 'ME->>') 
				$condition_relation = 'u_.status_usrusr = "A" AND _u.status_usrusr = "A" ';
			else if ($relation == '->ME<-')  
				$condition_relation = ' u_.status_usrusr <> 1 OR _u.status_usrusr <> 1 ';
			else 
				$condition_relation = 1;
			
			$listingnore[] = "00";
			$listingnore[] = $idwho;
			
			$query = '
					SELECT  SQL_CALC_FOUND_ROWS DISTINCT U.*,C.*,P.*,
							IFNULL(u_.status_usrusr,0) as me__usr,
							IFNULL(_u.status_usrusr,0) as _me_usr
						FROM `user` as  U
					LEFT JOIN  user_user AS u_ ON ( u_.id_follower_usrusr="'.$idwho.'" AND u_.id_followed_usrusr = U.id_usr )
					LEFT JOIN  user_user AS _u ON ( _u.id_followed_usrusr="'.$idwho.'" AND _u.id_follower_usrusr = U.id_usr ) 
					LEFT JOIN  `view_customer` as  C ON (U.id_usr = C.id_usr_custo)
					LEFT JOIN  `view_presta` as  P ON (U.id_usr = P.id_usr_presta)
					WHERE ( '.$condition_relation.' ) AND ( '.$termsql.' ) AND U.status_usr >= 0 AND id_usr NOT IN ("' . join('","',$listingnore) .'")
					ORDER BY u_.status_usrusr DESC,_u.status_usrusr DESC, U.regdate_usr DESC
					LIMIT '.$limit.'
				';
			$people = Db::read($query);
			//die($query);
			//$nokey = array();
		   	if (count($people))
		   	{
		   		foreach($people as &$usr)
		   		{
		   			$usr = new UserAdapter($usr); 
					//$nokey [] = $usr;
		   		}
				$this->getPeopleCount($people);
				$this->getPeopleTags($people,'service');
				$this->getPeopleSpots($people);
				
				$resnb=Db::read("SELECT FOUND_ROWS()");
	    		return array($resnb[0]['FOUND_ROWS()'],$people);
		   	}
			else return false;
		}
		return false;	
		
	}

	public function notifyMentionedPeople($owner,$content,$posturl)
	{
		preg_match_all('#\@\[[\s\w@\.]+\]\(\w+:(?P<url>\w+)\)#is', $content, $matches);
		$rets = $this->getByUrl($matches['url']);
		
		$this->model('message');
		$msg = new Adapter();
		
		$mentionedPeople = array();
		foreach ($rets as $receiver) {
			// inform the receiver about the mention
			SelectLang($receiver->lang);				
			
			$msg->content = Template::getInstance()->render('message/msg/mentionedYou',array('asker'=>$owner,'receiver'=>$receiver,'post'=>$content,'posturl'=>$posturl));
			$msg->mail 	= Template::getInstance()->render('message/mail/mentionedYou',array('asker'=>$owner,'receiver'=>$receiver,'post'=>$content,'posturl'=>$posturl));
			$msg->subject = $owner->name.' '._('mentioned you');
			$msg->type = 'OT';
			
			$sender = '00';
			$dest= $receiver->id;
			$msg->id_usr 	= $sender; 
			$msg->smail 	= 0;
			$msg->richhtml  = true;
			//$msg->id 		= $idmsg;
			$this->message->saveOne($msg,array($dest));
			//$this->message->sendMail($sender,$dest);
			$mentionedPeople[]=$dest;
			
		}
		
		SelectLang(me()->lang);
		return $mentionedPeople;
	}
   
}

?>