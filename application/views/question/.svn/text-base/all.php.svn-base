<?php 
$me	= $this->session->me();
$who = $this->session->who();
if ($me && $who)
{
	$isowner = $me && $me->id == $who->id;
}
else if ($me && !$who) $isowner = true;
else $isowner = false;
?>
						
<div class="art-Post" style=''>
	<div class="art-Post-body" >
		<div class='side-left left'>
			<?php if (!$who):?>
				<h4 style='margin-left:20px;padding-top:10px'>Questions/Réponses</h4>
			<?php else:?>
				<h4 style="margin-left:20px;padding-top:10px">
					<span class='left'><?= $who->name;?></span>
					<span class="ui-icon ui-icon-triangle-1-e left"></span> 
					<span class='left'><?=_('ASK_&_ANSWER')?></span>
				</h4>
			<?php endif;?>
			<div class="cleared"></div>
			
			<?if($this->session->isLogged() && $isowner):?>	
				<br/>
				<ul class="art-Post-menu art-post-share" style="margin:0px 0 0 0">
	        			<li class="logopost"><span class="art-PostHeaderIcon-wrapper"></span></li>
	            		<li id='share-question_toogle' class="apply toogle down butshare left" style='' onclick="">
	            			<div class="left" href="#" style='height: 10px;margin:0px 0px 15px;cursor: pointer;font-weight: bold'>
	            					&nbsp;Poser une question à la comunauté :
	            				</div>
	            		</li>
				</ul>
				<div class="cleared"></div>				
				 <?=$this->render('question/blocks/sharebox',array('me'=>$me));?>	
			<?endif;?>
			
			<div class="cleared"></div>
			<br/>
			
			<div id='timeline' class="art-Post-inner">
				<?if (count($activities)>0):?>
					<?=$this->render('question/inner/displayDash');?> 
				<?else:?>
					<?=$this->render('layout/messages/warningBubble', array('msg'=>_('ERR_NOACT')));?>
				<?endif;?>
			</div>
		</div>
		<div id='art-Post-inner' class="art-Post-inner side-right left">
			<br/>
		</div>
		<div id='art-Post-inner' class="side-cache left">
			<br/>
		</div>
	</div>
	<span class='right'><span id='nbread'><?=$nbread?></span>/<?=$nbtot.' '._('DISPLAYED')?></span>
	<div class='cleared'></div>
</div>

<div class='fetch-more <?=($nbread<$nbtot?'':'hide')?>' onclick="fetchMore('ASK');" >
	<a><?=_('FETCH_MORE')?>...</a>
</div>
	
<div id="post-success" class='hide' style='margin:0 10px;position:absolute;top:100px;width: 97%'>
	<table cellspacing="0" cellpadding="0" border="0" width="100%">
	<tbody><tr>
		<td class="green-left">Opération réussite: votre contenu a été réactualisé et transféré en tête de flux.</td>
		<td class="green-right"><a class="close-green" onclick="$('#post-success').fadeOut('slow')"><img alt="" src="/css/images/messages/icon_close_green.gif"></a></td>
	</tr>
	</tbody>
	</table>
</div>
<div id="error-ad-save" class='area-error hide' style='margin:0 10px;position:absolute;top:100px;width: 97%' >
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td class="red-left" ></td>
		<td class='red-right'><a class="close-red" style='class' ><img style='margin-left:-20px' src="/css/images/messages/icon_close_red_in.gif"  alt="" /></a></td>
	</tr>
	</table>
</div>
