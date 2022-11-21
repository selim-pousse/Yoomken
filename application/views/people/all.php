<?php $who = $this->session->who();
	$isnearby = $this->session->isLogged() && $filters[md5('XXX'.$this->session->me()->id)]->active;
	$marginNearby = $isnearby?'0':'0';
?>
								
<?= $this->render($this->controller.'/blocks/subMenu')?>
									
<div class="art-Post" style=''>
	
	<div class="art-Post-body">
		<div  id='art-Post-inner' class='art-Post-inner' style='margin-top: <?=$marginNearby?>px;'>
	
			<div class='list-people' style="">
				
					<div class='left side-left'>
						<div id='head-people' class='' style='position: <?=($isnearby?'initial':'initial')?>;width: 100%;z-index: 99;margin-top: 0px;' >
							<?/*<?php if ($who): //border-bottom: 1px solid #EBEBEB;?>
								<h4 style="margin-left:30px;margin-top:20px;">
									<span href='/boxy/profil/<?=$who->id?>' titlebox="<?=$who->name?> ▸  Profil" title="<?=$who->name?>" style='cursor: pointer' class='left boxy'><?= $who->name;?></span>
									<span class="ui-icon ui-icon-triangle-1-e left"></span> 
									<span class='left'><?=_('NETWORK')?></span>
									<span class='side-right-who hide'>
										<span class="ui-icon ui-icon-triangle-1-e left"></span> 
										<span class='left who'></span>
									</span>
								</h4>
							<?php else :?>
								<h4 style="margin-left:30px;"><?=_('NETWORK')?></h4>
							<?php endif;?>
							 */?>
				
							<div id='wrap-map' class='<?=($isnearby)?'':'hide'?>' style="position: relative;float: left;margin-top:5px"> 
								<div id='map' style="width:100%;height: 250px;position: relative;"></div>
							</div>
						</div>
					
					<div style="margin-top:15px;float: left;width: 100%">
						<div class="isotope" id='timeline' style='font-size: 13px;padding:5px 0;opacity: 0;min-height: 30px'>
							<?if (isset($people) && count($people)>0):?>
									<?=$this->render('people/inner/displayList',array('people'=>$people));?> 
								
							<?else:?>
								<?=$this->render('layout/messages/warningBubble', array('msg'=>_('ERR_NOUSR')));?>
							<?endif;?>
						</div>
						<div class='cleared'></div>
					</div>
				</div>
				<div class='left side-right'>
					<br/>
				</div>
				<?/*<div class='left side-cache'>
					<br/>
				</div>*/?>
			</div>
			<div class='cleared'></div>
		</div>
	</div>
	
	<div class='cleared'></div>
</div>
<div  style='width: 100px;margin:0 auto;float:none'>
	<button class='fetch-more <?=($nbread<$nbtot?'':'hide')?> action button' onclick="fetchMore('USR');"> 
		<?=_('NEXT')?>&nbsp;&nbsp;>>
		<?/*beg='<?=$nbread?>' limit='<?=Registry::getInstance()->get('nbresults')?>' total='<?=$nbtot?>'>
		<span class='right'>
			<span id='nbread'><?=$nbread?></span>/
			<span id='nbtot'><?=$nbtot.' '._('DISPLAYED')?></span>
		</span>*/?>
	</button>
</div>
