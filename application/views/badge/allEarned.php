<? 
$me = $this->session->get('user');
?>

<?= $this->render('people/blocks/subMenu')?>


<div class='art-Post' id='allearned-bdg'>
	
	<div class="art-sidebar1">
		<?=$this->render($this->controller.'/blocks/sidebarAll-right');?>
	</div>

	<?= $this->render('badge/inner/displayInColumns',array('badges'=>$badges));?>
</div>