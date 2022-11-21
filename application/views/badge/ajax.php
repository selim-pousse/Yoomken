<div class='left get-more get-more-css back' idact='<?=$who->id?>'>
	<div style='z-index:50;margin:-10px 5px 0; top:50%;position:absolute; font-size: 1.5em;font-weight: bold'>
		››
	</div>
</div>

<?=$this->render('/people/inner/displayBulle',array('usr'=>$who));?>
<?/*<div class='break-usr <?=$who->id?>-usr' style=""></div>*/?>

<div class='ajax-usr-js ajax-usr-css'>
	<div class='ajax-js ajax-<?=$user->id?>-badge-js'>
		<?=$this->render('/badges/allEarned');?>
	</div>
</div>