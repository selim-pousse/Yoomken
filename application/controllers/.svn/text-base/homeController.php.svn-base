<?php
/**
 * Manifest
 * 
 * application/controllers/adviseController
 * 
 * Describe some advises
 * 
 * @copyright: Yoomken Li
 * 
 */
Class HomeController Extends AppController 
{
	/**
	 * Main index, must be implemented
	 * 
	 * @see system/lib/baseController#index()
	 * 
	 */
	public function welcome()
	{
		if ($this->session->isLogged())
		{
			redirect('/'.$this->session->getUserVar('url'));
		}
		else if ($wait = $this->session->get('waitActivate'))
		{
			$msg = _('TXT_WAIT_ACTIVATION');
			$msg = preg_replace(
								array('/\{\#email\}/'),
								array('<b>'.$wait->email.'</b>'),
								$msg);
			$subtitle = _('MAIL_WELC_TXT1')." ".getNameObj($wait,'min')." "._('MAIL_WELC_TXT2');
			$this->template->page( '/home/inner/activate',array('message'=>$msg,'subtitle'=>$subtitle,'waitAct'=>1));
			$this->session->delete('waitActivate');
		}
		else {
			try{
   		  		$spot = new SpotAdapter();
				$this->model('spots');
   		  		//$spot = detectPosition((SERVER_ENV=='local'?'93.94.240.211':$_SERVER['REMOTE_ADDR']));
   		  		//$this->spots->saveOne($spot);
   			  		
   			  	} catch (Exception $e) {
					    echo 'Caught exception: ',  $e->getMessage(), "\n";
				}
  			//$spot->location = $spot->city.', '.$spot->country.'!#!'.$spot->id.'!#!'.$spot->city.', '.$spot->country;
			$this->template->layout('home');
			$this->template->page( '/home/view',array('spot'=>$spot));
		}
	}
	
	public function index(){}
	
	public function maintenance()
	{
		$this->template->layout('maintenance');
		$this->template->page( '');
	}
	
	public function timezone()
	{
		$_SESSION['tzoffset'] = $this->post('tzoffset');
	}
	
	public function sendpass()
	{
		$pseudo = $this->post('pseudo');
		if ($pseudo)
		{
			if (Db::read('SELECT email_usr FROM user where email_usr LIKE "'.$pseudo.'" OR  url_usr LIKE "'.$pseudo.'"' ))
			{
				$this->model('user');
				$user = false;
				if (isEmail($pseudo))
					$user = $this->user->getByEmail($pseudo);
				else 
					$user = $this->user->getByUrl($pseudo);
				if ($user) {
					
					$activate= md5('initpass'.$user->id.$_SERVER['REQUEST_TIME']);
					$res2=Db::write('UPDATE `user` SET activate_code_usr = "'.$activate.'" WHERE id_usr="'.$user->id.'"');
					
					if (ONLINE)
					{
	   					//Send Activation for reset password
		   				$mail = new Mailer(true);
						$mail->IsSMTP();
						$mail->AddAddress($user->email);
						$mail->hi_receiver = $user->name;
						$mail->Subject = "Reset Your Yoomken Password";
		
						$data = array('email'=>$user->email,'activate'=>$activate);
			   			$message = Template::getInstance()->render('message/mail/sendpass',$data);
						
						$mail->MsgHTML($message);
						$mail->Send();
					}

					echo jsonRet(_('SUCCESS'),true);
					return;
				}
			}
			echo jsonRet(_('ERR_NOTEXIST_EMAIL_PSEUDO'),false);
		}
		else {
			$this->template->layout('home');
			$this->template->page('/home/inner/sendpass',array());
		}
	}
	
	public function initpass()
	{
		$this->model('user');
   		$user = null;
		
		$pass = $this->get_post('password');
		$res = $this->user->resetPassword($this->get_post('act'),$pass);
		
		if (empty($pass)) {
			$this->template->layout('home');
			$error = false;
			
			if ($res==false) {
				 $error = $this->template->render('layout/messages/warningBubble', array('msg'=>_('ERR_LINK_NOTVALID_ANYMORE')));
				 $this->template->page('/home/inner/sendpass',array('error'=>$error));
			}
			else $this->template->page( '/home/inner/resetpass',array('activate'=>$this->get_post('act')));
			return;
		}
		else {
			if ($res) {
				echo jsonRet(_('SUCCESS'),true);
				return;
			}
			else {
				echo jsonRet(_('ERR_LINK_NOTVALID_ANYMORE'),FALSE);
			}
		} 
		
	}
	
	/**
   	 * Activates the user
   	 * 
   	 * @access public
   	 * 
   	 * @return outputs the result of the operation to the browser
   	 */
   	public function activate()
   	{
   		$this->model('user');
   		$user = null;
		$res = $this->user->activateUser($this->get_post('act'),$user);
		
		switch ($res)
		{
			case 1: 
				$subtitle = _('CONGRAT').'!';
				$msg = _('TXT_CONGRAT_ACTIVATE');
				$waitAct = 'none';
				$endMsg = '';
				break;
			case 2: 
				$subtitle = _('DOUBLE_ACTIVATE');
				$msg = _('TXT_DOUBLE_ACTIVATE_1');
				$waitAct = 'none';
				$endMsg = _('TXT_DOUBLE_ACTIVATE_2');
				break;
			default: 
				$subtitle = _('OOPS_ACTIVATE').'!';
				$msg = _('TXT_OOPS_ACTIVATE');
				$waitAct = 'waitAct';
				$endMsg = '';
				break;
		}
		$msg = preg_replace(
								array('/\{\#email\}/','/\{\#contact_us\}/'),
								array(isset($user->email)?'<b>'.$user->email.'</b>':'','<a href="#" onclick="$(\'#contactable_inner\').click()">'._('CONTACT_US').'</a>'),
								$msg);
		$endMsg = preg_replace(
								array('/\{\#email\}/','/\{\#contact_us\}/'),
								array(isset($user->email)?'<b>'.$user->email.'</b>':'','<a href="#" onclick="$(\'#contactable_inner\').click()">'._('CONTACT_US').'</a>'),
								$endMsg);
		
		$this->template->page( '/home/inner/activate',array(
															'message'=>$msg,
															'subtitle'=>$subtitle,
															'endMsg'=>$endMsg,
															$waitAct=>1
														));
		$this->session->delete('waiting');
   	}
   	
   	
	public function login_goo()
	{
		$user = new Adapter();
		//$access_token=1;
		//_debug($_REQUEST);die();
		$request_token = $this->get_post('openid_sig');
		//_debug($request_token);die();
		if (/*($request_token || 1)  &&*/ $this->get_post('openid_ext1_value_email')) 
		{
			$this->model('user');
			$user = $this->user->getByEmail($this->get_post('openid_ext1_value_email'));
			//_debug($user); die();
		}
		
		
		// login with google account
		if (/*($request_token || 1)  &&*/ isId($user->id) && $user->status) 
		{
			
		
			/*if (empty($user->go_oauth_token))
			{
				$res2=Db::write('
							UPDATE `user` 
								SET go_oauth_token_usr="'.$request_token.'" 
							WHERE id_usr="'.$user->id.'"
						');
			}*/
			$this->session->logIn($user->id, true,'goo');
			$this->user->writeLog($user->id);
			redirect('/');
		}
		else //if (/*($request_token || 1)  &&*/!isId($user->id)  && $user->status==0)
		{
		  //$goo = Google::getInstance();
		  //$httpClient = new Zend_Gdata_HttpClient();
		  //$access_token = $goo->getAccessToken($request_token);
		  //if ($access_token || 1)
		  {
		  	//$user->go_oauth_token = $request_token;
		  	$user->fullname = $this->get_post('openid_ext1_value_first').' '.$this->get_post('openid_ext1_value_last');
			$user->fullname = extractNames($user->fullname);
			$user->url		= changeUrlMap($user->fullname);
   			$user->email	= $this->get_post('openid_ext1_value_email');
  			$user->nation	= $this->get_post('openid_ext1_value_country');
		  	$this->register_step2($user,'goo');
		  	return;
		  }
		}
		//redirect('/');
	}

	public function register_step1()
	{
		//if ($this->get_post('fullname'))
		$via = $this->get_post('via');
		{
			$user = new Adapter();
   			//$user->email	= $this->get_post('email');
   			$user->url	= $this->get_post('pseudo');
			//$user->fullname = extractNames($user->email);
   			$user->url = changeUrlMap($user->url);
			
			$user->password	= $this->get_post('password');
			if($via =='invit'){
				$codeinvite = $this->get_post('codeinvit');
				$res=Db::read("SELECT email_usr FROM `user` WHERE id_usr='".$codeinvite."' LIMIT 1");
				if (count($res)) $user->email = $res[0]['email_usr'];
				
   				$user->fullname = extractNames($user->email);
   				$user->url = changeUrlMap($user->fullname);
			}
			
			if (empty($via)) $via = 'yoo';
		  	$this->register_step2($user,$via);
		  	return;
		 }
	}
	
	/* page d'incription de facebbok */
	public function register_fb($error = '')
   	{
   		if (!$this->session->isLogged())
   		{
	   		//$this->template->layout('box');
	   		$this->template->page( 'layout/registerbox_fb',array('signup_error'=>$error), array('title'=>'Inscription via Facebook' ) );
   		}
   	}
	
	/* page d'incription */
	private function register_step2($user,$via='yoo',$error = '')
   	{
   		if (!$this->session->isLogged())
   		{
   			  $this->model('spots');
   			  $user->spot = new SpotAdapter();
   			  if (isset($user->spot->id) && isId($user->spot->id)){
   			  	$user->spot->address = $this->spots->getCity($user->idspot);
   			  	$user->spot->location = $user->spot->city.', '.$user->spot->country.'!#!'.$user->spot->id.'!#!'.$user->spot->city.', '.$user->spot->country;
   			  }
   			  else {
   			  	try{
   			  		$user->spot = detectPosition((SERVER_ENV?$_SERVER['REMOTE_ADDR']:'93.94.240.211'));
   			  		$this->spots->saveOne($user->spot);
   			  		
   			  	} catch (Exception $e) {
					    echo 'Caught exception: ',  $e->getMessage(), "\n";
				}
				$user->spot->location = $user->spot->city.', '.$user->spot->country.'!#!'.$user->spot->id.'!#!'.$user->spot->city.', '.$user->spot->country;
   			  }
  			   //openid_ext1_value_lang
	   		$this->template->page( 'layout/registerbox_gen',array('signup_error'=>$error,'usr'=>$user,'via'=>$via));
   		}
		else {
			redirect('/home');
		} 
   	}
	
}
?>
