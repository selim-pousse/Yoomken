<?
	$lang = $this->session->get('lang');
	$location = isset($usr->spot) ? getLocation($usr->spot) : 'nulle part';
	$urlbase = 'http://'.$_SERVER['SERVER_NAME'];
?>
<table>
		<tr>
			<td>
				<a href="<?=$urlbase.'/'.$usr->url?>/about"><img src="<?=getUserPic($usr->id,$usr->id_img,75,$usr->email)?>" 
					switch=""
					alt="<?=$usr->name?>"
					style='margin-top:0px;margin-right: 12px;-webkit-border-radius: 6px;-moz-border-radius: 6px;border-radius: 6px;'
					width="80" height="80"
					title="<?=$usr->name?>"/>
				</a>
			</td>
		
			<td>
				<table>
					<tr>
						<td  style="overflow-y:hidden;max-height:15px;padding-top:3px">
							<a href="<?=$urlbase.'/'.$usr->url?>/about" style="{#astyle}">
								<?=$usr->name?>
							</a> <span>(<?=getTitleStatus($usr)?>)</span>
						</td>
					</tr>
					
					
					<? if (isset($usr->service) && count($usr->service)) :?>
					<tr>
						<td style='margin:3px 0;overflow-y: hidden;max-height: 15px;'>
							<span>
								<?=implode(', ',$usr->service)?>
							</span>
						</td>
					</tr>
					<? endif?>
					
					<tr><td><span><?=$location?></span></td></tr>
					
					<tr>
						<td>
							<table>
								<tr>
									<td style="float:left;border-right:1px solid #8f8d89; padding-right:10px">
										<a  href="<?=$urlbase.'/'.$usr->url.'/relations/init'?>" style="color:{#acolor};text-decoration: none;">
											<b ><?=number_format($usr->count_rel,0,',',"'")?></b> 
											<br/>
											<span class="meta">Relations</span>
										</a>	
									</td>
									<td style="float:left;padding-left:10px">
										<a href="<?=$urlbase.'/'.$usr->url.'/badges'?>" style="color:{#acolor};text-decoration: none;"  >
											<b ><?=number_format($usr->count_bdg,0,',',"'")?></b> 
											<br/>
											<span >Badges</span>
										</a>	
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>	
		</tr>
</table>
				