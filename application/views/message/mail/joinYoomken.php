<table cellpadding="0" cellspacing="0" style="width:100%">
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td colspan="2"> 
			<p> 
				<?
					$aparain = '<a href="http://'.$_SERVER['SERVER_NAME'].'/'.$parain->url.'/about" target="_blank" style="{#astyle}">'.$parain->name.'</a>';
				?>
				<?=preg_replace('/\{#user\}/',$aparain,_('JOIN YOUR FRIEND IN YOOMKEN'))?>
			</p>
			<p>
				<?=_('WHATS_YOO_DETAIL')?>
			</p>				
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td colspan="2">
			<? $this->show('message/inner/goThereNow',array('posturl'=>'/home/invite/'.$receiver->codeinvite));?>
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
</table>

