<?
// si c'est un reshare, remplacer le shareur par le vrai détenteur  du contenu
if ($act->user->id != $act->holder_usr) $act->user = $act->holder;

// for user location, it depends; we prioritize on meta value, otherwise id_spt_usr
//
list($location,$idspot) = isset($act->spot->id) && $act->spot->id!='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' ? array(getLocation($act->spot),$act->spot->id) : ( isset($act->user->spot->id) ? array(getLocation($act->user->spot),$act->user->spot->id) : array(SOMEWHERE,null) );
if ($idspot==null) $locset = '';
else $locset = $location.'!#!'.$idspot.'!#!'.$location;
$this->set('location',$location);


$isOwner = ($this->session->isLogged() && $this->session->getUserVar('id')==$act->user->id);


$mdlusr = new YOO_UserModel();
$act->user = $mdlusr->getById($act->user->id); //get more about the author
		
//_debug($idspot);
$desc_html  = addActiveLinks(_2br(($act->desc)));
$desc_html  = $isOwner ? addInactivePeople($desc_html):addActivePeople($desc_html);
$desc_js  = _2nl($act->desc);
$title = $act->title;

$tagset = isset($act->tagset)? implode('!+!',$act->tagset) : '';

$typename = array( 'SV' => _('SERVICE'),'JB' => _('JOB'));

$tumbnail = getPictureThumb($act->user->id, $act->thumbnail, 150, '',$act->user->id_img);

$addCollab = '';
if ($act->type == 'AV') {
	$addCollab .= "&nbsp;<span style='color:#F26B51'>"._('ON')."</span>&nbsp;";
	$addCollab .= "<a style='color:#F26B51' href='/{$act->related->url}'>{$act->related->name}</a>";
}
if ($act->wall_usr != $act->user->id && isset($act->userplus[$act->wall_usr]))
{
	$addCollab .= "&nbsp;<span style=''>➫</span>&nbsp;";
	$addCollab .= "<a style='' href='/{$act->userplus[$act->wall_usr]->url}'>{$act->userplus[$act->wall_usr]->name}</a>";
}

if ($title) $titleCnt = $title;
else $titleCnt = getTitleActivity($act).' '.$act->user->name;

?>
<div class='article' style=''>
	
	<div class="left" style="width:45px;margin-top:5px;">
		
		<?=$this->render('like/inner/action-like',array('act'=>$act,'sort'=>'ACT'));?>
		<div class="clear"></div>
		<div style="">
			<!-- AddThis Button BEGIN -->
			<style>
				.addthis_toolbox a span{
					margin-bottom: 5px;
				}
			</style>
			<div class="addthis_toolbox addthis_32x32_style" style="margin-top: 5px;padding: 0" addthis:url="http://yoomken.com/journal/<?=$act->id?>">
				<a class="addthis_button_preferred_1"></a>
				<a class="addthis_button_preferred_2"></a>
				<a class="addthis_button_preferred_3"></a>
				<a class="addthis_button_preferred_4"></a>
				<a class="addthis_button_compact"></a>
			</div>
			<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
			<!-- AddThis Button END -->	
		</div>
	</div>
	
	<div class='left' style="width: 870px;">
		<form class='post-form form-save-post pair left plain-view' id='<?=$act->pid?>_formmore' action='/ajax/post' method="post" style='width: 100%;'>
			<input type='hidden' value='AD' name='type'/> 
			<input name='flux' type='hidden' value="<?=$act->flux?>"/>
			<input name='id' type='hidden' value="<?=$act->pid?>"/>
			<input type='hidden' value='<?=$act->type?>' name='type'/> 
			
			<div class='cleared'> </div>
			<div id='<?=$act->id?>-more-postTitle' class='content <?=$isOwner? '':''?>' style='min-height:25px;'>
					<img src="<?=getUserPic($act->user->id,$act->user->id_img,24,$act->user->email)?>" 
					alt="<?=$act->user->name?>" 
					class="ppict profil-usr"
					title="<?=$act->user->name?>" style='margin: 5px 5px 0 0;padding:0;width:15px;height:15px;'/>
				<h4 id='<?=$act->id?>-more-postTitle_fix' class='content title' style='margin-right: 0;padding-top: 5px'>
					<span style='color:#685840;'>
						<a style='color:#685840;font-size: 15px;' href='/journal/<?=$act->pid?>'><?=$titleCnt?></a>
						<?=$addCollab?>
					</span>
					<?/*=$title <input type='hidden' value='<?=ucfirst($title)?>' name='title'/>*/?>
				</h4>
				<div style="float: left;padding-top: 7px;"><span>, <?=(formatDate($act->date))?></span></div>
				
				<div class='left <?=$isOwner? '':'hide'?>' style='margin-top:8px;margin-left: 5px'>
					<span act='<?=$act->id?>' href='/ajax/content/rem/<?=$act->id?>' class="delete-act yoo-icon right alert button light" title="<?=_('DEL_POST')?>">
						<span class="ui-icon ui-icon-closethick"></span>
					</span>
					<?/*<span class="yoo-icon right button light" style="margin-right: 4px" title="<?=_('UPDATE_POST')?>"  onclick="$('#<?=$act->id?>_formmore').submit();">
						<span class="ui-icon ui-icon-refresh"></span>
					</span> */?>
				</div>
				
				<div class='cleared'> </div>
				<?/*<ul class='' style='margin-top:0px'>
					<?if (isset($act->filters)) foreach ($act->filters as $filter):?>
						<li class='left'>
							<span href="/app.php?go=filter/dettach/&idsmart=<?=$filter->id?>&idact=<?=$act->id?>" class="dettach-filter right yoo-icon" title="déttacher le filtre"><span class="ui-icon ui-icon-closethick"></span></span>
							<a class='ui-state-default  etiquette' style='background-color:#F1EEE9;' href='/filter/<?=$filter->id?>/<?=$filter->type?>'><?=$filter->alias?></a>
						</li>
					<?endforeach;?>
				</ul>*/?>
			</div>
			<div class='cleared'> </div>
			<br/>
			<div class='cleared'> </div>
			<div class='secondary' style="float: right;width: 220px;height: 27px;">
				<? if($isOwner):?> <input class='button left' type='submit' value="<?=_('UPDATE')?>" style="width: 210px;margin:-40px 0 15px" title="<?=_('UPDATE_POST')?>"/><?endif;?>
				<? if ($act->type=='OF'):?>
					<h3 class='title-block' style=''><?=_('Pay')?></h3>
					<div id='<?=$act->id?>-more-paie' class='content <?=$isOwner? 'edit':''?>' style='width:210px;position: relative'>
						<? if($isOwner):?>
					  		<input class="hide content_input _input left ui-corner-all"  name="paie" id='<?=$act->id?>-more-paie_input' style='width:50px' value="<?=$act->paie?>"/>
						<? endif;?>
						
						<div class='fix_content' style="width:210px;line-height: 26px;height: 26px;">
							<div  id='<?=$act->id?>-more-paie_fix' class='left' >
								<?=$act->paie?>
							</div>
							<div class='left' style="margin-left: 5px;">&nbsp;<?=$act->currency?></div>
						</div>
						<? if($isOwner):?>
						<div id='<?=$act->id?>-more-paie_box' class='hide postBox' style='margin-left:-15px;'>
								<span class="yoo-icon right" title="éditer le champ" style="">
									<span class="ui-icon ui-icon-pencil"></span>
								</span>
							</div>
						<? endif;?>
					</div>
								
					
					<div class="clear"></div>
					<br/>
				<? endif;?>
					
				<h3 class='title-block' style=''><?=_('SERVICES_&_TAGS')?></h3>
				<div id='<?=$act->id?>-more-postTag' class='content <?=$isOwner? 'edit':''?>' style='width:210px;'>
						<div id='<?=$act->id?>-more-postTag_fix' class='fix_tag' style='float:left;width:210px;font-size: 12px'>
							<ol class='services-tag' style="margin: 0px">
							<? if($act->type=='OF'):?>
				 					<li class='type-offer left' style=""><a class="" style='cursor:pointer;margin-top:3px'><?=($act->flux=='SV')?_('Proposal'):_('Searching')?></a>
				 						<?if (isset($act->tags) && count($act->tags)):?><span style="float: left;margin: 6px 0 0 -4px;">:</span><?endif;?>
				 					</li>
		 					<? endif;?>
							<?if (isset($act->tags)) foreach ($act->tags as $tag):?>
										<li><a class="" style='cursor:pointer;margin-top:3px'><?=_($tag)?></a></li>
							<?endforeach;?>
							</ol>
						</div>
						<?php /* <input id='<?=$act->id?>-more-postTag_bulle' type='hidden' value='<?=$tags?>'/> */?>
						<div class=' hide' id='<?=$act->id?>-more-postTag_input'>
							<input  id='<?=$act->id?>-more-postTag_input2' bulle=true class='input-tags content_input' style='float:left;' type='text' name='tags' title='Vos tags...' value="<?=$tagset?>">
						</div>
						<div id='<?=$act->id?>-more-postTag_box' class='hide postBox' style='margin-left:-15px;'>
							<span class="yoo-icon right" title="éditer le champ">
								<span class="ui-icon ui-icon-pencil"></span>
							</span>
						</div>
				</div>
				<div class="clear"></div>
				<br/>
				
				<h3 class='title-block' style=''><?=_('ADDRESS_ASSOCIATED')?></h3>
				<div id='<?=$act->id?>-more-postLoc' class='content <?=$isOwner? 'edit':''?>' style='float:left;width:210px'>
					<div id='<?=$act->id?>-more-postLoc_fix' class='fix_loc' style='float:left;width:210px;font-size: 12px'>
						<div style="color:# ;margin-top: 5px">
							<?=$location?>
						</div>
					</div>
					<div class=' hide' id='<?=$act->id?>-more-postLoc_input'>
						<input id='<?=$act->id?>-more-postLoc_input2' bulle="true" class='input-loc content_input' style='float:left;' type='text' name='address' title='Votre localisation...' value='<?=$locset?>'>			
					</div>
					<div id='<?=$act->id?>-more-postLoc_box' class='hide postBox' style='margin-left:-15px;'>
						<span class="yoo-icon right" title="éditer le champ">
							<span class="ui-icon ui-icon-pencil"></span>
						</span>
					</div>
				</div>
			</div>
			<div  class='first' style=" width: 630px">
				<h3 class='title-block' style=''><?=_('DESCRIPTION')?></h3>
				<? if ($act->thumbnail): $sizetxt = '630px'; //$sizetxt = '465px';?>
					<?/*<img class='pic-article photo left' style='height: 150px;width: 150px;margin-right: 5px' src='<?=$tumbnail?>' alt=''/>*/?>
					<?=$this->render('image/mosaique',array('thumbs'=>$act->thumbnail,'userid'=>$act->user->id));?>
				<? else:  $sizetxt = '630px';?><?endif?>
				<div id='<?=$act->id?>-more-postDesc' class='content <?=$isOwner? 'edit':''?>' style='margin-top:5px;width: <?=$sizetxt?>;'>
					<div class='orange shortcut'></div>
					<p id='<?=$act->id?>-more-postDesc_fix' class='fix_content' style='width: <?=$sizetxt?>;padding: 4px;font-size:14px'><?=$desc_html?></p>
					<div id='<?=$act->id?>-more-postDesc_input' class='txtmention' >
			  			<textarea  id='<?=$act->id?>-more-postDesc_textarea' class='content_input infieldlabel mention' style='width: <?=$sizetxt?>;' name='desc' placeholder="<?=_('DESCRIPTION')?>"><?=$desc_js?></textarea>
					</div>
					<div id='<?=$act->id?>-more-postDesc_box' class='hide postBox' style='margin-left:-25px'>
						<span class="yoo-icon right" title="éditer le champ">
							<span class="ui-icon ui-icon-pencil"></span>
						</span>
					</div>
				</div>
			</div>	
			<div class='cleared'> </div>
		</form>
		
		<div class='cleared'> </div>
		<br/>
		<div  class='first' style=" width: 630px;margin-bottom: -10px;float: left">
			<h3 class='title-block'><?=_('ABOUT_AUTHOR')?></h3>
			<?
			$this->show('/people/inner/displayBulle',array('usr'=>$act->user,'iscontent'=>1,'mode'=>'read_only'));
			?>
		</div>	
		<div class='cleared'> </div>
		<?= $this->render('comment/all');?>
	 </div>
</div>
<!--  <div class='separator'></div> -->
