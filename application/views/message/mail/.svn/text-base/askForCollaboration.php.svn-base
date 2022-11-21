<table cellpadding="10" cellspacing="0">
<tr>
	<td colspan="2">
		
			<a href="http://<?=$_SERVER['SERVER_NAME'].'/'.$asker->url?>/about" target="_blank" style="{#astyle}">
					<?=$asker->name?>
			</a> <?=_('MAIL_REQUEST_DEAL')?>
	</td>
</tr>
<?if ($msg_perso):?>
<tr>
	<td colspan="2">
	<? $this->show('message/inner/fragmentPost',array('posteur'=>$asker,'post'=>$msg_perso));?>
	</td>
</tr>
<?endif;?>
<tr>
	<td colspan="2">
		<p>
			<?=_('MSG_REQUEST_DEAL')?>
		</p>
		<? $this->show('message/inner/goThereNow',array('posturl'=>'/'.$receiver->url.'/messages'));?>
	</td>
</tr>
</table>