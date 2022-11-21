
<table cellpadding="10" cellspacing="0" style="width:100%">
	<tr>
		<td colspan="2">
			<p>
				<?=preg_replace('/\{#user\}/','{a#'.$posteur->name.'|'.$posteur->url.'#a}', _('POSTED_ON_YOUR_WALL'));?>.
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
			<? $this->show('message/inner/goThereNow',array('posturl'=>$posturl));?>
		</td>
	</tr>
</table>	