<table cellpadding="0" cellspacing="0" style="width:500px">
	<tr>
		<td valign="top">
			<table cellpadding="0" cellspacing="0" width="60">
					<tr>
						<td valign="top" align="left" style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px;color:#535353;line-height:160%">
								<img src="<?=getUserPic($posteur->id,$posteur->id_img,40,$posteur->email)?>" 
									switch=""
									alt="<?=$posteur->name?>" 
									style="float:left;border-radius: 6px;margin-right:12px"
									width="40" height="40"
									class=""
									title="<?=$posteur->name?>"/>
						</td>
						<td valign="top" align="right" style="border-collapse:collapse;font-size:12px;line-height:160%;padding:0">
							<p style="margin:8px 0;border-style:dashed dashed solid;border-color:#FBFBFB;border-width:10px 10px 10px;height:0;width:0;z-index: 1;border-right-color: #F1F0EE;"></p>
						</td>
					</tr>
			</table>
		</td>
		<td valign="top">
			<table width="480" cellpadding="10" cellspacing="0" style="background:#F1F0EE;border-bottom:1px solid #dbdbdb;border-radius:5px">
					<?if (isset($post) && $post):?>
					<tr>
						<td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px">
							<p style="margin:0;">
								« <?=escape($post,'rich')?> ...»
							</p>
						</td>
					</tr>
					<? endif;?>
					<?if (isset($addpost) && $addpost):?>
						<tr>
							<td style="border-collapse:collapse;font-family:Arial,Sans-serif;font-size:12px">
								<?=$addpost?>
							</td>
						</tr>
					<? endif;?>
			</table>
		</td>
	</tr>
</table>
	