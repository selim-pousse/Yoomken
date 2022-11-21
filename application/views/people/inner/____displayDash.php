<? foreach($people as $usr) :
	if ($me && $me->id==$usr->id) continue; 
	if ($this->session->isLogged() && in_array($usr->id,$me_))
	{
		$action ='/ajax/dettach';
		$actLabel = DETTACH;
	}
	else 
	{
		$action ='/ajax/attach';
		$actLabel = ATTACH;
	}
	
	//_debug($usr->tags);
	$location = isset($usr->spot) ? getLocation($usr->spot) : 'nulle part';
?>
	<li class="user" style='height: 82px'>
		<a class='a-bulle' href="/<?=$usr->url?>">
			<img src="<?=getUserPic($usr->id,$usr->id_img,50)?>" 
				alt="<?=$usr->firstname.' '.$usr->lastname?>" 
				class="ppict profil-usr"
				title="<?=$usr->firstname.' '.$usr->lastname?>"/>
			<span class="name-usr" href="/<?=$usr->url?>"><?=$usr->firstname.' '.$usr->lastname?></span>
			<span class="job-usr"><?=$usr->job?></span>
			<span class="ort-usr">@ <?=$location?></span>
			<span class="clear"></span>
		</a>
		<?if ($this->session->isLogged()):?>
		<div class="art-button-wrapper left hide" style='margin:-15px 3px;'>
			<span class="l"> </span>
			<span class="r"> </span>
			<span>
				<form class='form-attach' method="POST" action='<?=$action?>'>
					<input class="art-button" type='submit' value="<?=$actLabel?>" style='width:145px;text-align: center'/>
					<input type='hidden' name='id' value='<?=$usr->id?>'/>
				</form>
			</span>
			<div style='clear:both;'></div>
		</div>
		
		<?endif;?>
	</li>
<?endforeach;?>