<?
$status ='';
$me = $this->session->me();
$who = $this->session->who();
$isowner = false;
if ($who):
	$isowner = ($me && $me->id == $who->id);
	$who = $isowner? $me:$who; // if is owner => affect $me to $who
	//_debug($who);
	$thumb75  = getPictureThumb($who->id, $who->id_img, 75,$who->email);
	$thumb150 = getPictureThumb($who->id, $who->id_img, 150,$who->email);
	$location = getLocation($who->spot);
	$ext  = $this->controller=='people'?'_USR':'_ACT';
	
	$myself = ($who->id == $this->session->getUserVar('id')) ;//&& isset($who->me_);
	if (!$myself)
	{
		switch ($who->me_)
		{
			case '0':
				$status = _('DETTACHED'); break;
			case 'F':
				$status = _('ATTACHED'); break;
			case 'W':
				$status = _('WAIT_DEAL'); break;
			case 'A':
				$status = _('IN_DEAL'); break;
		}
	}
	$services = array();
	if ($who->profil!='C'  && isset($who->serviceP)) foreach ($who->serviceP as $tag) $services[$tag] = gettext($tag);
	if ($who->profil!='P' && isset($who->serviceC)) foreach ($who->serviceC as $tag) $services[$tag] = gettext($tag);
?>
<div style="widthh:180px">
	 <div class='card-user'>
	 	
		<h4 class='entete-box title-box'> <?=_('MY_PROFIL')?></h4>
		
	 	 <div style="padding: 5px">
			  <h4 href='/boxy/profil/<?=$who->id?>' class='boxy left' titlebox="<?=$who->name?> ▸  Profil" title='<?=$who->name?>' style='margin:0px;cursor: pointer;overflow: hidden;width: 140px;'><?=$who->name;?></h4>
		      <div class="right" style="margin:0">
	  	  	 	<? if($this->session->isLogged() && $who->count_collaboWithMe):?>
					<span>&nbsp;</span>
					<span class='net-degree <?=$who->me_=='A'?'':'ui-widget-header'?>' title='<?=$who->name.' '.gettext('IS_'.($who->me_=='A'?'ACTUAL':'OLD').'_COLLABORATOR')?>'>
						1<sup style='vertical-align: baseline;'>er</sup>
					</span>
				 <?endif?>
	  	  	 </div>
		  	  <div class="cleared"></div>
		  	  <h5 class="" style='margin-top:0px'><?=who()->presta->job.' '.(who()->presta->amont?who()->presta->amont.' '.getCurrency(who()).' / '._('HOUR'):'')?></h5>
		      <h4> </h4>
		      <b style="margin-top:-5px"><?=implode(' | ',$services)?></b>
		      <div class="cleared"></div>
		      <span class="left" style="margin-bottom: 5px">à <?=$location?></span>
			  <div class="cleared"></div>
		      <div style="">
		     	 <img  title='<?=$who->name?>' class=" left boxy ppict" content="<img src='<?=$thumb150?>'/>" src="<?=$thumb75?>" alt="an image" style='padding:1px;cursor: pointer'>
		  	  	 <div class="left" style="padding-left: 5px">
		  	  	 	<?/*<span class='left' style="width:85px"><?=ucfirst($who->presta->job)?></span>*/?>
		  	  	 	<div class="cleared"></div>
		  	  	 	<span class="left"><?=($who->age?$who->age.' '._('ANS'):'')?></span>
		  	  	 </div>
		  	  	 <div class="cleared"></div>
		  	  	 <div class='right' style="margin:-35px -10px 0 0px">
			  		 
					 <?=$this->render('like/inner/action-like',array('act'=>$who,'sort'=>'USR'));?>
				 </div>
		  	  </div>
		  	  
		  	  <h5 style="border-bottom: 1px dashed #CCC; margin-right:0"><?=_('STATUS')?></h5>
		      <div style='margin-left: 5px' class="art-sidebar-status">
		      	<div class='tooltips' title ="<?=gettext('PROFIL_'.$who->profil)?>" toolposition='leftMiddle' targetposition='bottomRight'>
			      <span style='margin:1px' class='left <?=getClassProfil($who->profil)?> caseBigger' ></span>
			      <span class='left' style='margin:3px 2px' ><?=getTitleProfil($who->profil)?></span>
			    </div>
			      <div class='cleared'></div>
			      <div class='tooltips' title ="<?=gettext('STATUS_'.$who->status)?>" toolposition='leftMiddle' targetposition='bottomRight'>
					  <span style='margin:1px' class='left <?=getClassDispo($who->status)?> me-isaware caseBigger' ></span>
					  <span class="left" style='margin:3px 2px'><?=getTitleDispo($who->status)?></span>
				  </div>
				  <div class='cleared'></div>
			</div>
			<div class='cleared'></div>
	  		<?if($this->session->isLogged() && !$myself):?>
	  		<br/>    
				<div class="art-button-wrapper hide left <?=$who->id?>-follow" style='overflow:visible; height: 45px' id=''>
					<?=$this->render('people/inner/actions-follow',array('usr'=>$who));?>
				</div>
	      	<?endif;?>
	      	
		  </div>
	  	  <div class="cleared"></div>
	  	  <? $diplayEmail = (isme() || (ishim() && $who->me_ == 'A' && $who->_me == 'A') );
	  	  if ($diplayEmail):?>
	  	  <div class='more-coordonnees hide'>
		  	  	<span class='left' style="opacity: 0.5;width: 35px">Email</span>
		  	  	<span class='left'><?=$who->email?></span>
		  	  	 <div class="cleared"></div>
		  	  	<span class='left' style="opacity: 0.5;width: 35px">Tél.</span>
		  	  	<span class='left'><?=$who->mobil?$who->mobil:_('NO_DATA');?></span>
		  	  	<div class="cleared"></div>
		  </div>
		  <?endif;?>
	  	  <div class="coordonnees" style="height: 15px;" >
	  	  	<a href='/boxy/profil/<?=$who->id?>' class='boxy left' titlebox="<?=getTitleStatus($who).' '.$who->name?> ▸  Profil" title='<?=$who->name?>'><?=_('GETMORE')?></a>
	  	  	<?if ($diplayEmail):?>
	  	  	<a href='#' class='right' title='<?=_('COORDONNEES')?>' onclick="$(this).parent().prev().slideToggle('slow');"><?=_('COORDONNEES')?></a>
	  	  	<span  class='right'>&nbsp;|&nbsp;</span>
	  	  	<? endif;?>
	  	  </div>
  	  </div>
  	  
  	  <div class="cleared"></div>
  	  <br/>
      
      <?//<a href="mailto:info@company.com">info@company.com</a><br>?>
 </div> 
 
 
	 <?
	 	if ($this->controller!='message'):
	 	$mdlusr = new YOO_UserModel();
		$myrels = $mdlusr->getRelations(null);
		$couples =  $mdlusr->getRelations(null,'<-ME->');
		$suivis = $mdlusr->getRelations(null,'ME->');
		$collabos = $mdlusr->getRelations(null,'ME->>');
		$suiveurs = $mdlusr->getRelations(null,'<-ME');
	 ?>
	 <div style="widthh:180px">
		<div class='card-user'>
			 	
			<h4 class='entete-box title-box'> <?=_('MY_RELATIONS').' ('.$myrels[0].')'?></h4>
			
			<input type="text" name='searchrelation' class="enabled left" id="" value="" placeholder="<?=_('SEARCH_RELATION')?>" style='padding-right: 25px;width: 150px;margin:0 4px'/>
		     <button type="submit" style='font-size: 12px;background-color: transparent;border-color: transparent;margin: -0px 0px 0px -38px;color: #685840;float: left;' >Ƃ<span class="ti" style='cursor:pointer' >-</span>Ƌ</button>
		     <div class='cleared'></div>
		     <div id='block-relationship'>
		     	<?=$this->render('people/inner/displayRelations',array('myrelations'=>$myrels));?> 
			 </div> 	
				      
		  	  <div class="cleared"></div>
		  	  <div class='more-coordonnees hide'>
			  	  	<div style='margin-left: -2px' class='art-sidebar-relation' >
					  <div class='tooltips' rel='/ajax/people/display/icon/followedOnly/<?=$who->id?>' head="<?=preg_replace('/\{#user\}/', $who->name, _('PROFILS_FOLLOWED_BY_AND_NOT_FOLLOW'))?>" 
					  	toolposition='leftMiddle' targetposition='bottomRight'>
				      	<img class='left' style="border: none;" class='left' src="/css/images/me-v2_ico16.png"/>
				      	<span class="left" style="margin:2px"><?=($isowner?_('MYS'):_('HISS')).' '._('FOLLOWED_PUR')?> (<?=$suivis[0]?>)</span>
				      </div>
				      <div class='cleared'></div>
				      <div class='tooltips' rel='/ajax/people/display/icon/followersOnly/<?=$who->id?>' head="<?=preg_replace('/\{#user\}/', $who->name,_('PROFILS_FOLLOW_AND_NOT_FOLLOWED'))?>"
				      	toolposition='leftMiddle' targetposition='bottomRight'>
					      <img class="left" style="border: none;" class='left' src="/css/images/-mev2_ico16.png"/>
					      <span class="left" style="margin:2px"><?=($isowner?_('MYS'):_('HISS')).' '._('FOLLOWER_PUR')?> (<?=$suiveurs[0]?>)</span>
					  </div>
					  <div class='cleared'></div>
					  <div class='tooltips' rel='/ajax/people/display/icon/coupleOnly/<?=$who->id?>' head="<?=_('PROFILS_FOLLOW_AND_FOLLOWED').' '.$who->name?>"
					  	toolposition='leftMiddle' targetposition='bottomRight'>
					      <img class="left" style="border: none;" class='left' src="/css/images/-me-_ico16.png" />
					      <span class="left" style="margin:2px"><?=($isowner?_('MYS'):_('HISS')).' '._('FOLLOWER_AND_FOLLOWED')?> (<?=$couples[0]?>)</span>
					  </div>
					  <div class='cleared'></div>
					  <div class='tooltips' rel='/ajax/people/display/icon/collaboratorsOnly/<?=$who->id?>' head="<?=_('PROFILS_IS_COLLABORATING_NOW_WITH').' '.$who->name?>"
					  	toolposition='leftMiddle' targetposition='bottomRight'>
					      <img class="left" style="border: none;" class='left' src="/css/images/dealv2_ico16.png" />
					      <span class="left" style="margin:2px"><?=($isowner?_('MYS'):_('HISS')).' '._('ACTUAL_COLLABORATOR')?> (<?=$collabos[0]?>)</span>
					  </div>
			      </div>
			  </div>
		  	  <div class="coordonnees" style="height: 15px;" >
		  	  	<a style='cursor:pointer' class=' left' onclick="$(this).parent().prev().slideToggle('slow');" ><?=_('GETMORE')?></a>
		  	  </div>
	  	  </div>
	  	  
	  	  <div class="cleared"></div>
	  	  <br/>
	      
	      <?//<a href="mailto:info@company.com">info@company.com</a><br>?>
	 </div>
	 <? endif;?>                                         
<?endif;?>