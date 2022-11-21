<?$count = count($mycontacts);
 if ($mycontacts):
	foreach ($mycontacts as $msg): $count--;
	     //_debug($msg->id);
 ?>
	     <div style="" 
	     idusr='<?=$msg->user->id?>' class='user friend recent-contact <?if((isme() && $msg->user->id=='00') || (ishim() && $msg->user->id==who()->id)) echo "-selected";?>'>
		    <img src="<?=getUserPic($msg->user->id,$msg->user->id_img,40,$msg->user->email)?>" 
			switch=""
			alt="<?=$msg->user->name?>" 
			style='margin:0 5px'
			width="40" height="40"
			class="ppict photo left"
			title="<?=$msg->user->name?>"/>
			
			<span>
				<b title="<?=$msg->user->name?>" class='' style='color:#292319;margin:2px 0px;width:130px'><?=$msg->user->name?></b>
				<br/>
				<span style=''><?=shortenString(strip_tags(cleanMyLinks($msg->content)), 50,'short')?></span>
			</span>
	 		<div class='cleared'></div> 
		</div>
	 <? endforeach;
endif;
?>  