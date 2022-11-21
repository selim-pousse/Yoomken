<?
//_debug($cmt);
$commentHide='';
$commentReadMore=false;

// set Variables
$intro=$hide='';
list($intro,$hide) = splitFormatComment($cmt->text);
?>
<div class="li-cmt-bubble left" id="<?=$cmt->id?>-cmt" style=''>
	<?=$this->render('like/inner/action-like',array('act'=>$cmt,'sort'=>'CMT'));?>
	<div class='cmt-text left' style=''>
		<div class="comment-bubble left" >
			<span style="font-size: 13px"><?=addActiveMyLinks(_2br($intro))?></span>
			<? if(!empty($hide)):?>
				<a onclick="$(this).hide().next().show();"  class="readMoreCmtBut" style='cursor:pointer'>&nbsp;(<?=_('GETMORE')?>)</a>
				<span class="hide" style="font-size: 13px"><?=_2br($hide)?></span>
			<? endif;?>
		</div>
		<div class="act-cmt-buttons right hide" style='right: 0;position: absolute;width: 35px;margin: -10px -5px 0 0;'>
		<? if ($this->session->isLogged()): ?>
			<? if ($cmt->user->id==$this->session->getUserVar('id')):?>
				<div class="act-cmt-options right">
					<span act="<?=$cmt->id?>" type='cmt' href="/ajax/cmt/rem/<?=$cmt->id?>" class="delete-act yoo-icon right alert" title="<?=(isset($typeact) && $typeact=='QU')?_('DELETE_ANSW'):_('DELETE_CMT')?>" style="margin: 0px; ">
						<span class="ui-icon ui-icon-closethick"></span>
					</span>
				</div>			
			<? endif;?> 
		<? endif; ?>
		</div>
		<div class="cleared"></div>
		<div>
			<img src="<?=getUserPic($cmt->user->id,$cmt->user->id_img,24,$cmt->user->email)?>" 
			alt="<?=$cmt->user->name?>" 
			class="ppict profil-usr"
			title="<?=$cmt->user->name?>" style='border:none;width:15px;height:15px'/>
			<a href='/<?=$cmt->user->url?>'><span><?=$cmt->user->name?></span></a>
			<span class='date'> <?=formatDate($cmt->date)?></span>
		</div>
	</div>
	<div class="cleared"></div>
</div>
