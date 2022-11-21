<?
	$areciver = '<a href="http://'.$_SERVER['SERVER_NAME'].'/'.$goodguy->url.'/about" target="_blank" style="{#astyle}">'.$goodguy->name.'</a>';
?>
	
<table cellpadding="10" cellspacing="0" style="width:100%">
	<tr>
		<td colspan="2">
				<a href="http://<?=$_SERVER['SERVER_NAME'].'/'.$parain->url?>/about" target="_blank" style="{#astyle}">
					<?=$parain->name?>
				</a>&nbsp;<?=preg_replace('/\{#user\}/',$areciver,_('RECOMMAND_USER_AS_WORK_RELATION_SPECIALAZED_IN_SERVICES'))?> :
		</td>
	</tr>
	<tr>
		<td colspan="2">
				<? $addpost = $this->render('/user/inner/displayForMail',array('usr'=>$goodguy));?>
				<? $this->show('message/inner/fragmentPost',array('posteur'=>$parain,'post'=>$msg_perso,'addpost' => $addpost));?>
		</td>
	</tr>
<? if (!$receiver->isEmail) :?>
	<tr>
		<td colspan="2">
			<? $this->show('message/inner/goThereNow',array('posturl'=>'/'.$receiver->url.'/relations'));?>
		</td>
	</tr>
<? endif;?>
</table>	

<? if ($receiver->isEmail) $this->show('message/mail/joinYoomken',array('parain'=>$parain,'receiver'=>$receiver));?>