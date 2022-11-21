<table style="width: 100%" style="">
<tr>
	<td colspan="2">
		<p>
			<?=$begin_message?> 
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