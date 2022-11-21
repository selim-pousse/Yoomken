<?=$this->render('/badge/inner/displayLine',array('badge'=> $bdg = $badge));?>
<p>
	<? if (me()):?>
					<input class="action button boxy" title="<?=_('GIVE BADGE').' '.$bdg->title.' '._('TO')?>" href="/ajax/people/transfert/badge/GIV/<?=$bdg->name?>" titlebox="<?=_('GIVE BADGE').' '.$bdg->title.' '._('TO')?>" 
							style="padding: 10px 5px;margin:0 10px 0 0px;float: none;cursor: pointer" value="<?=_('DON BADGE')?>" type='button'/>
					<input class="action button boxy" title="<?=_('ASK BADGE').' '.$bdg->title.' '._('TO')?>" href="/ajax/people/transfert/badge/ASK/<?=$bdg->name?>" titlebox="<?=_('ASK BADGE').' '.$bdg->title.' '._('TO')?>" 
							style="padding: 10px 5px;float: none;cursor: pointer" value="<?=_('ASKING BADGE')?>" type='button'/>
				<? endif;?>
</p>