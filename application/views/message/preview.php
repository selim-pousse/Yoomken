
<span class='tip-before-before' style='position: absolute;'></span>
<table  class='tb-transborder tip-before' style="position: absolute;width: 100%;left:-44%;top:18px;">
<tr >
	<td class='tl-transborder'></td><td class='tm-transborder'></td><td class='tr-transborder'></td>
</tr>
<tr>
<td class='ml-transborder'></td><td class='bg-block-soft' style="padding: 0">
	<div class='' style="background-color: #685840;height: 20px">
		<span class='brown-bold left' style="padding: 5px;margin:0;color:#E4DDD3">&nbsp <?=_('NOTIFICATIONS')?></span>	
	</div>
	<div class="cleared"></div> 
<?php if ($contacts):?>
	<?php foreach ($contacts as $usr):
		$tumbnail = getUserPic($usr->id,$usr->id_img,24,$usr->email);
		$unread = $usr->unread;
		if ($usr->id=='00') $usr->url = $this->session->getUserVar('url');
	?>
		<div class='left news-msg hover-grown' style='overflow: hidden;height:29px;'>
			<a href='/<?=$usr->url?>/tchat' class='search-item' style='color:#685840;width: 200px'>
				<img src='<?=$tumbnail?>' class='search-img left' style='margin:3px'></img>
				<b class='left' style='margin:0px 5px;'>
					<span class='left'><?=$usr->name?></span>
					<br/>
					<span class='left'><?=$usr->presta->job?></span>
				</b>
				<b class='right news-timer <?=isset($unread) && $unread? '':'hide'?>'><?= isset($unread) && $unread? $unread:''?></b>	
			</a>
			<div class='cleared'></div>
		</div>
	<?php endforeach;?>
<?php else:?>
	<div style="padding: 4px">
      	<span class="brown-bold" style='background-image: none;padding:0;margin:0'><?=_('NO_MESSAGE_NOW')?></span>
     </div>
<?php endif;?>
</td><td class='mr-transborder'></td>
</tr>
<tr>
	<td class='bl-transborder'></td><td class='bm-transborder'></td><td class='br-transborder'></td>
</tr>
</table>