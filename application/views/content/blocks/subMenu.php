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
	//die($typeJournal);
?>

<div class="art-Post sub-menu" style="z-index:3;position: static;height: auto;padding-top:0px">		
			<div style="margin: 15px 0">
				<div class="full" style='margin-top: 5px;width: 100%'>
							
					<div class="profile vcard group" >
						
						<?if($this->session->isLogged() && (isme() || (ishim() && $journal=='WALL' && who()->_me)) ):?>		
							<?=$this->render('content/blocks/sharebox',array('me'=>$me));?>
						<?endif;?>
					</div>
				</div>
			</div>
					
			<div class='clear'></div>
			<div id="the-sub-menu" style="position: relative;z-index: 3">
				<ul class="profile-tabs tabs" style ='height: 27px;'>
					<li class='<?=$this->controller=='content' && $journal=='BASE'?'active':''?> sub-menu-multi'>
						<a href='/<?=$urlwho?>timeline/init' style="width:105px;padding:0 0 0 0px;">
							<span class='meta' style="width:105px;text-align: center"><?=_('TIMELINE')?></span>
						</a>
					</li>
					
					<li class='<?=$this->controller=='content' && $journal=='OFFR' ?'active':''?> sub-menu-multi'>
						<a href='/<?=me()->url?>/timeline/offers' style="width:85px;padding:0 0 0 0px;">
							<span class='meta' style="width:75px;text-align: center"><?=_('OFFER')?>s</span>
						</a>
					</li>
					
					
				</ul>
				
			</div>
			
			<div class='clear'></div>
			
			<?/* if(in_array($this->controller,array('people','content','user','message','question'))):?>
					<? if ((!isset($journal) || $journal!='WALL') && isset($nbfilters) && $nbfilters && $nbtot):?>
					<div style="position:relative;">
						<table id='rappel-filter'cellspacing="0" cellpadding="0" border="0" width="400px" style='font-size: 11px;position: absolute;top:33px;right:2px;z-index: -1'>
							<tbody><tr>
								<td class="yellow-left">
									<div style='margin-top:-5px'>
										<?=preg_replace('/\{#nbfilters\}/',$nbfilters,_('RAPPEL_NB_FILTRE'))?>
									</div>
								</td>
								<td class="yellow-right"><a class="close-green"><img alt="" src="/css/images/messages/icon_close_yellow.gif"></a></td>
							</tr>
							</tbody>
						</table>
					</div>
				<? endif;?>
							
			<? endif;?>*/?>
	<div class="cleared"></div>
	</div>
<? if (1 || $journal != 'OFFR'):?>
	<?=$this->render($this->controller.'/blocks/subsubMenu');?>
<? endif;?>
<!--<div style="z-index:2;position: fixed;top:35px;width: 100%;height: 15px;background-image: url('/css/images/bg-degrade.png');"></div>-->
