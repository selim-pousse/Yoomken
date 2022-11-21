<? 
$resturl = null;
switch ($journal) {
	case 'OFFR':	$resturl = 'offers/';break;
	case 'WALL':	$resturl = 'wall/';break;
	default:		$resturl = '';break;
}

if (isset($journal) && ($journal =='WALL' || $journal =='BASE')): ;?>
<div class="cleared" ></div>
<div style="position: relative;height: 30px;z-index: 10;">
	<ul class="category-filter" style="position: absolute">
			<li class='left'><a class="box-check-all  filter-sub selected" enabled="true"  title="<?=_('Disable all filters')?>" href="/filter-+/AL/<?=$typeFilter?>" typecrtl="<?=$typeFilter?>" journal="<?=$journal?>" idalias="AL" >All Posts</a></li>
		<? if ($journal =='OFFR'):?>
		
			<li ><a class="filter-sub" href="/<?=me()->url?>/timeline/<?=$resturl?>SV" typecrtl="<?=$typeFilter?>" journal="<?=$journal?>" idalias="SV" title="<?=_('Only').' '._('Proposal')?>s" ><?=_('Proposal')?>s</a></li>
			<li ><a class="filter-sub" href='/<?=me()->url?>/timeline/<?=$resturl?>JB' typecrtl="<?=$typeFilter?>" journal="<?=$journal?>" idalias="JB" title="<?=_('Only').' '._('Searching')?>s"><?=_('Searching')?>s</a></li>
		
		<? else:?>
			<li class="left "><a class="filter-sub" href='/<?=who()->url?>/timeline/<?=$resturl?>NW' typecrtl="<?=$typeFilter?>" journal="<?=$journal?>" idalias="NW" title="<?=_('Only').' '._('SCOOP')?>s"><? if($journal=='WALL'): echo _(ishim()?'Ses':'MYS').' '; endif;?><?=_('SCOOP')?>s</a></li>
			<li class="left "><a class="filter-sub" href='/<?=who()->url?>/timeline/<?=$resturl?>CR' typecrtl="<?=$typeFilter?>" journal="<?=$journal?>" idalias="CR"  title="<?=_('Only').' '._('CREATION')?>s"><? if($journal=='WALL'): echo _(ishim()?'Ses':'MYS').' '; endif;?><?=_('CREATION')?>s</a></li>
			<li class="left "><a class="filter-sub"  href='/<?=who()->url?>/timeline/<?=$resturl?>QU' typecrtl="<?=$typeFilter?>" journal="<?=$journal?>" idalias="QU" title="<?=_('Only').' '._('QUESTION')?>s"><? if($journal=='WALL'): echo _(ishim()?'Ses':'MYS').' '; endif;?><?=_('QUESTION')?>s</a></li>
			<? if ($journal=='WALL'):?>
				<li class="left "><a class="filter-sub" href='/<?=who()->url?>/timeline/<?=$resturl?>OF' typecrtl="<?=$typeFilter?>" journal="<?=$journal?>" idalias="OF" title="<?=_('Only').' '._('OFFER')?>s"><? if($journal=='WALL'): echo _(ishim()?'Ses':'MYS').' '; endif;?><?=_('OFFER')?>s</a></li>
			<? endif;?>
			<?/*<li class="left "><a class="filter-sub" href='/<?=who()->url?>/timeline/<?=$resturl?>AC' typecrtl="<?=$typeFilter?>" journal="<?=$journal?>" idalias="AC" title="<?=_('Only').' '._('Activities')?>"><? if($journal=='WALL'): echo _(ishim()?'Ses':'MYS').' '; endif;?><?=_('Activities')?></a></li>*/?>	
			<? if ($journal!='WALL'):?>
			<li class="left tools-search" style="">
				<a style=""  title="" class=""><?=_('Outils de recherche')?>&nbsp▾</a>
				<?if ($this->session->who()):?> 
					<div style="margin-top: -20px">
						<?=$this->render('filter/blocks/filters');?>
					</div>
				<?endif;?>
				<div class="cleared"></div>
			</li>
			<? endif;?>
		<? endif;?>
		
	</ul>
	<?if ($journal !='WALL'):?> 
		<?= $this->render('filter/inner/displayTags');?>
	<? endif?>
</div>
<?endif;?>


	