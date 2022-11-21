<div class='secondary' style="float: right;width: 220px;height: 27px;margin: 5px 0 3px">
			
</div>
	
<div class='first left' style="width: 680px">
<? if (count($people)):?>
	<? foreach($people as $usr) :
		if ($usr->me_=='A' && $usr->_me='A') $icon = 'dealv2_ico16';
		else if ($usr->me_ && $usr->_me) $icon = '-me-_ico16';
		else if ($usr->me_) $icon = 'me-v2_ico16';
		else if ($usr->_me) $icon = '-mev2_ico16';
	?>
		<a class='left' href="/<?=$usr->url?>/timeline/wall" class='people-relation'>	
				<img src="<?=getUserPic($usr->id,$usr->id_img,75,$usr->email)?>" 
					switch=""
					alt="<?=$usr->name?>" 
					style='margin: 0 10px 10px 0'
					width="80" height="80"
					class="photo left"
					title="<?=$usr->name?>"/>
				<?/*<span class="left bg-block-soft" style="height: 16px;width: 17px;border: none; margin: 2px 0 0 -20px;" > </span>*/?>
				<span class="left" style="height: 20px;width: 28px;border: none;margin: 60px 0 0 -40px;background-image: url(/css/images/<?=$icon?>.png);" > </span>
		</a>	
	<?endforeach;?>
<? else:?>
	<h3 class='none' style=''>None</h3>
<? endif;?>
</div>