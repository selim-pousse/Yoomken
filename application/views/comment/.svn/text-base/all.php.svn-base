<?
//_debug($comments);

//Set Variables
//_debug($act->cmts);
if (!isset($act->cmts)) $act->cmts=array();
$numcmts=$act->count_cmt;

$i=1;
$displayCom=$pcoms=$arrowCommentClass='';
$commentReadMore=false;

if($numcmts>0)
{
	//$pcoms=' ('.$numcmts.')';
	if ($act->type!='QU') $displayCom=_('COMMENTS');
	else $displayCom=_('ANSWERS');
}
else
{
	if ($act->type!='QU') $displayCom=_('COMMENTS');
	else $displayCom=_('ANSWER');
}

if ($act->type!='QU') $leave_msg=_('LEAVE_CMT');
else $leave_msg=_('LEAVE_ANSWER');

if ($numcmts>10) $display_all = _('DISPLAY_ALL');
else $display_all = '';

?>
	<div class="cleared"></div>
	<!-- header buttons -->
	<div class="act-datas-buttons left" style="width: 630px">
		<div  class='title-block'>
			<div class="cmtlk left">
				<span class="commentButton left" style="font-size: 12px;">
					<?=$displayCom?><span class="nComments"> (<?=$numcmts?>)</span>
				</span>
			</div>
			
			<div class="dellk-cmt-getall right" style="cursor: pointer" href='/ajax/cmt/rest/<?=$act->id?>'><?=$display_all?></div>
	
			<div class="cleared"></div>
		</div>
	</div>
	<!-- the comments box -->
	<div class="act-datas-comments" style="">
			<div class="cmtError hide errorBubble">
				<p></p>
			</div>

				<!-- /the commentform (comment inline) -->
			<? if ($this->session->isLogged()):?>
				<div class="act-cmt-elmt cmt-form">
					<a href="/user/<?=$this->session->getUserVar('url')?>" class='left'>
						<img src="<?=getUserPic(me()->id,me()->id_img,40,me()->email)?>" alt="<?=me()->name?>" class="ui-corner-all" />
					</a>
					
					<form action='/ajax/cmt/share' class="form-cmt cmt-bulle" style='margin:0 10px' method="post">
						
					  	<div class='speaker-bulle' style="top:10px;left:-15px;border-right-color: #ccc;"></div>
						<div class='speaker-bulle' style="top:10px;left:-14px;border-right-color: white;"></div>
						<div class='left' style="margin-right: 5px">
							<textarea id='' class="infieldlabel mention" placeholder="<?=$leave_msg?>" name="txtcmt" style="font-size: 12px"></textarea>
						</div>
						<input class="action" type="submit" name="post" value="<?=_('POST')?>"/>
						<input type='hidden' name='idactcmt' value='<?=$act->id?>'/>
						<input type='hidden' name='pidactcmt' value='<?=$act->pid?>'/>
						<input type='hidden' name='idactusr' value='<?=$act->user->id?>'/>
					</form>
				</div>
			<? endif;?>
				<div class="cleared"></div>
				<div class='start-cmt-<?=$act->id?>'></div>
				<? foreach($act->cmts as $cmt):?>
					<?=$this->show('comment/view',array('numcmts'=>$numcmts,'cmt'=>&$cmt,'i'=>$i,'typeact'=>$act->type), true);?> 
				<? $i++; endforeach;?>
				<div class='start-cmt-<?=$act->id?>-end'></div>
		<span class="clear"></span>
	</div>
	
