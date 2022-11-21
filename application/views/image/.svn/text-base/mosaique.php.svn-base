<?
$thumbs = explode(',',$thumbs);
if (isset($thumbs[5])) $widthmos = '210px';
else if (isset($thumbs[3])) $widthmos = '175px';
else if (isset($thumbs[1])) $widthmos = '140px';
else $widthmos = '0';

if (isset($thumbs[0]) && isId($thumbs[0])):?>
	<div class="pile-grp-img post-img" style="float: left;margin-right: 5px;width: 246px;">
		<div class="sub-menu-multi pile-img left boxy" style="width: 246px;" content="<img src='<?=getPictureThumb($userid, $thumbs[0]);?>'/>">
			<img class="photo left" src="<?=getPictureThumb($userid, $thumbs[0], 246);?>" style="width: 246px;height: 246px" />
		</div>
	</div>
	
	<div class="left">
		<div class="pile-grp-img post-img left" style="float: left;margin-bottom: 2px;width:<?=$widthmos?>">
			<?if (isset($thumbs[1]) && isId($thumbs[1])):?>
			<div class="sub-menu-multi pile-img left boxy" content="<img src='<?=getPictureThumb($userid, $thumbs[1]);?>'/>">
					<img class="photo left" src="<?=getPictureThumb($userid, $thumbs[1], 120);?>"/>
			</div>
			<?endif;?>
			<?if (isset($thumbs[3]) && isId($thumbs[3])):?>
			<div class="sub-menu-multi pile-img left boxy" content="<img src='<?=getPictureThumb($userid, $thumbs[3]);?>'/>">
					<img class="photo left" src="<?=getPictureThumb($userid, $thumbs[3], 120);?>"/>
			</div>
			<?endif;?>
			<?if (isset($thumbs[5]) && isId($thumbs[5])):?>
			<div class="sub-menu-multi pile-img left boxy" content="<img src='<?=getPictureThumb($userid, $thumbs[5]);?>'/>">
					<img class="photo left" src="<?=getPictureThumb($userid, $thumbs[5], 120);?>"/>
			</div>
			<?endif;?>
		</div>
		
		<div class="cleared"></div>
		
		<div class="pile-grp-img post-img left" style="float: left;width:<?=$widthmos?>">
			<?if (isset($thumbs[2]) && isId($thumbs[2])):?>
			<div class="sub-menu-multi pile-img left boxy" content="<img src='<?=getPictureThumb($userid, $thumbs[2]);?>'/>">
					<img class="photo left" src="<?=getPictureThumb($userid, $thumbs[2], 120);?>"/>
			</div>
			<?endif;?>
			<?if (isset($thumbs[4]) && isId($thumbs[4])):?>
			<div class="sub-menu-multi pile-img left boxy" content="<img src='<?=getPictureThumb($userid, $thumbs[4]);?>'/>">
					<img class="photo left" src="<?=getPictureThumb($userid, $thumbs[4], 120);?>"/>
			</div>
			<?endif;?>
			<?if (isset($thumbs[6]) && isId($thumbs[6])):?>
			<div class="sub-menu-multi pile-img left  boxy" content="<img src='<?=getPictureThumb($userid, $thumbs[6]);?>'/>">
					<img class="photo left" src="<?=getPictureThumb($userid, $thumbs[6], 120);?>"/>
			</div>
			<?endif;?>
		</div>
	</div>
<? endif;?>