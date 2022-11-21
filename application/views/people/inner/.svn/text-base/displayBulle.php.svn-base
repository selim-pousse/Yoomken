<?php
	$lang = $this->session->get('lang');
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
	
if ($usr->shortdesc)
	$html_shortdesc = shortenString(strip_tags($usr->shortdesc),250,'short');
else 
	$html_shortdesc = _('DESC_NOT_SPECIFIED');
?>

<?
if (!isset($mode) || $mode =='action_full'):?>
	<div class='profile'>
		<div class='left block-sub-more' style='border-top-right-radius: 0px 0px;position: relative;width:100%;'>
			<?/*<div class='infocount right hide' style='width: 40px;color:#685840;'>
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
			 */?>
			
			<div class="full" style="">
				<div class="profile vcard group left" style="width: 322px">
					<a class="get-more" href="#" action='/ajax/about/view/' idact='<?=$usr->id?>'><img src="<?=getUserPic($usr->id,$usr->id_img,75,$usr->email)?>" 
						switch=""
						alt="<?=$usr->name?>" 
						style=''
						width="80" height="80"
						class="photo left"
						title="<?=$usr->name?>"/>
					</a>
					
					<h4 style="overflow-y: hidden;max-height: 15px;">
						<a href="#" action='/ajax/about/view/' idact='<?=$usr->id?>' class="get-more fn edit" style='color: #685840;margin-top: 3px;'>
							<?=$usr->name?>
						</a> <span style="font-weight: normal;font-size: 12px;"><?=($usr->profil!='N'?'('.getTitleStatus($usr).')':'')?></span>
					</h4>
					
					<? if (isset($usr->service) && count($usr->service)) :?>
					<div style='margin:5px 0;overflow-y: hidden;max-height: 25px;'>
						<span class="meta meta-skills" style='font-size: 12px;background: url(/css/images/ico-services.png) no-repeat;padding-left: 15px'>
							<?//=implode(', ',$usr->service)?>
							<?foreach ($usr->service as $key => $tag):?>
								<a href="/search/network/<?=$key?>-t" class="" style='color:#685840;cursor:pointer;margin-top:3px'><?=$tag?></a>,&nbsp;
							<?endforeach;?>
						</span>
					</div>
					<? endif?>
					
					
					<?=$this->render('layout/module/actions-button',array('usr'=>$usr,'all'=>'light'));?>
				</div>
				<div style="float: left">
					
					<? 
						$boxyGivBdg =  'class="boxy" href="/ajax/badges/transfert/user/GIV/'.$usr->id.'"  titlebox="'._('GIVE BADGE').' '._('TO').' '.$usr->name.'" title="'._('GIVE BADGE').' '._('TO').' '.$usr->name.'"';
						$colors = array('PERS' => 'or', 'SKILL'=>'ma','ACTION'=>'vio');
						
						if (count($usr->best_bdg)==2) :?>
						<a href="#"><img src="/media/img/badges/badge_<?=$usr->best_bdg[1]->name?>80_<?=$lang?>_<?=$colors[$usr->best_bdg[1]->type]?>.png" <?=$boxyGivBdg?>></a>
						<a href="#"><img src="/media/img/badges/badge_<?=$usr->best_bdg[0]->name?>80_<?=$lang?>_<?=$colors[$usr->best_bdg[0]->type]?>.png" <?=$boxyGivBdg?>></a>
					<? elseif (count($usr->best_bdg)==1) :?>
						<? if ($usr->best_bdg[0]->type=='PERS') :?><a href="#"><img src="/media/img/badges/badgeBelge80.png" <?=$boxyGivBdg?> ></a> <?endif;?>
						<a href="#"><img src="/media/img/badges/badge_<?=$usr->best_bdg[0]->name?>80_<?=$lang?>_<?=$colors[$usr->best_bdg[0]->type]?>.png" <?=$boxyGivBdg?>></a>
						<? if ($usr->best_bdg[0]->type=='SKILL') :?><a href="#"><img src="/media/img/badges/badgeOrange80.png" <?=$boxyGivBdg?> ></a><?endif;?>
					<? else:?>
						<a href="#"><img src="/media/img/badges/badgeBelge80.png" <?=$boxyGivBdg?> ></a>
						<a href="#"><img src="/media/img/badges/badgeOrange80.png" <?=$boxyGivBdg?> ></a>
					<?endif;?>
				</div>
			</div>
			<div class='infocount left ' style='width: 70px;color:#685840;margin-top: 15px'>
				
			</div>
			
			<div class="clear"></div>
	   		
	   		<!-- Meta -->
			<ul class="entry-meta player-stats group">
					<li style="float:left;width: 322px" class="">
						<a href="/search/network/<?=getAddressUser($usr,true)->id?>-l" class="locality"><?=$location?></a>
					</li>
					<li class="stat-shots">
						<a href="/<?=$usr->url?>/relations/init"><?=number_format($usr->count_rel,0,',',"'")?><span class="meta">Relations</span></a>	
					</li>
					
					<li class="stat-followers">
							<a href="/<?=$usr->url?>/badges"><?=number_format($usr->count_bdg,0,',',"'")?><span class="meta">Badges</span></a>	
					</li>
					
					<?/*<li class="stat-followers">
							<a href=""><?=number_format($usr->count_like)?> <span class="meta"><?=_('Soutien(s)')?></span></a>	
					</li>*/?>
			</ul>
			
		</div>
	</div>
<? else:?>
	<div class='profile'>
	<div class='left block-sub-more' style='border-top-right-radius: 0px 0px;position: relative;width:100%;margin-bottom: 20px;'>
		<div class="full" style="">
			<div class="profile vcard group left" style="width: 100%;">
				<a href="/<?=$usr->url?>/timeline/wall"><img src="<?=getUserPic($usr->id,$usr->id_img,75,$usr->email)?>" 
					switch=""
					alt="<?=$usr->name?>"
					style='margin-top:4px;'
					width="80" height="80"
					class="photo left"
					title="<?=$usr->name?>"/>
				</a>
				<div class="left">
					<h4 style="overflow-y: hidden;max-height: 15px;">
						<a href="/<?=$usr->url?>/timeline/wall" class="fn edit" style='color: #685840;margin-top: 3px;'>
							<?=$usr->name?>
						</a> <span style="font-weight: normal;font-size: 12px;color: #826D4F;"><?=($usr->profil!='N'?'('.getTitleStatus($usr).')':'')?></span>
					</h4>
					<ul class="profile-details" style="250px">
						<li>
							<a href="/search/network/<?=getAddressUser($usr,true)->id?>-l" class="locality"><?=$location?></a>
						</li>
					</ul>
				</div>
				
				<div class='secondary' style="float: right;width: 220px">
					<? if (count($usr->service)):?>
						<h3 class='title-block' style="margin:0">&nbsp;
							<span class='left'>Services &nbsp;</span>
							<b class='right' style="color:#685940"><?=isset($who->presta->amont) && $who->presta->amont? $who->presta->amont.' '.getCurrency(who()).' / '._('HOUR'):''?></b>
						</h3>
						<? if (isset($usr->service) && count($usr->service)) :?>
							<div style="width: 100%;height: 20px;margin-top: 8px;float:left;"  >
								<ol class='services-tag' style="">
									<?foreach ($usr->service as $key => $tag):?>
												<li><a href="/search/network/<?=$key?>-t" class="" style='color:#685840;cursor:pointer;margin-top:3px'><?=$tag?></a></li>
									<?endforeach;?>
								</ol>
							</div>
						<? endif?>
					<?endif;?>
				</div>
							
				
				
				
				<div class='subsub-menu infocount left ' style='color:#685840;'>
					<ul class="player-stats group subsub" idusr='<?=$usr->id?>'>
						<li class="subsub-relation" style="">
							<a class="<?=($mode=='action_menu'?'subsub-li-js':'')?>" href="<?=($mode=='action_menu'?'/ajax/people/display/iconrel/relations/'.$usr->id : '/'.$usr->url.'/relations/init')?>" ctrl='relation'>
								<span class="count"><?=number_format($usr->count_rel,0,',',"'")?></span> 
								<span class="meta">Relations</span>
							</a>	
						</li>
						<li class="subsub-badge ">
								<a class="<?=($mode=='action_menu'?'subsub-li-js':'')?>" href="<?=($mode=='action_menu'?'/ajax/badges/light/'.$usr->id : '/'.$usr->url.'/badges')?>" ctrl='badge'>
									<span class="count"><?=number_format($usr->count_bdg,0,',',"'")?></span> 
									<span class="meta">Badges</span>
								</a>	
						</li>
						
						<? if ($mode != "read_only"):?>
							<li class="subsub-msg <?= (isset($submenu) && $submenu=='message'?'active':'')?>">
									<a class="<?=($mode=='action_menu'?'subsub-li-js':'')?>" href="<?=($mode=='action_menu'?'/ajax/message/light/'.$usr->id : '/'.$usr->url.'/tchat')?>" ctrl='message'>
										<span class="count">0</span> 
										<span class="meta">Messages</span>
									</a>	
							</li>
						
							<li class="subsub-about <?= (isset($submenu) && $submenu=='about'?'active':'')?>" >
									<a class="<?=($mode=='action_menu'?'subsub-li-js':'')?>" href="<?=($mode=='action_menu'?'/ajax/about/light/'.$usr->id : '/'.$usr->url.'/about')?>" ctrl='user'>
										<span class="count">&nbsp;</span> 
										<span class="meta"><?=_('ABOUT_US')?></span>
									</a>	
							</li>
						<? endif;?>
						
						<?/*<li class="stat-followers">
								<a href=""><?=number_format($usr->count_like)?> <span class="meta"><?=_('Soutien(s)')?></span></a>	
						</li>*/?>
					</ul>
				</div>
			</div>
		</div>
		
		
	</div>
</div>
<div class="clear"></div>
<?endif;?>