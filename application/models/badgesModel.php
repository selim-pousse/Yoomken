<?php
/**
 * Manifest
 * 
 * application/models/tagsModel.php
 * 
 * Model for tags
 * 
 * @copyright: Yoomken Li
 * 
 */
class YOO_BadgesModel extends YOO_LikeModel
{
	
 	/**
     * Gets all tags for a provided user
     * 
     * @param string $user ID
     * 
     * @return mixed array of tags
     * 
     * @access public
     */
    public function getByUser($user = '')
    {
    	// only a valid user
    	if (!isId($user))
    	{
    		return array();
    	}
    	
    	// vars
    	$return = array( 'others' => array(), 'shows' => array(), 'bands' => array(), 'books' => array(), 'brands' => array() );
    	
    	$tags 	= Db::read('SELECT id_tag, title_tag, type_tagusr FROM tag, tag_usr WHERE id_tag = id_tag_tagusr AND id_usr_tagusr="' . $user . '"');
		
    	// build return array
    	if(sizeof($tags)>0)
   		{
   			foreach($tags as $t)
   			{   						
   				$return[$t['type_tagusr']][$t['id_tag']] = $t['title_tag'];
   			}
   		}
   		return $return;    	
    	
    }
    
	public function getLike($_str, $types = '',$limit = 16, $beg='0' )
	{
		$_str = strtolower ($_str);
		if (empty($_str)) $_search = '1';
		else $_search = ' ( LOWER(title_bdg) LIKE(\'%'.$_str.'%\') OR ('.$this->aproximate.' AND SOUNDEX(title_bdg) = SOUNDEX("'.$_str.'")) )';
		
		$lang = $this->session->get('lang');
		
		if (empty($types)) $types = '1';
		else $types = ' type_bdg IN ("'.join('","',$types).'")';
		
		$res=Db::read('
						SELECT b.*,t.title_tag as parent_bdg FROM badge b 
						LEFT JOIN tag t ON (parent_bdg = id_tag and lang_tag = lang_bdg)
						WHERE '.$types.' AND lang_bdg = "'.$lang.'" AND '.$_search.' AND status_bdg > 0 
						ORDER BY order_tag, title_bdg
						LIMIT '.$beg.','.$limit.'
					');
	
   		if(count($res)>0)
   		{
   			foreach ($res as &$bdg) 
   			{
   				$bdg = new BadgeAdapter($bdg);
   			} 
			return $res; 
   		}
		else return false;	
	}
	
	public function getTitle($name)
	{
		$res=Db::read('SELECT title_bdg FROM tag WHERE name_bdg="'.$name.'" and lang_bdg="'.me()->lang.'"');
		if (count($res)==1) return $res[0]['title_bdg'];
		else return false;
	}
	
	public function getById($name,$lang = null)
	{
		if ($lang==null) $lang = $this->session->get('lang');
		$res=Db::read('SELECT * FROM badge WHERE name_bdg="'.$name.'" AND lang_bdg="'.$lang.'" LIMIT 1');
		
		if (count($res)==1) return new BadgeAdapter($res[0]);
		else return false;
	}

	public function getEarned($userid,$term = null)
	{
		$res 	= Db::read('SELECT b.* , COUNT(DISTINCT pid_lik) AS count_bdg 
										FROM `like` l
										INNER JOIN badge b ON (name_bdg = bdg_lik AND lang_bdg= "'.$this->session->get('lang').'")
										WHERE type_lik IN ("L","A") 
											AND id_meta_lik ="' . $userid . '" 
											AND meta_lik = "BDG"
										GROUP BY bdg_lik  HAVING COUNT(DISTINCT pid_lik) > 0');
										
		if(count($res)>0)
   		{
   			foreach ($res as &$bdg) 
   			{
   				$bdg = new BadgeAdapter($bdg);
				$earned[] = $bdg->name;
   			} 
			
			
			$plusres = Db::read('SELECT bdg_lik,u.*,c.*
										FROM `like` l
										INNER JOIN user u ON (id_meta_lik = id_usr)
										LEFT JOIN comment c ON (cmt_lik = pid_cmt)
										WHERE type_lik IN ("L","A") 
											AND id_meta_lik ="' . $userid . '" 
											AND bdg_lik IN ("'.join('","',$earned).'")
											AND meta_lik = "BDG"
										');
			
			foreach($plusres as $person){
				
			}
			return $res;
   		}
		else return false;	
	}

	/* 
   	 *  it accepts an ID hash to load Activity's datas from database
	 * 
	 * @param string $id
	 * 
	 * @return array including the Activity's datas
	 * 
	 */
	public function getAllWished( $limit = 50)
	{	

		$res	=	Db::read('
							SELECT a.*,b.status_bdg as status_vac, u.url_usr, u.id_img_usr, u.fullname_usr, u.privacy_usr, u.gender_usr, u.id_spt_usr
							FROM  view_activity AS a
							INNER JOIN `user` AS u ON a.id_usr_vac = u.id_usr
							INNER JOIN badge As b ON (related_vac = name_bdg AND lang_vac = lang_bdg AND lang_bdg = "'.$this->session->get('lang').'") 
							WHERE  type_bdg = "WISH" AND status_bdg < 0  LIMIT '.$limit.'
							');
   		if(count($res))
   		{
   			foreach ($res as &$act) {
				   $act =  new ActivityAdapter($act);
			 }
			
			$this->model('activities');
			$this->activities->getActivitiesSpots($res);
			$this->activities->getActivitiesCount($res);
			
			//$ret  	= $ret[0];
   			return $res;
   			
  	   	}
  	   	else return false;
		
	}
	
	/**
	 * the user stored in the session start following $params
	 * 
	 * @param array contains the user's id to follow
	 * 
	 * @return array error
	 *
	 */
    public function attach($id_usr, $towho, $bdgname, $deal, $addmsg = null, $idmsg = null)
    {   	
		$this->model('user');
		
		$sess 		= $this->session;
    	if ($id_usr==null)
    	{
    		$giver	= me();
    	}
		else if (isEmail($id_usr)){
			$giver = new Adapter();
			$giver->isEmail = true;
			$giver->email = $towho;
			$giver->name = $towho;
			$giver->id = md5($id_usr);
			$giver->lang = me()->lang;
			
			// attention avant le codeinvite parametre
			$this->user->createBlankUser($giver);
			//$giver->codeinvite = urlencode(mcrypt_encrypt(MCRYPT_BLOWFISH, 'artem', $receiver->email, MCRYPT_MODE_ECB));
			$giver->codeinvite = $giver->id;
		} 
		else {
			$giver	= $this->user->getById($id_usr);
		}
		
		if (isEmail($towho)){
			$receiver = new Adapter();
			$receiver->isEmail = true;
			$receiver->email = $towho;
			$receiver->name = $towho;
			$receiver->id = md5($towho);
			$receiver->lang = me()->lang;
			// attention avant le codeinvite parametre
			$this->user->createBlankUser($receiver);
			//$giver->codeinvite = urlencode(mcrypt_encrypt(MCRYPT_BLOWFISH, 'artem', $receiver->email, MCRYPT_MODE_ECB));
			$receiver->codeinvite = $receiver->id;
		}
		else {
			$receiver	= $this->user->getById($towho);
		}
		
		$bdg = $this->getById($bdgname,$receiver->lang);
		$bdggiv = $this->getById($bdgname,$giver->lang);
		
		$res = null;
		$query = '	SELECT * FROM  `like` 
	    				WHERE id_usr_lik = "'.$giver->id.'" AND  id_meta_lik = "'.$receiver->id.'" AND meta_lik="BDG" AND bdg_lik="'.$bdg->name.'"
	    			    ORDER BY pid_lik DESC
	    			';
					
		$res=Db::read($query);
		
		if (count($res)==1 && $res[0]['type_lik']!='D') {
			if ($deal =='GIV' && ($res[0]['type_lik']=='L' || $res[0]['type_lik']=='A' || $res[0]['type_lik']=='W' ) ) 
				return array(preg_replace('/\{#badge\}/',ucfirst($bdggiv->title), _('WARN_BADGE_ALREADY_GIVEN_BY').' '.$receiver->name), false, null, $receiver->id);
			else if ($deal =='ASK' && $res[0]['type_lik']=='L') 
				return array(preg_replace('/\{#badge\}/',ucfirst($bdg->title),_('WARN_BADGE_ASKED_ALREADY_GIVEN_BY').' '.$giver->name), false, null, $giver->id);
			else if ($deal =='ASK') 
				return array(preg_replace('/\{#badge\}/',ucfirst($bdg->title),_('WARN_BADGE_ALREADY_ASKED_TO').' '.$giver->name), false, null, $giver->id);
		}		
    	
    	if ( ($sess->isLogged())  && $giver && $bdg ) 
    	{
    		//die('sdkfksdj');	 
			//_debug($receiver);
	    	$sta2=false;
	    	$newsta = _('ATTACHED');
	    	$msg = new Adapter();
			$msg->richhtml = true;
			
	    	SelectLang($receiver->lang);
    		if ($deal=='GIV') { // give a badge
    				$this->model('message');
					
					// inform the receiver about the donative
					SelectLang($receiver->lang);
	    			$sta1="L";
	    			$msg->content = Template::getInstance()->render('message/msg/haveNewBadge',array('giver'=>$giver,'receiver'=>$receiver,'bdg'=>$bdg,'msg_perso'=>$addmsg));
					$msg->mail 	= Template::getInstance()->render('message/mail/haveNewBadge',array('giver'=>$giver,'receiver'=>$receiver,'bdg'=>$bdg,'msg_perso'=>$addmsg));
					$msg->subject = _('SUBJECT_HAVE_NEW_BADGE');
	    			$msg->type = 'RB';
	    			$newsta = _('GIVEN');
					
					$tabact = array( 
							'id_vac' 			=> null, 
							'id_usr_vac' 		=> $giver->id,
							'date_vac'			=> date("Y-m-d H:i:s"),
							'id_spt_vac'		=> $giver->id_spt,
							'type_vac'			=> 'GB',
							'related_vac'		=> json_encode(array('towho'=>$receiver->id,'badge'=>$bdg->name)),
							); 
				   				
				$this->model('activities');
				$ret	=	$this->activities->saveOne($tabact);
				
				$tabact = array( 
							'id_vac' 			=> null, 
							'id_usr_vac' 		=> $receiver->id,
							'date_vac'			=> date("Y-m-d H:i:s"),
							'id_spt_vac'		=> $receiver->id_spt,
							'type_vac'			=> 'RB',
							'related_vac'		=> json_encode(array('towho'=>$giver->id,'badge'=>$bdg->name)),
							); 
				$ret	=	$this->activities->saveOne($tabact);
	    	}
			else if ($deal=='ASK') {// ask for badge
					// inform the receiver about the donative
					SelectLang($giver->lang);
	    			$sta1="W";
					$msg->content = Template::getInstance()->render('message/msg/askNewBadge',array('asker'=>$receiver,'receiver'=>$giver,'bdg'=>$bdggiv,'msg_perso'=>$addmsg));
					$msg->mail 	= Template::getInstance()->render('message/mail/askNewBadge',array('asker'=>$receiver,'receiver'=>$giver,'bdg'=>$bdggiv,'msg_perso'=>$addmsg));
					$msg->subject = $giver->name.' '._('SUBJECT_ASK_FOR_BADGE');
	    			$msg->type = 'AB';
	    			$newsta = _('WAIT_DEAL');
			}
	    	else if ($deal =='Y') // accept to give the badge
	    	{
	    		$sta1 = $sta2 = 'A';
				$msg->content = preg_replace('/\{#user\}/','{a#'.$giver->name.'|'.$giver->url.'#a}',_('MSG_ACCEPT_GIVE_BADGE').' '.$bdg->title).'.';
	    		$msg->subject = _('SUBJECT_HAVE_NEW_BADGE');
	    		$msg->type = 'YB';
				
				
				$tabact = array( 
							'id_vac' 			=> null, 
							'id_usr_vac' 		=> $giver->id,
							'date_vac'			=> date("Y-m-d H:i:s"),
							'id_spt_vac'		=> $giver->id_spt,
							'type_vac'			=> 'GB',
							'related_vac'		=> json_encode(array('towho'=>$receiver->id,'badge'=>$bdg->name)),
							); 
				$this->model('activities');
				$ret	=	$this->activities->saveOne($tabact);
				
				$tabact = array( 
							'id_vac' 			=> null, 
							'id_usr_vac' 		=> $receiver->id,
							'date_vac'			=> date("Y-m-d H:i:s"),
							'id_spt_vac'		=> $receiver->id_spt,
							'type_vac'			=> 'RB',
							'related_vac'		=> json_encode(array('towho'=>$giver->id,'badge'=>$bdg->name)),
							);  		
				$ret	=	$this->activities->saveOne($tabact);
	    	}
	    	else if ($deal == 'N') // reject the badge request 
	    	{
	    		$sta1 = "R";
				$msg->content = preg_replace('/\{#user\}/','{a#'.$giver->name.'|'.$giver->url.'#a}',_('MSG_HAVE_REJECTED_YOUR_REQUEST_TO_RECEVE_BADGE').' '.$bdg->title).'.';
				$msg->subject = _('MSG_REQUEST_BADGE_REJECTED');
	    		$msg->type = 'NB';	
	    	}
			
			
			$idcmt = null;
			if ($addmsg)
			{
				$this->model('comments');
				$idgrp = null;
				$idcmt = $this->comments->saveOne(null,$giver->id,$giver->url,date("Y-m-d H:i:s"),$bdg->name,$giver->id,$addmsg,'BDG',$idparent = null,$idgrp);
			}
			
			
	
	    	$query = '	REPLACE INTO `like` 
	    				(`id_usr_lik`,`id_meta_lik`,`date_lik`,`type_lik`,`meta_lik`,`bdg_lik`,`cmt_lik`) 
	    				VALUES ( "'.$giver->id.'",  "'.$receiver->id.'","'.date("Y-m-d H:i:s").'","'.$sta1.'","BDG","'.$bdg->name.'", '.($idcmt?$idcmt:'NULL').')
	    			';		
	    				
	    	$res=Db::write($query);
	    	
			SelectLang(me()->lang); // revenir à la langue de l'envoyeur (soit de l'utilisateur connecté)
	      	
	      	if($res)
	      	{	
	    		$firstnm	= $giver->name;
	    		$lastnm		= '';
	    		$url		= $giver->url;
	   					       			
	    		if($deal=='Y' && $deal == 'GIV')
	    		{
   					$tabact = array( 
   								'id_vac' 			=> null, 
   								'id_usr_vac' 		=> $giver->id,
   								'date_vac'			=> date("Y-m-d H:i:s"),
   								'id_spt_vac'		=> $giver->id_spt,
   								'type_vac'			=> 'FU',
   								'related_vac'		=> $receiver->id
   								); 
   					   				
   					$this->model('activities');
   					$ret	=	$this->activities->saveOne($tabact);
   					if ($ret != 1) return array('fail save',false,$ret);
	    		}
	    		
	    		
	    		if (isset($msg->content)) 
	    		{
	    				$this->model('message');
	    				$sender = $deal=='ASK'?$receiver:$giver;
	    				$dest= $deal=='ASK'?$giver:$receiver;
	    				$msg->content 	= preg_replace('/\{#user\}/','{a#'.$sender->name.'|'.$sender->url.'#a}',$msg->content);
	    				$msg->id_usr 	= '00'; 
						$msg->smail 	= 0;
						$msg->mail 		= ($msg->mail);
						$msg->subject	= ($msg->subject);
		    			$msg->content 	= ($msg->content);
						$msg->id 		= $idmsg;
		    			$this->message->saveOne($msg,array($dest->id));
	    		}
	    		//_debug($receiver->me_.' '.$receiver->_me );
	    		
	    		//return array(_('DONE'), true,$newsta, $receiver->id);
				if ($deal =='GIV') return array(preg_replace('/\{#badge\}/',ucfirst($bdggiv->title), _('SUCCESS_BADGE_GIVEN_TO').' '.$receiver->name), true, null, $receiver->id);
				else if ($deal =='ASK') return array(preg_replace('/\{#badge\}/',ucfirst($bdg->title),_('SUCCESS_BADGE_ASKED_TO').' '.$giver->name), true, null, $giver->id);
				else return array(_('DONE'),true,null,null);
	    	}
	    	else
	    		return array('something wrong : error SQL request',false,'');
    	}
    	else return array('missing fields',false,'id');
    }

	
	
	
}
?>