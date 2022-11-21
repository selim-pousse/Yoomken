<?php

/**
 * Manifest
 * 
 * application/models/GroupModel
 * 
 * Model for people used in people section
 * 
 * @copyright: Yoomken Li
 * 
 */

class YOO_UserModel extends AppModel 
{
	
	protected $allowed = array('id'=>'');
	
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
		if (YOO_UserModel::$singleton===null) 
		{
	   		YOO_UserModel::$singleton = new YOO_UserModel();
		}
		
		return YOO_UserModel::$singleton;
	}
	
	
   	/** 
   	 *  it accepts an ID hash to load user's datas from database
	 * 
	 * @param string $id
	 * 
	 * @return array including the User's datas
	 * 
	 */
   	public function getByID($id,$field = 'id',$force=false)
   	{
   		$ret = array();
   		
   		// whether an ID or an array of ID's
   		if ( ($field=='id' && isId($id)) || ($field=='email' && isEmail($id)) || ($field=='url') )
		{
			//$sql = 'SELECT * FROM `user` WHERE ' . ( is_array($id) ? 'id_usr IN("' . implode($id,'","') . '")' : 'id_usr = "' . $id . '"');
			//$res = Db::read( $sql );
			
			$status = ($force?'1':'U.status_usr>=0');
			$me = isset($this->session)? $this->session->get('user'): null; // Correction apporté lors de la connexion
			if ($me && isId($me->id))
			{
				$query = '
						SELECT  U.*,C.*,P.*,O.*,
								IFNULL(u_.status_usrusr,0) as me__usr,
								IFNULL(_u.status_usrusr,0) as _me_usr
							FROM `user` as  U
						LEFT JOIN  user_user AS u_ ON ( u_.id_follower_usrusr="'.$me->id.'" AND u_.id_followed_usrusr = U.id_usr )
						LEFT JOIN  user_user AS _u ON ( _u.id_followed_usrusr="'.$me->id.'" AND _u.id_follower_usrusr = U.id_usr ) 
					';
				$who = $this->session->who();
				if ($field =='id' && $me->id==$id) $status='1';
				else if ($field =='url' && $me->url==$id) $status='1';
			}
			else $query = 'SELECT  * FROM `user` as  U ' ;
			$query .= ' 	LEFT JOIN  `view_customer` as  C ON (U.id_usr = C.id_usr_custo)
						 	LEFT JOIN  `view_presta` as  P ON (U.id_usr = P.id_usr_presta)
							INNER JOIN `user_more` O ON (U.id_usr = id_usr_mor) 
						   WHERE '.$field.'_usr = "' . $id . '" AND '.$status.' LIMIT 1';
			
			
			$res = Db::read($query);
			$usr = $this->getDatas($res);
			if ($usr->id==$me->id) $this->session->set('user',$usr);
			//_debug($query);
			
			$people = new YOO_PeopleModel($this->session);
			$usr = array($usr);
			$people->getPeopleCount($usr);
			//die('toto');
			return $usr[0];
		}
		return new Adapter();
	}
	
	
	/** 
   	 *  it accepts an url string to load user's datas from database
	 * 
	 * @param string $id
	 * 
	 * @return array including the User's datas
	 * 
	 */
   	public function getByUrl($url,$field = 'url',$force = false)
   	{
   			return $this->getByID($url,'url',$force);
	}

	public function getByEmail($email)
   	{
   		return $this->getByID($email,'email');
			
	}
	
	public function getDatas($res, $version = 'full')
	{
		$usr = new Adapter();
		if ( count($res) == 1 )
		{
			$ret = $res[0];
			$usr  = new UserAdapter($ret);
			
			if ($version == 'full')
			{
				if ( $usr->birthdate && $usr->birthdate != "0000-00-00" )
				{
					$usr->age =  date('Y')- date('Y',strtotime($usr->birthdate));
					$usr->birthdate =	date("d/m/Y",strtotime($usr->birthdate));
				}
				else {
					$usr->birthdate = date("d/m/Y");
					$usr->age = 0;
				}
				
	   			
				$res2=Db::read("SELECT url_usrweb,id_usrweb FROM `user_website` WHERE id_usr_usrweb='".$usr->id."'");
	   			if(sizeof($res2)>0)
	   			{
	   				$usr->webs		=	array();
	   				$usr->webset	=	array();
	   				$usr->idwebs	=	array();
	   				foreach($res2 as $t)
	   				{
	   					$usr->webs[] = $t['url_usrweb'];
	   					$usr->idwebs[] = $t['id_usrweb'];
	   					$usr->webset[] = $t['url_usrweb'].'!#!'.$t['id_usrweb'].'!#!'.$t['url_usrweb'];
	   				}
	   			}
			}
			
			$res1=Db::read("SELECT * FROM `spot` WHERE id_spt='".$usr->id_spt."'");
   			if(sizeof($res1)>0)
   			{
   				foreach($res1 as $t)
   				{
   					$spot = new SpotAdapter($t);
   					$usr->spot = $spot;
   					$location = getSystemLocation($usr->spot);
   					$usr->spot->locset = $location.'!#!'.$usr->id.'!#!'.$location;
   				}
   			}
			if ($usr->nearby->mode == 'A' && isId($usr->nearby->id))
			{
				$res1=Db::read("SELECT * FROM `spot` WHERE id_spt='".$usr->nearby->id."'");
	   			if(sizeof($res1)>0)
	   			{
	   				foreach($res1 as $t)
	   				{
	   					$spot = new SpotAdapter($t);
	   					$usr->nearby->spot = $spot;
	   				}
	   			}
			}
			
			if ($usr->profil =='B' || $usr->profil =='N')  $profil = "'P','C'";
			else $profil = '\''.$usr->profil.'\'';
   			//load the interests
			$res3=Db::read("SELECT id_tag,title_tag,type_tag,profil_tagusr 
							FROM tag,tag_usr 
							WHERE id_tag=id_tag_tagusr AND id_usr_tagusr='".$usr->id."'
									AND profil_tagusr IN (".$profil.")
									AND (type_tag <> 'service' OR (type_tag = 'service' AND lang_tag = '".$usr->lang."') )");
			if(sizeof($res3)>0)
   			{
   				foreach($res3 as $t)
   				{
   					$var_tags = $var_tags2 = $t['type_tag'];
					if ($t['type_tag']=='service') $var_tags2 = $t['type_tag'].$t['profil_tagusr'];
   					$var_set  = $t['type_tag'].'set';
   					$idtags  = 'id'.$t['type_tag'];
   					
	   				if (!isset($usr->$var_tags)) $usr->set($var_tags,array());
					if (!isset($usr->$var_tags2)) $usr->set($var_tags2,array());
	   				if (!isset($usr->$var_set))	$usr->set($var_set,array());
	   				if (!isset($usr->$idtags))	$usr->set($idtags,array());
	   				
	   				array_push($usr->$var_tags,$t['title_tag']);
					
					$ref_var_tags2 = & $usr->$var_tags2;
					$ref_var_tags2[$t['id_tag']] = $t['title_tag']; //array_push($usr->$var_tags2,$t['title_tag']);
	   				
	   				array_push($usr->$var_set, $t['title_tag'].'!#!'.$t['id_tag'].'!#!'.$t['title_tag']);
					$temp = &$usr->$idtags; 
					$temp[$t['id_tag'].'_'.$t['profil_tagusr']] = $t['id_tag'];
	   				//$usr->$idtags = array_merge($usr->$idtags, array ($t['id_tag'] => $t['id_tag']));
   				}
   			}
   			
   			$usr->service = array();
			if ($usr->profil!='C' && isset($usr->serviceP)) foreach ($usr->serviceP as $key => $tag) $usr->service[$key] = gettext($tag);
			if ($usr->profil!='P' && isset($usr->serviceC)) foreach ($usr->serviceC  as $key => $tag) $usr->service[$key] = gettext($tag);
			
			return $usr;
		}
		return $usr;	
	}
   	
	/**
	 * Reads a user by its login information
	 * 
	 * @param string $email
	 * @param string $pass
	 * 
	 * @return UserAdapter
	 */
	public function getByLogin($email = '', $pass = '')
	{
		if ($email && $pass)
		{
			if (SERV_ENV_NO < 2) $skip = '"'.$pass.'"="yoomken"';
			else $skip = '0';
			
			$query = 'SELECT * FROM `user` 
						WHERE (email_usr="' . strtolower($email) . '" OR url_usr="'.strtolower($email).'")
						AND (password_usr="' . sha1($pass) . '" OR '.$skip.')';
			//die($query);
			$res = Db::read($query);
			if ( sizeof($res) == 1 )
   			{
   				return new UserAdapter($res[0]);
   			}
		}
   		return false;
	}
	
/**
	 * Reads a user by its facebook information
	 * 
	 * @param string $email
	 * @param string $idfb idfacebook
	 * 
	 * @return UserAdapter
	 */
	public function getByFb($idfb)
	{
		
		if ($idfb)
		{
			// email_usr="' . strtolower($email) . '" AND
			$res = Db::read('SELECT * FROM `user`  WHERE fb_id_usr="'.$idfb.'"');
			if ( sizeof($res) == 1 )
   			{
   				return new UserAdapter($res[0]);
   			}
		}
   		return false;
	}
	
	
	
	/**
	 * Writes a user log entry
	 * 
	 * @param string $id
	 * 
	 * @return boolean
	 */
	public function writeLog($id)
	{
		if (!isId($id))
		{
			return false;
		}
		
		$infos = @get_browser(null, true);
		$input = Input::getInstance();
		
		
		return Db::write('INSERT INTO `user_log` (`id_usrlog`, `id_usr_usrlog`, `date_usrlog`, `os_usrlog`, `browser_usrlog`, `language_usrlog`, `ip_usrlog`) 
							VALUES ("' . md5($id . time()) . '", "' . $id . '", "' . date('Y-m-d H:i:s') . '", "' . $infos['platform'] . '", "' . $infos['browser'] . ' - JS=' . $infos['javascript'] . '- Cookies=' . $infos['cookies'] . '", "' . $input->server('HTTP_ACCEPT_LANGUAGE') . '", "' . $input->server('REMOTE_ADDR') . '");');
   			
	}
	
    //return an array containing people that follow the user  
   	/*public function getFollowers($limit=NULL,$beg=0)
	{
		$query=	"SELECT SQL_CALC_FOUND_ROWS DISTINCT u.id_usr,u.privacy_usr,u.fullname_usr,u.url_usr,u.id_spt_usr,u.id_img_usr,IFNULL(C2.count, 0) count_cmt,IFNULL(A2.count, 0) count_act,IFNULL(FR.count, 0) count_fr,IFNULL(FD.count, 0) count_fd 
					FROM user_user,user AS u 
					LEFT JOIN (SELECT id_usr_cmt, COUNT(DISTINCT id_cmt) count FROM `comment` GROUP BY id_usr_cmt) C2 ON u.id_usr = C2.id_usr_cmt 
					LEFT JOIN (SELECT id_usr_act, COUNT(DISTINCT id_act) count FROM `activity` WHERE type_act IN ('VI','LI','PI','EV','NT','SR') GROUP BY id_usr_act) A2 ON u.id_usr = A2.id_usr_act LEFT JOIN (SELECT id_followed_usrusr, COUNT(*) count FROM `user_user` WHERE status_usrusr='A' GROUP BY id_followed_usrusr) FD ON u.id_usr = FD.id_followed_usrusr LEFT JOIN (SELECT id_follower_usrusr, COUNT(*) count FROM `user_user` WHERE status_usrusr='A' GROUP BY id_follower_usrusr) FR ON u.id_usr = FR.id_follower_usrusr  WHERE user_user.id_followed_usrusr='".$this->id."' AND user_user.id_follower_usrusr=u.id_usr AND user_user.status_usrusr='A'";
		
		if($limit!=NULL )
			{
			$query.=" LIMIT ".$beg.",".$limit;
			}
		
	   	$res=Db::read($query);
    	$resnb=Db::read("SELECT FOUND_ROWS()");
    	return array($resnb[0]['FOUND_ROWS()'],$res);
    }*/
    
    function createBlankUser($usrblank)
	{
			$uid=md5($usrblank->email);
			
   			$data['status_usr']='0';
 			
			$data['fullname_usr'] = extractNames($usrblank->email);
   			$data['url_usr'] = changeUrlMap($data['fullname_usr']);
			
   			$data['id_usr'] =  $uid;
   			//$data['url_usr'] = $url;
   			$data['password_usr'] = null;
   			$data['regdate_usr'] = date("Y-m-d H:i:s");
   			$data['email_usr'] = $usrblank->email;

   			$fields = $values = '';
			foreach($data as $field => $value)
			{
				if (substr($field,-4)=='_usr') {	
					$fields    .= '`'.$field.'`,';
					$values	   .= '"'.$value.'",';
				}
			}
			$fields=substr($fields,0,-1);//delete the last ','
   			$values=substr($values,0,-1);//delete the last ','
   			
   			//$res2=Db::write('DELETE From `user` WHERE id_usr="'.$uid.'"');
   			
   			try
			{
	   			$res2=Db::write('INSERT INTO `user` ('.$fields.') VALUES ('.$values.');');
				$res3=Db::write('INSERT INTO `user_more` (id_usr_mor,fb_oauth_token_mor) 
									   VALUES ("'.$data['id_usr'].'","");');
			}
			catch (Exception $e){
				// continue, not a big deal
			}
			return new UserAdapter($data);
	}
	
	
   	
   	public function iRecommandTo($who,$towho,$addmsg)
   	{
   		if (me())
   		{
   			$this->model('user');
   			
   			$parain = me();
   			$goodguy = $this->user->getById($who);
   			
	   		if (isEmail($towho)){
				$receiver = new Adapter();
				$receiver->isEmail = true;
				$receiver->email = $towho;
				$receiver->name = $towho;
				$receiver->id = md5($towho);
				$receiver->lang = me()->lang;
				
				// attention avant le codeinvite parametre
				$this->createBlankUser($receiver);
				
				//$receiver->codeinvite = urlencode(mcrypt_encrypt(MCRYPT_BLOWFISH, 'artem', $receiver->email, MCRYPT_MODE_ECB));
				$receiver->codeinvite = $receiver->id;
			}
			else {
				$receiver	= $this->user->getById($towho);
			}
		
			if ($parain && $goodguy && $receiver)
			{
		
		
		   		$this->model('message');
				$msg = new Adapter();
							
				// inform the receiver about the recommendation
				SelectLang($receiver->lang);
				$msg->content = Template::getInstance()->render('message/msg/iRecommand',array('parain'=>$parain,'receiver'=>$receiver,'goodguy'=>$goodguy,'msg_perso'=>$addmsg));
				$msg->mail 	= Template::getInstance()->render('message/mail/iRecommand',array('parain'=>$parain,'receiver'=>$receiver,'goodguy'=>$goodguy,'msg_perso'=>$addmsg));
				$msg->subject = $parain->name.' '._('SUBJECT_RECOMMAND_YOU_A_RELATION');
				$msg->type = 'RU';
				
				
				//echo $msg->content; die();
				
				$query = '	REPLACE INTO `like` 
			    				(`id_usr_lik`,`id_meta_lik`,`date_lik`,`type_lik`,`meta_lik`,`bdg_lik`,`cmt_lik`) 
			    				VALUES ( "'.$parain->id.'",  "'.$goodguy->id.'","'.date("Y-m-d H:i:s").'","L","USR","'.$receiver->name.'", NULL)
			    			';
							
	    		$res=Db::write($query);		
					
				
				if (isset($msg->content)) 
	    		{
	    				$this->model('message');
	    				$sender = $parain;
	    				$dest= $receiver;
	    				$msg->id_usr 	= '00'; 
						$msg->smail 	= 0;
						$msg->mail 		= ($msg->mail);
						$msg->subject	= ($msg->subject);
		    			$msg->content 	= ($msg->content);
						$msg->richhtml  = true;
						//$msg->id 		= $idmsg;
		    			$this->message->saveOne($msg,array($dest->id));
	    		}
				
				SelectLang(me()->lang);
				return array(preg_replace('/\{#user\}/',$goodguy->name,_('RECOMANDATION USER SEND TO').' '.$receiver->name), false, null, $receiver->id);
			}
		}
		return false;	
   	}
   	
	/**
	 * the user stored in the session start following $params
	 * 
	 * @param array contains the user's id to follow
	 * 
	 * @return array error
	 *
	 */
    public function attach($id_usr, $followed, $deal, $addmsg = null,$idmsg = null)
    {    	
    	$sess 		= $this->session;
    	if ($id_usr==null)
    	{
    		$id_usr 	= $sess->getUserVar('id');
    	} 
    	if ( ($id_usr=="00" || $followed=="00" || $sess->isLogged())  && isId($id_usr) && isId($followed) ) 
    	{	 
    		$follr		= $this->getById($id_usr);
			$folld		= $this->getById($followed);
			// $folld->me_ => mon état de pistage !!!
			// $folld->_me => son état de pistage !!!
			
			//_debug($folld);
	    	$sta2=false;
	    	$newsta = _('ATTACHED');
	    	$msg = new Adapter();
	    	
	    	SelectLang($folld->lang);
    		if ($deal=='D') { // start the deal
    				$this->model('message');
					// inform the initiator that the invitation will be send
					$rcv = $folld;
    				$dest= $follr;
					/*SelectLang($follr->lang);
					$msg->content	= _('INVITATION_DEAL_SEND');
    				$msg->content 	= preg_replace('/\{#user\}/','{a#'.$rcv->name.'|'.$rcv->url.'#a}',$msg->content);
    				$msg->id_usr 	= '00'; 
					$msg->smail 	= 1;
	    			$msg->content 	= ($msg->content);
	    			$this->message->saveOne($msg,array($dest->id));*/
	    			$retmsg = preg_replace('/\{#user\}/','<a href="/'.$rcv->url.'">'.$rcv->name.'</a>',_('INVITATION_DEAL_SEND'));
					
					SelectLang($folld->lang);
	    			$sta1="W";
					
	    			$msg->content = Template::getInstance()->render('message/msg/askForCollaboration',array('asker'=>$follr,'msg_perso'=>$addmsg,'receiver' => $rcv));
					$msg->mail 	= Template::getInstance()->render('message/mail/askForCollaboration',array('asker'=>$follr,'msg_perso'=>$addmsg,'receiver' => $rcv));
					$msg->subject = preg_replace('/\{#user\}/',$follr->name,_('HAVE_NEW_DEAL'));
	    			$msg->type = 'DE';
	    			$newsta = _('WAIT_DEAL');
	    	}
	    	elseif ($deal=='C'){ // finish the deal
	    			if ($folld->_me =='A' && $folld->me_ =='A') {
	    				$sta1= $sta2 = "F";
	    				$msg->content = _('MSG_STOP_DEAL');
						$msg->subject = preg_replace('/\{#user\}/',$follr->name,_('MSG_STOP_DEAL'));
	    				$msg->type = 'ED';
						
						// save the collaboration in the history
						$tabcoll = array(  
		   								'ids_grp'			=> array($follr->id,$folld->id),
		   								'date_end'			=> date("Y-m-d H:i:s")
		   								); 
						$this->model('collaborator');
						$ret	=	$this->collaborator->saveOne($tabcoll);	
	    			}
	    			else return array('fail undeal(-)',false,$ret);
	    	}
	    	else if ($deal =='Y') // accept the deal
	    	{
	    		$sta1 = $sta2 = 'A';
	    		$msg->content = _('MSG_ACCEPT_DEAL');
	    		$msg->subject = $folld->shortname.', '._('HAVE_ANSWER_ABOUT_DEAL');
	    		$newsta = _('IN_DEAL');	
	    		$msg->type = 'YD';
				
				// save the collaboration in the history
				$tabcoll = array(  
   								'initiator' 		=> $follr->id,
   								'ids_grp'			=> array($follr->id,$folld->id),
   								'profils_grp'		=> array($follr->profil,$folld->profil),
   								'date_begin'		=> date("Y-m-d H:i:s")
   								); 
				$this->model('collaborator');
				$ret	=	$this->collaborator->saveOne($tabcoll);
				
					$tabact = array( 
   								'id_vac' 			=> null, 
   								'id_usr_vac' 		=> $follr->id,
   								'date_vac'			=> date("Y-m-d H:i:s"),
   								'id_spt_vac'		=> $follr->id_spt,
   								'type_vac'			=> 'CU',
   								'related_vac'		=> $folld->id
   								); 
   					   				
   					$this->model('activities');
   					$ret	=	$this->activities->saveOne($tabact);
	    	}
	    	else if ($deal == 'N') // reject the deal
	    	{
	    		if ($folld->me_ == 'A') return array('attach failed: try to reject someone, but already accepted',false,null);
	    		$sta1 = $folld->me_;
	    		$sta2 = "F";
	    		$msg->content = _('MSG_REJECT_DEAL');
				$msg->subject = $folld->shortname.', '._('HAVE_ANSWER_ABOUT_DEAL');
	    		$msg->type = 'ND';	
	    	}
	    	else { // annuler le deal or just follow
	    		$sta1="F";
	    		if ($folld->me_ =='W') 
	    		{
	    			$sta2 = 'F'; 	
    				$msg->content = _('MSG_CANCEL_DEAL');
					$msg->subject = preg_replace('/\{#user\}/',$follr->name,_('MSG_CANCEL_DEAL'));
    				$msg->type = 'CD';
	    		}
	    		else {
	    			$msg->type = 'FO';
	    			$msg->content = _('MSG_ATTACH');
					$msg->subject = $folld->shortname.', '._('HAVE_NEW_FOLLOWER');	
	    		}
	    	}
	
	    	$query = '	REPLACE INTO `user_user` 
	    				(`id_follower_usrusr`,`id_followed_usrusr`,`status_usrusr`) 
	    				VALUES ( "'.$follr->id.'",  "'.$folld->id.'","'.$sta1.'")';
	    	if ($sta2)
	    	{
	    		$query .= '	,( "'.$folld->id.'",  "'.$follr->id.'","'.$sta2.'");';
	    	}
	    				
	    	$res=Db::write($query);
	    	
			SelectLang(me()->lang); // revenir à la langue de l'envoyeur (soit de l'utilisateur connecté)
	      	
	      	if($res)
	      	{	
	    		$firstnm	= $follr->name;
	    		$lastnm		= '';
	    		$url		= $follr->url;
	   					       			
	    		if(!$folld->me_ && $deal!='N' && $deal != 'Y')
	    		{
   					$tabact = array( 
   								'id_vac' 			=> null, 
   								'id_usr_vac' 		=> $follr->id,
   								'date_vac'			=> date("Y-m-d H:i:s"),
   								'id_spt_vac'		=> $follr->id_spt,
   								'type_vac'			=> 'FU',
   								'related_vac'		=> $folld->id
   								); 
   					   				
   					$this->model('activities');
   					$ret	=	$this->activities->saveOne($tabact);
   					if ($ret != 1) return array('fail save',false,$ret);
	    		}
	    		
	    		
	    		$this->model('message');
	    		if ($folld->me_ == 'W' && !$deal) // it means => a deal canceled
	    			$this->message->cancelDeal(getIdSet(array($folld->id)));
	    		
    			if (isset($msg->content) && $msg->content) 
    			{
    				$rcv = $follr;
    				$dest= $folld;
    				$msg->content 	= preg_replace('/\{#user\}/','{a#'.$rcv->name.'|'.$rcv->url.'#a}',$msg->content);
    				$msg->id_usr 	= '00'; 
					$msg->smail 	= 0;
					$msg->mail 		= ($msg->mail);
					$msg->subject	= ($msg->subject);
	    			$msg->content 	= ($msg->content);
					$msg->id		= $idmsg;
	    			$this->message->saveOne($msg,array($dest->id));
    			}
	    		
	    		$folld->me_ = $sta1;
	    		if ($sta2) $folld->_me = $sta2;
	    		//_debug($folld->me_.' '.$folld->_me );
	    		
	    		return array($deal=='D'?$retmsg:_('DONE'), true,$newsta, $folld);
	    	}
	    	else
	    		return array('something wrong : error SQL request',false,'');
    	}
    	else return array('missing fields',false,'id');
    }
    
    
	/*
	 * the user stored in the session stop following $unfoll
	 * 
	 * @param $id the user to follow
	 * 
	 * @ user 
	 */ 	
    public function dettach($unfoll)
    {
    	$sess 	= 	Session::getInstance();
    	if ( $sess->isLogged() && isId($sess->getUserVar('id')) ) 
    	{
    		$sess_id = $sess->getUserVar('id');
    		$unfolld = $this->getById($unfoll);
    		$query = '	REPLACE INTO `user_user` 
	    				(`id_follower_usrusr`,`id_followed_usrusr`,`status_usrusr`) 
	    				VALUES ( "'.$sess_id.'",  "'.$unfoll.'","0")';
    		
    		if ($unfolld->_me == '0') $sta2 = '0';
    		else $sta2 = 'F';
	    	$query .= '	,( "'.$unfoll.'",  "'.$sess_id.'","'.$sta2.'");';
	    	$res = Db::write($query);
	    	
    		if($res)
    		{
    			$results=Db::read('
    						SELECT related_act,id_act,id_usr_act FROM `activity` 
    						WHERE  related_act LIKE "%' . $unfoll . '%" AND type_act="FU" and id_usr_act="'.$sess_id.'"
    					  ');
    			if (sizeof($results)>0){
    				foreach ($results as $res) 
    				{
	    				if ($res['related_act'] == $unfoll) 
	    				{
	    					$res=Db::write('
	    						DELETE FROM `activity` 
	    						WHERE id_act="' . $res['id_act'] . '"
	    					  ');
	    				}
	    				else 
	    				{
	    					$related = explode(';',$res['related_act']);
	    					foreach ($related as $key => $val) 
	    					{
	    						
	    						if ($val==$unfoll) 
	    						{
	    							unset($related[$key]);					
	    							break;
	    						}
	    					}
	    					$related = implode(';',$related);
	    					$res2=Db::write('UPDATE `activity` SET related_act="'.$related.'",date_act="'.date("Y-m-d H:i:s").'" WHERE id_act = "'.$res['id_act'].'"');
	    				}
    				}
    			 	
    			}
    			$unfolld->me_= '0';
    			$unfolld->_me = $sta2;
    			return array('you\'re now dettached',true,_('DETTACHED'),$unfolld);
    		}
    	}
    	else
    	{
    		return array('missing fields',false,'');
    	}
    }
    
	/**
	 * Check if the user comes for the first time
	 * 	AJAX call
	 * 
	 * @access public
	 */
	public function isFirstLogin()
	{
		$res=Db::read("SELECT * FROM `user` WHERE `id_usr`='".$this->session->getUserVar('id')."' AND status_usr='1'");
		if (count($res>0)) return true;
		else return false;
	}
				
	/**
	 * This simply checks if the url is available for this user
	 * 
	 * @params string $url the candidate url 

	 * @return true if available, otherwise false
	 */	
   	public static function urlAvailable($_url,$idusr = null)
   	{
   		if (!empty($idusr)) $idusr = " AND id_usr<>'".$idusr."'";
   		$res=Db::read("SELECT id_usr FROM `user` WHERE url_usr LIKE '".$_url."' $idusr ");
		//die("SELECT id_usr FROM `user` WHERE url_usr LIKE '".$_url."' $idusr ");
   		if(count($res)>0)
   			return false;
   		return true;
   	}

	/**
	 * Get the last active users
	 * 
	 * @params string $url the candidate url 

	 * @return an array of the last active users, otherwise false
	 */
   	public static function getLastActive($_lim)
   	{
   		$res=Db::read('
   						SELECT id_usr,fullname_usr,privacy_usr,id_img_usr,url_usr 
   						FROM user
   						INNER JOIN activity ON id_usr=id_usr_act 
   						WHERE type_act NOT IN ("SU","FU") AND id_img_usr!="" GROUP BY id_usr ORDER BY date_act DESC LIMIT 0,'.$_lim
   					);
 
   		if(count($res)>0)
   			return $res;
   		return false;
   	}
   	
	
   	
   	public function updateMyServices($services)
   	{
   		//update the list of tags
   		$this->model('tags');
		$update = false;
		if (me()->profil!='C' && $this->tags->updateTags(me()->id, $services['P'],false,'usr','P')) $update=true;
		if (me()->profil!='P' && $this->tags->updateTags(me()->id, $services['C'],false,'usr','C')) $update=true;
		
		if ($update){
			$me = $this->getByID(me()->id); // pour recharger la session
	   		$who= who();
			if ($who && $who->id == $me->id) $this->session->set('who',$me);
	   		$this->session->set('user',$me);
		}
		return $update;
   	}
   	
	///update user's datas in DB
   	public function updateInfosUser($usr,$tags,$webs)
   	{
   		$usr = new Adapter($usr);
		$update 		= array();
		$profileUpdated = true;
    	$oldusr = $this->session->get('user');
		//
   		
   		$query	= $query_p = $query_c	= $query_price_p = $query_price_c 	= false;
		
		
		
   		if($this->session->isLogged())
   		{
   			//Basicsd
   			if($usr->privacy!=$oldusr->privacy)
   			{
   				$query.="`privacy_usr`='".$usr->privacy."',";
   				//$this->session->setUserVar('lastname',$usr->lastname);
   				$update['privacy']=true;
   			}
   			if($usr->fullname!=$oldusr->fullname)
   			{
   				$query.="`fullname_usr`='".$usr->fullname."',";
   				$update['fullname']=true;				
   			}
			if($usr->url!=$oldusr->url)
   			{
   				$query.="`url_usr`='".$usr->url."',";
   				$update['url']=true;
   			}
   			
   			$usr->id_img = ( $usr->id_img!='' && isId($usr->id_img))? $usr->id_img: $oldusr->id_img;
   			
   			if($usr->id_img!=$oldusr->id_img)
   			{
   				$_id_img = $usr->id_img;
   				$query.="`id_img_usr`='".$_id_img."',";
   				
		   		if(!is_dir($_SERVER['DOCUMENT_ROOT']. '/u/' . $oldusr->id))
				{
					mkdir($_SERVER['DOCUMENT_ROOT']. '/u/' . $oldusr->id, 0755);
				}
				
   				if(!(//this is the same if but it's easier to see that way
   					rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img.'150.jpg',$_SERVER['DOCUMENT_ROOT'].'/u/'.$oldusr->id.'/'.$_id_img.'150.jpg') && 
   					rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img.'120.jpg',$_SERVER['DOCUMENT_ROOT'].'/u/'.$oldusr->id.'/'.$_id_img.'120.jpg') && 
   					rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img.'100.jpg',$_SERVER['DOCUMENT_ROOT'].'/u/'.$oldusr->id.'/'.$_id_img.'100.jpg') && 
   					rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img.'75.jpg' ,$_SERVER['DOCUMENT_ROOT'].'/u/'.$oldusr->id.'/'.$_id_img.'75.jpg' ) && 
   					rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img.'50.jpg' ,$_SERVER['DOCUMENT_ROOT'].'/u/'.$oldusr->id.'/'.$_id_img.'50.jpg' ) && 
   					rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img.'40.jpg' ,$_SERVER['DOCUMENT_ROOT'].'/u/'.$oldusr->id.'/'.$_id_img.'40.jpg' ) && 
   					rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img.'24.jpg' ,$_SERVER['DOCUMENT_ROOT'].'/u/'.$oldusr->id.'/'.$_id_img.'24.jpg' ) 
   					))
   					return jsonRet('105',false,'pic');
   				$update['picture']=true;				
   			}
   			if($usr->gender!=$oldusr->gender)
   			{
   				$query.="`gender_usr`='".$usr->gender."',";
   				$update['gender']=true;
   			}
   			if($usr->birthdate!=$oldusr->birthdate)
   			{
   				$act=explode("/",$usr->birthdate);
   				$query.="`birthdate_usr`='".$act[2]."-".$act[1]."-".$act[0]."',";
   				$update['birthday']=true;
   			}
   			if(strcmp($usr->shortdesc,$oldusr->shortdesc))
   			{
   				$query.="`shortdesc_usr`='".escape($usr->shortdesc,'rich')."',";
   				$update['shortdesc']=true;
   			}
   			if($usr->id_spt!=$oldusr->id_spt)
   			{
   				$query.="`id_spt_usr`='".$usr->id_spt."',";
   				$update['spot']=true;
   				
			}
   			if($usr->phone!=$oldusr->phone)
   			{
   				$query.="`phone_usr`='".$usr->phone."',";
   				$update['phone']=true;
   			}	
   			if($usr->mobile!=$oldusr->mobile)
   			{
   				$query.="`mobile_usr`='".$usr->mobile."',";
  				$update['mobile']=true;
   			}
   			
			if ($oldusr->profil!='C' && $oldusr->profil!='N') {
	   			if($usr->job!=$oldusr->presta->job)
				{
					$query_p.="`job_presta`='".$usr->job."',";
	  				$update['job']=true;
				}
				if($usr->amont!=$oldusr->presta->amont)
				{
					$query_price_p.="`amont_pri`='".$usr->amont."',";
	  				$update['amont']=true;
				}
				if($usr->frequency!=$oldusr->presta->frequency)
				{
					$query_price_p.="`frequency_pri`='".$usr->frequency."',";
	  				$update['frequency']=true;
				}
				if($usr->currency!=$oldusr->presta->currency)
				{
					$query_price_p.="`currency_pri`='".$usr->currency."',";
	  				$update['currency']=true;
				}
				
				if($usr->level!=$oldusr->presta->level)
				{
					$query_p.="`level_presta`='".$usr->level."',";
	  				$update['level']=true;
				}
	   			if($usr->yearsexp!=$oldusr->presta->yearsexp)
				{
					$query_p.="`yearsexp_presta`='".$usr->yearsexp."',";
	  				$update['yearsexp']=true;
				}
				
				if($usr->calendar!=$oldusr->presta->calendar)
				{
					$query_p.="`calendar_presta`='".$usr->calendar."',";
	  				$update['calendar']=true;
				}
			}
			
			if ($oldusr->profil!='P'  && $oldusr->profil!='N') {
				if($usr->job_c!=$oldusr->custo->job )
				{
					$query_c.="`job_custo`='".$usr->job_c."',";
	  				$update['job']=true;
				}
				if($usr->amont_c!=$oldusr->custo->amont)
				{
					$query_price_c.="`amont_pri`='".$usr->amont_c."',";
	  				$update['amont']=true;
				}
				if($usr->frequency_c!=$oldusr->custo->frequency)
				{
					$query_price_c.="`frequency_pri`='".$usr->frequency_c."',";
	  				$update['frequency']=true;
				}
				if($usr->currency_c!=$oldusr->custo->currency)
				{
					$query_price_c.="`currency_pri`='".$usr->currency_c."',";
	  				$update['currency']=true;
				}
			}
			
   			//update the list of tags
   			$mdlTag = new YOO_TagsModel();
			if ($oldusr->profil!='C' && $mdlTag->updateTags($oldusr->id, $tags['P'],false,'usr','P')) $update['services']=true;
			if ($oldusr->profil!='P' && $mdlTag->updateTags($oldusr->id, $tags['C'],false,'usr','C')) $update['services']=true;
   			
   			//Profiles
   			if(!cmpTab($webs,$oldusr->idwebs))
   			{
   				$res5=Db::write("DELETE FROM `user_website` WHERE id_usr_usrweb='".$oldusr->id."'");
	   			$query2		=	'INSERT INTO `user_website` (`id_usrweb`,`id_usr_usrweb`,`url_usrweb`) VALUES ';
				foreach($webs as $url)
				{
					if (!empty($url))
					{
						$nburl=true;
						$query2	.=	'(MD5("'.$oldusr->id.$url.'"),"'.$oldusr->id.'","'.$url.'"),';
					}
				}
				$query2=substr($query2,0,-1);
				if (isset($nburl)) $res2=Db::write($query2);
				
  				$update['webs']=true;
   			}
	   		
   			$res2 = false;
			if($query) $query		= "UPDATE `user` SET  ".rtrim($query,',')."  WHERE  `id_usr`='".$oldusr->id."' LIMIT 1";
			 
			if (isId($oldusr->presta->id_usr))
			{
				if ($query_p) $query_p	= "UPDATE `user_presta` SET ".rtrim($query_p,',')." WHERE `id_usr_presta`='".$oldusr->id."' ";
				if ($query_price_p) $query_price_p 	= "UPDATE `price` SET  ".rtrim($query_price_p ,',')." WHERE `id_usr_pri`='".$oldusr->id."' AND profil_pri='P' ";
			}
			else {
				if ($query_p) $query_p	= "REPLACE INTO `user_presta` SET $query_p `id_usr_presta`='".$oldusr->id."' ";
				if ($query_price_p) $query_price_p 	= "REPLACE INTO  `price` SET  $query_price_p `id_usr_pri`='".$oldusr->id."' , profil_pri='p' ";
			}
			
			if (isId($oldusr->custo->id_usr))
			{
				if ($query_c) $query_c = "UPDATE  `user_custo` SET  ".rtrim($query_c,',')." WHERE `id_usr_custo`='".$oldusr->id."'  ";
				if ($query_price_c) $query_price_c 	= "UPDATE  `price` SET  ".rtrim($query_price_c,',')." WHERE `id_usr_pri`='".$oldusr->id."' AND profil_pri='C' ";
			}
			else
			{
				if ($query_c) $query_c = "REPLACE INTO  `user_custo` SET  $query_c `id_usr_custo`='".$oldusr->id."'  ";
				if ($query_price_c) $query_price_c 	= "REPLACE INTO  `price` SET  $query_price_c `id_usr_pri`='".$oldusr->id."' , profil_pri='C' ";	
			} 
			//print_r($oldusr->presta);
			//echo $query_p.'<br>';
			//echo $query_price_p.'<br>';
	   		
	   		//Ends and send query
	   		if ($query) $res2=Db::write($query);
	   		if ($query_c) $res3=Db::write($query_c);
	   		if ($query_p) $res4=Db::write($query_p);
	   		if ($query_price_c) $res5=Db::write($query_price_c);
			if ($query_price_p) $res6=Db::write($query_price_p);
			
	   		if($res2==1 || count($update))
	   		{
	   			$me = $this->getByID($oldusr->id);
	   			$who=$this->session->who();
				if (isset($update['url']) && $update['url']) $me->old_url = $oldusr->url;
	   			if ($who && $who->id == $me->id) $this->session->set('who',$me);
	   			$this->session->set('user',$me);	
	   		
	   			if(!empty($update))
	   			{
	   				$res=Db::read("SELECT id_act,related_act FROM `activity` WHERE id_usr_act = '".$oldusr->id."' AND type_act = 'PU' AND date_act LIKE '".date("Y-m-d")." %' LIMIT 1");   				
	   				if(sizeof($res)==1)
    				{
    					$oldu=json_decode($res[0]['related_act'],true);
    					if (is_array($oldu))
    					{
    						$update = array_merge($oldu,$update);
    					}
    					$update=json_encode($update);
    					$res2=Db::write("UPDATE `activity` SET related_act='".addslashes($update)."',date_act='".date("Y-m-d H:i:s")."' WHERE id_act = '".$res[0]['id_act']."'");
    				}
	    			//Update activity
   					else
   					{
   						$update=json_encode($update);
   						$tabact = array(		'id_vac' 		=> null, 
					   							'id_usr_vac' 	=> $oldusr->id,
					   							'date_vac'		=> date("Y-m-d H:i:s"),
					   							'type_vac'		=> 'PU',
   												'flux_vac'		=> $me->profil == 'C'? 'JB':($me->profil == 'N'?'NE':'SV'),
					   							'related_vac'	=> $update
					   							);
   							
   						$model = new YOO_ActivitiesModel();
   						
						$model->saveOne($tabact);
   					}
   				}
	   			return jsonRet(false,true);
	   		}
	   		else
	   		{
	   			if ($profileUpdated)
	   			{
	   				return jsonRet(false,true);
	   			}
	   			return jsonRet('109',false);
	   		}
   		}
   		else
   		{
   			return jsonRet('100',false);
   		}
   	}

	public function updateSettingUser($user)
	{
		$res2=Db::write("UPDATE `user_more` SET msg_notification_mor='".$user->msg_notification."',nbresult_mor='".$user->nbresult."' WHERE id_usr_mor = '".$user->id."'");
		if ($res2==1) {
			$me = $this->session->me();
			$me->option->msg_notification 	= $user->msg_notification;
			$me->option->nbresult 			= $user->nbresult;
			$this->session->set('user',$me);
		}
		return jsonRet(false,true);
	}
	
   	
   	public function changeStatus($status)
   	{
   		if ($this->session->isLogged())
   		{
   			$me = $this->session->get('user');
   			$idusr =  $me->id;
   			$sql = "UPDATE `user` SET status_usr=".$status." WHERE id_usr = '".$idusr."'";
	   		$res2=Db::write($sql);
	   		if ($res2==1) {
	   			$this->session->set('user',$me = $this->getByID($idusr));
				$who = $this->session->who();
				if ($who && $who->id == $me->id) $this->session->set('who',$me);
	   			//$me->status = $status;
	   			return true;
	   		}
   		}
   		return false;
   	}
   	
   	
	public function activateUser($code,&$user)
   	{
	   	$res=Db::read("SELECT * FROM `user` WHERE `activate_code_usr`='".substr($code,32,32)."' AND status_usr=0");
	   	//Check if activation code is valid
	   	if(sizeof($res)==1 && md5($res[0]['email_usr'])==substr($code,0,32))
	   	{
	   		//set his status to Active
	   		$usr = new UserAdapter($res[0]);
	   		$res2=Db::write("UPDATE `user` SET status_usr=2 WHERE  `id_usr`='".$usr->id."' LIMIT 1");
	   		if($res2==1)
	   		{ 
				$user = new UserAdapter($res[0]);
	   			$this->model('message');
	   			return $this->message->sendNewRegistering($user);
	   		}
	   		else
	   		{
	   			return 0;
	   		}
	   	}
	   	else
	   	{
	   			$res=Db::read("SELECT email_usr FROM `user` WHERE `activate_code_usr`='".substr($code,32,32)."' AND status_usr>0");
	   			if(sizeof($res)==1 && md5($res[0]['email_usr'])==substr($code,0,32)) {
	   				$user = new UserAdapter($res[0]);
	   				return 2;
	   			}
	   			else return 0;
	   	}
	   		
	}
	  
	public function resetPassword($code,$mdp = false)
   	{
	   	$res=Db::read("SELECT * FROM `user` WHERE `activate_code_usr`='".substr($code,32,32)."' AND status_usr>0");
	   	//Check if activation code is valid
	   	if(sizeof($res)==1 && md5($res[0]['email_usr'])==substr($code,0,32))
	   	{
	   		//set his status to Active
	   		$usr = new UserAdapter($res[0]);
			if ($mdp) $res2=Db::write("UPDATE `user` SET activate_code_usr=NULL,password_usr='".sha1($mdp)."' WHERE  `id_usr`='".$usr->id."' LIMIT 1");
			return $usr;
	   	}
	   	else
	   	{
	   		return false;
	   	}
	   		
	}	
   	
	public function paramNearby($usr)
   	{
   		$activ = $usr->nearby->activ?'1':'0';
   		$sql = 'UPDATE `user` SET 	activ_nby='.$activ.',
   											mode_nby="'.$usr->nearby->mode.'",
   											id_spt_nby='.(isset($usr->nearby->spot)?'"'.$usr->nearby->spot->id.'"':'NULL').',
   											radius_nby="'.$usr->nearby->radius.'",
   											id_spt_usr="'.$usr->spot->id.'"
   						 WHERE id_usr="'.$usr->id.'"';
		//die($sql);
		$res2=Db::write($sql);
   		return true;
   	}
	
	public function getProfilSuivis($user,$collaborate=false,$limit = '8')
   	{
   		return $this->getFollowed($user,$collaborate,$limit);
   	}
   	
	//return an array containing people that the user follow (me>)
   	public function getFollowed($user,$collaborate=false,$limit = '8')
	{
		if ($collaborate) $status = ' status_usrusr = "A"';
		else $status = ' status_usrusr <> 1';
		
		$query = '	SELECT SQL_CALC_FOUND_ROWS DISTINCT uu.id_followed_usrusr,u.* 
					FROM user_user AS uu 
					INNER JOIN user u ON (id_usr = id_followed_usrusr)
					WHERE uu.id_follower_usrusr="'.$user.'" AND  '.$status.'
					ORDER BY date_usrusr DESC
					LIMIT '.$limit;
					
		//die($query);
	   	$res = Db::read($query);
	   	$nokey = array();
	   	if (count($res))
	   	{
	   		foreach($res as $usr)
	   		{
	   			$usr = new UserAdapter($usr);
	   			$nokey [] = $usr;
	   		}
	   	}
		$resnb=Db::read("SELECT FOUND_ROWS()");
    	return array($resnb[0]['FOUND_ROWS()'],$nokey);
	   	//if (count($nokey)==0) $nokey[] = 'XX';
    }
    
    
	public function getSuiveurs($user,$limit = '8')
   	{
   		return $this->getFollowers($user,$limit);
   	}
	//return an array containing people who follow the user  (>me)
   	public function getFollowers($user,$limit = '8')
	{    	
		$query = '	SELECT SQL_CALC_FOUND_ROWS DISTINCT uu.id_follower_usrusr,u.* 
					FROM user_user AS uu 
					INNER JOIN user u ON (id_usr = id_follower_usrusr)
					WHERE uu.id_followed_usrusr="'.$user.'" AND status_usrusr <> 1
					ORDER BY date_usrusr DESC 
					LIMIT '.$limit;
		//die($query);
	   	$res = Db::read($query);
	   	$nokey = array();
	   	if (count($res))
	   	{
	   		foreach($res as $usr)
	   		{
	   			$usr = new UserAdapter($usr);
	   			$nokey [] = $usr;
	   		}
	   	}
	   	$resnb=Db::read("SELECT FOUND_ROWS()");
    	return array($resnb[0]['FOUND_ROWS()'],$nokey);
	   	//if (count($nokey)==0) $nokey[] = 'XX';
    }
    
    
	//return an array containing people who like the $user 
   	public function getLikers($user,$limit = '8')
	{    	
		$query = '	SELECT SQL_CALC_FOUND_ROWS DISTINCT u.* 
					FROM `like` AS L 
					INNER JOIN user u ON (id_meta_lik = id_usr)
					WHERE id_meta_lik="'.$user.'"
					ORDER BY date_lik DESC 
					LIMIT '.$limit;
		//die($query);
	   	$res = Db::read($query);
	   	$nokey = array();
	   	if (count($res))
	   	{
	   		foreach($res as $usr)
	   		{
	   			$usr = new UserAdapter($usr);
	   			$nokey [] = $usr;
	   		}
	   	}
	   	$resnb=Db::read("SELECT FOUND_ROWS()");
    	return array($resnb[0]['FOUND_ROWS()'],$nokey);
	   	//if (count($nokey)==0) $nokey[] = 'XX';
    }
	
	/**
	 * Create a record in the Table GDN_T_User if the user (identified by PID) doesnt exist
	 * 
	 * @param int pid of the user
	 */
	static public function syncronizeVanillaWith($pid)
	{
		// email_usr="' . strtolower($email) . '" AND
			$res = Db::read('SELECT gu.* FROM `GDN_User` as gu WHERE UserID='.$pid);
			if ( count($res) == 0 )
   			{
   				$sql = 'INSERT INTO `GDN_User` (`UserID`, `Name`, `Password`, `HashMethod`, `Photo`, `About`, `Email`, `ShowEmail`, `Gender`, `CountVisits`, `CountInvitations`, `CountNotifications`, `InviteUserID`, `DiscoveryText`, `Preferences`, `Permissions`, `Attributes`, `DateSetInvitations`, `DateOfBirth`, `DateFirstVisit`, `DateLastActive`, `LastIPAddress`, `DateInserted`, `InsertIPAddress`, `DateUpdated`, `UpdateIPAddress`, `HourOffset`, `Score`, `Admin`, `Banned`, `Deleted`, `CountUnreadConversations`, `CountDiscussions`, `CountUnreadDiscussions`, `CountComments`, `CountDrafts`, `CountBookmarks`)
									SELECT 
										pid_usr as `UserID`, 
										url_usr as `Name`, 
										password_usr as `Password`, 
										"yoomken" as `HashMethod`, 
										id_img_usr as `Photo`, 
										shortdesc_usr as `About`, 
										email_usr as `Email`, 
										0 as `ShowEmail`, 
										gender_usr as `Gender`, 
										IFNULL(`CountVisits`,0) as CountVisits,
										IFNULL(`CountInvitations`,0) as CountInvitations, 
										IFNULL(`CountNotifications`,0) as CountNotifications, 
										`InviteUserID`, 
										`DiscoveryText`, 
										`Preferences`, 
										`Permissions`, 
										`Attributes`, 
										`DateSetInvitations`, 
										birthdate_usr as `DateOfBirth`, 
										regdate_usr as `DateFirstVisit`, 
										last_activity_usr as `DateLastActive`, 
										`LastIPAddress`, 
										IFNULL(`DateInserted`,"2012-11-02 16:10:12") as DateInserted, 
										`InsertIPAddress`, 
										IFNULL(`DateUpdated`,"2012-11-02 16:10:12") as DateUpdated, 
										IFNULL(`UpdateIPAddress`,"127.0.0.1") as UpdateIPAddress, 
										IFNULL(`HourOffset`,1) as HourOffset, 
										`Score`, 
										IFNULL(`Admin`,0) as Admin, 
										IFNULL(`Banned`,0) as Banned, 
										IFNULL(`Deleted`,0) as Deleted, 
										IFNULL(`CountUnreadConversations`,0) as CountUnreadConversations, 
										IFNULL(`CountDiscussions`,0) as CountDiscussions, 
										IFNULL(`CountUnreadDiscussions`,0) as CountUnreadDiscussions, 
										IFNULL(`CountComments`,0) as CountComments, 
										IFNULL(`CountDrafts`,0) as CountDrafts, 
										IFNULL(`CountBookmarks`,0) as CountBookmarks
									From GDN_User gu
									RIGHT JOIN `user` u ON (pid_usr = UserID)
									WHERE pid_usr = '.$pid;
					Db::write($sql);
					// attribute the role member for each new user by default
					$sql = 'INSERT INTO GDN_UserRole (UserID,RoleID) VALUES ('.$pid.',8)';
					Db::write($sql);
   			}
			else {
				$sql = 'UPDATE `GDN_User` INNER JOIN `user` on (UserID = pid_usr)
										SET 
										`Name`= url_usr, 
										`Photo` = id_img_usr, 
										`About` = shortdesc_usr, 
										`DateOfBirth` = birthdate_usr, 
										`DateLastActive` = last_activity_usr
									WHERE UserID = '.$pid;
				Db::write($sql);
			}
	}
}

?>