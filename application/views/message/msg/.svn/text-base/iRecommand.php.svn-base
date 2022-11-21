
	<?
		$areciver = '<a href="http://'.$_SERVER['SERVER_NAME'].'/'.$goodguy->url.'/about" target="_blank" style="{#astyle}">'.$goodguy->name.'</a>';
	?>
			<p>
				<a href="http://<?=$_SERVER['SERVER_NAME'].'/'.$parain->url?>/about" target="_blank" style="{#astyle}">
					<?=$parain->name?>
				</a> 
				<?=preg_replace('/\{#user\}/',$areciver,_('RECOMMAND_USER_AS_WORK_RELATION_SPECIALAZED_IN_SERVICES'))?> :
			</p>
			
			
			<?=$this->render('/user/inner/displayForMail',array('usr'=>$goodguy,));?>
			
			
			<?if ($msg_perso):?>
				<span style='clear: both'></span>
				<p>
					« <?=escape($msg_perso,'rich')?> »
				</p>
			<? endif;?>