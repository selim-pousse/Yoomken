<?
$commentHide='';
$replyReadMore=false;

// set Variables
$intro=$hide='';
list($intro,$hide) = splitFormatComment($rep->text);

if(isset($numreps) && $numreps>4)
{
	$commentHide="hide";
	$replyReadMore=false;
	if($j==1)
	{
		$commentHide="";
		$replyReadMore=true;
	}
	else if($j==$numreps)
	{
		$commentHide="";
		$replyReadMore=false;
	}
}
?>
<li class="act-cmt-elmt reply <?=$commentHide?>" id="<?=$rep->id?>">
	<a href="/user/<?=$rep->user->url?>">
		<img src="<?=getPictureThumb($rep->user->id,$rep->user->id_img,24)?>" alt="<?=$rep->user->firstname." ".$rep->user->lastname?>" class="ppict"/>
	</a>
	<p class="comment-bubble">
		<?=$intro?>
		<? if(!empty($hide)):?>
			<a href="/" class="readMoreCmtBut"><?=READ_MORE_TXT?></a>
			<span class="readMoreCmtTxt hide"><?=$hide?></span>
		<? endif;?>
	</p>
	<div class="act-cmt-buttons">
	<? if ($this->session->isLogged()): ?>
		<? if ($rep->user->id==$this->session->getUserVar('id')):?>
			<div class="act-cmt-options">
				<span class="delCmtButton <?=$rep->id?>"><?=DELETE?></span>
			</div>
		<? endif; ?>
	<? endif; ?>
	</div>
	<p class="act-cmt-user">
		<a href="/user/<?=$rep->user->url?>"><?=$rep->user->firstname.' '.$rep->user->lastname?></a> 
		- <?=formatDate($rep->date)?>
	</p>
	<span class="clear"></span>
</li>
<span class="clear"></span>

<? if(0 & $replyReadMore):?>
	<li class="act-cmt-elmt cmt-more">
		<span><?=READALLMSGS.' '.$numreps.' '.COMMENTS?></span>
	</li>
<? endif;?>