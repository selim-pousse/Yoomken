<?php 
$who = $this->session->who();
$me = $this->session->me();
if (is_object($me) && $who)
{
	$isowner = ($me->id == $who->id);
}
else if ($me && !$who) $isowner = true;
else $isowner = false;
?>

<div class="art-nav">
	<?php //<div style='display: block;float: left;height: 10px;width: 140px;'></div>?>
	 <ul class="art-menu">
	 	<li class='yoomken'>
			<a href="/" class="logo">
				<div style=""></div>
			</a>
			<b style="opacity: 0.9;margin-left: -32px;margin-top: 24px;color: #FFB53E;float: left;font-size: 9px;">BETA</b>
		</li>
		
		
		<?if ($this->controller!="home"):?>	
		
			<?php if($this->session->isLogged()):
				$isdash = (isset($journal) && $journal!='WALL' && in_array($this->controller,array('content')));
				?>
				<li class=' <?=$isdash?'active':''?>'>
					<a href="/<?=(me()?me()->url.'/timeline/init':'timeline')?>" class="">
						<span class="t"><?=_('DISCOVER')?></span>
					</a>
				</li>
			
		
			
			
				<? if ($this->session->isLogged() && !$isowner):?>
				<li class=''>
					<a href="/<?=($me && !$isowner?$me->url.'/relations/init':'/network')?>" class="">
						<span class="t"><?=_('MY_SPACE')?></span>
					</a>
				</li>
				<?endif;?>
			
			
				<? if (who()): 
				$isdash = ( in_array($this->controller,array('people','user','message')) || ($this->action=='index' && $this->controller='badge') );
				?>
					<li class=' <?=$isdash || ($this->controller=='content'  &&  $journal=='WALL') ?'active':''?>'>
						<a href="/<?=(me()?who()->url.'/relations/init':who()->url.'/about')?>" class="">
							<span class="t"><?=(!$who || ($who && $isowner)?_('MY_SPACE'):$who->shortname)?></span>
						</a>
					</li>
				<?endif;?>
			
				<li class=' <?= ($this->controller=='badge' && $this->action!='index') ?'active':''?>'>
					<a href="/badges/personalities">
					<span class="t">Badges</span>
					</a>
				</li>
			
				<li class=' <?=$this->controller=='invite'?'active':''?>'>
					<a href="/invite">
					<span class="t"><?=_('Invite')?></span>
					</a>
				</li>
				
				<li class=' <?=$this->controller=='advice'?'active':''?>'>
					<a href="/advice/aboutus">
					<span class="t"><?=_('ABOUT_US')?></span>
					</a>
				</li>
				
				
			<?php endif;?>	
			
			<? if (0 && $this->session->isLogged()): ?>
			<li class='ui-corner-top'>
				<a href="/forum" class="">
					<span class="t">Forum</span>
				</a>
			</li>	
			<?endif;?>
		<? endif;?>
		
		<li style='float:right;margin-right:0px'>
	              <?=$this->render('layout/module/connection');?>
		</li>
	</ul>
</div>
