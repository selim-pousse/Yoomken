<?php
/**
 * Manifest
 * 
 * application/controllers/messageController
 * 
 * Manages the content requests for instant messages
 * 
 * @copyright: Yoomken Li
 * 
 */
Class MessageController Extends AppController 
{
	/**
	 * Main index, must be implemented
	 * 
	 * @see system/lib/baseController#index()
	 * 
	 */
	public function index()
	{
		$who = $this->session->who();
		$me = $this->session->get('user');
		$this->model('user');
		
		if ($this->session->isLogged())
		{
			if ($who==null || $who->id == $me->id)   
				$who=$this->user->getById('00');
			
			if (isId($who->id) && isId($me->id))
			{
				$idusr = $me->id;
				$idsender = $who->id;
	   		
				$this->model('message');
				$mess = $this->message->getAll($idsender,$me->id);
				$contacts = $this->message->getRecentContact(null);
				$this->template->set('mycontacts',$contacts);
				
				$this->template->page( '/message/all',array('cacheMainSearch'=>'1', 'messages'=>$mess,'who'=>$who,'setrec' => $idsender), array('title'=>'Tchat -'. getNameObj($who) ));
				return;
			}
		}
		
		redirect('/');
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
		
		$this->model('message');
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
					$mess = $this->message->getAll($who->id,$me->id);
					
					//if ($who->me_=='A')  // you must be in working relation
					{
						if($mess) 
						{
							if ($this->get_post('act')=='all') {
								$page = 'all';
							}
							else if ($this->get_post('act')=='view') $page = 'ajax';
							else $page = 'view';
							// rendering
							$view = $this->template->render( '/message/'.$page,array('keyword'=>'', 'messages'=>$mess,'who'=>$who,'setrec' => $who->id,'mode' => 'action_menu','submenu'=>'message'));
							
							// then, echo a JSON response
							echo jsonRet(_('DONE'), true,null,getNameObj($who), $view, 1);
						}
					}
					//else echo jsonRet('not exist', false);
				break;
			case 'contacts':
					$mess = $this->message->getRecentContact($term);
					if($mess) 
					{
						if ($this->get_post('act')=='all') $page = 'all';
						else $page = 'ajax';
						// rendering
						$view = $this->template->render( '/message/inner/displayContacts',array('keyword'=>'', 'mycontacts'=>$mess));
						
						// then, echo a JSON response
						echo jsonRet(_('DONE'), true,null,'no meta', $view, 1);
					}
					else echo jsonRet(_('DONE'), true,null,'N/A', '<div style="margin:5px 5px;">'._('NO_MATCH_CONTACT').'<div>', 1);
				break;
			case 'share':
				$this->share();
				return;
				
			case 'delall':
				if ($id)
				{
					$this->deleteAll($id);
					return;
				}				
				break;
			case 'countUnread':
				$nbnew = $this->message->countUnread($id);
				echo jsonRet(_('DONE'),true,null,$nbnew);
				break;
			case 'contactsUnread':
				$news = $this->message->contactsUnread();
				// and finish
				$view = $this->template->render( '/message/preview',array('contacts'=>$news));
				// then, echo a JSON response
				echo jsonRet(_('DONE'), true,null,0,$view, 1);
				break;
			case 'sendmail':
				$this->sendMail();
				return;
			case 'rem':
				$this->rem();
				return;
			default:
				// finally, return an error if execution has not been halted before
				echo jsonRet('101',false,'act');
		}
	}
	
	private function share()
	{
	// only for logged in users
		if (!$this->session->isLogged())
		{
			echo jsonRet(_('ERR_NOT_LOGED'),false);
			return;
		}
		
		// get params
		$data	= array(	
							'id_usr'		=> $this->session->getUserVar('id') , 
							'content'		=> trim($this->post('msg','string')) 
						);
		$recevers = explode(',',$this->post('setrec','string'));
		$msg = new Adapter($data);
		//$msg->content = stripslashes(escape($msg->content));
		
		// then, save the content
		$this->model('message');
		if ( !$this->message->saveOne($msg,$recevers))
		{
			echo jsonRet(_('ERR_SAVE_ACT'),false);
			return;
		}
		$results	= 	$this->message->getById($msg->id_grp);	
		// only for notification mail 
		$this->model('user');
		$msg->id_usr  = '00';
		$msg->subject = _('NEW_MESSAGE_FROM').' '.me()->name;
		$msg->content = _('NEW_MESSAGE_FROM').' <a href="/'.me()->url.'/messages" >'.me()->name.'</a>';
		$msg->mail 	= Template::getInstance()->render('message/mail/newMessage',array('posteur'=>me(),'post'=>shortenString($data['content'], 250,'short')));
		$msg->active  = 0;
		$this->message->saveOne($msg,$recevers);
		// end notification mail
		 
		// and finish
		$this->template->set('messages', $results);

		$results = $this->template->render('message/inner/displayDash');
				// then, echo a JSON response
		//die($results);
		echo jsonRet(_('DONE'), true,null,$recevers, $results, 1);
		
	}
	
	private function sendMail()
	{
		
		$sender 	= $this->get_post('send','string','','','isId');
		$recever 	= $this->get_post('recev','string','','','isId');
		
		//If (mail notification => Send email notification
   		$this->model('message');
		$this->message->sendMail($sender,$recever);
   		
   		echo jsonRet(false,true,'sendmail');
	}
	
	/**
	 * AJAX call to delete all the messages
	 * 	Gets params from post
	 * 
	 * @param string id
	 * 
	 * @return echoes a JSON response to the browser
	 */
	private function deleteAll($id)
	{
		if(Message::delAllmessages($id))
		{
			echo jsonRet(false,true,'deleteall');
		}
		else
		{
			echo jsonRet('102',false,'deleteall');
		}
	}
	
	/**
	 * AJAX call to delete a message
	 * 	Gets params from post
	 * 
	 * @param string id
	 * 
	 * @return echoes a JSON response to the browser
	 */
	public function rem()
	{
		$id = $this->get_post('idact','string');
		if (!$this->session->isLogged())
		{
			echo json_encode(array('message'=>_('ERR_NOT_LOGED'),'success'=>false));
			return false;
		}
		
		if (!$id)
		{
			echo json_encode(array('message'=>_('ERR_FIELD'),'success'=>false));
			return false;
		}
		
		if( $this->message->deleteOne($id) )
		{
			echo json_encode(array('message'=>'msg deleted','success'=>true));
			return true;
		}
		echo json_encode(array('message'=>_('MESS_HELP_TEAM'),'success'=>false));
	}
	
	/**
	 * AJAX call to mark a message as read
	 * 	Gets params from post
	 * 
	 * @param string $id
	 * 
	 * @return echoes a JSON response to the browser
	 */
	private function markAsRead($id)
	{
		if(Message::markasRead($id))
		{	
			echo jsonRet(false,true);
		}
		else
		{
			echo jsonRet('102',false,'mark as read');
		}
	}
	
	/**
	 * AJAX call to mark a message as read
	 * 	Gets params from post
	 * 
	 * @return echoes a JSON response to the browser
	 */
	private function countUnread($idsend)
	{
		
		$unreadMessages = $this->message->countUnread($idsend);
		
		if ($unreadMessages < 1)
		{
			$unreadMessages = "0";
		}
		
		echo jsonRet(false,true,null,null,null,$unreadMessages);
	}
}
?>
