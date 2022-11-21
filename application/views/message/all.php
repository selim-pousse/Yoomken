<? 
$me = $this->session->get('user');
?>

<?=$this->render($this->controller.'/blocks/subMenu')?>

	<div class="art-sidebar1">
		<?=$this->render($this->controller.'/blocks/sidebarAll-right');?>
	</div>
		
	<div class='left' id='<?=$setrec?>-msg'>
		<?/*<h4 style="margin:auto;width:650px;">
			<span class='left'><?= $who->name;?></span>
			<span class="ui-icon ui-icon-triangle-1-e left"></span>
			<span class='left'><?=_('TCHAT')?></span>
			<? if (1 || $setrec != '00'):?>
			<span class="ui-icon ui-icon-triangle-1-e left"></span> 
			<span class='left'><?= $me->name;?></span>
			<br/>
			<? endif;?>
		</h4>
		<br/>
		<div class='cleared'></div>*/?>
		
		
	
		<?= $this->render('message/view');?>
	</div>