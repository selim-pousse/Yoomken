<table cellpadding="10" cellspacing="0" style="width: 100%">
<tr>
	<td colspan="2">
			<a href="http://<?=$_SERVER['SERVER_NAME'].'/'.$asker->url?>/about" target="_blank" style="{#astyle}">
					<?=$asker->name?>
			</a> <?=_('REQUEST_YOU_TO_RECEIVE_BADGE').' '.ucfirst($bdg->title)?> :
	</td>
</tr>
<tr>
	<td style="width:160px">
		<img src="<?='http://'.$_SERVER['SERVER_NAME'].$bdg->img160?>" alt="<?=$bdg->title?>" width="160" height="160" style="border:none;"/>
	</td>
	<td>
		<h4 style="overflow-y: hidden;max-height: 15px;">
			<a style="margin-top: 3px;color:{#acolor};font-weight: bold;text-decoration:none;"  href="<?='http://'.$_SERVER['SERVER_NAME'].'/badges/'.$bdg->name?>">
				Badge <?=ucfirst($bdg->title)?>
			</a> <span style="font-weight: normal;font-size: 12px;">(<?=$bdg->type=='SKILL'?_('SKILL'):_('PERSONALITY')?>)</span>
		</h4>
		
		<p class="" style=''>
				<?=$bdg->desc?>
		</p>
	</td>
</tr>
<?if ($msg_perso):?>
<tr>
	<td>
		&nbsp;
	</td>
	<td>
		<? $this->show('message/inner/fragmentPost',array('posteur'=>$asker,'post'=>$msg_perso));?>
	</td>
</tr>
<?endif;?>
<tr>
	<td colspan="2">
		<? if ($receiver->isEmail) :?>
		<p>
			<?=_('NEED_TO_JOIN_YOOMKEN_TO_ACCEPT_REQUEST');?>
		</p>
		<? else:?>
			<? $this->show('message/inner/goThereNow',array('posturl'=>'/'.$receiver->url.'/messages'));?>
		<? endif;?>
	</td>
</tr>
</table>	

<? if ($receiver->isEmail) $this->show('message/mail/joinYoomken',array('parain'=>$asker,'receiver'=>$receiver));?>