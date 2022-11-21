	
	<div class="full left" style='margin: 20px 0 15px;width: <?=$this->action=='wish'?'80%':'100%'?>'>
		
		<div class="profile vcard group" >
			<img  title='' class=" left"  style='cursor: pointer'>
			<h1 style='margin:0 0 10px 0'>
				<div class="fn edit" style='font-size: 20px' >
					<?=gettext('TIT_BADGE_'.$type)?>
				</div>
			</h1>
				
			<div style="font-size:13px ;margin-top: 4px">
				<span> 
					<?=gettext('TXT_BADGE_'.$type)?>
				</span>
			</div>
			
			
		</div>
	</div>
	
	<? if ($this->action =='wish'):?>
		<div class='secondary' style="float: right;width: 220px;height: 27px;margin: 55px 0 3px">
			<input class="action button boxy" title="<?=_('WISH_NEW_BADGE')?>" href="/ajax/badges/wishnew" titlebox="<?=_('WISH_NEW_BADGE')?>" 
								style="padding: 10px 5px;width: 220px;float: none;cursor: pointer" value="<?=_('WISH_BADGE')?>" type='button'/>
		</div>
	<? endif;?>

<div class='clear'></div>
<div class="" >
	<ul class="profile-tabs tabs left" style ='height: 27px; width : 80%'>
		<li class='sub-menu-multi <?=$this->action=='personalities'?'active':''?>'>
			<a href='/badges/personalities' style="width:85px;padding:0 0 0 0px;">
				<span class='meta' style="width:85px;text-align: center"><?=_('Personality')?></span>
			</a>
		</li>
		<li class='sub-menu-multi <?=$this->action=='skills'?'active':''?> ' style="">
			<a href='/badges/skills' style="width:85px;padding:0 0 0 0px;">
				<span class='meta' style="width:85px;text-align: center"><?=_('Know-How')?></span>
			</a>
		</li>
		<li class='sub-menu-multi <?=$this->action=='actions'?'active':''?> ' style="">
			<a href='/badges/actions' style="width:85px;padding:0 0 0 0px;">
				<span class='meta' style="width:85px;text-align: center"><?=_('Action')?></span>
			</a>
		</li>
		
		<? if ($this->session->isLogged()):?>
		<li class='sub-menu-multi <?=$this->action=='wish'?'active':''?> ' style="border-right: none;">
			<a href='/badges/wish' style="width:85px;padding:0 0 0 0px;">
				<span class='meta' style="width:85px;text-align: center"><?=_('Wish')?></span>
			</a>
		</li>
		<? endif;?>
	</ul>
	
</div>