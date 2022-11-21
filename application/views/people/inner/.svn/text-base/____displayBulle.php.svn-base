<?php
	$location = isset($usr->spot) ? getLocation($usr->spot) : 'nulle part';
	$youHe = isme()?_('YOU'):who()->name;
	if ($usr->me_=='A' && $usr->_me='A') {
		 $relicon = 'dealv2_ico16';
		 $reltitle = preg_replace(array('/\{#who\}/','/\{#user\}/'), array($youHe,$usr->name), _('TXT_RELATION_ME->>'));
	}
	else if ($usr->me_ && $usr->_me) {
		$relicon = '-me-_ico16';
		$reltitle = preg_replace(array('/\{#who\}/','/\{#user\}/'), array($youHe,$usr->name), _('TXT_RELATION_<-ME->'));
	}
	else if ($usr->me_) {
		$relicon = 'me-v2_ico16';
		$reltitle = preg_replace(array('/\{#who\}/','/\{#user\}/'), array($youHe,$usr->name), _('TXT_RELATION_ME->'));
	}
	else if ($usr->_me) {
		$relicon = '-mev2_ico16';
		$reltitle = preg_replace(array('/\{#who\}/','/\{#user\}/'), array($youHe,$usr->name), _('TXT_RELATION_<-ME'));
	}
	else {
		$relicon = 'no-relationv2_ico16';
		$reltitle = preg_replace(array('/\{#who\}/','/\{#user\}/'), array($youHe,$usr->name), _('TXT_RELATION_NONE'));
	}
	$reltitle = ucfirst($reltitle);
	
	if (!isset($iscontent)) $margin = 30;
	else $margin = 0;
	
if ($usr->shortdesc)
	$html_shortdesc = shortenString(strip_tags($usr->shortdesc),250,'short');
else 
	$html_shortdesc = _('DESC_NOT_SPECIFIED');
?>
<div class='user'>
	<div class='bulle left block-sub-more' style='border-top-right-radius: 0px 0px;width: 550px;position: relative;margin-left: <?=$margin?>px;'>
		<div class="art-button-wrapper follow <?=$usr->id?>-follow" >
			<?=$this->render('people/inner/actions-follow',array('usr'=>$usr));?>
		</div>
		
		<a href="/<?=$usr->url?>/timeline/wall"><img src="<?=getUserPic($usr->id,$usr->id_img,75,$usr->email)?>" 
			switch=""
			alt="<?=$usr->name?>" 
			style='margin:5px'
			width="75px" height="75"
			class="ppict left"
			title="<?=$usr->name?>"/></a>
		
		<span title="<?=getTitleProfil($usr->profil)?>" class='left <?=getClassProfil($usr->profil)?>' ></span> &nbsp&nbsp
		<span title="<?=getTitleDispo($usr->status)?>" class='left <?=getClassDispo($usr->status)?>' ></span> &nbsp&nbsp
		<span class="left" title="<?=$reltitle?>" style="height: 20px;width: 28px;border: none;margin:-2px 0 0 2px;background-image: url(/css/images/<?=$relicon?>.png);" > </span>
		<a class="name-usr" style='width: 210px;float: left;padding: 5px 2px 0 2px;font-size: 13px;height: 10px' href="/<?=$usr->url?>/timeline/wall"><?=$usr->name?></a>
		<? if($this->session->isLogged() && $usr->count_collaboWithMe):?>
			<span>&nbsp;</span>
			<span class='net-degree left <?=$usr->me_=='A'?'':'ui-widget-header'?>' title='<?=gettext('IS_'.($usr->me_=='A'?'ACTUAL':'OLD').'_COLLABORATOR')?>'>
				1<sup style='vertical-align: baseline;'>er</sup>
			</span>
		<?endif?>
		
		<h4 class=""><?=$usr->presta->job.' '.($usr->presta->amont?$usr->presta->amont.' '.getCurrency(who()).' / '._('HOUR'):'')?></h4>
		<div class='' style='font-style: italic;'>
			<img class='quote-user' src='/css/images/PostQuote.png' style='border: none'/>
			<span class='usr-bulle-desc' style=''><?=$html_shortdesc?></span>
		<br/>
		  <div class='left' style='padding-top:5px;width: 255px;'>
			<div class='left' style='font-size: 1.1em;font-weight: bold;'>#&nbsp;</div>
			<div style="height:20px;width: 240px;overflow: hidden">
				<?if (isset($usr->service)) foreach ($usr->service as $tag):?>
					<a class="textboxlist-bit textboxlist-bit-box" style='text-decoration: none;color:#685840;cursor:pointer'><?=_($tag)?></a>
				<?endforeach;?>
			</div>
		  </div>
		  <div class='right' style='width: 200px;padding-top:5px;overflow: hidden;'>
				<div style="height:20px;">
					<span style='font-size: 1.5em;font-style: normal'>❂</span> <?=$location?>
				</div>
		  	</div>
		  	<?if ($this->session->isLogged() && $usr->id!=$this->session->me()->id):?>
				<div class='left' style='font-style: normal;width:550px;margin-left: 10px'>
					<form suggest='<?=(isSession() && $usr->count_collaboWithMe)?'none':'collaborate'?>' class='form-like' action='/ajax/like' method="POST">
						<input type="hidden" name='idactlike' value='<?=$usr->id?>'/>
						<input type="hidden" name='typelike' value='<?=$usr->isLiked?'N':'L'?>'/>
						<input type="hidden" name='sort' value='USR'/>
				  		<a rel='/ajax/people/display/icon/collaborator/<?=$usr->id?>'class="left link-like" onclick="$(this).parent().submit()" title='<?=_('I_RECOMMAND').' '.$usr->name?>' style='cursor: pointer'>
				  			<?=($usr->isLiked?_('I_NOT_RECOMMAND'):_('I_RECOMMAND'))?>
				  		</a>
				  	</form>
			  		<span class='left'>&nbsp;▪&nbsp;</span>
				  	<span style=''>
				  		<a class='left savoir-plus' ><?=_('GETMORE')?>&nbsp;</a>
				  		<span class='sub-more hide'><?=_('ON')?> ➫ 
				  			<a class='boxy' href='/boxy/profil/<?=$usr->id?>' titlebox="<?=getTitleStatus($usr).' '.$usr->name?> ▸  Profil"><?=_('THE_PROFIL')?></a> ▪ 
				  			<?if($usr->count_avis):?>
				  				<a class='boxy' href='/ajax/critiques/<?=$usr->id?>' titlebox="<?=$usr->name?> ▸  Critiques"><?=_('THE_CRITIQUES')?></a> ▪ 
				  			<?endif;?>
				  			<?if(!isset($iscontent) || $iscontent==0):?>
				  				<a onclick="$('#msg-more-<?=$usr->id?>').trigger('click');"><?=_('THE_MESSAGES')?></a>
				  			<?endif;?>
				  		</span>
				  	</span>
				</div>
			<? endif;?>
			<div class="cleared"></div>
		</div>
	</div>
	<div class='infocount left hide' style='width: 40px;color:#685840;'>
		<div class='tooltips <?=($usr->count_like)?'':'hide'?>' style='margin:2px;padding: 2px;cursor: text' title="<?=$usr->count_like.' '.($usr->count_like<2?_('PEOPLE_RECOMANDS'):_('PEOPLE_RECOMAND')).' '.$usr->name;?>"
			 rel='/ajax/people/display/icon/likers/<?=$usr->id?>'> 
			<img style="border: none" class='left' src="/css/images/like_ico16.png" height="12"/>
			<div class='count-like left' val='count-USR-<?=$usr->id?>' style="padding:0 2px;width:16px;text-align:left;overflow-x: hidden"><?=(int)$usr->count_like;?></div>
		</div>
		<div class="cleared"></div>
		<div style='margin:2px;padding: 2px;cursor: text' title="<?=$usr->name.' '._('FOLLOWS').' '.$usr->count_fd.' '._('PERSON(S)');?>"
			 class='tooltips' rel='/ajax/people/display/icon/followed/<?=$usr->id?>'> 
				<img style="border: none" class='left' src="/css/images/me-_ico16.png" height="12"/>
				<div class='left' style="padding:0 2px;width:16px;text-align:left;overflow-x: hidden"><?=(int)$usr->count_fd;?></div>
			</div>
		<div class="cleared"></div>
		<div style='margin:2px;padding: 2px;cursor: text' title="<?=$usr->count_fr.' '.($usr->count_fr<2?_('PEOPLE_FOLLOWS'):_('PEOPLE_FOLLOW')).' '.$usr->name;?>"
			 class='tooltips' rel='/ajax/people/display/icon/followers/<?=$usr->id?>'> 
			 <img style="border: none" class='left' src="/css/images/-me_ico16.png" height="12"/>
			 <div class='left' style="padding:0 2px;width:16px;text-align:left;overflow-x: hidden"><?=(int)$usr->count_fr;?></div>
		</div>
		<div class="cleared"></div>
		<div style='margin:2px;padding: 2px;cursor: text' title="<?=$usr->count_collaborator.' '.($usr->count_collaborator<2?_('HAS_COLLABORATED'):_('HAVE_COLLABORATED')).' '.$usr->name;;?>"
			 class='tooltips' rel='/ajax/people/display/icon/collaborators/<?=$usr->id?>'>
				<img style="border: none" class='left' src="/css/images/collabo_ico16x12.png" height="12"/>
				<div class='left' style="padding:0 2px;width:16px;text-align:left;overflow-x: hidden"><?=(int)$usr->count_collaborator;?></div>
		</div>
		<div class="cleared"></div>
		<div style='margin:2px;padding: 2px;cursor: text' title="<?=$usr->count_avis.' '.($usr->count_avis<2?_('AVIS_HAS_GOTTEN_FROM'):_('AVIS_HAVE_GOTTEN_FROM')).' '.$usr->name;?>">
				<img style="border: none" class='left' src="/css/images/avis_ico16.png" height="12"/>
				<div class='left' style="padding:0 2px;width:16px;text-align:left;overflow-x: hidden"><?=(int)$usr->count_avis;?></div>
		</div>
	<?if($this->session->isLogged()):?>
		<div class="cleared"></div>
		<div style='margin:2px;padding: 2px;cursor: text' title="<?=$usr->count_msg.' '.($usr->count_msg<2?_('MSG_HAS_SEND_FROM'):_('MSG_HAVE_SEND_FROM')).' '.$usr->name?>"> <img style="border: none" class='left' src="/css/images/msg_ico16.png" height="12"/><div class='left' style="padding:0 2px;width:16px;text-align:left;overflow-x: hidden"><?=(int)$usr->count_msg;?></div></div>
	<?endif;?>
	</div>
</div>