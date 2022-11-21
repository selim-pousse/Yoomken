<?php 
$me	= $this->session->me();
$who = $this->session->who();
if ($me && $who)
{
	$isowner = $me && $me->id == $who->id;
}
else if ($me && !$who) $isowner = true;
else $isowner = false;
?>

<?= $this->render( ($journal=='WALL'?'/people':$this->controller).'/blocks/subMenu')?>
						
<div class="art-Post" style=''>
	<div class="art-Post-body" >
		<div class='side-left left'>
			<div class="art-sidebar1">
				
			</div>
			
			<?/*<?php if (!$who):?>
				<h4 style='margin-left:20px;padding-top:10px'> <?=_('TIMELINE')?></h4>

			<?php else:?>
				<h4 style="margin-left:20px;padding-top:10px">
					<span class='left'><?= $who->name;?></span>
					<span class="ui-icon ui-icon-triangle-1-e left"></span> 
					<span class='left'><?=_('TIMELINE')?></span>
					<? if ($typeJournal!='ALL'):?>
						<span class="ui-icon ui-icon-triangle-1-e left"></span>
						<span class='left'><?=($typeJournal=='WALL'?_('WALL'):($typeJournal=='OF'?_('OFFER'):($typeJournal=='AV'?_('CRITIQUE'):_('SCOOP'))).'s')?></span>
					<?endif;?>
				</h4>
			<?php endif;?>*/?>
			
			<div class='wrap-flow'>
				<?if($this->session->isLogged() && ( (ishim() && $journal=='WALL' && who()->_me)) ): // only the following can post on my wall?>	 	
					<?=$this->render('content/blocks/sharebox',array('me'=>$me));?>
				<?endif;?>
				
				<br/>
				
				<div id='timeline' class="art-Post-inner left isotope" style='font-size: 13px;padding:5px 0;width:101%;opacity: 0;min-height: 30px'>
					<?if (count($activities)>0):
						echo $this->render('content/inner/displayDash',array('activities'=>$activities));
					else:
						echo $this->render('layout/messages/warningBubble', array('msg'=>_('ERR_NOACT')));
					endif;?>
				</div>
				<div class='cleared'></div>
				<div  style='width: 100px;margin:0 auto;float:none'>
					<button class='fetch-more <?=($nbread<$nbtot?'':'hide')?> action button' onclick="fetchMore('ACT',undefined,10,<?=$nbread?>);" >
						<?=_('NEXT')?>&nbsp;&nbsp;>>
						<?/*<span class='right'><span id='nbread'><?=$nbread?></span>/<?=$nbtot.' '._('DISPLAYED')?></span>*/?>
					</button>
				</div>
				
			</div>
	
		</div>
		<div id='art-Post-inner' class="art-Post-inner side-right left">
			<br/>
		</div>
		<?/*<div class='left side-cache'>
					<br/>
				</div>*/?>
	</div>	
</div>

