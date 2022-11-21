<?php 
if ($this->session->isLogged()){
	$idwho = $this->session->who()->id;
	$isowner = $this->session->get('user')->id == $idwho;
	$idwho = $isowner?'00':$idwho;
	$urlwho = $this->session->who()->url.'/';
}
else {
	$idwho = $urlwho = '';
}


$status ='';
$me = $this->session->me();
$who = $this->session->who();
$isowner = false;

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
	//$services = array();
	//if ($who->profil!='C'  && isset($who->serviceP)) foreach ($who->serviceP as $tag) $services[$tag] = gettext($tag);
	//if ($who->profil!='P' && isset($who->serviceC)) foreach ($who->serviceC as $tag) $services[$tag] = gettext($tag);
?>


	<div class="art-Post sub-menu can-be-fixedd" style="z-index:3;position:static<?//=(BROWSER_MOBILE?'position:static;margin-bottom:-36px':'')?>">		
				<div style="margin: 15px 0">
					
					<div class='secondary' style="float: right;width: 220px">
						<? if (count($who->service)):?>
							<h3 style="margin:0">&nbsp;
								<span class='left'>Services &nbsp;</span>
								<span style="float: left;margin: -5px 0px;display: inline-block;background: url(/css/images/icon-services.png) no-repeat center;height: 17px;width: 17px;">&nbsp;</span>
								<b class='right' style="color:#685940"><?=isset($who->presta->amont) && $who->presta->amont? $who->presta->amont.' '.getCurrency(who()).' / '._('HOUR'):''?></b>
							</h3>
							<div style="width: 100%;height: 20px;margin-top: 8px;float:left;"  >
								<ol class='services-tag' style="">
									<?foreach ($who->service as $key => $tag):?>
												<li><a href="/search/network/<?=$key?>-t" class="" style='color:#685840;cursor:pointer;margin-top:3px'><?=$tag?></a></li>
									<?endforeach;?>
								</ol>
							</div>
						<?endif;?>
					</div>
					<div class="full" style='margin-top: 5px;width: 710px'>
						
						<div class="profile vcard group" >
							<img  title='<?=$who->name?>' class=" left boxy photo80" content="<img src='<?=$thumb150?>'/>" src="<?=$thumb75?>" alt="an image" style='cursor: pointer'>
							<h1 style='margin:0'>
								<div class="fn edit" style='font-size: 20px' >
									<?=getTitleStatus($who).' '.$who->name?>
								</div>
							</h1>
								
							<div style="font-size:1.2em;color:#999 ;margin-top: 4px">
								<a href="/search/network/<?=getAddressUser($who,true)->id?>-l" class="locality"><?=$location?></a>
							</div>
							
							<div style="margin-top:8px;">
								<?=$this->render('layout/module/actions-button',array('usr'=>who(),'all'=>'true'));?>
							</div>
						</div>
					</div>
				</div>
				
				<div class='clear'></div>
				
				<? if (me()) :?>
				<div id="the-sub-menu">
					<ul class="profile-tabs tabs" style =''>
						<? /*if (ishim()) :?>
							<li class='<?=$this->controller=='content'?'active':''?> sub-menu-multi'>
								<a href='/<?=$urlwho?>timeline/wall' style="width:105px;padding:0 0 0 0px;">
									<span class='count' style="width:75px ">&nbsp;</span>
									<span class='meta' style="width:105px;text-align: center"><?=_('HIS_WALL')?></span>
								</a>
							</li>
						<? endif;*/?>
						
						<li class='<?=$this->controller=='content' && $journal=='WALL' ?'active':''?> sub-menu-multi'>
							<a href='/<?=$urlwho?>/timeline/wall/ALL' style="width:105px;padding:0 0 0 0px;">
								<span class='count' style="width:75px ">&nbsp;</span>
								<span class='meta' style="width:105px;text-align: center"><?=ishim()?_('HIS_WALL'):_('MY_WALL')?></span>
							</a>
						</li>
					
						<li class="<?=$this->controller=='people' ?'active':''?> sub-menu-multi">
							<a href="/<?=$urlwho?>relations/init">
								<span class="count"><?=number_format($who->count_rel,0,',',"'")?></span> 
								<span class="meta">Relations</span>
							</a>
						</li>
						<li class='<?=$this->controller=='badge'?'active':''?> sub-menu-multi'>
							<a href="/<?=$urlwho?>badges">		
								<span class="count"><?=$who->count_bdg?></span> 
								<span class="meta">Badges</span>
							</a>
						</li>
						
						<? if (isme() || who()->me_=='A') : // you must be in working relation?>
							<li class="<?=$this->controller=='message'?'active':''?> sub-menu-multi" style="">
								<a href="/<?=$urlwho?>messages" style="">
									<span id='<?=$idwho?>-unread' class="count" ><?= isset($whounread) && $whounread? $whounread:'0'?></span> 
									<span class="meta" style=""><?=_('Messages')?></span>
								</a>
							</li>
						<? endif;?>
						
						<li class="<?=$this->controller=='user'?'active':''?> sub-menu-multi" style="border-right: none;padding-right: 0px;">
							<a href="/<?=$urlwho?>about">
								<span class="count">&nbsp;</span> 
								<span class="meta"><?=_('ABOUT_ME')?></span>
							</a>
						</li>
					</ul>
					
				</div>
				<div class='clear'></div>
				
				<? endif;?>
		</div>
		
	<?=$this->render($this->controller.'/blocks/subsubMenu')?>


				
<!--<div style="z-index:2;position: fixed;top:35px;width: 100%;height: 15px;background-image: url('/css/images/bg-degrade.png');"></div>
	<div class='shift-submenu' style='padding-top: 180px;display: block;'></div>-->


