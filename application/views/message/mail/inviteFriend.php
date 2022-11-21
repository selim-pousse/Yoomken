<table cellpadding="0" cellspacing="0" style="width: 100%">
	<tr style='vertical-align: top'>
		<td style='width: 80px'>
			<a href="http://<?=$_SERVER['SERVER_NAME'].'/'.$parain->url?>/about" target="_blank">
				<img src="<?=getUserPic($parain->id,$parain->id_img,40,$parain->email)?>" 
					switch=""
					alt="<?=$parain->name?>" 
					style='float:left;border-radius: 6px;margin-right:5px'
					width="40" height="40"
					class=""
					title="<?=$parain->name?>"/>
			</a>
		</td>
		<td colspan="2"> 
				<p> 
					<a href="http://<?=$_SERVER['SERVER_NAME'].'/'.$parain->url?>/about" target="_blank" style="{#astyle}">
						<?=$parain->name?>
					</a> 
					<span><?=_('INVITE YOU TO JOIN YOOMKEN')?></span>
					<br/>
					<span><?=_('WHATS_YOO_DETAIL')?></span>
				</p>
					
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<? $this->show('message/inner/goThereNow',array('posturl'=>'/home/invite/'.$receiver->codeinvite));?>
		</td>
	</tr>

</table>

