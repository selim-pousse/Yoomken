
<div class="cleared" ></div>
<div style="position: relative;height: 30px;z-index: 10;">
	<ul class="category-filter" style="position: absolute">
		<li class='left'><a class="box-check-all filter-sub" enabled="true"  title="<?=_('Disable all filters')?>" href="/filter-+/AL/<?=$typeFilter?>" typecrtl="<?=$typeFilter?>" idalias="AL" >All Profils</a></li>
		<li class='left'><a class="selected filter-sub" enabled="true"  title="<?=_('Toutes les relations')?>" href="/filter-+/FF/<?=$typeFilter?>" typecrtl="<?=$typeFilter?>" idalias="FF" >All Relations</a></li>
		<li class="left categories tools-search" style="">
			<a style="" class=""><?=_('Outils de recherche')?>&nbsp▾</a>
			<?if ($this->session->who()):?> 
				<div style="margin-top: -20px">
					<?=$this->render('filter/blocks/filters');?>
				</div>
			<?endif;?>
			<div class="cleared"></div>
		</li>
	</ul>
	<?= $this->render('filter/inner/displayTags');?>
</div>