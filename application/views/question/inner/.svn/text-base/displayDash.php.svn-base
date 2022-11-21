<?foreach ($activities as $act):
if ($act->type=='PU') {
	continue;
}

if ($act->type=='FU') {
	continue;
}
// for user location, it depends; we prioritize on meta value, otherwise id_spt_usr
//
list($location,$idspot) = isset($act->spot->id) && $act->spot->id!='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' ? array(getLocation($act->spot,true),$act->spot->id) : ( isset($act->user->spot->id) ? array(getLocation($act->user->spot,true),$act->user->spot->id) : array(_('SOMEWHERE'),null) );
if ($idspot==null) $locset = '';
else $locset = $location.'!#!'.$idspot.'!#!'.$location;
$this->set('location',$location);
//_debug($idspot);

$desc  = addActiveLinks(_2br(detectTitle(shortenString($act->desc, 340))));
$title = shortenString($act->title, 70,'short');

$tagset = isset($act->tagset)? implode('!+!',$act->tagset) : '';
$idtags = isset($act->idtags)? implode('!+!',$act->idtags) : '';
if (isset($act->tags)) { $tags = array(); foreach ($act->tags as $tag) $tags[] = gettext($tag);}
$tags = isset($act->tags)? implode(' # ',$tags) : '';

$typename = array( 'SV' => _('SERVICE'),'JB' => _('JOB'));
$isOwner = ($this->session->isLogged() && $this->session->getUserVar('id')==$act->user->id);

if ($hasPic = hasPic($act->user->id, $act->thumbnail, 40, '',$act->user->id_img))
{
	$tumbnail = getPictureThumb($act->user->id, $act->thumbnail, 75, '',$act->user->id_img);
	$widthCnt = '508';
}
else $widthCnt = '570';
?>
<div class='art-postDash block-sub-more' style='position:relative' id='<?=$act->id?>-act'>
	
	<div class='type-flux <?//=$act->flux?>' idact='<?=$act->id?>' action='/ajax/content/view/' style='left:-5px'>
		<div title='<?=gettext('TOOLTIP_'.$act->type)?>' style="height: 25px;width: 25px;text-align: center;background-image: url('/css/images/cnt_<?=$act->type?>_ico25.png')"><?//=gettext('SPACE_'.$act->type)?></div>
	</div>
	
<div class='art-PostContent post-form' id='<?=$act->id?>_form' style='border-top:1px solid #EBEBEB;padding-top:5px;margin: 0 30px;display: inline-block;'>
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
	<div title='En savoir plus...' class='get-more  get-more-css postActions' idact='<?=$act->id?>' action='/ajax/content/view/' style='margin-right:-27px;'>
		<div style='z-index:50;margin:-10px 5px 0; top:50%;position:absolute; font-size: 1.5em;font-weight: bold'>
			‹‹
		</div>
	</div>
	<div class='post-right'>
			<div id='<?=$act->id?>-postTitle' class='content <?=$isOwner? '':''?>' style='min-height:25px;width:<?=$widthCnt?>px'>
				<div class='orange shortcut'></div>
				
				<h7 id='<?=$act->id?>-postTitle_fix' class='content title' style=''>
					<img src="<?=getUserPic($act->user->id,$act->user->id_img,24)?>" 
					alt="<?=$act->user->name?>" 
					class="ppict profil-usr"
					title="<?=$act->user->name?>" style='padding:0;width:15px;height:15px'/>
					<a style='color:#292319' href='/<?=$act->user->url?>'><?=($act->flux=='JB'?'Asker':'Provider')?>&nbsp;<?=$act->user->name?></a>
					<?//=$title?>
				</h7>
				<!--<input type='hidden' name='title' value='<?=$title?>'/>-->
				<div class='left <?=$isOwner? '':'hide'?>' sufix='row'>
					<span act='<?=$act->id?>' type='act' href='/ajax/content/rem/<?=$act->id?>' class="delete-act yoo-icon right alert" title="supprimer la question">
						<span class="ui-icon ui-icon-closethick"></span>
					</span>
					<span class="yoo-icon right" title="Réactualiser la question" onclick="$('#<?=$act->id?>_form').submit();">
						<span class="ui-icon ui-icon-refresh"></span>
					</span>
				</div>
				<div class='right postActions'></div>  
			</div>
			<div class='cleared'> </div>
		
		<div class='left' style='width:<?=$widthCnt?>px'>
			<div class='cleared'> </div>
			
			<div id='<?=$act->id?>-postDesc' class='content <?=$isOwner? '':''?>' style='margin-top:-8px;width:<?=$widthCnt-5?>px'>
				<div class='orange shortcut'></div>
				<div id='<?=$act->id?>-postDesc_fix' class='fix_content fix_short' style='width:<?=$widthCnt?>px;'><?=$desc?></div>
		  		<textarea id='<?=$act->id?>-postDesc_input' class='content_input contentArea hide' name='desc' style='width:20px;' placeholder='Votre description...' title='Votre description...'><?=$desc?></textarea>
				<div id='<?=$act->id?>-postDesc_box' class='hide postBox'>
					<span class="yoo-icon right" title="éditer le champ">
						<span class="ui-icon ui-icon-pencil"></span>
					</span>
				</div>
			</div>
			<div class='left' style=''>
		 		<span class='left' style='width:400px'>
		 			<div class'left'><?=$tags?></div>
		 			<div class='cleared'></div>
		 			<form action='/ajax/like' method="POST" style="padding: 0">
						<input type="hidden" name='idactlike' value='<?=$act->user->id?>'/>
						<input type="hidden" name='typelike' value='<?=$act->isLiked?'N':'L'?>'/>
						<input type="hidden" name='sort' value='ACT'/>
				  		<a class="left link-like" onclick="$(this).parent().submit()" style='cursor: pointer'><?=$act->isLiked?_('DISLIKE'):_('LIKE')?></a>
				  	</form>
				  	<span class='left'>&nbsp;▪&nbsp;</span>
					<span class=''>
				  		<a class='left savoir-plus'><?=_('GETMORE')?>&nbsp;</a>
				  		<span class='sub-more hide'><?=_('ON')?> ➫ 
				  			<a style="cursor: pointer" href="/question/<?=$act->id?>" target='_blank'>la question</a> ▪ 
				  			<a class='boxy' href='/boxy/profil/<?=$act->user->id?>' titlebox="<?=$act->user->name?> ▸  Profil">l'auteur</a>
				  		</span>
				  	</span>
				</span>
			</div>
			<div class='content right' style='margin-top:-2px;margin-right: 5px;'> 
				<div><span class='date'> <?=formatDate($act->date).', '._('AT').' '.$location?></span>
				</div>
			</div>
		</div> 
		<input type='hidden' name='tags' value='<?=$idtags?>'/> 
		<input type='hidden' name='address' value='<?=$idspot?>'/> 
	</div>
	<div class='infocount left hide' style='width: 50px;color:#685840;margin:-5px -25px 0 -10px;'>
		<?if($act->count_like):?>
		<div style='margin:2px;padding: 2px' title="<?=((int)$act->count_like).' '.($act->count_like<2?_('PERSON_LIKES_ASK'):_('PERSONS_LIKE_ASK'));?>"> <img style="border: none" class='left' src="/css/images/like_ico16.png" height="12"/><div class='left' style="padding: 0 2px;width:16px;text-align:left;overflow-x: hidden"><?=(int)$act->count_like;?></div></div>
		<?endif;?>
		<div class="cleared"></div>
		<div style='margin:2px;padding: 2px' title="<?=((int)$act->count_cmt).' '._('ANSWER_ADDED')?>"> <img style="border: none" class='left' src="/css/images/cmt_ico16.png" height="12"/><div class='left' style="padding:0 2px;width:16px;text-align:left;overflow-x: hidden"><?=(int)$act->count_cmt;?></div></div>
	
	</div>
</div> 
	
	
	<div style='clear:both;'></div>
</div>

<!--  <div class='separator'></div> -->
<?endforeach;?>

