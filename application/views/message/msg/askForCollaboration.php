	<span>
	 	<a href="http://<?=$_SERVER['SERVER_NAME'].'/'.$asker->url?>/about" target="_blank"><?=$asker->name?></a> <?=_('MAIL_REQUEST_DEAL')?>
		
		<?if ($msg_perso):?>
			:
			<br/>
			« <i><?=escape($msg_perso,'rich')?></i> »
		<? else:?>
			.
		<? endif;?>
	</span>
	
	<br class="cleared"/>
	<br/>
	<span>
		<?=_('MSG_REQUEST_DEAL')?> <?=_('DO_YOU_ACCEPT_COLLABORATION').' '.'{accept#'.$asker->id.'-DEAL-NULL#reject}'?>
	</span>