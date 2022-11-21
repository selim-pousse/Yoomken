
<!--
/*-----------------------------------------------------------------------------------*/
/*	Slider
/*-----------------------------------------------------------------------------------*/
-->
<?
$thumbs = explode(',',$thumbs);
?>

<div class="widget-slider">
	<div class="flexslider <?if($title==='') echo 'ui-corner-top';?>">
		<div class="flex-viewport " style="">
			<ul class="slides" style="">
				<? foreach ($thumbs as $key => $thumb) : ?>
					<li style="<?if(!$key) echo 'display:list-item';?>" class="">
		    			<div class="entry-image">
		    				<a  class='entry-image get-more' idact='<?=$actid?>' action='/ajax/content/view/'>
		    					<img src="<?=getPictureThumb($userid, $thumb, 306);?>" alt="" class="<?if($title==='') echo 'ui-corner-top';?>" style=''>
		    				</a>
		    			</div>
					</li>
				<? endforeach;?>
			</ul>
		</div>
	</div>
</div>	