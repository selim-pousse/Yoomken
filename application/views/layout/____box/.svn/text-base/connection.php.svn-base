<?

	// Create our Application instance (replace this with your appId and secret).
	//$fb = Registry::getInstance()->get('fb');
	//_debug($_SESSION);
	$logo_fb = '<img src="/css/images/fb_ico.jpg" style="margin:0 4px -5px;"/>';
	$logo_go = '<img style="margin:0 '.($this->session->isLogged()?'10':'0').'px -5px;border:2px solid white" src="/media/img/google-icon.png" height="14" width="14">'; 
?>
<script>



function onlogin_fb()
{
	FB.getLoginStatus(function(response) {
	  if (response.session) {
	    // logged in and connected user, someone you know
	   	 document.location.href = '/app.php?go=user/login_fb&uid='+response.session.uid;
		 return false;
	  } else {
		// no user session available, someone you dont know
	    if (response.status == 'notConnected')
	    {
		    //console.log('je suis là!');
		    return true;
	    	// need to be resynchronized
	    }
	    return true;
	  }
	});
}
</script>
	<ul class="art-Post-menu me-menu" style=''>
		       
		  <?if($this->session->isLogged()):?>
		  
		  <li id='disconnect_Button' class="apply toogle" style='-moz-border-radius: 5px !important;
-webkit-border-radius: 5px !important;'>
			  	<span class="t me" style='cursor: pointer;'>
			  		<?='Hi '.$this->session->getUserVar('firstname')?>
			  		<?php switch($this->session->isLogged()){
			  			case 1:break;
			  			case 2: echo $logo_fb;break;
			  			case 3: echo $logo_go;break;
			  		}?>
			  	</span>
				  
					<ul id='disconnect_Block' class='hide' style="list-style-type: none;margin:0">
						<li onclick="$('#my-profil').slideToggle('fast');">
							<span id='link-profil' class='brown-bold'>Mon profil</span>
						</li>
						<li>
				  			<?if ($this->session->isLogged()==2):?>
						    	<a href="<?=Facebook::getInstance()->getLogoutUrl()?>" class="fb_button fb_button_medium">
						    		<span class="fb_button_text">Logout</span>
						    	</a>
					    	<?else:?>
								<a href="/logout">
						      		<span class="t" style='background-image: none;padding:0;margin:0'><?=_('LOGOUT')?></span>
						    	</a>
					        <?endif;?>
			          	</li>
		          	</ul>
		       </li>
          <?else:?>
          
          <li id='connect_Button' class="apply toogle" style='cursor:pointer;'>
          	<span class="t" style=''>
          		<?=_('LOGIN')?>
          		<?=$logo_fb?>
          		<?=$logo_go?>
          	</span>
          </li>
      	  <?endif;?>
          	  
    	</ul>
       <div class='clear'></div>
       <?if(!$this->session->isLogged()):?>
                    <div id='connect_Block' class="right art-Block hide" style='height:0px;z-index:1;width: 417px;margin-right:2px'>
									       <div class="art-Block-body">
									        <div class="art-BlockContent">
									         <div class="art-BlockContent-tl"></div>
									         <div class="art-BlockContent-tr"></div>
									         <div class="art-BlockContent-bl"></div>
									         <div class="art-BlockContent-br"></div>
									         <div class="art-BlockContent-tc"></div>
									         <div class="art-BlockContent-bc"></div>
									         <div class="art-BlockContent-cl"></div>
									         <div class="art-BlockContent-cr"></div>
									         <div class="art-BlockContent-cc"></div>
									         <div class="art-BlockContent-body">
									          <div class="inner-Block" >
									            <form class='left' id="login_form" method="post" action="/login" style='width: 170px;background-color:whiteSmoke;margin:4px'>
														<ul style=''>
													
															<li>
																<label>Se connecter via Yoomken</label>
															</li>
															<li>
																<input class='infieldlabel ' type="text" name="email" id="email" title='Email' class="" style='width: 100%'/>
															</li>
															<li class='clear'></li>
															<li>
																<input class='infieldlabel' type="password" name="password" id="password" title='<?=_('PASSWORD')?>' style='width: 100%' class="" />
															</li>
															<li class='clear'></li>
															<li>
																<input class='left' type="checkbox" value="1" name="remember_me" id="remember_me" />
																<label class='left' for="remember_me"><?=_('REMEMBER_ME')?></label>
																
															</li>
															<li class='clear'></li>
															<li><span class='error'></span></li>
														</ul>
											
													<div class="" >
														<a class='left' id="forgot" href="javascript:;"><?=_('FORGOT')?></a>
														<span class="art-button-wrapper" style="margin-right:-3px;z-index:0;">
															<span class="l"> </span>
					                                		<span class="r"> </span>
					                                		<span><input class="art-button" type='submit' value='<?=_('CONNECT')?>'/></span>
					                                	</span>
														<div style='clear:both;'></div>
													</div>
												</form>
												<form class='left' id='login_form' action="/login" style='width: 170px;background-color: #D1DDF0;margin:4px'>
														
													<ul style=''>
													
															<li>
																<label>Se connecter via Facebook</label>
																
															</li>
															<li>
																<fb:login-button 
																	registration-url="<?='http://' . $_SERVER["HTTP_HOST"] . '/app.php?go=user/signup_fb'?>"
																	on-login="onlogin_fb()" >
																	
																</fb:login-button> 
																<!-- show-faces="true" 
																	width="150" 
																	max-rows="1" -->
															</li>
													</ul>
												
												</form>
												<form class='left' id='login_form' action="/login" style='width: 170px;background-color:#F6F9ED;margin:4px'>
													<ul style=''>
															<li>
																<label class='left'>Se connecter via Google</label>
																<div class='cleared'></div>
  																<a class='left' href="<?php echo $_SERVER['PHP_SELF'] . '?openid_mode=checkid_setup&openid_identifier=google.com/accounts/o8/id' ?>" id="LoginWithGoogleLink">
  																	<img style="margin-right: 3px;"  src='/media/img/google-icon.png' height="16" width="16"></img>
  																	<span class="google" style='margin-top:-5px;'>
  																		<span>G</span><span>o</span><span>o</span><span>g</span><span>l</span><span>e</span> <span style='color:#1f47b2;'>Account</span>
  																	</span>
  																</a> 
															</li>
													</ul>
												</form>
												<div class='clear'></div>
									          </div>
									         </div>
									        </div>
									       </div>
					</div>
                    <div id='2-connect_Block' class="hide"></div>
			<?endif;?>		
			
						       