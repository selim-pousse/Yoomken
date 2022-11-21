<?php
/*
Name: Class Comment
Desc: Class to manage users comments
Last modification: 03/15/2010 by Guillaume 
*/

class YOO_CommentsModel extends AppModel
{
	
	
	protected $model = 'comments';
	//Vars
	private $id;
	private $id_usr;
	private $url_usr;
	private $date;
    private $id_act;
    private $id_usr_act;
    private $text;
    private $type_act;

	/*
	 * Contructor
	 */ 
	public function __construct($id=NULL,$id_usr=NULL,$url_usr=NULL,$date=NULL,$id_act=NULL,$id_usr_act=NULL,$text=NULL,$type_act=NULL,$parent=NULL)
	{
		
		parent::__construct();
	}

	
	public function getById($id, $details= false)
	{		
		if (isId($id))
		{
			$res	=	$res=Db::read('
		   					SELECT m.*,u.* FROM `comment` m 
		   					INNER JOIN user u on (id_usr_cmt=id_usr)
		   					WHERE id_cmt ="'.$id.'"  LIMIT 1
   						');
			
	   		if(count($res))
	   		{
	   			$r = new CommentAdapter($res[0]);
   				return $r;
	  	   	}
	  	   	else return false;
		}	
		
	}
	
	//Save a new comment 
	function saveOne($id=NULL,$id_usr=NULL,$url_usr=NULL,$date=NULL,$pid_act=NULL,$id_act=NULL,$id_usr_act=NULL,$text=NULL,$type_act=NULL,$parent=NULL,&$id_grp)
    {
		
		$this->id_usr=$id_usr;
		$this->url_usr=$url_usr;
		$this->date=$date;
		$this->id_usr_act=$id_usr_act;
		$this->id_act=$id_act;
		$this->pid_act=$pid_act;
		$this->text=$text;
		$this->type_act=$type_act;
		$this->parent=$parent;
		
		$me = $this->session->me();
		
		if($this->id==NULL)
			$this->id=md5("cmt".time().$this->id_usr);
		
		$query='REPLACE INTO `comment` 
				SET id_cmt="'.$this->id.'",id_usr_cmt="'.$this->id_usr.'",date_cmt="'.$this->date.'",
					id_act_cmt="'.$this->id_act.'",text_cmt="'.escape($this->text,'rich').'",id_prt_cmt="'.$parent.'"';
		$res=Db::write($query);
		
	   	if($res==1)
	   	{
	   		$lastid = Db::lastInsertId();		
	   		$this->model('activities');	
	   		$act = $this->activities->getById($this->pid_act);
	   		

			//$id_owner = $this->parent==null ? $this->id_usr_act : $this->getOwnerComment($act->id,$this->parent);
			$id_owner = $this->id_usr_act;
	       	
			
			if ($type_act!='BDG')
			{
		       	//if ($this->parent==null )
		       	{
		       		$link_cmt = ($act->type=='QU'?'journal':'journal').'/'.$act->id; 
		       		//bulding notification message for activity owner
		       		$msg_owner  = '{a#'.$me->name.'|'.$me->url.'#a} '.
				       							($act->type=='QU'?_('COMMENTED_YOUR_QUESTION'):_('COMMENTED_YOUR_POST')).'.';
					$subj_owner = $me->name.' '.($act->type=='QU'?_('COMMENTED_YOUR_QUESTION'):_('COMMENTED_YOUR_POST'));
		       		
		       		//bulding message for other people who are taking part in the conversation
		       		$msg_forall = '{a#'.$me->name.'|'.$me->url.'#a} '._('ADDED_COMMENT').'.';
					$subj_forall = $me->name.' '._('ADDED_COMMENT');
		       	}
		       	/*else 
		       	{
		       		//bulding notification message for comment owner
		       		$message="<a href=\"/user/".$_SESSION['user']->url."\">".$_SESSION['user']->firstname." ".$_SESSION['user']->lastname."</a> ".REPLY_TXT;
		       		//bulding message for other people who are taking part in the conversation of one comment
		       		$message2="<a href=\"/user/".$_SESSION['user']->url."\">".$_SESSION['user']->firstname." ".$_SESSION['user']->lastname."</a> ".REPLY_TXT2;
		       	}*/
				
				$this->model('message');
				$msg = new MessageAdapter();		
				// Send measage notification to activity owner (notification de l'auteur du post)
		       	if($act->user->id!=$me->id)
		       	{
		       		
		       		$msg->id_usr = '00';
					//utf8_decode 
	    			$msg->content = ($msg_owner). ' {a#'._('CLICK_ACCESS_CMT').'|'.$link_cmt.'#a}.';
					$msg->subject = ($subj_owner);
					$msg->mail = Template::getInstance()->render('message/inner/globalPost',array('begin_message'=> $msg_owner,'posteur'=>$me,'post'=>shortenString($this->text, 250,'short')));
					$msg->smail 	= 0;
					$msg->richhtml  = true;
	    			$this->message->saveOne($msg,array($act->user->id));
		       	}
		   
		   		// send message for other people who are taking part in the conversation
		   		{
		   			$peeps =$this->getPeopleComment($act->id,$this->parent);
				
					if (isset($peeps[$me->id])) unset($peeps[$me->id]); // pas besoin d'envoyer à l'envoyeur
					if (isset($peeps[$act->user->id])) unset($peeps[$act->user->id]); //  ni à l'auteur du post
					
					
			   		if($peeps!=false && count($peeps)>0)
		   			{
		   				$msg->id_usr = '00';
			   			$msg->content = ($msg_forall).' {a#'._('CLICK_ACCESS_CMT').'|'.$link_cmt.'#a}.';
						$msg->subject = ($subj_forall);
						$msg->mail = Template::getInstance()->render('message/inner/globalPost',array('begin_message'=> $msg_forall,'posteur'=>$me,'post'=>shortenString($this->text, 250,'short')));
						$msg->smail 	= 0;
						$msg->richhtml  = true;
			    		$this->message->saveOne($msg,$peeps);
						
						$id_grp = getIdSet($peeps);
						$this->message->sendMail('00',$id_grp);
		   			}
					
				}
				
				// update the date of the related activity
				$res2=Db::write('UPDATE `activity` SET date_act="'.date("Y-m-d H:i:s").'" WHERE id_act = "'.$act->id.'"');
			}	   		
	   		
	   		return $lastid;
	   	}
	   	else
	   	{
	   		return false;
	   	}
	}

	public function getAll($idact,$limit = 50)
	{
		$query	 = 'SELECT SQL_CALC_FOUND_ROWS * FROM (
						SELECT c.*,u.fullname_usr,u.url_usr,u.id_img_usr,u.privacy_usr,u.id_usr 
						FROM `comment` as c 
						LEFT JOIN `user` AS u ON c.id_usr_cmt = u.id_usr 
						WHERE c.id_act_cmt ="' . $idact  . '"
					) AS totRes
					ORDER BY date_Cmt DESC LIMIT 5,'.$limit;
					
		$res 	 = Db::read($query);
		$nbcount = Db::read("SELECT FOUND_ROWS()");
		
		$cmts = array();
		// then process result
   		foreach ($res as $r) 
   		{
   			$r = new CommentAdapter($r);
   			$cmts[$r->id]	=	$r;
		}
		return $cmts;
	}
    	
	///Return an array with id users of people who has commented on this activity
	public function getPeopleComment($id,$idcmt)
	{
		//if ($idcmt==null)	
		//{
	    	$queryAct='SELECT id_usr_cmt FROM `comment` WHERE id_act_cmt="'.$id.'" GROUP BY id_usr_cmt';
			$res=Db::read($queryAct);
			if(count($res)>0)
			{
				$users = array();
				foreach ($res as $usr)
	   			{
	   				$users[$usr['id_usr_cmt']] = $usr['id_usr_cmt'];
	   			}
	   			return $users;
			}
		   	else
		   		return false;
		//}
		/*else 
		{
			return $this->getPeopleWhoReply($id,$idcmt);
		}*/
	}
	
	///Return an array with id users of people who has commented on this activity
	public function getOwnerComment($id,$idcmt)
	{
	    $queryAct='SELECT id_usr_cmt FROM `comment` WHERE id_act_cmt="'.$id.'" AND id_cmt="'.$idcmt.'"';
		$res=Db::read($queryAct);
		if(count($res)>0)
	   		return $res[0]['id_usr_cmt'];
	   	else
	   		return false;	
	}
		
	/** 
   	 * Return an array with id users of people who has reply on this comment
   	 * 
   	 * @param string $id ID activity
   	 * 
   	 * @param string $idcmtparent id comment of the parent 
   	 * 
   	 * @return array of people
   	 */
	public function getPeopleWhoReply($idact,$idcmtparent)
	{
    	$queryAct='SELECT * FROM `comment` WHERE id_act_cmt="'.$idact.'" AND (id_prt_cmt="'.$idcmtparent.'" OR id_cmt="'.$idcmtparent.'") GROUP BY id_usr_cmt';
		$res=Db::read($queryAct);
		if(count($res)>0)
		{	
			foreach ($res as &$usr)
	   		{
	   			$usr = new CommentAdapter($usr);
	   		}
	   		return $res;
		}
	   	else
	   		return false;
	}
    
    /*//Get all comments for an activity	
    function getActivityCmt($idact)
    {
    	$query="SELECT c.* FROM `comment` as c WHERE id_act_cmt='".$idact."' ORDER BY date_cmt ASC";
   	   	$res=Db::read($query);
	   	if(count($res)>0)
	   	{
	   		return $res;
	   	}
	   	else
	   	{
	   		return false;
	   	}
    }*/
    
    
    function formatComment($cmt)
    	{
    	$intro=shortenString($cmt,300,false);
    	
    	if($intro!=$cmt)
    		{
    		$hide=str_replace($intro,"",$cmt);
    		return addActivePeople($intro)."<a href=\"/\" class=\"readMoreCmtBut\">".READ_MORE_TXT."</a><span class=\"readMoreCmtTxt hide\">".addActivePeople($hide)."</span>";
    		}
    	else return addActivePeople($cmt);
    	}
 }
?>