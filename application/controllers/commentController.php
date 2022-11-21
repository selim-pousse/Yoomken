<?php
/**
 * Manifest
 * 
 * application/controllers/commentController
 * 
 * Manages the content requests for comments
 * 
 * @copyright: Eegoes Inc.
 * 
 */
Class CommentController Extends AppController 
{
	/**
	 * Main index, must be implemented
	 * 
	 * @see system/lib/baseController#index()
	 * 
	 */
	public function index()
	{
		
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
					
		switch ($this->get_post('act'))
		{ 
			case 'share':
				$this->share();
				return;
			case 'rem':
				$this->rem();
				return;
			case 'rest':
				$this->getAll();
				return;
			default:
				// finally, return an error if execution has not been halted before
				echo jsonRet('101',false,'act');
		}
	}
	/**
	 * Receives a comment and inserts it into the database
	 * 	AJAX response
	 * 
	 * @access public
	 */
	public function share()
	{
		//Default error
		$ret=jsonRet('102',false);
		$idparent 	= $this->post('idparent','string',NULL,'','isId');
		$idactusr 	= $this->post('idactusr','string','','','isId');
		$idactcmt 	= $this->post('idactcmt','string','','','isId');
		$pidactcmt 	= $this->post('pidactcmt','int','','');
		$txtcmt 	= trim($this->post('txtcmt','string'));
		$typeact 	= $this->post('typeact','string');
		
		if($this->session->isLogged())
		{
			//if session and params are valid
			if(isId($idactcmt) && $txtcmt!="" && isId($idactusr) && $txtcmt != _('LEAVE_CMT'))
			{
				$date=date("Y-m-d H:i:s");
				//creat comment
				
				$cmt = new CommentAdapter(NULL);
				$cmt->user = new UserAdapter(array(
													'id_usr'		=> $this->session->getUserVar('id'),
													'url_usr'		=> $this->session->getUserVar('url'),
													'id_img_usr'	=> $this->session->getUserVar('id_img'),
													'fullname_usr'	=> $this->session->getUserVar('fullname'),
													'privacy_usr'	=> $this->session->getUserVar('privacy')
													));
				$cmt->id = md5("cmt".time().$cmt->user->id);
				$cmt->id_usr = $this->session->getUserVar('id');
				$cmt->text = $txtcmt;
								
				$this->model('comments');
				//save it in DB
				$idgrp = null;
				if($this->comments->saveOne(null,$cmt->user->id,$cmt->user->url,$date,$pidactcmt,$idactcmt,$idactusr,$txtcmt,$typeact,$idparent,$idgrp))
				{
					//if (isset($idparent) && !empty($idparent) && $idparent!='0')
					//	$view = $this->template->render('comment/blocks/reply',array('rep'=>$cmt)); 
					//else
						$cmt  = 	$this->comments->getById($cmt->id);	 // à faire.
						$view = $this->template->render('comment/view',array('cmt'=>$cmt));
						
					// notify people mentioned
					$this->model('people');
					$mentionedPeople = $this->people->notifyMentionedPeople(me(),$cmt->text,'/journal/'.$pidactcmt);
						
					$ret=jsonRet(false,true,null,array('idact'=>$idactcmt,'idowner'=>$idactusr,'idgrp'=>$idgrp,'mentionedPeople'=>$mentionedPeople),$view);
					
					
				}
				else
				{
					//"return" error while saving
					$ret=jsonRet('104',false);
				}
			}
		else
			{
				//"return" error of parameters
				$ret=jsonRet('101',false);
			}
		}
		else
		{
			$ret=jsonRet('100',false);
		}
					
		echo $ret;				
	}


	private function getAll()
	{
		if(!$this->session->isLogged()) {
			echo jsonRet('100',false);
			return;
		}

		$idactcmt 	= $this->get_post('idact','string','','','isId');
		$this->model('comments');
		$cmts = $this->comments->getAll($idactcmt);
		$view = '';
		foreach($cmts as $cmt) $view .= $this->template->render('comment/view',array('cmt'=>$cmt));
		echo jsonRet(false,true,null,array('idact'=>$idactcmt.'-end'),$view);
	}
	
	/**
	 * AJAX call to delete a comment
	 * 	Gets params from post
	 * 
	 * @return echoes a JSON response to the browser
	 */
	public function rem()
	{
		if (!$this->session->isLogged())
		{
			echo jsonRet("100",false);
			return false;
		}
		$me = $this->session->me();
		
		$id = $this->get_post('idact','string','','','isId');
		if (!$id)
		{
			echo jsonRet('101',false);
			return false;
		}
	
		$res=Db::write("DELETE FROM `comment` WHERE `comment`.`id_cmt` = '".$id."' AND `comment`.`id_usr_cmt`='".$me->id."'");
		
		if(count($res)==1)
	  	{
   			echo jsonRet(false,true);
   			return true;
	  	}

		echo jsonRet("104",false);
	}

}
?>
