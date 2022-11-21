<script type='text/javascript'>
  $(function() {
    var nav = $('.secondary');
    var navHomeY = nav.offset().top;
    var isFixed = false;
    var $w = $(window);
    $w.scroll(function() {
        var scrollTop = $w.scrollTop();
        var shouldBeFixed = scrollTop + 40 > navHomeY;
        if (shouldBeFixed && !isFixed) {
            nav.css({
                position: 'fixed',
                top: 40,
                left: nav.offset().left,
                width: nav.width()
            });
            isFixed = true;
        }
        else if (!shouldBeFixed && isFixed)
        {
            nav.css({
                position: 'static'
            });
            isFixed = false;
        }
    });
});
</script>

<?= $this->render($this->controller.'/blocks/subMenu')?>
<div class='secondary' style="float: right;width: 19%;height: 27px;margin: 5px 0 3px">
		
		<? foreach ($badges as $bdg):?>
			<div class="<?=$badges[count($badges)-1]->name==$bdg->name?'hide':'hide'?> css-desc-badge desc-badge desc-badge-<?=$bdg->name?>"> 
				<h3 style="margin-bottom: 15px;"><?=_('MEANING')?> &nbsp;<span style="">&nbsp;</span></h3>
				<p>
					<b>Badge <?=$bdg->title?> : </b><?=$bdg->desc?>
				</p>
				
				
				<p></p>
				<? if($bdg->type!='PERS'):?>
					<h3 style="margin-bottom: 15px;"><?=($bdg->type=='ACTION'?_('Rules for obtaining'):_('Rules for donation'))?> &nbsp;<span style="">&nbsp;</span></h3>
					<p>
						<?=($bdg->rules?$bdg->rules:_('None.'))?>
					</p>
				<? endif;?>	
				
				<? if (me() && $bdg->type!='ACTION'):?>
				<input class="action button boxy" title="<?=_('GIVE BADGE').' '.$bdg->title.' '._('TO')?>" href="/ajax/people/transfert/badge/GIV/<?=$bdg->name?>" titlebox="<?=_('GIVE BADGE').' '.$bdg->title.' '._('TO')?>" 
						style="padding: 10px 5px;margin:0 10px 0 0px;float: none;cursor: pointer" value="<?=_('DON BADGE')?>" type='button'/>
				<input class="action button boxy" title="<?=_('ASK BADGE').' '.$bdg->title.' '._('TO')?>" href="/ajax/people/transfert/badge/ASK/<?=$bdg->name?>" titlebox="<?=_('ASK BADGE').' '.$bdg->title.' '._('TO')?>" 
						style="padding: 10px 5px;float: none;cursor: pointer" value="<?=_('ASKING BADGE')?>" type='button'/>
				<? endif;?>
			</div>
		<?endforeach;?>
</div>

<div class='first left' style="width: 80%;margin-top: 5px">
	<div class='profile-tabs tabs left badges' style="background: none;height: 100%;width: 100%">
		<? 
		$parent = null;
		foreach ($badges as $bdg):
		?>
			<? if($parent != $bdg->parent) :?> <h3 class='title-block' style='clear: both;padding-top:15px;'><?=$bdg->parent?></h3> <?endif;$parent = $bdg->parent?>
			<div class='sub-menu-multi badges-def big-badge img-badge <?=$badges[count($badges)-1]->name==$bdg->name?'activ':''?> ' name='<?=$bdg->name?>' style="<?=$bdg->name=='keepingPets'?'float:right;margin-right:0px':''?>"> 
				<a class='left'><img src="<?=$bdg->img160?>" ></a>
			</div>
		<?endforeach;?>
	</div> 
</div>