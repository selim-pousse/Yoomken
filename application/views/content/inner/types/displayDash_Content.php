<?
// for user location, it depends; we prioritize on meta value, otherwise id_spt_usr
//
list($location,$idspot) = isset($act->spot->id) && $act->spot->id!='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' ? array(getLocation($act->spot,true),$act->spot->id) : ( isset($act->user->spot->id) ? array(getLocation($act->user->spot,true),$act->user->spot->id) : array(_('SOMEWHERE'),null) );
if ($idspot==null) $locset = '';
else $locset = $location.'!#!'.$idspot.'!#!'.$location;
$this->set('location',$location);

$desc  = addActivePeople(addActiveLinks(_2br(shortenString($act->desc, 700,'short'))));
$title = trim(shortenString($act->title, 70,'short'));

$tagset = isset($act->tagset)? implode('!+!',$act->tagset) : '';
$idtags = isset($act->idtags)? implode('!+!',$act->idtags) : '';
if (isset($act->tags)) { $tags = array(); foreach ($act->tags as $tag) $tags[] = gettext($tag);}
$tags = isset($act->tags)? implode(', ',$tags) : '';

$typename = array( 'SV' => _('SERVICE'),'JB' => _('JOB'));
$isOwner = ($this->session->isLogged() && $this->session->getUserVar('id')==$act->user->id);

$withTitle = $widthCnt = 670;
/*if ($hasPic = hasPic($act->user->id, $act->thumbnail, 40, '',$act->user->id_img))
{
	$tumbnail = getPictureThumb($act->user->id, $act->thumbnail, 75, '',$act->user->id_img);
	$widthCnt -= 80;
}*/
if ($act->type=='OF') {
	$widthCnt-=80;
	$withTitle -=80;
}

$addCollab = '';
if ($act->type == 'AV') {
	$addCollab .= "&nbsp;<span style='color:#685840'>"._('ON')."</span>&nbsp;";
	$addCollab .= "<a style='color:#685840' href='/{$act->related->url}'>{$act->related->name}</a>";
}
if ($act->wall_usr != $act->user->id && isset($act->userplus[$act->wall_usr]))
{
	$addCollab .= "&nbsp;<span style='color:#685840'>➫</span>&nbsp;";
	$addCollab .= "<a style='color:#685840' href='/{$act->userplus[$act->wall_usr]->url}'>{$act->userplus[$act->wall_usr]->name}</a>";
}

$strTypeAct = ($act->type=='OF'?_('OFFER'):($act->type=='AV'?_('CRITIQUE'):($act->type=='QU'?_('QUESTION'):_('SCOOP')))).' '._('OF_THE').' ';

if ($title) $titleCnt = $title;
else $titleCnt = $strTypeAct.($act->flux=='JB'?'Asker':'Provider').' '.$act->user->name;
?>
<div class='art-postDash block-sub-more left article' style='position:relative;margin-bottom: -3px' id='<?=$act->id?>-act'>
	
	<div class='type-flux <?//=$act->flux?>' idact='<?=$act->id?>' action='/ajax/content/view/' style='left:0px;top: 7px;'>
		<div title='<?=gettext('TOOLTIP_'.$act->type)?>' style="height: 25px;width: 24px;text-align: center;background-image: url('/css/images/cnt_<?=$act->type?>_ico25.png')"><?//=gettext('SPACE_'.$act->type)?></div>
	</div>
	
<div class='art-PostContent post-form'  style='margin: 0 35px;display: inline-block;'>
	<form class='form-save-post' action='/ajax/post' id='<?=$act->id?>_form'  method="post">
		<?/*<input name='flux' type='hidden' value="<?=$act->flux?>"/>*/?>
		<input type='hidden' value='<?=$act->type?>' name='type'/> 
		<input name='id' type='hidden' value="<?=$act->id?>"/>
		<input name='jumpcnt' type='hidden' value="1"/>
	</form>
	
	<ul class='post-left myfilter droppable' style='width: 80px;' idact='<?=$act->id?>'>
		<?if (isset($act->filters)) foreach ($act->filters as $filter):?>
			<li>
				<span href="/ajax/filter/dettach/<?=$filter->id?>/<?=$act->id?>/<?=$typeFilter?>" class="dettach-filter right yoo-icon" title="déttacher le filtre"><span class="ui-icon ui-icon-closethick"></span></span>
				<a class='ui-state-default  etiquette' style='background-color:#F1EEE9;' href='/filter/<?=$filter->id?>/<?=$typeFilter?>'><?=$filter->alias?></a>
			</li>
		<?endforeach;?>
	</ul>
	<div title='En savoir plus...' class='get-more get-more-css postActions' idact='<?=$act->id?>' action='/ajax/content/view/' style='margin-right:-27px;height: 100%'>
		<div style='z-index:50;margin:-10px 5px 0; top:50%;position:absolute; font-size: 1.5em;font-weight: bold'>
			‹‹
		</div>
	</div>
	<div class='post-right' style="width: 100%">
		<? if ($act->type=='OF'):?>
		<div class='right' style='float:right;margin-right: 10px'>
				<div class='ui-corner-bottom ui-corner-left block-more-rotated' style="margin:0 5px 10px;height: 45px;display: block; width: 60px; background: #FFB53E url(/css/images/glass-light.png) 0% 50% repeat-x;position:relative">
					<div class='ui-corner-bottom ui-corner-left block-inv-rotated' style="top:0;left:0;height: 45px;display: block;text-align:center; width: 60px; background: #4b3e2d url(/css/images/glass-light.png) 0% 0% repeat-x;position: absolute"></div>
					<div class='block-inv-more-rotated' style="margin-top:-9px;color:white;font-weight: bold;position: absolute;top:50%;width: 60px;text-align: center"><?=$act->paie.' '.$act->currency?></div>
				</div>
				
		</div>
		<? endif?>
		<div class='title-plus-desc left' style="width: <?=$withTitle?>px">
			<div id='<?=$act->id?>-postTitle' class='content <?=$isOwner? '':''?>' style='min-height:25px;'>
				<div class='orange shortcut'></div>
				
				<img src="<?=getUserPic($act->user->id,$act->user->id_img,24,$act->user->email)?>" 
					alt="<?=$act->user->name?>" 
					class="ppict profil-usr"
					title="<?=$act->user->name?>" style='padding:0;width:15px;height:15px;'/>
					
				<h7 id='<?=$act->id?>-postTitle_fix' class='content title' style=''>
					
					<a style='color:#685840;' href='/journal/<?=$act->id?>'><?=$titleCnt?></a>
					<?=$addCollab?>
				</h7>
				<!--<input type='hidden' name='title' value='<?=$title?>'/>-->
				<? if ($isOwner):?>
					<div class='left <?=$isOwner? '':'hide'?>' sufix='row'>
						<span act='<?=$act->id?>' type='act' href='/ajax/content/rem/<?=$act->id?>' class="delete-act yoo-icon right alert button light" title="<?=_('DEL_POST')?>">
							<span class="ui-icon ui-icon-closethick"></span>
						</span>
						<? if($act->type=='OF'):?>
							<span class="yoo-icon right button light" style="margin-right: 4px" title="<?=_('UPDATE_POST')?>" onclick="$('#<?=$act->id?>_form').submit();">
								<span class="ui-icon ui-icon-refresh"></span>
							</span>
						<? endif;?>
					</div>
				<? endif;?>
			</div>
			<div class='cleared'> </div>
			
			
			<? if ($act->thumbnail):
				echo $this->render('image/mosaique',array('thumbs'=>$act->thumbnail,'userid'=>$act->user->id,'actid'=>$act->id));?>
			 <?endif;?>
			 <p><?=$desc?></p>
		</div>
		
		<div class='cleared'> </div>
		
		<div class='left' style='width: 100%'>
			
			<div class='left' style=''>
		 		<span class='left' style='width:400px'>
		 			
		 			<div class='left' style='font-size: 12px;margin-bottom: 5px'>
		 				<!--<ul class="meta meta-skills" style='font-size: 12px;background: url(/css/images/ico-services.png) no-repeat;padding-left: 15px'>-->
		 				<ol class='services-tag' style="">
		 					<? if($act->type=='OF'):?>
		 					<li class='type-offer left' style=""><a href="/<?=me()->url?>/timeline/offers/<?=$act->flux?>" class="" style='cursor:pointer;margin-top:3px'><?=($act->flux=='SV')?_('Proposal'):_('Searching')?></a>
		 						<?if (isset($act->tags) && count($act->tags)):?><span style="float: left;margin: 6px 0 0 -4px;">:</span><?endif;?>
		 					</li>
		 					<? endif;?>
		 					
							<?if (isset($act->tags)) foreach ($act->tags as $key => $tag):?>
								<li  class='left'><a href="/search/flux/<?=$journal?>/<?=$key?>-t" class="" style="cursor:pointer;margin-top:3px"><?=_($tag)?></a></li>
							<?endforeach;?>
						</ol>
		 			</div>
		 			<div class='cleared'></div>
		 			<div class='left' style='width:350px;font-size: 12px;'>
		 				<? if (1 || !$isOwner):?>
							<form class='form-like' action='/ajax/like' method="POST" style="padding: 0">
								<input type="hidden" name='idactlike' value='<?=$act->id?>'/>
								<input type="hidden" name='typelike' value='<?=$act->isLiked?'N':'L'?>'/>
								<input type="hidden" name='sort' value='ACT'/>
						  		<a class="left link-like" onclick="$(this).parent().submit()" style='cursor: pointer;color:#BCB5AC'><?=$act->isLiked?_('DISLIKE'):_('LIKE')?></a>
						  	</form>
						  	<span class='left' style="color:#BCB5AC">&nbsp;▪&nbsp;</span>
					  	<?endif;?>
					  	<span class=''>
					  		<a class='left savoir-plus' style="color:#BCB5AC"><?=_('GETMORE')?>&nbsp;</a>
					  		<span class='sub-more hide' style=""><?=_('ON')?> ➫ 
					  			<a style="cursor: pointer;color:#BCB5AC" href="/journal/<?=$act->id?>" target='_blank'><?=_('THE_POST')?></a> ▪
					  			<a style='color:#BCB5AC' class='boxy' href='/boxy/profil/<?=$act->user->id?>' titlebox="<?=getTitleStatus($act->user).' '.$act->user->name?> ▸  Profil"><?=_('THE_AUTHOR')?></a>
					  		</span>
					  	</span>
					</div>
				</span>
			</div>
			<div class='content right' style='margin-top:-2px;margin-right: 5px;text-align: right'> 
				<div>
					<span class='date' style='font-size: 11px;;'> <?=_('AT').' '.$location.', '.lcfirst(formatDate($act->date))?>
						<? if (!empty($act->title)):?>
							<br/><?=_('by')?> <a href="/<?=$act->user->url?>/about"><?=$act->user->name?></a></span>
						<? endif;?>
				</div>
			</div>
		</div> 
	</div>
	<div class='infocount left hide' style='width: 50px;color:#685840;margin:-5px -55px 0 -10px;'>
		
		<div class='<?=($act->count_like?'':'hide')?>' style='margin:2px;padding: 2px' title="<?=((int)$act->count_like).' '.($act->count_like<2?_('PERSON_LIKES_POST'):_('PERSONS_LIKE_POST'));?>"> 
			<img style="border: none" class='left' src="/css/images/like_ico16.png" height="12"/>
			<div class='count-like left' val='count-ACT-<?=$act->id?>' style="padding: 0 2px;width:16px;text-align:left;overflow-x: hidden"><?=(int)$act->count_like;?></div>
		</div>
		<div class="cleared"></div>
		<div style='margin:2px;padding: 2px' title="<?=((int)$act->count_cmt).' '.($act->count_cmt<2?_('CMT_ADDED'):_('CMTS_ADDED'));?>"> 
				<img style="border: none" class='left' src="/css/images/cmt_ico16.png" height="12"/>
				<div class='left' style="padding:0 2px;width:16px;text-align:left;overflow-x: hidden"><?=(int)$act->count_cmt;?></div>
		</div>
	</div>
</div> 
	<div style='clear:both;'></div>
</div>

