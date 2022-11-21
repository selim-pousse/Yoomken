
<br/>

<fb:like href="http://yoomken.com" show_faces="true" width="450" send="true"></fb:like><!--formatted-->

<?php 
	//start fb
	$facebook = Facebook::getInstance();
	
	/*if ($session)
	{
		$facebook->api('/me/feed', 'POST', array('message'=>$message, 'link'=>$link['href'], 'name'=>$link['text']));
	 * 
	 * POST /787174439/notifications?access_token= … &template= … &href= …
	}*/
	
	$user_id = $facebook->getUser();
			
		
	try {
        
		$mdl = new YOO_PeopleModel();
		$objs = $mdl->getBy('Fb',array('100002045064352','787174439'),true);
	
		
							
        // FQL queries return the results in an array, so we have
        //  to get the user's name from the first element in the array.
		 $friends = array();
		 foreach($objs as $friend) {
			$facebook->api("/$friend->fb_id/notifications", 'POST', 
		 				array(	'template'=>'hello is it a test!',
		 						'href'=> 'invite', 
		 						'access_token'=>$friend->option->fb_app_token)
							);
							
			//_debug($friend);
			//to: ["591791380"],
		 }
		 

      } catch(FacebookApiException $e) {
        // If the user is logged out, you can have a 
        // user ID even though the access token is invalid.
        // In this case, we'll get an exception, so we'll
        // just ask the user to login again here.
        
        $login_url = $facebook->getLoginUrl(); 
        echo 'FacebookApiException Please <a href="' . $login_url . '">login.</a>';
        _debug($e->getType());
        _debug($e->getMessage());
      }   
	
   	if($user_id) {

      // We have a user ID, so probably a logged in user.
      // If not, we'll get an exception, which we handle below.
      
      // and strpos(name,"Shingo") >=0
      try {
        $fql = 'SELECT uid,name,pic_square from user where uid in (select uid2 from friend where uid1= me())';
        $ret_obj = $facebook->api(array(
                                   'method' => 'fql.query',
                                   'query' => $fql,
                                 ));
		
        // FQL queries return the results in an array, so we have
        //  to get the user's name from the first element in the array.
		 $friends = array();
		 foreach($ret_obj as $friend) {
		 	$friend = new Adapter($friend);
			
			/*try {
			$fql = 'SELECT uid,name,pic_square from user where uid in (select uid2 from friend where uid1="'.$friend->uid.'" )';
        		$tests = $facebook->api(array(
                                   'method' => 'fql.query',
                                   'query' => $fql,
                                 ));
				_debug($tests);
			}
			catch(FacebookApiException $e) {
				_debug($e->getType());
        		_debug($e->getMessage());
				continue;
        
      		}  */
			$friends[] = $friend->uid;
			_debug($friend);
			//to: ["591791380"],
		 }
		 
		 
	 
		/*?>
		<script language="JavaScript">
				function fbInviteCallback(){
					console.log('done');
				};
				
				FB.ui({method: 'apprequests',
					to: ["591791380","787174439"],
				    title: 'Friend Smash Challenge!',
				    message: 'I just smashed friends! Can you beat it?',
				}, fbInviteCallback);
		 </script>
		 <?*/

      } catch(FacebookApiException $e) {
        // If the user is logged out, you can have a 
        // user ID even though the access token is invalid.
        // In this case, we'll get an exception, so we'll
        // just ask the user to login again here.
        
        $login_url = $facebook->getLoginUrl(); 
        echo 'FacebookApiException Please <a href="' . $login_url . '">login.</a>';
        _debug($e->getType());
        _debug($e->getMessage());
      }   
    } else {

      // No user, so print a link for the user to login
      $login_url = $facebook->getLoginUrl();
      echo 'Please <a href="' . $login_url . '">login.</a>';

    }

  ?>

  </body>
</html>