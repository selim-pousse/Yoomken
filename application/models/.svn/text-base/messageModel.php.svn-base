<?php 
class YOO_MessageModel extends AppModel 
{
	protected $allowed = array('id'=>'');
	
	public function getById($idgrp, $details= false)
	{		
		if (isId($idgrp))
		{
			$res	=	$res=Db::read('
		   					SELECT m.*,u.* FROM `message` m 
		   					INNER JOIN user u on (id_usr_msg=id_usr)
		   					WHERE id_grp_msg ="'.$idgrp.'" AND active_msg=1 ORDER BY id_msg DESC LIMIT 1
   						');
			
	   		if(count($res))
	   		{
	   			foreach($res as &$r)
	   				$r = new MessageAdapter($r);
   				return $res;
	  	   	}
	  	   	else return false;
		}	
		
	}
	
	
	
	public function getAll($idsender,$idrecever, $until = null)
   	{
   		// TODO : pour un groupe qui prends par dans une conversation
   		// seule les converstions entre 2 personnes sont gérés 
   		$idgrp1 = getIdSet(array($idrecever));
		$idgrp2 = getIdSet(array($idsender));
		
   		// delete all message older than 2 months = 60*24*60*60 secondes
   		$res=Db::write('UPDATE `message`  set active_msg=0
   						WHERE id_grp_msg ="'.$idgrp1.'" AND id_usr_msg="00" AND type_msg NOT IN ("YD","ND","YB","NB","DE","AB") AND status_msg="R"
   						AND date_msg < "'.date('Y-m-d',time()-15*24*60*60).'"  ');
   		
   		$req = ' UPDATE message SET status_msg = "R" WHERE id_grp_msg ="'.$idgrp1.'" AND id_usr_msg = "'.$idsender.'"';
   		//die($req);
	   	Db::write($req);
   		
   		//if ($until == null) 
   			//$until = 'date_msg >= "'.date('Y-m-d',time()-15*24*60*60).'"'; // 15 days ago
   		//else 
   			$until = '1';
   		
   		$sql = 'SELECT m.*,u.* FROM `message` m 
   					INNER JOIN user u on (id_usr_msg=id_usr)
   					WHERE  (id_grp_msg ="'.$idgrp1.'" AND id_usr_msg = "'.$idsender.'" 
   								OR 
   							id_grp_msg ="'.$idgrp2.'" AND id_usr_msg = "'.$idrecever.'")
   					AND '.$until.' AND active_msg = 1 ORDER BY id_msg DESC  LIMIT 50 
   				';
   		//die($sql);
   		$res=Db::read($sql);
   	
   		if(count($res))
   		{
	   		foreach ($res as &$value)
			{
				$value = new MessageAdapter($value);
			}
			return $res;	
   		}
   		else return new Adapter();
   	}
   	
	// return top 10 people who gets in touch recently with me
	public function getRecentContact($_str)
	{
		if (me())
		{
			$res  = Db::read('
								SELECT id_msg, content_msg, u.* 
										FROM `message` m 
										INNER JOIN `user` u on (m.id_usr_msg = id_usr)
										INNER JOIN ( SELECT MAX(id_msg) as maxid, id_usr_msg FROM message WHERE id_grp_msg = "'.me()->id.'" and active_msg = 1 GROUP BY id_usr_msg) mx on (maxid=m.id_msg) 
										WHERE m.id_grp_msg = "'.me()->id.'"
												AND ( ( fullname_usr LIKE \'%'.$_str.'%\' AND privacy_usr=\'P\' ) 
													OR url_usr LIKE(\'%'.$_str.'%\') )'. 
					($_str?'
							   UNION 
							   SELECT  0 as id_msg, "'._('NO_MESSAGE_CONTACT').'" as content_ms, U.*
										FROM `user` as  U
										LEFT JOIN  user_user AS u_ ON ( u_.id_follower_usrusr="'.who()->id.'" AND u_.id_followed_usrusr = U.id_usr )
										LEFT JOIN  user_user AS _u ON ( _u.id_followed_usrusr="'.who()->id.'" AND _u.id_follower_usrusr = U.id_usr ) 
										WHERE (u_.status_usrusr <> 1 OR _u.status_usrusr <> 1)
											 AND ( ( fullname_usr LIKE \'%'.$_str.'%\' AND privacy_usr=\'P\' ) OR url_usr LIKE(\'%'.$_str.'%\') ) ':'').
								
							'ORDER BY id_msg DESC	 LIMIT 10		
								');
			if(count($res))
	   		{
		   		foreach ($res as &$value)
				{
					$value = new MessageAdapter($value);
				}
				return $res;	
	   		}
		}
		return false;
	}
   	
	//default save method
	public function saveOne(&$msg,$grp)
   	{ 
   		//if ($this->session->isLogged())
   		{
	   		if(is_array($msg)) $msg = new Adapter($msg);
	   		if (!isset($msg->type)) $msg->type='OT';
	   		
	   		$msg->id_grp = getIdSet($grp);
	  
	   		// change the message DEAL into answered if the action is "accept" or "reject"
	   		if ($msg->type == 'YD' || $msg->type == 'ND' || $msg->type == 'YB' || $msg->type == 'NB')
	   		{
	   			$me = $this->session->get('user');
	   			$idgrp = getIdSet(array(/*$msg->id_usr,*/$me->id));
				
	   			$reqmsg = '	SELECT max(id_msg) as id,content_msg  as content
	   						FROM message 
	   						WHERE id_msg='.$msg->id.' and active_msg=1
	   						LIMIT 1';
	   			$res = Db::read($reqmsg);
	   			if (count($res)) {
	   				$content = preg_replace(	"#\{accept\#([a-f0-9]{32})-([A-Z]{3,6})-([a-z0-9]{1,32})\#reject\}#is",
	   											($msg->type == 'YD' || $msg->type == 'YB')?'{#accepted}':'{#rejected}',
	   											($res[0]['content']));
	   				$more ='';
	   				$more = ', type_msg = "OT"';
	   				$res=Db::write('
		   					UPDATE `message` m 
		   					SET content_msg = "'.addslashes($content).'"'.$more.'
		   					WHERE id_msg ="'.$res[0]['id'].'" 
   						');
	   			}
	   		}
	   		
	   		// send follow message only if today not send
	   		$insert = true;
	   		if ( 0 && ($msg->type == 'FO' || $msg->type == 'DE' || $msg->type == 'CD')){
	   			$reqmsg = '	SELECT id_msg 
	   						FROM message 
	   						WHERE type_msg="'.$msg->type.'" AND id_grp_msg = "'.$msg->id_grp.'" AND date_msg > "'.date('Y-m-d',time()-24*60*60).'"  
	   						ORDER BY id_msg DESC  LIMIT 1';
	   			//die($reqmsg);
	   			$res = Db::read($reqmsg);
	   			if (count($res)) $insert = false;
	   		}
	   		
	   		if ($insert) {
	   			$req = "SELECT * FROM grp_usr WHERE id_grpusr = '{$msg->id_grp}' LIMIT 1";
	   			$req = Db::read($req);
	   			
	   			if (count($req)==0)
		      	{
		      		$qry ="
		      			INSERT INTO `grp_usr` ( `id_grpusr`,`id_usr_grpusr`) 
		      			VALUES ";
					$first = true;
		      		foreach ($grp as $one)
		      		{
			      		if ($first) $first = false;
						else $qry .= ",";
			      		$qry .= "('".$msg->id_grp."','".$one."')";
			      	}
		      		$res=Db::write($qry);
		      	}
		      	if (!isset($msg->mail)) $msg->mail = NULL;
				if (!isset($msg->smail)) $msg->smail = 0;
				if (!isset($msg->active)) $msg->active = 1;
		      	
				$msg->content = addslashes($msg->content);
				$msg->mail = addslashes($msg->mail);
				
				if (!isset($msg->richhtml) || $msg->richhtml == false) $msg->content = escape($msg->content,'rich');
				
		      	$qry=" INSERT INTO `message` ( `id_grp_msg`,`id_usr_msg`,`date_msg`,`content_msg`,`mail_msg`,subject_msg,type_msg,smail_msg,active_msg) 
		      			VALUES('{$msg->id_grp}','{$msg->id_usr}','".date('Y-m-d H:i:s')."',\"{$msg->content}\",\"{$msg->mail}\",\"{$msg->subject}\",'{$msg->type}',{$msg->smail},{$msg->active});";

				//echo $qry;
		        $res=Db::write($qry);
	   		}
	      	return true;
	   	}
	   	return false;
   	}
   	
	public function cancelDeal($idgrp)
	{		
		if (isId($idgrp))
		{
			$res	=	$res=Db::write('
		   					UPDATE  `message` set active_msg=0
		   					WHERE  id_grp_msg ="'.$idgrp.'" AND type_msg="DE" AND active_msg=1
		   					ORDER BY id_msg DESC LIMIT 1 
   						');
			
	   		if ($res==1)
	   		{
	   			return true;
	  	   	}
	  	   	else return false;
		}	
	}
   	
   	public function sendMail($idsender,$idrecever)
   	{
   		
   		$req = '	SELECT m.*,
   						   u1.id_usr, u1.fullname_usr, u1.privacy_usr, u1.url_usr, u1.email_usr,u1.lang_usr, opt.msg_notification_mor
   						FROM `message` m
   					INNER JOIN grp_usr ON (id_grp_msg = id_grpusr)
   				 	INNER JOIN user u1 ON (id_usr_grpusr = u1.id_usr)
   					LEFT JOIN `user_more` opt ON (opt.id_usr_mor = u1.id_usr)
   					WHERE id_usr_msg ="'.$idsender.'" 
   						AND id_grp_msg ="'.$idrecever.'" 
   						AND smail_msg=0
   				';
	   	$res = Db::read($req);
	   	foreach ($res as $one) {
	   		$acceptNotif = $one['msg_notification_mor'];
	   		$one = new MessageAdapter($one);
	   		if($acceptNotif=="Y" && ONLINE)
       		{
       			SelectLang($one->user->lang);
       			$mail = new Mailer(true);
				$mail->IsSmtp();
				$mail->AddAddress($one->user->email);
				$mail->hi_receiver = $one->user->name;
				$mail->Subject = $one->subject;
				$mail->AltBody = $one->content;
				$mail->MsgHTML(addActiveMyLinks($one->mail==null?$one->content:$one->mail,'color:#5b564d'));
				try {
					$mail->Send();
				}
				catch (Exception $exc) {
					// TODO
				}
				SelectLang(me()->lang);
				
       		}

	   	}
	   	$req = ' UPDATE message SET smail_msg = 1 
	   				WHERE id_usr_msg ="'.$idsender.'" 
	   						AND id_grp_msg ="'.$idrecever.'" 
	   						AND smail_msg = 0';
	   	Db::write($req);
	   	return $res;
   	}
   	
   	public function checkDealedLastDay($him)
   	{
   		$idgrp = getIdSet(array('00',$him));
   		$reqmsg = '	SELECT id_msg 
	   						FROM message 
	   						WHERE type_msg="DE" AND id_grp_msg = "'.$idgrp.'" AND date_msg > "'.date('Y-m-d',time()-24*60*60).'"  
	   						ORDER BY id_msg DESC  LIMIT 1';
   		//die($reqmsg);
   		$res = Db::read($reqmsg);
   		if (count($res))
   		{
   			return true;
   			
   		}
   		else return false;
   	}
   	
	public function countUnread($idsend)
   	{
   		if ($this->session->isLogged())
   		{
   			$idme = $this->session->getUserVar('id');
			$idgrp = getIdSet(array($idme));
   			if (empty($idsend)){
   				$where = '1';
   			}
   			else {
   				if ($idme == $idsend) $idsend = '00';
   				$where = ' id_usr_msg = "'.$idsend.'" ';
   			}
   			
	   		$req = '	SELECT count(id_msg) as nbr
	   					FROM  message
	   					INNER JOIN grp_usr mu1 ON (mu1.id_usr_grpusr = "'.$idme.'" AND mu1.id_grpusr = id_grp_msg)
	   					WHERE '.$where.' AND id_grp_msg = "'.$idgrp.'" 
	   									 AND id_usr_msg <> "'.$idme.'" 
	   									 AND status_msg="N" 
	   									 AND active_msg=1
	   					GROUP BY id_grp_msg 
	   				';
	   		//_debug($req);
		   	$res = Db::read($req);
		   	if (count($res))
		   	{
		   		$init = '0';
		   		foreach ($res as $one)
		   		{
		   			$init .= '+'.$res[0]['nbr'];
		   		}
		   		return $init;
		   	}
		   	return '0';
   		}
   		else return '0';
   	}
   	
   	
	public function contactsUnread()
   	{
   		if ($this->session->isLogged())
   		{
   			$idme = $this->session->getUserVar('id');
			$idgrp = getIdSet(array($idme));
 
	   		$req = '	SELECT count(id_msg) as unread_usr, u.*
	   					FROM  message
	   					INNER JOIN user u ON (id_usr = id_usr_msg)
	   					INNER JOIN grp_usr mu1 ON (mu1.id_usr_grpusr = "'.$idme.'" AND mu1.id_grpusr = id_grp_msg)
	   					WHERE id_grp_msg = "'.$idgrp.'" 
							 AND id_usr_msg <> "'.$idme.'" 
							 AND status_msg="N" 
							 AND active_msg=1
	   					GROUP BY id_grp_msg ORDER BY date_msg DESC
	   				';
	   		
		   	$res = Db::read($req);
		   	//die($req);
		   	if (count($res))
		   	{
			   	foreach ($res as &$value)
				{
					$value = new UserAdapter($value);
					//_debug($value);
				}
		   		return $res;
		   	}
		   	return false;
   		}
   		else return false;
   	}
	
	public function deleteOne($id)
   	{
   		if ($this->session->isLogged())
   		{
   			//$idme = $this->session->getUserVar('id');
 
	   		$req = '	UPDATE  message set active_msg = 0
	   					WHERE id_msg='.$id.';
	   				';
	   		
		   	$res = Db::write($req);
		   	//die($req);
		   	if(count($res)==1)
		  	{
	   			return true;
		  	}
		   	return false;
   		}
   		else return false;
   	}
   	
   	public function sendNewRegistering(&$usr)
   	{
   		if (ONLINE)
		{
	   		//send the email 
			$mail = new Mailer(true);
			$mail->IsSMTP();
			$mail->AddAddress('shingo@yoomken.com');
			$mail->Subject="New registration in ".$_SERVER['HTTP_HOST']." : {$usr->fullname}" ;
			//$mail->AltBody=$mail->Subject;
			$data = array('firstname'=>$usr->fullname,'lastname'=>'','email'=>$usr->email,'url'=>$usr->url,'spot'=>$usr->spot);
	   		$message = Template::getInstance()->render('message/mail/newRegistering',$data);
			$mail->MsgHTML($message);
			try {
				$mail->Send();
			} catch (Exception $e) {
			    echo 'Exception catched :',  $e->getMessage(), "\n";
			    return -1;
			}
			return 1;
		}
   	}
}

?>