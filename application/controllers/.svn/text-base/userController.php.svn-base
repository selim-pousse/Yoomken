<?php
/**
 * Manifest
 * 
 * application/controllers/userController
 * 
 * Manages user actions like login and logout
 * 
 * @copyright: Yoomken Li
 * 
 */
Class UserController Extends AppController 
{
	/**
	 * Needs to be implemented
	 * 
	 * @see system/lib/baseController#index()
	 *
	 */
	public function index($format = 'full')
	{
		if ($format != 'full') {
			$userid = $this->get_post('id');
			$this->model('user');
			$user = $this->user->getById($userid);
			
			if ($format=='light') $page = 'view';
			else if ($format=='view') $page = 'ajax';
		
			$view = $this->template->render( 'user/'.$page,array('title'=>'About '.$user->name, 'desc'=>$user->desc,'user'=>$user,'mode' => 'action_menu','submenu'=>'about'));
			return array ('view' => $view,'meta' => array());
		}
		else {
			$user = who();
			$this->template->page( 'user/one',array('cacheMainSearch'=>'1','title'=>'About '.$user->name, 'desc'=>$user->desc,'user'=>$user));
		}
	}
	
	
	public function ajax(){
		// 	general protection: user must be logged in
		if (!$this->session->isLogged())
		{
			echo jsonRet('not logged',false);
			return;
		}
		
		$act = $this->get_post('act');
		switch ($act)
		{
			case 'nearby':
					$this->nearby();
				return;
			case 'light':
			case 'view':
					$data = $this->index($act);
					echo  jsonRet(_('DONE'), true,null,$data['meta'], $data['view'], 1);
				return;
			case 'status':
					$sta= $this->get_post('id');
					$this->model('user');
					if($this->user->changeStatus($sta)){
						echo jsonRet('status changed',true);
						return;
					}
				break;
			case 'myOption':
			case 'myProfile':
					$view = $this->template->render('layout/module/'.$act,array('who'=>$this->session->get('user'),'change'=>1));
					echo jsonRet(_('DONE'), true,null,$act=='myOption'?'#my-options':'#my-profil', $view, 1);
					return;
			default:
				// finally, return an error if execution has not been halted before
				
		}
		echo jsonRet('100',false);
		
	}
	/**
	 * Logs user in and responds to the AJAX call
	 * 
	 * @return JSON object
	 */
	public function login()
	{
		$email 		= $this->post('email','string','','','isEmail');
		$password 	= $this->post('password','string');
		$remember	= $this->post('remember_me','boolean');
		$date = '0000'; 
		
		//sleep(1);
		
		if (!$email || !$password || !$date)
		{
			echo jsonRet(_('ERR_FIELD'),false);
			return false;
		}
		echo $this->loginUser(escape($email),escape($password),$remember,$date);
		
	}
	
	public function login_fb()
	{
		//$uid = $this->get_post('uid');
		
		$fb = Facebook::getInstance();	
		$uid = $fb->getUser();
		
		//_debug($_REQUEST);die();
		if (empty($uid)) echo jsonRet(_('ERR_FIELD'),false);
		
		$res = $this->loginUser_fb($uid);
    	if ($res[1]) 
    	{
    		redirect('/');
    	}
    	else return jsonRet($res[0],$res[1]);
	}

	//http://localhost/app.php?&signedRequest=iScKr7dU1LP3OSh1-od60js_vVTxXLxRUOB5MqW0Duo.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNvZGUiOiJBUUNTNnZvYWFGVEs5NUd6eXE3MVVwcml4UkJHMkRDeXNENVpXbHEyaUdjRzFYNzc3R3o0NGtxdEVuWWc2aF9Ic2tvUmxScFllR0txcjNESU5IQS1sVjByNDFtTXd2UVRKUHFqbXZYU2xUTGFVT1VaRlFjbzRzeUtBdVhPbFZ5Z1FlV09pUUZyWU9kV2R6Qm16N2RseFVqR0RPcGVfWWpkcHN5bHlKT2IyWHgyMUltQ2lfcVJQTFJ3SklVVS03TVJwc2RTSUw5QzJDMlktdV85cmdWcl8zUzJvUnBaQXdaYUFpY2RlRGd4SHdZWHdyU2E0UUhfWGZZWHpVdTM4UHp2NGR4ZC1JSGYtSkpUbnJqSU9uSU9odm9DSXBVSmRHWHpFcTZvaGRDT1lFY3hYVS14OEk0TVdYbkl0YndHS3N1T3R6a0xlOTFMNjhDOGJCZkVtYTVBRmJ3NyIsImlzc3VlZF9hdCI6MTM4NTI1ODAzMCwidXNlcl9pZCI6IjEwMDAwMjA0NTA2NDM1MiJ9
	
	
	
	/**
	 * Manages the internal login actions, writes into cookies and logs
	 * 
	 * @param string $email
	 * @param string $pass
	 * @param boolean $rememberme
	 * @param string $_date
	 * 
	 * @return writes a JSON output
	 */
	private function loginUser($email,$pass,$rememberme,$via='Ƃ-Ƌ')
   	{
   		$this->model('user');
   		$res = $this->user->getByLogin($email,$pass);
   		if($res && $res->id && $res->status != 0 )
   		{
   			$this->session->logIn($res->id, $rememberme,$via);
			$this->user->writeLog($res->id);
			return jsonRet(false,true);
   		}
   		elseif( isset($res->status) &&  $res->status== 0 && $res->activate_code)
   		{
   			return jsonRet(_('ERR_ACTIVATE'),false,'wait');
   		}
   		else
   		{
   			return jsonRet(_('ERR_LOGIN'),false);
   		}
   	}
   	
	public function loginUser_fb($idfb, $rememberme = '1')
   	{
   		$this->model('user');
   		//$date = date('Y-m-d',time());
   		$res = $this->user->getByFb($idfb);
   		if($res && $res->id && $res->status > 0 )
   		{
   			
			$fb = Facebook::getInstance();	
			$uid = $fb->getUser();
		
			$oauth = $fb->getAccessToken();
			$app = $fb->getApplicationAccessToken(); 
		
			Db::write("UPDATE user_more SET `fb_app_token_mor`='$app',fb_oauth_token_mor='$oauth' WHERE id_usr_mor='$res->id'");
		
   			$this->session->logIn($res->id, $rememberme,'fb');
			$this->user->writeLog($res->id);
			
   			redirect('/');
   		}
   		elseif( isset($res->status) &&  $res->status== 0 )
   		{
   			return array(_('ERR_ACTIVATE'),false,'wait');
   		}
   		else
   		{
   			return array(_('ERR_LOGIN'),false);
   		}
   	}
   	
	
   	
   	/**
   	 * Performs a logout action and redirects application
   	 * 	AJAX call
   	 * 
   	 * @access public
   	 * 
   	 * @return redirects to home
   	 */
   	public function logout()
   	{
   		$this->session->logout();
   		
   		redirect('/');
   	}
   	
   	
   	
	
	/**
	 * Manages the attend action for a user to an event
	 * 	AJAX call
	 * 
	 * @access public
	 */
	public function attend()
	{
		if(isSession())
		{	
			if(isset($_POST['id']) && isId($_POST['id']) && isset($_POST['act']) && $_POST['act']=="a")
			{
				if(Db::write("INSERT INTO user_event(id_usr_usrevt,id_act_usrevt) VALUES('".$_SESSION['user']->id."','".$_POST['id']."')")==1) 	echo jsonRet(false,true,'attend');
				else echo jsonRet('104',false,'attend');
				$arr[0]=$_POST['id'];
				
				$tabact = array('id_vac' 		=> null, 
		   						'id_usr_vac' 	=> $_SESSION['user']->id,
		   						'date_vac'		=> date("Y-m-d H:i:s"),
		   						'id_spt_usr_vac'=> '99999999999999999999999999999999',
		   						'type_vac'		=> 'AE',
		   						'related_vac'	=> $_POST['id']
		   						);
				   								
				$actModel = newActivitiesModel();
		   		$actModel->saveOne($tabact); 	
			}
			else if(isset($_POST['id']) && isId($_POST['id']) && isset($_POST['act']) && $_POST['act']=="u")
			{
				if(Db::write("DELETE FROM user_event WHERE id_usr_usrevt='".$_SESSION['user']->id."' AND id_act_usrevt='".$_POST['id']."'")==1) echo jsonRet(false,true,'attend');
				else echo jsonRet('104',false,'unattend');
			}
			else
				echo jsonRet('101',false);
		}
		else
		{
			echo jsonRet('100',false);
		}
	}
	
	/**
	 * Resets user password on demand
	 * 	AJAX response
	 * 
	 * @access public
	 */
	public function resetPassword()
	{
		//If user submit reset password
		if(isset($_POST['email']) && isEmail($_POST['email']))
		{
			$user=new User();
			echo $user->resetPassUser(escape($_POST['email']));
			exit;	
		}
		else
		{
			echo jsonRet('101',false);
		}
	}
	
	/**
	 * Saves user settings, receives input from settings form
	 * 	AJAX call
	 * 
	 * @access public
	 */
	public function save()
	{
		if($this->session->isLogged())
		{
			//print_r($_POST);die();
			if(1 /*&& $this->post('type') && $this->post('type')=="profil"*/)
			{
				$this->model('user');
    			$fields = array();
				// Values validation and submit 
								
				//================CONTACT==============================
				$url = $this->post('pseudo');
				if($url!="")
				{
					$fields['url'] = ucfirst(strtolower(escape($url)));
				}
				
				$fullname = $this->post('fullname','string');
				if($fullname!="")
				{
					$fields['fullname'] = escape(formatName($fullname));
				}
				
				$public = $this->post('privacy');
				if($public)
				{
					$fields['privacy'] = 'P';
				}
				else $fields['privacy'] = 'R';
				
				$gender = $this->post('gender');
				if($gender=="M" || $gender=="F")
				{
					$fields['gender'] = $gender;
				}
				
				$fields['birthdate'] = escape(str_replace("-","/",$this->post('birth')));
				$fields['shortdesc'] = escape($this->post('shortdesc'));
				
				//$fields['email'] = $this->post('email');
				$fields['phone'] = escape($this->post('phone'));
				$fields['mobile'] = escape($this->post('mobile'));
				
				//================ZONE PRESTA & CUSTOMER ====================
				if($this->post('job'))
				{
					$fields['job'] = ucfirst(strtolower($this->post('job')));
				}
				if($this->post('job_c'))
				{
					$fields['job_c'] = ucfirst(strtolower($this->post('job_c')));
				}
				
				if($this->post('level'))
				{
					$fields['level'] = $this->post('level');
				}
				if($this->post('yearsexp'))
				{
					$fields['yearsexp'] = $this->post('yearsexp');
				}
				if($this->post('calendar'))
				{
					$fields['calendar'] = $this->post('calendar');
				}
				
				
				if($this->post('amont'))
				{
					$fields['amont'] = $this->post('amont');
				}
				if($this->post('amont'))
				{
					$fields['amont_c'] = $this->post('amont_c');
				}
				if($this->post('currency'))
				{
					$fields['currency'] = $this->post('currency');
				}
				if($this->post('currency_c'))
				{
					$fields['currency_c'] = $this->post('currency_c');
				}
				if($this->post('frequency'))
				{
					$fields['frequency'] = $this->post('frequency');
				}
				if($this->post('frequency_c'))
				{
					$fields['frequency_c'] = $this->post('frequency_c');
				}
   			
				//================LOCATIONS=============================
				$address = $this->post('address');		
				$this->model('spots');
				$fields['id_spt'] = key($this->spots->add((array)$address));
				
				//================PICTURE=================================
				$fields['id_img'] = $this->post('thumb');
				
				//====================TAGS=====================
				//$tags=array('skill'=>array(),'degree'=>array(),'service'=>array());
				$tags['C'] = $tags['P'] = array();
				$this->model('tags');
				$tags['skill']	= 	explode('!+!',$this->post('skill'));
				//$tags['skill']  = $this->tags->add($tags);
				$tags['degree']	=	explode('!+!',$this->post('degree'));
				$tags['P']	= $this->tags->add($tags);
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
				
				// TODO : ne pas oublier de clener les tags
				
				//========== WEBSITES ============================
				$webs=explode('!+!',$this->post('website'));	
				
				//===============SUBMIT VALUES==============================
				$this->model('user');
				header('Content-Type: application/json; charset=utf-8');
				echo $this->user->updateInfosUser($fields,$tags,$webs);
			}
		}
		else
		{
			echo jsonRet('100',false);
		}
	}
	
	public function setting()
	{
		/*if(strlen($_POST['curr_pass'])>5 && strlen($_POST['curr_pass'])<17 && md5($_POST['curr_pass'])==$user->password && strlen($_POST['new_pass'])>5 && strlen($_POST['new_pass'])<17)
		{
			$old_password=md5($_POST['curr_pass']);
			$new_password=md5($_POST['new_pass']);
		}
		else
		{
			$old_password=$user->password;
			$new_password=$user->password;
		}*/ 
		if (isSession())
		{
			$user = new Adapter();
			$user->id 					= $this->session->me()->id;
			$user->nbresult 			= $this->input->get_post('nbresult');
			$user->msg_notification 	= $this->input->get_post('msg_notification')?'Y':'N';
				
			//===============SUBMIT VALUES==============================
			$this->model('user');
			header('Content-Type: application/json; charset=utf-8');
			echo $this->user->updateSettingUser($user);
		}
		else 
		{
			echo jsonRet('100',false);
		}
	}
	
	public function signup_fb()
	{	
		$user = new Adapter();
		$isexist = false;
		if (isset($_REQUEST['signed_request'])) {
			$response = parse_signed_request($_REQUEST['signed_request'], FB_SECRET);
			
			/*if ( ($response) && $response['registration']['email']) 
			{
				$this->model('user');
				$isexist = $this->user->getByEmail($response['registration']['email']);
			}*/
			
			/*// login with facebook account
			if (($response) && isId($user->id)) 
			{
				$this->session->logIn($user->id, true,'fb');
				$this->user->writeLog($user->id);
				redirect('/');
			}
			else
			{*/
				$fullname = ucfirst($response['registration']['first_name']).' '. ucfirst($response['registration']['last_name']);
			  	$user  = array (
	    			'fb_id_usr' 			=> isset($response['user_id'])? 	$response['user_id']:'',
	    			'fullname_usr' 			=> $fullname,
				    'email_usr' 			=> $response['registration']['email'],
			  		'gender_usr' 			=> $response['registration']['gender'],
				    'profil_usr' 			=> $response['registration']['profil'],
				    'password_usr' 			=> escape($response['registration']['password']),
				    'privacy_usr' 			=> 'P',
				    'url_usr' 				=> changeUrlMap($fullname),
				    'status_usr' 			=> 2,
							);
							
				$opts = array (
	    					'fb_oauth_token_mor' 	=> isset($response['oauth_token'])? $response['oauth_token']:'',
						);
				
										
				$spot = geocoding($response['registration']['location']['name']);
				$this->model('spots');
				$this->spots->saveOne($spot);
				$user['id_spt_usr'] = $spot->id;
				
				$this->model('people');
				$res = $this->people->saveOne($user,$opts,false);
				if ($res[1])
				{
					$this->loginUser($user['email_usr'],$user['password_usr'],'1','fb');
				}
				$error = $res[0];
			//}
		} 
		else 
		{
		  $error = 'Something wrong: the fields are empty!';
		}
		redirect('/');
		
		//$this->register_fb($error);	
	}
	
	
	public function signup()
	{
		$via = $this->get_post('via');
		$user = new Adapter();
		//_debug($_REQUEST);
		//$request_token = $this->get_post('go_oauth_token');
		if ( $this->get_post('email')) 
		{
			$this->model('user');
			$user = $this->user->getByEmail($this->get_post('email'));
		}
		
		// login with google account
		if (isId($user->id) && $user->status) 
		{
			$this->session->logIn($user->id, true,$via);
			//$this->user->writeLog($user->id);
			jsonRet('done',true);
		}
		else 
		{
		  if ($via=='goo'){
			  /*$goo = Google::getInstance();
			  $httpClient = new Zend_Gdata_HttpClient();
			  $access_token = $goo->getAccessToken($request_token);*/
		  }
		  //if (isset($access_token) && $access_token || 1)
		  {
			  	//$usr['go_oauth_token_usr'] = $this->get_post($request_token);
			  	$usr['fullname_usr']	= $this->get_post('fullname');
	   			//$usr['lastname_usr']	= $this->get_post('lastname');
	   			$usr['privacy_usr']		= ($this->get_post('privacy')?'P':'R');
				$usr['url_usr']			= ucfirst(strtolower($this->get_post('pseudo')));
	   			$usr['email_usr']		= $this->get_post('email');
	   			$usr['password_usr']	= $this->get_post('password');
	   			$this->model('spots');
	   			$usr['id_spt_usr']  	= key($this->spots->add((array)$this->get_post('location')));
	   			$usr['profil_usr']		= $this->get_post('profil');
				$usr['status_usr']		= 2;
			  	$this->model('people');
			  	
				$res = $this->people->saveOne($usr,null,$via=='yoo'?true:false);
				$user = new UserAdapter($usr);
				if ($res[1])
				{
					$this->loginUser($user->email,$user->password,'1',$via);
					//$user = new Adapter(array('firstname'=>$user->firstname,'email'=>$user->email));
					if ($via =='yoo') {
						//$user->firstname = utf8_encode($user->firstname);
						//$user->lastname = utf8_encode($user->lastname);
						$user->fullname = formatName($user->fullname);
						$this->session->set('waitActivate',$user);
					}
					echo jsonRet('done',true);
				}
				else {
					echo jsonRet($res[0],false);
			  }
			}
		}
	}
	
   		

	public function feedback()
	{
		//declare our assets 
		$name = stripcslashes($this->post('name'));
		$emailAddr = stripcslashes($this->post('email'));
		$comment = stripcslashes($this->post('message'));
		$subject = stripcslashes($this->post('subject'));	
		$contactMessage =  
		"<p>Message: <br/> $comment </p>

		<p>Name: $name</p>
		<p>E-mail: $emailAddr </p>

		<p>Sending IP:$_SERVER[REMOTE_ADDR] </p>
		<p>Sending Script: $_SERVER[HTTP_HOST]$_SERVER[PHP_SELF] </p>";
		
		//send the email 
		$mail = new Mailer(true);
		$mail->IsSMTP();
		$mail->AddAddress('shingo@yoomken.com');
		$mail->Subject=$name." sent you feedback.";
		//$mail->AltBody=$mail->Subject;
		$mail->MsgHTML($contactMessage);
		try {
			$mail->Send();
		} catch (Exception $e) {
		    echo 'Exception catched :',  $e->getMessage(), "\n";
		    return;
		}
		//mail('selim.pousse@gmail.com', $subject, $contactMessage);
		echo('success'); //return success callback
	}
	
	public function profil()
	{
		
		$format = $this->input->get_post('format');
		if ($format == 'boxy')
		{
			$iduser = $this->input->get_post('id');
			$user = $this->user->getById($iduser);
			$this->template->show('user/inner/displayInBoxy',array('user' =>$user,'change'=>0));
			return;
		}
		else {
			$who = $this->session->who();
			if ($who)
			{
				$this->template->page( '/user/view',array('cacheMainSearch'=>'1','user'=>$who,), array('title'=>getNameObj($who)));
			}
			else {
				redirect('/');
			}
		}
		
	}
	
	private function nearby()
	{
		$status =  $this->get_post('status');
		$me = $this->session->me();
		$update = false;
		if ($status=='OK') 
		{
			$spot = $this->get_post('spot');
			$this->model('spots');
			if ($me->nearby->mode == 'R' || ($me->nearby->mode == 'A' && !isId($me->nearby->id))) $update = true;
			$me->nearby->mode = 'A';
			foreach ($this->spots->add((array)$spot) as $value)
				$me->nearby->spot = $value;
			$me->nearby->date = date('Y-m-d',time());
		}
		else if ($status=='NO') 
		{
			$me->nearby->mode = 'R';
			$update = true;
		}
		
		if ($update)
		{
			$this->model('user');
			$this->user->paramNearby($me);
		}
		$this->session->set('user',$me);
		$who = $this->session->who();
		if ($who && $who->id == $me->id) $this->session->set('who',$me);
		echo jsonRet('mode location updated to :'.$me->nearby->mode,true);
	}
}
?>
