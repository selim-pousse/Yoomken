<?
$who = $user;
$me = $this->session->get('user');
list($location,$idspot) = isset($who->spot->id)? array(trim(getLocation($who->spot)),$who->spot->id):array(_('SOMEWHERE'),null);
if ($idspot==null) $locset = '';
else $locset = $location.'!#!'.$idspot.'!#!'.$location;

$setdegree = isset($who->degreeset)? implode('!+!',$who->degreeset):'';
$setweb = isset($who->webset)? implode('!+!',$who->webset):'';
$setskill = isset($who->skillset)? implode('!+!',$who->skillset):'';

$isme = ($me && $me->id == $who->id);
//$thumb='';
$thumb = getPictureThumb($who->id, $who->id_img, 75,$who->email);

if ($who->shortdesc)
	$html_shortdesc = addActiveLinks(_2br($who->shortdesc));
else 
	$html_shortdesc = _('DESC_NOT_SPECIFIED');
$js_shortdesc   = _2nl($who->shortdesc);

$sql = 'SELECT * FROM currency'; $ccies = Db::read($sql);
?>				
			
		<?if ($isme || ($who->me_ == 'A' && $who->_me == 'A') ):?>
			<div class="art-sidebar1">
					<?=$this->render('user/blocks/sidebarAll-right',array('who'=>$who));?>
			</div>
		<? elseif($me):?>
				<?=$this->render('layout/messages/warningBubble', array('msg'=>_('ERR_NO_COLLABORATE').'<br/>'._('SUGEST_COLLABORATE').'.'));?>
				<br/>
		<?	else:?>
			<br/>
		<?endif;?>
		
		<div class='aboutme-block-left' style=''>
				
				<h3 class='title-block' ><?=_('WHO_I_AM')?>&nbsp;<span style="">&nbsp;</span></h3>
				<span id='profil-aboutme_label' class="label field-label big"><?=_('Description')?></span>
				<div id='profil-aboutme_fix' class='fix_content field-value big' style=""><?=($who->shortdesc?$html_shortdesc:_('NO_DATA'));?></div> 
				<?if ($isme || ($who->me_ == 'A' && $who->_me == 'A') ):?>
					<span  class="label field-label big"><?=_('Pages Web')?></span>
					<div class='fix_content field-value big' style=""><?=$who->presta->job?$who->presta->job:_('NO_DATA')?></div> 
				<? endif;?>				
			
				<? if ($who->profil!='C' && me()->profil!='N'):?>
					<div class="clear"></div>
					<br/>
					<h3 class='title-block' ><?=_('DETAIL_PRESTA')?>&nbsp;<span style="">&nbsp;</span></h3>
					<span  class="label field-label big"><?=_('JOB_PRESTA')?></span>
					<div class='fix_content field-value big' style=""><?=$who->presta->job?$who->presta->job:_('NO_DATA')?></div> 
					
					<span  class="label field-label big"><?=_('SERVICES_PRESTA')?></span>
					<div class='fix_content field-value big' style="">
						<? if(isset($who->serviceP) && count($who->serviceP) ):?>
						<ol class='services-tag' style="">
							<?foreach ($who->serviceP as $tag):?>
										<li><a class="" style='color:#685840;cursor:pointer;margin-top:3px'><?=_($tag)?></a></li>
							<?endforeach;?>
						</ol>
						<? else: echo _('NO_DATA'); endif;?>
					</div>
					<div class="cleared"></div>
					<span  class="label field-label big"><?=_('PRICE_PRESTA')?></span>
					<div class='fix_content field-value big' style=""><?=$who->presta->amont?$who->presta->amont.' '._('EUR/HOUR'):_('FREE_SERVICE')?></div> 
					
					<span  class="label field-label big">Tags</span>
					<div class='fix_content field-value big' style="">
						<? if(isset($who->skill) && count($who->skill) ):?>
						<ol class='services-tag' style="">
							<?foreach ($who->skill as $tag):?>
										<li><a class="" style='color:#685840;cursor:pointer;margin-top:3px'><?=_($tag)?></a></li>
							<?endforeach;?>
						</ol>
						<? else: echo _('NO_DATA'); endif;?>
					</div> 
					<div class="cleared"></div>
					<span  class="label field-label big"><?=_('DEGREES')?></span>
					<div class='fix_content field-value big' style="">
						<? if(isset($who->degree) && count($who->degree) ):?>
						<ol class='services-tag' style="">
							<?foreach ($who->degree as $tag):?>
									<li><a class="" style='color:#685840;cursor:pointer;margin-top:3px'><?=_($tag)?></a></li>
							<?endforeach;?>
						</ol>
						<? else: echo _('NO_DATA'); endif;?>
					</div> 
					<div class="cleared"></div>
					
					<span  class="label field-label big"><?=_('LEVEL')?></span>
					<div class='fix_content field-value big' style=""><?=$who->presta->level?gettext($who->presta->level):_('JUNIOR')?></div> 
					<span  class="label field-label big" title="<?=_('YEARS_EXPERIENCES')?>"><?=_('YEARS')?></span>
					<div class='fix_content field-value big' style=""><?=$who->presta->yearsexp?$who->presta->yearsexp:'0'?></div> 			
					
					<div class="clear"></div>
					<br/>
					<h3 class='title-block' ><?=_('CALENDAR')?>&nbsp;<span style="">&nbsp;</span> 
						<div class='right' style='width:200px'>
							<div class="left" style="line-height: 20px">(&nbsp;</div>
							<div style="color: #685840;font-style: italic">
								<div class="left" style='font-style: normal;border: 1px solid #685840;height: 15px;width: 15px;text-align: center;line-height: 15px' >✘</div> <div class="left" style="line-height: 20px">&nbsp;<?=_('Indisponible')?> &nbsp;&nbsp;&nbsp;</div>
								<div class="ui-selected left" style='font-style: normal;border: 1px solid #685840;background: #C3E83B; height: 15px;width: 15px;text-align: center;line-height: 15px' >✔</div> <div class="left" style="line-height: 20px">&nbsp; <?=_('Disponible')?> )</div>
							</div>
							<div class="left"></div>
						</div>
					</h3>			
					<span class="label field-label big" ><?=_('AVAILABLE_FROM_DATE')?></span>
					<div class='fix_content field-value big' style=""><?=$who->presta->datedispo?></div> 
					
					<div class="clear"></div>
					
					<div id='his-profil-calendar' >
						<div class='head-hours'>
							<div class='hour'>00h</div>
							<div class='hour'>07h</div>
							<div class='hour'>08h</div>
							<div class='hour'>09h</div>
							<div class='hour'>10h</div>
							<div class='hour'>11h</div>
							<div class='hour'>12h</div>
							<div class='hour'>13h</div>
							<div class='hour'>14h</div>
							<div class='hour'>15h</div>
							<div class='hour'>16h</div>
							<div class='hour'>17h</div>
							<div class='hour'>18h</div>
							<div class='hour'>19h</div>
							<div class='hour'>20h</div>
							<div class='hour'>22h</div>
							<div class='hour'>00h</div>
						</div>
						<div class='cleared'></div>
						<div class='head-days left'>
							<div class='day'><?=_('Monday')?></div>
							<div class='day'><?=_('Tuesday')?></div>
							<div class='day'><?=_('Wednesday')?></div>
							<div class='day'><?=_('Thursday')?></div>
							<div class='day'><?=_('Friday')?></div>
							<div class='day'><?=_('Saturday')?></div>
							<div class='day'><?=_('Sunday')?></div>
						</div>
						<div class="calendar-wrap left" style='width: 460px;margin:0 0 25px 10px;'>
							<input id='-calendar-result' type='hidden' name='calendar' value='<?=$who->presta->calendar?>'/>
							<ul id="his-selectable" class='calendar ui-corner-all'>
								<?  foreach( explode(',',$who->presta->calendar) as $day) {
									for ($i=0;$i<strlen($day);$i++){
										?>
											<li class="ui-state-default <?=$day[$i]?'ui-selected':''?> ui-selectee"></li>
										<?	
									}
								}
								?>
							</ul>
						</div>
					</div>
					<div class="clear"></div>
					<br/>
				<? endif;?>
				<? if ($who->profil!='P' && me()->profil!='N'):?>
				
					<h3 class='title-block' ><?=_('DETAIL_CUSTO')?></h3>
					<?/*<span  class="label field-label big"><?=_('JOB_CUSTO')?></span>
					<div class='fix_content field-value big' style=""><?=$who->custo->job?$who->custo->job:_('NO_DATA')?></div> */?>
					
					<span  class="label field-label big"><?=_('SERVICES_CUSTO')?></span>
					<div class='fix_content field-value big' style="">
						<? if(isset($who->serviceC) && count($who->serviceC) ):?>
						<ol class='services-tag' style="">
							<?foreach ($who->serviceC as $tag):?>
									<li><a class="" style='color:#685840;cursor:pointer;margin-top:3px'><?=gettext($tag)?></a></li>
							<?endforeach;?>
						</ol>
						<? else: echo _('NO_DATA'); endif;?>
					</div> 
					<div class="cleared"></div>
					<?/*<span  class="label field-label big"><?=_('PRICE_CUSTO')?></span>
					<div class='fix_content field-value big' style=""><?=isset($who->custo->amont) && $who->custo->amont? getCurrency(who()).' '._('HOUR'):_('FREE_SERVICE')?></div> */?>
					
				<? endif;?>
			
				<div class='clear'></div>
	</div>
	
			