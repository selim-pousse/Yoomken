	<span>
	 	<a href="http://<?=$_SERVER['SERVER_NAME'].'/'.$asker->url?>/about" target="_blank"><?=$asker->name?></a> <?=_('REQUEST_YOU_TO_RECEIVE_BADGE').' '.ucfirst($bdg->title)?>
		
		<?if ($msg_perso):?>
			:
			<br/>
			« <i><?=escape($msg_perso,'rich')?></i> »
		<? else:?>
			.
		<? endif;?>
	
	</span>
	
	<br class="cleared"/>
	<span class='left' style="margin: 5px 5px 5px 0">
		<img src="<?='http://'.$_SERVER['SERVER_NAME'].'/'.$bdg->img160?>" 
			switch=""
			alt="<?=$bdg->title?>"
			style="width: 80px;height: 80px;float:left;border:none;margin:0 5px 0 0"
			class=""
			title="<?=$bdg->name?>"/>
		<span style="overflow-y: hidden;max-height: 15px;;">
			<a class="fn edit" style='color: #F26B51;margin-top: 3px;'>
				Badge <?=ucfirst($bdg->title)?>
			</a> 
			<span style="font-weight: normal;font-size: 12px;">(<?=$bdg->type=='SKILL'?_('SKILL'):_('PERSONALITY')?>)</span>
		</span>
		<br/>
		<span class="" style=''>
				<?=$bdg->desc?>
		</span>
	</span>
	
	<br class="cleared"/>
	<span style=''>
		<?=_('DO_YOU_ACCEPT_TO_GRANT_BADGE').' '.'{accept#'.$asker->id.'-BADGE-'.$bdg->name.'#reject}'?>
	</span>