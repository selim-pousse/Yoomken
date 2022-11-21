<table cellpadding="0" cellspacing="0" style="width: 100%">
<tr>
	<td colspan="2">
		<p>
			<?=_('NEW_MESSAGE_FROM')?> 
			<a href="http://<?=$_SERVER['SERVER_NAME'].'/'.$posteur->url.'/messages'?>" alt="" target="_blank" style="{#astyle}">
				<?=$posteur->name?>
			</a> 
		</p>
	</td>
</tr>
<tr>
	<td colspan="2">
		<? $this->show('message/inner/fragmentPost',array('posteur'=>$posteur,'post'=>$post));?>
	</td>
</tr>
<tr>
	<td>
		&nbsp;
	</td>
	<td>
		<? $this->show('message/inner/goThereNow',array('posturl'=>'/'.$posteur->url.'/messages'));?>
	</td>
</tr>
</table>	