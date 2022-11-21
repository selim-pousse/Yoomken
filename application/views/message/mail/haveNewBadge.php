<table cellpadding="10" cellspacing="0" style="width: 100%;">
<tr>
	<td colspan="2">
	
		<?=_('CONGRAT YOU RECEIVED BADGE').' '.ucfirst($bdg->title).' '._('FROM').' '?>
			<a href="http://<?=$_SERVER['SERVER_NAME'].'/'.$giver->url?>/about" target="_blank" style="{#astyle}">
				<?=$giver->name?>
			</a> :
	</td>
</tr>
<tr>
	<td style="width:160px">
		<img src="<?='http://'.$_SERVER['SERVER_NAME'].$bdg->img160?>" alt="<?=$bdg->title?>"  width="160" height="160" style="border:none;"/>
	</td>
	<td>
		<span style="float:left">
			<h4 style="overflow-y: hidden;max-height: 15px;">
				<a style="margin-top: 3px;font-weight: bold;color:{#acolor};text-decoration: none" href="<?='http://'.$_SERVER['SERVER_NAME'].'/badges/'.$bdg->name?>">
					Badge <?=ucfirst($bdg->title)?>
				</a> <span style="font-weight: normal;font-size: 12px;">(<?=$bdg->type=='SKILL'?_('SKILL'):_('PERSONALITY')?>)</span>
			</h4>
			<p>
				<?=$bdg->desc?>
			</p>
		</span>
	</td>
</tr>

<?if ($msg_perso):?>
<tr>
	<td>
		&nbsp;
	</td>
	<td>
		<? $this->show('message/inner/fragmentPost',array('posteur'=>$giver,'post'=>$msg_perso));?>
	</td>
</tr>
<? endif;?>

<? if (!$receiver->isEmail) :?>
<tr>
	<td colspan="2">
		<? $this->show('message/inner/goThereNow',array('posturl'=>'/'.$receiver->url.'/relations'));?> 
	</td>
</tr>
<? endif;?>
</table>	

<? if ($receiver->isEmail) $this->show('message/mail/joinYoomken',array('parain'=>$giver,'receiver'=>$receiver));?>