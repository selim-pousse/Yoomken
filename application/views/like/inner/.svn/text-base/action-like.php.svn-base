<? 
if (!isSession() /*&& $this->session->me()->id == (isset($act->id_usr)?$act->id_usr:$act->id) */) :?>
 <div class='left' style='padding: 0;margin: 0 10px 0 0;'>	
	<ul class="player-stats group">
		<li class="stat-shots">
			<a><?=$act->count_like<100?sprintf('%02d',$act->count_like):99?><span class="meta">Votes</span></a>	
		</li>
	</ul>
 </div>
<?else:?>
<form class='form-like left' style='padding: 0;margin: 0;' action="/ajax/like" method="post">
	<input type="hidden" name='idactlike' value='<?=$act->id?>'/>
	<input type="hidden" name='typelike' value='<?=$act->isLiked?'N':'L'?>'/>
	<input type="hidden" name='sort' value='<?=$sort?>'/>
	<div class='left like-score' >
		<div class='wrap-count-like' style='width: 15px;margin: 0 auto;'>
			<b class='count-like art-count-like' val='count-<?=$sort?>-<?=$act->id?>' style="">
				<?=$act->count_like<100?sprintf('%02d',$act->count_like):99?>
			</b>
		</div>
	</div>
	<div class="cleared"></div>
	<input class='left button-like like-but-score ui-corner-bottom' type='submit' value='' style="background-image:<?=$act->isLiked?'url(/css/images/minus_like2.png)':'url(/css/images/plus_like2.png)'?>;background-position:center; background-repeat:no-repeat;"/>
</form>
<?endif?>