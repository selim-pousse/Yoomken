<?
// pas de connection possible en mode waiting list
//if (MODE_SIGNUP <0) return;

	// Create our Application instance (replace this with your appId and secret).
	//$fb = Registry::getInstance()->get('fb');
	//_debug($_SESSION);
	$logo_yo = '<img style="margin:0 '.($this->session->isLogged()?'2':'0').'px -5px;border-radius:2px;" src="/media/img/yoom.jpg" height="14" width="14">';
	$logo_fb = '<img src="/css/images/fb_ico.jpg" style="margin:0 2px -5px;border-radius:2px;border:none"/>';
	$logo_go = '<img style="margin:0 '.($this->session->isLogged()?'2':'0').'px -5px;border:2px solid white;border-radius:2px;" src="/media/img/google-icon.png" height="14" width="14">'; 
	$logo_fr = '<img style="margin:0 2px -5px;border:2px solid white;border-radius:2px;" src="/media/img/france.png" height="18" width="18">';
	$logo_eng= '<img style="margin:0 2px -5px;border:2px solid white;border-radius:2px;" src="/media/img/england.png" height="18" width="18">';
	$logo_fr_small 	= '<img style="margin:-1px 2px -5px;border:2px solid white;border-radius:2px;" src="/media/img/france.png" height="14" width="14">';
	$logo_eng_small = '<img style="margin:-1px 2px -5px;border:2px solid white;border-radius:2px;" src="/media/img/england.png" height="14" width="14">';
	$mdlmsg = new YOO_MessageModel();
	$this->set('contacts',$mdlmsg->contactsUnread());
	eval('$unread = '.$mdlmsg->countUnread(null).';');
	$this->set('unread',$unread);
	if ($this->session->who())
	{
		eval('$whounread = '.$mdlmsg->countUnread($this->session->who()->id).';');
		$this->set('whounread',$whounread);
	}
	
	$langue = $this->session->get('lang');
?>
<script>



function onlogin_fb()
{
	FB.getLoginStatus(function(response) {
		//console.log(response);
	  if (response.status == 'connected') {
	    // logged in and connected user, someone you know
	     
	     response.authResponse['access_token'] = response.authResponse.accessToken;
	     response.authResponse['signed_request'] = response.authResponse.signedRequest;
	     delete response.authResponse.signedRequest;
	     delete response.authResponse.accessToken;
	     
	   	 document.location.href = '/app.php?go=user/login_fb&'+jQuery.param(response.authResponse);
		 return false;
	  } else {
		// no user session available, someone you dont know
	    if (response.status == 'notConnected')
	    {
		    //console.log('je suis là!');
		    
		    return true;
	    	// need to be resynchronized
	    }
	    else document.location.href = '/app.php?go=user/signup_fb';
	    return true;
	  }
	});
}

function ChangeLang(menu) {
	if (menu.style.display == 'none') menu.style.display = 'block';
	else menu.style.display = 'none';
}
</script>

	<ul class="art-Post-menu me-menu" style="margin: 2px 0 0 0px;">
       	  <?
       	  if(!$this->session->isLogged()):
       	  ?>	
          <li id='connect_Button' class="apply toogle alone <?=(0 &&in_array($this->action,array('activate','welcome')) && !isset($waitAct) ?'down':'')?>" style='cursor:pointer;margin-left: 50px;'>
          	<span class="me" style='width: 150px'>
          		▼&nbsp;
          		<?=_('LOGIN')?>
          		<?//=$logo_fb?>
          		<?//=$logo_go?>
          	</span>
          	
          </li>
      	  <?endif;?>
      	  
		  <?if($this->session->isLogged()):?>
		      <?/*<li id='disconnect' class="apply alone" style='position: relative'>
		      	<table class='tb-transborder'>
					<tr>
					<td class='ml-transborder'></td><td class='' style="background-color: #685840">  
					  	<span class="me" style='cursor: pointer;float:left;padding: 0px 0 6px;'>
					  		<?php switch($this->session->isLogged()){
					  			case 1: echo $logo_yo;break;
					  			case 2: echo $logo_fb;break;
					  			case 3: echo $logo_go;break;
					  		}?>
					  		<?=HI.' '.$this->session->getUserVar('shortname')?> ▼
					  	</span> 
				  	</td>
				  	<td class='mr-transborder'></td>
				  	</tr>
				 </table>
				  	
					<div class="cleared"></div>
					<table class='tb-transborder hide' id='disconnect_Block' style="width: 100%;position: absolute;left:0;min-width: 155px;">
					<tr>
					<td class='ml-transborder'></td><td class='bg-block-soft'>  
					<div  class='' >
						<div class='hover-grown' onclick="loadMyProfil()">
							<span class='ui-icon ui-icon-person left'></span><span id='link-profil' class='brown-bold'><?=_('EDIT_PROFIL')?></span>
						</div>
						<div class="cleared"></div>
						<div class='hover-grown' onclick="loadMyOptions()">
								<span class='ui-icon-wrench ui-icon left'></span><span class='brown-bold'><?=_('Options')?></span>
						</div>
						<div class="cleared"></div>
						<div class='hover-grown'>
				  			<?if (0 && $this->session->isLogged()==2):?>
						    	<a href="<?=Facebook::getInstance()->getLogoutUrl()?>" class="fb_button fb_button_medium">
						    		<span class="fb_button_text">Logout</span>
						    	</a>
					    	<?else:?>
								<a href="/logout">
						      		<span class='ui-icon-power ui-icon left' style=''></span>
						      		<span class="brown-bold" style='background-image: none;padding:0;margin:0'><?=_('LOGOUT')?></span>
						    	</a>
					        <?endif;?>
			          	</div>
		          	</div>
		          	</td><td class='mr-transborder'></td>
					</tr>
					<tr>
						<td class='bl-transborder'></td><td class='bm-transborder'></td><td class='br-transborder'></td>
					</tr>
					</table>
		       </li>*/?>
		  	 <li class="apply alone" style="margin-left:30px">
				<?=$this->render('/layout/module/mainsearch');?>
		  	 </li>
		  	 
		  	 <?if($this->session->isLogged()):?>
		  	 		<?// logout ?>
		  	  		<li  class="apply alone" style='margin: -1px 0px 0 0px;'>
	  	  				<?if (0 && $this->session->isLogged()==2):?>
					    	<a href="<?=Facebook::getInstance()->getLogoutUrl()?>" style="background-image: url(/css/images/ico-logout.png);height: 20px;width: 20px;margin:2px">&nbsp;
			       			</a>
				    	<?else:?>	
							<a href='/logout' style="background-image: url(/css/images/ico-logout.png);height: 20px;width: 20px;margin:2px">&nbsp;
			       			</a>
				        <?endif;?>
			  	  </li>	
			  	  	 
			  	  <?php // Messages ?>
			       <li id='not-read' class="apply alone" style='margin: -1px 5px 0 30px;'>
			       	   <span id='unread'class="me <?=isset($unread) && $unread? 'positive':''?>" style=''>
				       		<?= isset($unread) && $unread? $unread:''?>
				       </span>  
				       <div class="cleared"></div>
				       	<div id='not-read_Block' class='hide' style='position: absolute;width: 200px;'>
								<?=$this->render('message/preview');?>
						</div>
			  	  </li>
			  	  
			      
			      	       
	         <?endif;?>
         
		  	   <?php /*  // disponibilité  ?>
		       <li id='available' class="apply alone" style='margin-top:0px'>
		       			<span class='me <?=getClassDispo(me()->status)?> me-isaware caseBigger'></span>
		       		<div class="cleared"></div>  
		       		<div id='available_Block' class='hide' style='width: 150px;position: absolute;min-width: 150px;'>
				  	<span class='tip-before-before' style='position: absolute;'></span>
		       		<table  class='tb-transborder tip-before' style="position: absolute;width: 100%;left:-44%;top:18px;">
					<tr>
						<td class='tl-transborder'></td><td class='tm-transborder'></td><td class='tr-transborder'></td>
					</tr>
					<tr>
					<td class='ml-transborder'></td><td class='bg-block-soft' style="padding: 0"> 
						<div class='' style="background-color: #685840;height: 20px">
							<span class='brown-bold left' style="padding: 5px;margin:0;color:#E4DDD3">&nbsp <?=_('LISTEN_MARKET')?></span>	
						</div>
						<div class="cleared"></div>
						<div onclick="availability(2)" class='hover-grown'>
							<span class='caseDispo' style="margin-top:-1px"></span>
							<span class='brown-bold left' style="padding-top: 2px">&nbsp <?=_('IAM_AWARE')?></span>	
						</div>
						<div class="cleared"></div>
						<?//<li onclick="availability(3)">
						//	<span class='caseBusy' style=''></span>
						//	<span class='brown-bold'>&nbsp <?=_('BUSY')</span>
						//</li>?>
						<div onclick="availability(4)" class='hover-grown'>
							<span class='caseIndispo' style='margin-top:-1px'></span>
							<span class='brown-bold left' style="padding-top: 2px">&nbsp <?=_('IAM_UNAWARE')?></span>
						</div>
						<div class="cleared"></div>
						<div onclick="availability(-1)" class='hover-grown'>
							<span class='caseOut' style='margin-top:-1px'></span>
							<span class='brown-bold left' style="padding-top: 2px">&nbsp <?=_('IAM_HIDDEN')?></span>	
						</div>
		          	</td><td class='mr-transborder'></td>
					</tr>
					<tr>
						<td class='bl-transborder'></td><td class='bm-transborder'></td><td class='br-transborder'></td>
					</tr>
					</table>
					</div>
		       </li>*/?>
		       
		       <li id='type-profil' class="apply alone" style=''>
		       		<span class="me" style=''>
		       			<span class='<?=getClassProfil(me()->profil)?> caseBigger'></span>
		       		</span>
		       		<div class="cleared"></div>
		       		<div id='type-profil_Block' class='hide' style='position: absolute;min-width: 250px;'>
				  	<span class='tip-before-before' style='position: absolute;'></span>
		       		<table  class='tb-transborder tip-before' style="position: absolute;width: 100%;left:-44%;top:18px;">
					<tr >
						<td class='tl-transborder'></td><td class='tm-transborder'></td><td class='tr-transborder'></td>
					</tr>
					<tr>
					<td class='ml-transborder'></td><td class='bg-block-soft' style="padding: 0">
						<div class='' style="background-color: #685840;height: 20px">
							<span class='brown-bold left' style="padding: 5px;margin:0;color:#E4DDD3">&nbsp <?=_('STATUS_MARKET')?></span>	
						</div> 
						<div class='hover-grown'>
							<a class='brown-bold' href='/switch/profil/N/<?=$this->controller.'/'.$this->action?>' style='width: 100%'>
								<span class='caseNeutral' style='margin-top:-1px'></span>
								<span class="left" style="padding-top: 2px">&nbsp <?=_('NEUTRAL_PROFIL')?></span>	
							</a>
						</div>
						<div class='hover-grown'>
							<a class='brown-bold' href='/switch/profil/P/<?=$this->controller.'/'.$this->action?>' style='width: 100%'>
								<span class='casePresta' style='margin-top:-1px'></span>
								<span class="left" style="padding-top: 2px">&nbsp <?=_('PRESTA')?> (Provider)</span>	
							</a>
						</div>
						<div class='hover-grown'>
							<a class='brown-bold' href='/switch/profil/C/<?=$this->controller.'/'.$this->action?>' style='width: 100%'>
								<span class='caseEmploy' style='margin-top:-1px'></span>
								<span class="left" style="padding-top: 2px">&nbsp <?=_('EMPLOYER')?> (Asker)</span>
							</a>
						</div>
						<div class='hover-grown'>
							<a class='brown-bold' href='/switch/profil/B/<?=$this->controller.'/'.$this->action?>' style='width: 100%'>
								<span class='caseBothProfil' style='margin-top:-1px'></span>
								<span class="left" style="padding-top: 2px">&nbsp <?=_('BOTH_PROFIL')?> (Provider & Asker)</span>
							</a>	
						</div>
		          	</td><td class='mr-transborder'></td>
					</tr>
					<tr>
						<td class='bl-transborder'></td><td class='bm-transborder'></td><td class='br-transborder'></td>
					</tr>
					</table>
					</div>
		       </li>
		   <? endif;?>
		       <li id='language' class="apply alone <?php $this->session->get('lang')?>">
		       	  <?php 
			  			switch($langue ){
				  			case 'en': echo $logo_eng;break;
							default: echo $logo_fr; break;
			  			}
			  		?>
					<div class="cleared"></div>
				  <div id='language_Block' class='hide' style='position: absolute;min-width: 105px;'>
				  	<span class='tip-before-before' style='position: absolute;'></span>
		       		<table  class='tb-transborder tip-before' style="position: absolute;width: 100%;left:-44%;top:18px;">
					<tr >
						<td class='tl-transborder'></td><td class='tm-transborder'></td><td class='tr-transborder'></td>
					</tr>
					<tr>
					<td class='ml-transborder'></td><td class='bg-block-soft' style="padding: 0">
						<div class='' style="background-color: #685840;height: 20px">
							<span class='brown-bold left' style="padding: 5px;margin:0;color:#E4DDD3">&nbsp <?=_('LANGUAGE')?></span>	
						</div>
						<div class='hover-grown'>
				  			<a class='brown-bold' href='/switch/lang/fr<?='/'.$this->controller.'/'.$this->action?>'>	
					  			<?=$logo_fr_small?>&nbsp;Français
					  		</a>
					  	</div>
					  	<div class='hover-grown'>
				  			<a class='brown-bold' href='/switch/lang/en<?='/'.$this->controller.'/'.$this->action?>'>	
					  			<?=$logo_eng_small?>&nbsp;English
					  		</a>
					  	</div>
				  	  </td><td class='mr-transborder'></td>
					  </tr>
					  <tr>
							<td class='bl-transborder'></td><td class='bm-transborder'></td><td class='br-transborder'></td>
					  </tr>
					  </table>
					</div>
					  	
			 </li> 	
		
      	  
      </ul>
    
       <div class='cleared'></div>
       <?if(!$this->session->isLogged()):?>
                    <div id='connect_Block' class="left hide <?=(0 &&in_array($this->action,array('activate','welcome')) && !isset($waitAct)?'show':'')?>" 
                   		style='right: -10px;margin: 2px 7px 0px;position: absolute;top: 35px;width: 490px;z-index: 1;'>
		       		<table  class='tb-transborder' style="">
					<tr >
						<td class='tl-transborder'></td><td class='tm-transborder'></td><td class='tr-transborder'></td>
					</tr>
					<tr>
					<td class='ml-transborder'></td><td class='bg-block-soft' style="padding: 0">
					         <div class="art-BlockContent-body">
					            <form class='left bg-block-soft' id="login_form" method="post" action="/login" style='width: 250px;background-color:whiteSmoke;margin:0px;padding: 10px;'>
										<ul style=''>
									
											<li>
												<label><?=_('CONNECT')?> via Yoomken</label>
											</li>
											<li>
												<input class="infieldlabel enabled ui-corner-all" type="text" name="email" id="email" title="Email" placeholder='Pseudo ou Email' style="width: 230px;border: 1px solid #ccc;padding: 5px">
											</li>
											<li>
												<input class='infieldlabel enabled ui-corner-all' type="password" name="password" id="password" title='<?=_('PASSWORD')?>' placeholder='<?=_('PASSWORD')?>' style="width: 230px;border: 1px solid #ccc; padding: 5px"  />
											</li>
											<li style="width: 230px">
												<input class='left' type="checkbox" value="1" name="remember_me" id="remember_me"  checked="checked""/>
												<label class='left' style="line-height: 2" for="remember_me"><?=_('REMEMBER_ME')?></label>
												<a class='right' style="line-height: 2" id="forgot" href="/init/sendpass"><?=_('FORGOT')?></a>
											</li>
											<li class='clear'></li>
											<li><span class='error' style='margin: -5px 0 5px;'></span></li>
										</ul>
							
									<div class="" >
										
										<input class="action button" type='submit' value='<?=_('CONNECT')?>'/></span>
										<div style='clear:both;'></div>
									</div>
								</form>
								<form class='left bg-block-soft' id='login_form' action="/login" style='width: 170px;background-color: whitesmoke;margin:0 10px;padding:10px'>
									<ul style=''>
											<li>
												<label><?=_('CONNECT')?> via Facebook</label>
												
											</li>
											<li>
												<fb:login-button id='fb-login'
													registration-url="<?='http://' . $_SERVER["HTTP_HOST"] . '/callback/register_fb'?>" 
													on-login="onlogin_fb()">
												</fb:login-button>
												<!-- show-faces="true" 
													width="150" 
													max-rows="1" -->
											</li>
									</ul>
								</form>
								<form class='left bg-block-soft' id='login_form' action="/login" style='width: 170px;background-color:whitesmoke;margin: 5px 10px;padding: 10px'>
									<ul style=''>
											<li>
												<label class='left'><?=_('CONNECT')?> via Google</label>
												<div class='cleared'></div>
  												<a class='left LoginWithGoogleLink' href="<?php echo $_SERVER['PHP_SELF'] . '?openid_mode=checkid_setup&openid_identifier=google.com/accounts/o8/id' ?>" id="">
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
								</td><td class='mr-transborder'></td>
							  </tr>
							  <tr>
									<td class='bl-transborder'></td><td class='bm-transborder'></td><td class='br-transborder'></td>
							  </tr>
							  </table>
					</div>
                    <div id='2-connect_Block' class="hide"></div>
                                       
			<?endif;?>	
 			       