<? foreach($badges as $badge) :
?>
	<div href="#" class='user friend left art-postDash' on style='border-top:1px dashed #ccc;width: 493px;padding:0 2px;cursor: pointer;border-bottom: 2px solid transparent;margin-top: -2px' idbadge="<?=$badge->name?>">
		<?=$this->render('/badge/inner/displayLine',array('badge'=>$badge));?>
	</div>
<?endforeach;?>