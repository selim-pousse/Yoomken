<?if ($this->session->isLogged() && (!isset($journal) || $journal!='WALL')):?>
	<?php //$typeFilter = ($this->controller=='people')? 'USR':'ACT';
	$me = $this->session->get('user');
	$who = $this->session->who();
	$isowner = ($who->id == $me->id);
	
	$services = array();
	if ($who->profil!='C'  && isset($who->serviceP)) foreach ($who->serviceP as $tag) $services[$tag] = $tag;
	if ($who->profil!='P' && isset($who->serviceC)) foreach ($who->serviceC as $tag) $services[$tag] = $tag;
	
	$textService = '';
	if (count($services)){
		  foreach ($services as $tag):
			$textService .= "<a class='textboxlist-bit textboxlist-bit-box' style='text-decoration: none;color:#685840;'>"._($tag)."</a>";
		 endforeach;
	}
	else $textService = _('NO_DATA'); 
?>
<div id='menu-smartFilter' class="" style="<?//=(BROWSER_MOBILE?'position:static;margin-bottom:-36px':'position:fixed')?>">
	     <div class='bg-filter' style=''>
	     <div style="padding:4px;margin-bottom:-10px">
	     	<?/* if(!isset($journal)):?>
		     	<a class="box-check-all" enabled="true"  title="<?=_('Disable all filters')?>" href="/filter-+/AL/<?=$typeFilter?>" typecrtl="<?=$typeFilter?>" idalias="AL">
		     		<h5 style="margin-bottom:10px;;text-decoration: underline"><?=_("SHOW ALL")?>&nbsp;<<</h5>
		     	</a>
		     	<h5 class="" style="margin-bottom:10px;"><?=_("MONTRER_SEULEMENT")?> :</h5> 
			<?endif*/?>
			<ul class='smart-Filtre left' style='width: 150px;margin-bottom:10px;'>
					<h5 style="margin: 8px 0;width: 150px;margin-top:0;"><?=_("Criteria")?></h5> 
					<?foreach ($filters as $static): if (strstr($static->alias,'=',true)=='XXX' || strstr($static->alias,'=',true)=='SRV'):
			      	 if ($static->access ==-2 ):
			      	 	 $idalias = strstr($static->alias,'=',true);
						 $alias = substr(strstr($static->alias,'='),1);
						 
						 $text = $head = '';
						 if ($idalias=='SRV') {
						 	$text = $textService;
							 $alias .= '_'.$typeFilter;
							 $head = gettext($typeFilter=='USR'?('GN_'.$alias.'_TITLE'.($isowner?'':'_OTH')):('GN_'.$alias.'_TITLE'.($isowner?'':'_OTH')));
						 }
						 if ($idalias=='XXX') {
						 	$head = ($typeFilter=='USR'?_('ALL_PROFIL'):_('ALL_CONTENT')).' '._('AU_PLUS_PRES_DU_LIEU')
						 			.':';
						 	$text = getAddressUser($who);
							$radius = '';
							if ($me->nearby->radius != 'XX') $radius = ' '._('DANS_RAYON').' '.$me->nearby->radius.' km ';
							$head = preg_replace('/\{\#radius\}/',$radius,$head);
						 }
			      	 	?>
			      		<li class='filtre' style='text-transform: uppercase;margin:0;'>
							<div class='cleared'></div> 
							<a class="box-check" enabled="true" style='' title='<?=_('ACTIVE_FILTER')?>'
								href='/filter-+/<?=$idalias?>/<?=$typeFilter?>' typecrtl='<?=$typeFilter?>' idalias='<?=$idalias?>'>
								<input type='checkbox' class='hide' name='activeFilter' <?=($static->active)?'checked="checked"':''?> value="<?=$idalias?>" title=""/>
							</a>
							<a class='tooltips elem-filter  <?=($static->active)?'active':''?>' id='<?=$static->id?>-<?=$typeFilter?>' 
								title="<?=gettext('GN_'.$alias.'_TITLE'.($isowner?'':'_OTH'))?> <?=($idalias=='XXX'?':':'')?>" 
								content="<?=$text?>" head='<?=$head?>' toolposition='rightMiddle' targetposition='leftMiddle'>
								<?=gettext('GN_'.$alias.($isowner?'':'_OTH'))?>
							</a>
							
							
							<? if($idalias=='XXX' && $isowner):?>
								<div style='margin-right:5px'>
									<span class="supsup">&nbsp;>>&nbsp;</span>
									<span href="/ajax/filter/nearby/edit/<?=$typeFilter?>" class="boxy right yoo-icon light button hide " title="<?=_('EDIT_FILTER')?>" titlebox='<?=_('PARAM_FILTER')?> <?=gettext('GN_'.$alias.($isowner?'':'_OTH'))?>'><span class="ui-icon ui-icon-wrench"></span></span>
								</div>
							<?endif;?>
							<? if($idalias=='SRV' && $isowner):?>
								<div style='margin-right:5px'>
									<span class="supsup">&nbsp;>>&nbsp;</span>
									<span href="/ajax/filter/myservices/edit/<?=$typeFilter?>" class="boxy right yoo-icon light button hide" title="<?=_('EDIT_FILTER')?>" titlebox='<?=_('PARAM_FILTER')?> <?=gettext('GN_'.$alias.($isowner?'':'_OTH'))?>'><span class="ui-icon ui-icon-wrench"></span></span>
								</div>
							<?endif;?>
						</li>
						<? endif; endif;?>
			      	<?endforeach;?>
			</ul>
		      <div class='cleared'></div> 
			<ul class='smart-Filtre' style='width: 150px;margin-bottom:10px;'>
					<h5 style="margin: 8px 0;width: 150px;margin-top:0;"><?=_("Profil")?></h5> 
					<?foreach ($filters as $static): if (strstr($static->alias,'=',true)!='XXX' && strstr($static->alias,'=',true)!='SRV' && strstr($static->alias,'=',true)!='LIS'):
			      	 if ($static->access ==-2 ):
			      	 	 $idalias = strstr($static->alias,'=',true);
						 $alias = substr(strstr($static->alias,'='),1);
						 $text = $head = '';
			      	 	?>
			      		<li class='filtre' style='text-transform: uppercase;margin:0;'>
							<div class='cleared'></div> 
							<a class="box-check" enabled="true" style='' title='<?=_('ACTIVE_FILTER')?>'
								href='/filter-+/<?=$idalias?>/<?=$typeFilter?>' typecrtl='<?=$typeFilter?>' idalias='<?=$idalias?>'>
								<input type='checkbox' class='hide' name='activeFilter' <?=($static->active)?'checked="checked"':''?> value="<?=$idalias?>" title=""/>
							</a>
							<a class='tooltips elem-filter  <?=($static->active)?'active':''?>' id='<?=$static->id?>-<?=$typeFilter?>' 
								title="<?=gettext('GN_'.$alias.'_TITLE'.($isowner?'':'_OTH'))?> <?=($idalias=='XXX'?':':'')?>" 
								content="<?=$text?>" head='<?=$head?>' toolposition='rightMiddle' targetposition='leftMiddle'>
								<?=gettext('GN_'.$alias.($isowner?'':'_OTH'))?>
							</a>
						</li>
						<? endif; endif;?>
			      	<?endforeach;?>
			</ul>
			 <div class='cleared'></div> 
		      <ul class='smart-Filtre left' style='width: 180px;margin-bottom:10px;'>
		      	<h5 style="margin: 8px 0;width: 150px;margin-top:0;"><?=_("Relation")?></h5> 
		      	<?foreach ($filters as $static):
		      	 if ( $static->access ==-1 || $static->access ==-3):
		      	 	$idalias = strstr($static->alias,'=',true);
					$alias = substr(strstr($static->alias,'='),1);
				 	if ($idalias=='AL') continue;
		      	?>
		      		<?/*<li style='width: 180px;'>
		      			<a class="box-check" enabled="true"  title='<?=_('ACTIVE_FILTER')?>' style='padding: 0'
							href='/filter-+/<?=$idalias?>/<?=$typeFilter?>' idalias='<?=$idalias?>'>
							<input type='radio' class='hide' name='activeFixe' <?=($static->active)?'checked="checked"':''?> value="<?=$idalias?>" title=""/>
						</a>
						
							<?php $tmp = gettext($alias.'_'.$typeFilter.($isowner?'':'_OTH'));
							$title = gettext($alias.'_'.$typeFilter.'_TITLE'.($isowner?'':'_OTH'));
							?>
						<a typecrtl='<?=$typeFilter?>' class='tooltips elem-filter <?=($static->active)? 'active':''?>'
							style='padding: 0 2px;text-transform: uppercase;font-size: 10px;' toolposition='rightMiddle' targetposition='leftMiddle' head="<?=$title?>" title="<?=$title?>">
							<?=$tmp?>
						</a>
						
					</li>*/?>
					
			      		<li class='filtre' style='text-transform: uppercase;margin:0;'>
							<div class='cleared'></div> 
							<a class="box-check" enabled="true" style='' title='<?=_('ACTIVE_FILTER')?>'
								href='/filter-+/<?=$idalias?>/<?=$typeFilter?>' typecrtl='<?=$typeFilter?>' idalias='<?=$idalias?>'>
								<input type='checkbox' class='hide' name='activeFilter' <?=($static->active)?'checked="checked"':''?> value="<?=$idalias?>" title=""/>
							</a>
							<a class='tooltips elem-filter  <?=($static->active)?'active':''?>' id='<?=$static->id?>-<?=$typeFilter?>' 
								title="<?=trim(gettext($alias.'_'.$typeFilter.'_TITLE'.($isowner?'':'_OTH')))?>." 
								content="<?=$text?>" head='<?=$head?>' toolposition='rightMiddle' targetposition='leftMiddle'>
								<?=gettext($alias.'_'.$typeFilter.($isowner?'':'_OTH'))?>
							</a>
						</li>
				 <? endif;?>
		      	<?endforeach;?>
		      </ul>
		    <div class='cleared'></div> 
			<?/*<h5 style="border-bottom: 1px dashed #CCC;margin-bottom:0px"><?=_('CUSTO')?> <b class="" style="color:orange;font-size:10px;margin:15px 0 0 3px;text-transform:uppercase;">(<?=_('BETA')?>)</b></h5>
			<ul class='smart-Filtre' style='width: 150px;'>
				<?foreach ($filters as $fil):
					if ($fil->access >= 0):
						$idalias = $fil->id;
						 ?>
					<li class='filtre'>
						<div class='cleared'></div> 
						<!--  <span class='boxcolor'></span>-->
						<a class="box-check" enabled="true" style='' title='<?=_('ACTIVE_FILTER')?>'
							href='/filter-+/<?=$idalias?>/<?=$typeFilter?>' typecrtl='<?=$typeFilter?>' idalias='<?=$idalias?>'>
							<input type='checkbox' class='hide' name='activeFilter' <?=($fil->active)?'checked="checked"':''?> value="<?=$fil->id?>" title=""/>
							<input type='hidden' name='filtertyp' value='<?=$typeFilter?>'/>
						</a>
						
						<a class='ui-state-default etiquette draggable <?=($fil->active)?'active':''?>' id='<?=$fil->id?>-<?=$typeFilter?>' style='background-color:#F1EEE9;cursor: move' title="<?=_('DRAG_FILTER')?>"><?=$fil->alias?></a>
						<div style='margin-right:-10px'>
							<span href="/app.php?go=filter/rem&idsmart=<?=$fil->id?>" class="delete-filter right yoo-icon hide" title="<?=_('DELETE_FILTER')?>" alias='<?=$fil->alias?>'><span class="ui-icon ui-icon-closethick"></span></span>
							<span href="/app.php?go=filter&idfilter=<?=$fil->id?>&type=<?=$typeFilter?>" class="boxy right yoo-icon hide" title="<?=_('EDIT_FILTER')?>" titlebox='<?=_('PARAM_FILTER')?>'><span class="ui-icon ui-icon-wrench"></span></span>
						</div>
					</li>
					<? endif;?>
				<?endforeach;?>
					<li>
						<a href="#" style="max-width: 200px"><b href='/app.php?go=filter&type=<?=$typeFilter?>' class="t boxy" style='margin-left:-10px' titlebox='<?=_('PARAM_FILTER')?>'>+ <?=_('NEW_FILTER')?></b></a>
					</li>
			</ul>
			<div class='cleared'></div>*/?>
			</div>
		</div>
	</div>
<?endif;?>