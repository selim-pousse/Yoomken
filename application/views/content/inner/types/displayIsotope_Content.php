<?
// for user location, it depends; we prioritize on meta value, otherwise id_spt_usr
//
list($location,$idspot) = isset($act->spot->id) && $act->spot->id!='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' ? array(getLocation($act->spot,true),$act->spot->id) : ( isset($act->user->spot->id) ? array(getLocation($act->user->spot,true),$act->user->spot->id) : array(_('SOMEWHERE'),null) );
if ($idspot==null) $locset = '';
else $locset = $location.'!#!'.$idspot.'!#!'.$location;
$this->set('location',$location);

$desc  = addActivePeople(addActiveLinks(_2br(shortenString($act->desc, 340,'short'))));
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

/*if (!$title && $act->type=='QU' && $desc) {
	$act->title = $act->desc; $act->desc = null;
	$title = $desc; $desc = null;
}*/

if ($act->user->id != $act->holder_usr && $act->holder_usr!=null) {
	$titleShare = '<a class="boxy" href="/boxy/profil/'.$act->user->id.'" titlebox="'.getTitleStatus($act->user).' '.$act->user->name.' ▸  Profil">'.$act->user->name.'</a> <span style="color: #8D795E;">'._('a partagé >>').' </a>';
	$titleCnt = getTitleActivity($act).' '.$act->holder->name;
}
else {
	$titleShare = '';
	$titleCnt = getTitleActivity($act).' '.$act->user->name;
}
?>		

<div class="isotope-post post-format-gallery  span306 isotope-item left" style="">
	<div id='<?=$act->pid?>-act' class="post" style="opacity: 1;">
		<? //_debug($act);
		if($isOwner):?>
			<div class="pins">
				<span act='<?=$act->pid?>' type='act' href='/ajax/content/rem/<?=$act->pid?>' class="delete-act pin-delete  bande-pin" title="<?=_('DEL_POST')?>"><span></span></span>
			</div>
		<? endif;?>
		
		<? if ($title):?>
			<div class="entry-title ui-corner-top">
				<a href="/journal/<?=$act->pid?>"><?=$title?></a>			
			</div>
		<? endif;?>
		
		<? if ($act->thumbnail):
				echo $this->render('image/slider',array('thumbs'=>$act->thumbnail,'userid'=>$act->user->id,'actid'=>$act->pid,'title'=>$title));?>
			 <?endif;?>
			 
	   	<div class="entry drop-shadow curved ui-corner-bottom <?if($act->thumbnail==='' && $title==='') echo 'ui-corner-top';?>" style="">
	   	
	   		<!-- Title -->
	   		<h4 class="heading"><?=$titleShare?><a style="cursor: pointer" class='get-more' idact='<?=$act->pid?>' action='/ajax/content/view/'><?=$titleCnt?></a> <?=$addCollab?></h4>
	   		 <?//_debug($act);?>
	   		<!-- Content -->
	   		<p style="margin: 5px 0"><?=$desc?>
	   			<?if (strlen($act->desc)>340):?>
	   				<a style="cursor: pointer" class='get-more' idact='<?=$act->pid?>' action='/ajax/content/view/'><?=_('GETMORE')?></a>
	   			<?endif;?>
	   		</p>
	   		
	   		<!-- Services -->
			<ol class='services-tag left' style="margin-bottom: 20px">
				<? if($act->type=='OF'):?>
				<li class='type-offer left' style=""><a href="/<?=me()->url?>/timeline/offers/<?=$act->flux?>" class="" style='cursor:pointer;margin-top:3px'><?=($act->flux=='SV')?_('Proposal'):_('Searching')?></a>
					<?if (isset($act->tags) && count($act->tags)):?><span style="float: left;margin: 6px 0 0 -4px;">:</span><?endif;?>
				</li>
				<? endif;?>
				
				<?if (isset($act->tags)) foreach ($act->tags as $key => $tag):?>
					<li  class='left'><a href="/search/flux/<?=$journal?>/<?=$key?>-t" class="" style="cursor:pointer;margin-top:3px"><?=_($tag)?></a></li>
				<?endforeach;?>
			</ol>
		 			
	   		<div class="clear"></div>
	   		
	   		<!-- Meta -->
   		 	<ul class="entry-meta">
   		 		<li class="time" style="width: 145px;">
   		 			<a href="/search/flux/<?=$journal?>/<?=$idspot?>-l" class="locality" style="color: #888 ;background-position: 0 3px;padding: 0px 0 0px 16px;display: block;">
   		 				<?=_('AT').' '.$location.', '.lcfirst(formatDate($act->date))?> 
   		 			</a>
   		 		</li>
   		 		<li class="right">
	   		 		<ul>
	   		 			<li class="meta-comment" title="<?=((int)$act->count_cmt).' '.($act->count_cmt<2?_('CMT_ADDED'):_('CMTS_ADDED'));?>">
	   		 				<a class='get-more' idact='<?=$act->pid?>' action='/ajax/content/view/' style='cursor:pointer'>
	   		 					<span class="meta-icon"></span><span class="count"><?=(int)$act->count_cmt;?></span>
	   		 				</a>
	   		 			</li>
	   		 			
	   		 			<li class="meta-like" title="<?=((int)$act->count_like).' '.($act->count_like<2?_('PERSON_LIKES_POST'):_('PERSONS_LIKE_POST'));?>" >
	   		 				<form class='form-like' action='/ajax/like' method="POST" style="padding: 0">
								<input type="hidden" name='idactlike' value='<?=$act->id?>'/>
								<input type="hidden" name='typelike' value='<?=$act->isLiked?'N':'L'?>'/>
								<input type="hidden" name='sort' value='ACT'/>
						  		<a style="cursor:pointer" class="" onclick="$(this).parent().submit()"><span class="meta-icon"></span><span class="count-like" val='count-ACT-<?=$act->id?>'><?=(int)$act->count_like;?></span></a>
						  	</form>
	   		 			</li> 
	   		 			
	   		 			<li class="meta-share" title="<?=_('Partagé').' '.(int)$act->count_share.' '._('fois')?>">
	   		 				<form class='form-save-post' action='/ajax/post' method="POST" style="padding:0">
								<input type='hidden' value='<?=$act->type?>' name='type'/> 
								<input name='id' type='hidden' value="<?=$act->pid?>"/>
								<input name='jumpcnt' type='hidden' value="1"/>
						  		<a style="cursor:pointer" onclick="$(this).parent().submit()"><span class="meta-icon"></span><span class="count"><?=(int)$act->count_share;?></span></a>
						  	</form>
	   		 			</li>
	   		 		</ul>	
   		 		</li>
   		 	</ul>
   		 	
   		 	<div class="clearboth"></div>
   		 	
		</div>
											
	</div>
</div>
