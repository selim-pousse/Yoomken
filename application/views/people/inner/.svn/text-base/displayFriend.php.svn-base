<?
	$location = isset($usr->spot) ? getLocation($usr->spot) : 'nulle part';
	
	if ($usr->me_=='A' && $usr->_me='A') $icon = 'dealv2_ico16';
	else if ($usr->me_ && $usr->_me) $icon = '-me-_ico16';
	else if ($usr->me_) $icon = 'me-v2_ico16';
	else if ($usr->_me) $icon = '-mev2_ico16';
?>
<div class='profile' style="z-index:1">
	<div class='left block-sub-more' style='padding: 10px 0px;width:100%;position: relative;cursor: pointer;'>
		<div class="full" style="">
			<div class="profile vcard group left" style="width: 100%;">
				<img src="<?=getUserPic($usr->id,$usr->id_img,40,$usr->email)?>" 
					switch=""
					alt="<?=$usr->name?>"
					style='width: 40px;height: 40px'
					class="photo left"
					title="<?=$usr->name?>"/>
				
				<h4 style="overflow-y: hidden;max-height: 15px;">
					<a class="fn edit" style='color: #685840;margin-top: 3px;'>
						<?=$usr->name?>
					</a> <span style="font-weight: normal;font-size: 12px;color: #826D4F;">(<?=getTitleStatus($usr)?>)</span>
				</h4>
				
				<?/* if (isset($usr->service)) :?>
					<div style='margin:3px 0;overflow-y: hidden;max-height: 15px;'>
						<span class="meta meta-skills" style='color: #999;;cursor:pointer;font-size: 12px;background: url(/css/images/ico-services.png) no-repeat;padding-left: 15px'>
							<?=implode(', ',$usr->service)?>
						</span>
					</div>
				<? endif*/?>
				
				<ul class="profile-details" style="250px">
					<li>
						<a href="/search/network/<?=getAddressUser($usr,true)->id?>-l" class="locality"><?=$location?></a>
					</li>
				</ul>
				
				<?/*<div class='subsub-menu infocount left ' style=''>
					<ul class="player-stats group subsub" idusr='<?=$usr->id?>'>
						<li class="subsub-relation" style="">
							<a>
								<span class="count"><?=number_format($usr->count_rel,0,',',"'")?></span> 
								<span class="meta">Relations</span>
						</li>
						<li class="subsub-badge ">
							<a>
									<span class="count">0</span> 
									<span class="meta">Badges</span>
							</a>
						</li>
						
						<li class="subsub-msg">
							<a>
									<span class="count">0</span> 
									<span class="meta">Messages</span>
							</a>
						</li>
		
					</ul>
				</div>*/?>
				
				<span class="right" style="height: 20px;width: 28px;border: none;margin: -28px 0 0 0px;background-image: url(/css/images/<?=$icon?>.png);" > </span>
			</div>
		</div>
		
		
	</div>
</div>
<div class="clear"></div>