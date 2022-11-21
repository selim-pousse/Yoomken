<?
$me = $this->session->get('user');
list($location,$idspot) = isset($who->spot->id)? array(trim(getLocation($who->spot)),$who->spot->id):array(_('SOMEWHERE'),null);
if ($idspot==null) $locset = '';
else $locset = $location.'!#!'.$idspot.'!#!'.$location;

$setdegree = isset($who->degreeset)? implode('!+!',$who->degreeset):'';
$setweb = isset($who->webset)? implode('!+!',$who->webset):'';
$setskill = isset($who->skillset)? implode('!+!',$who->skillset):'';

$isme = ($me->id == $who->id);
//$thumb='';
$thumb = getPictureThumb($who->id, $who->id_img, 75,$who->email);
$hd = $change?'my':'his';

if ($who->shortdesc)
	$html_shortdesc = addActiveLinks(_2br($who->shortdesc));
else 
	$html_shortdesc = _('DESC_NOT_SPECIFIED');
$js_shortdesc   = _2nl($who->shortdesc);

$sql = 'SELECT * FROM currency'; $ccies = Db::read($sql);
?>
<script>
	function aciveOngletProfil(that)
	{
		$(that).parent().parent().find('li').removeClass('profil-tab-active');
		$(that).parent().addClass('profil-tab-active').trigger('click');
	}
</script>
	<div class='<?=$change?" page-profil":""?>' id='<?=$hd?>-profil' style='font-size: 13px'>
	
	<?/*if ($change):?>
	<table class='tb-transborder'>
		<tr>
			<td class='tl-transborder'></td><td class='tm-transborder'></td><td class='tr-transborder'></td>
		</tr>
		<tr>
			<td class='ml-transborder'></td><td class='art-profil bg-block-soft'>
	<?endif;*/?>
		<? if($change || isset($forceTitleProfil)):?>
			<h3 style=''>
				<span>&nbsp;</span>
				<span class=''><?=getTitleStatus($who).' '.$who->name;?></span><span class=''>&nbsp;▸&nbsp;<?= _('PROFIL')?></span>
			</h3>
		<? endif;?>
					
		<? if($change):?>
		<div id="myprofilupload" class='' style='z-index:-1;position:absolute;left:-200px;top:50px;width:150%;height: 100%'></div>
		<form id="profil-form" action="/user/save" method="post" <?//style='margin:auto;width:650px;'?>>
		<?php else:?>
		<div style='margin:auto;width:650px;'>
		<? endif;?>
			
			
			<div class="cleared"></div>
			<div class="profil-tabs" style='min-height:200px;'>
				
				<ul class="ui-filter-fix" style='margin: 10px 0px 15px 0px;' >
					<li class="<?=$hd=='my'?'profil-tab-active':''?>"><a  href='#<?=$hd?>tabs-1' onclick="aciveOngletProfil($(this))"><?=_('WHO_I_AM')?></a></li>
					
					<li class=""><a  href="#<?=$hd?>tabs-4" onclick="aciveOngletProfil($(this))"><?=_('COORDONNEES')?></a></li>
					<? if ($who->profil!='P'):?>
					<li class="" ><a  href='#<?=$hd?>tabs-3' onclick="aciveOngletProfil($(this))"><?=(me()->profil=='N'?_('SERVICES_SUIVIS'):_('DETAIL_CUSTO'))?></a></li>
					<? endif;?>
					<? if ($who->profil!='C' && me()->profil!='N'):?>
					<li class="" ><a  href='#<?=$hd?>tabs-2' onclick="aciveOngletProfil($(this))"><?=_('DETAIL_PRESTA')?></a></li>
					<li class="" ><a  href='#<?=$hd?>tabs-5' onclick="aciveOngletProfil($(this))"><?=_('CALENDAR')?></a></li>
					<? endif;?>
					
				</ul>
				
				<div id="<?=$hd?>tabs-1" style="" class='content-tab <?=$hd?>tabs <?=$hd!='my'?'':'hide'?>'>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td style='width: 170px;margin :4px 0;' class="label"><?=_('IDENTITY')?></td>
							<td>
								<div class="left" style="width:60px;margin-left:-100px;">
								 	<span id='<?=$hd?>profil-pseudo_label' class='label' style='margin :4px 0;line-height: 20px;text-align: right; width: 90px;'><?=_('PSEUDO')?></span>
								 	<span id='<?=$hd?>profil-fullname_label' class='label' style='margin :4px 0;line-height: 20px;text-align: right; width: 90px;'><?=_('FULLNAME')?></span>
								 	<span id='<?=$hd?>profil-birth_label' class='label' style='margin :4px 0;line-height: 20px;text-align: right; width: 90px;'><?=_('AGE')?></span>
								 	<span id='<?=$hd?>profil-privacy_label' class='label' style='margin :4px 0;line-height: 20px;text-align: right; width: 90px;'><?=_('GENDER')?></span>
								</div>
								<div class="left" style="width:340px;">
										<div id='<?=$hd?>profil-pseudo' class='content <?=$change?'edit':''?>' style=''>
											<div tabindex='<?=$change?'510':''?>' id='<?=$hd?>profil-pseudo_fix' class='fix_content <?=$change?'focusin':''?>' style="margin :4px 0;width:300px;line-height: 20px;"><?=$who->url?></div>
									  		<? if($change):?>
									  		<input  tabindex='511' id='<?=$hd?>profil-pseudo_input' class="content_input styledinput hide _input" name="pseudo" style="width:300px" title='<?=_('LABEL_PSEUDO')?>' value="<?=$who->url?>"/>
											<div id='<?=$hd?>profil-pseudo_box' class='hide postBox' style='margin-left:-10px;float:right'>
												<span class="yoo-icon right" title="éditer le champ">
													<span class="ui-icon ui-icon-pencil"></span>
												</span>
											</div>
											<? endif;?>
										</div>
										<div id='<?=$hd?>profil-fullname' class='content <?=$change?'edit':''?>' style=''>
											<div tabindex='<?=$change?'512':''?>' id='<?=$hd?>profil-fullname_fix' class='fix_content <?=$change?'focusin':''?>' style="margin :4px 0;width:300px;line-height: 20px;"><?=$who->fullname?></div>
									  		<? if($change):?>
									  		<input tabindex='513' id='<?=$hd?>profil-fullname_input' class="content_input styledinput hide _input" name="fullname" style="width:300px"  title='<?=_('FULLNAME')?>' value="<?=$who->fullname?>"/>
											<div id='<?=$hd?>profil-fullname_box' class='hide postBox' style='margin-left:-10px;float:right'>
												<span class="yoo-icon right" title="éditer le champ">
													<span class="ui-icon ui-icon-pencil"></span>
												</span>
											</div>
											<? endif;?>
										</div>
										<div id='<?=$hd?>profil-birth' class='content <?=$change?'edit':''?>' style=''>
											<div tabindex='<?=$change?'514':''?>' id='<?=$hd?>profil-birth_fix' class='fix_content <?=$change?'focusin':''?>' style='margin :4px 0;line-height: 20px;width:300px;'><?=$who->age?$who->age:_('NO_DATA')?></div>
									  		<? if($change):?>
									  		<input tabindex='515' id='<?=$hd?>profil-birth_input' class="content_input styledinput hide date _input" name="birth" style="width:300px;float:left;"  title='<?=_('BIRTHDATE')?>' value="<?=$who->birthdate?>"/>
									 		<div id='<?=$hd?>profil-birth_box' class='hide postBox' style='margin-left:-10px;float:right'>
												<span class="yoo-icon right" title="éditer le champ">
													<span class="ui-icon ui-icon-pencil"></span>
												</span>
											</div>
											<? endif;?>
										</div>
										
										<div id='<?=$hd?>profil-gender' class='content <?=$change?'edit':''?>' style=''>
											<div tabindex='<?=$change?'516':''?>' id='<?=$hd?>profil-gender_fix' class='fix_content <?=$change?'focusin':''?>' style="margin :4px 0;width:300px;line-height: 20px;">
												<?=($who->gender && $who->gender=='F'?_('WOMAN'):_('MAN'));?>
											</div>
											<? if($change):?>
											<select tabindex='517' id='<?=$hd?>profil-gender_input' class="content_input styledselect hide _input gender" name="gender" style="width:300px;float:left;"  title='Gender'>
												<option <?php if($who->gender && $who->gender == 'M') echo 'selected'?> value="M"><?=_('MAN')?></option>
												<option <?php if($who->gender && $who->gender == 'F') echo 'selected'?> value="F"><?=_('WOMAN')?></option>
											</select>
											<div id='<?=$hd?>profil-gender_box' class='hide postBox' style='margin-left:-10px;float:right'>
												<span class="yoo-icon right" title="éditer le champ">
													<span class="ui-icon ui-icon-pencil"></span>
												</span>
											</div>
											<? endif;?>
										</div>
								</div>
								 <div class="left profil-img" style='margin-left:25px;margin-right:-5px' onmouseover="/*$('#profilupload-button').fadeIn('slow')*/" >
										<input id='<?=$hd?>profilupload-hidden' type='hidden' name='thumb' value=''/>
                                  		<img id='<?=$hd?>profilupload-img' class="art-article <?=$hd?>profilupload-img photo" src="<?=$thumb?>" alt="Profile/Logo"/>
                                  		<? if($change):?>
								 			<div class='my-upload-button hide' style='cursor: pointer;' onclick="$('#myprofilupload input[name=file]').click()"><?=_('UPLOAD')?></div>
										<? endif;?>
								 </div>
							</td>
						</tr>
						<? if($change):?>
						<tr>
							<td></td>
							<td>
								<div id='<?=$hd?>profil-privacy' class='content' style=''>							 			
									<div class='fix_content focusin' style='margin :4px 0;line-height: 20px;float:left;'>
										<input style='margin: 5px' class='left' id='chk-privacy_input' type='checkbox' name='privacy' <?=($who->privacy=='P'?'checked="checked"':'')?>/> 
										<label class='left' style=''  for="chk-privacy_input"><?=_('LABEL_PRIVACY')?></label>
									</div>
								</div>
							</td>
						</tr>
						<? endif;?>
						<tr><td><br></td></tr>
						<tr>
							<td id='<?=$hd?>profil-aboutme_label' class="label"><?=_('ABOUT_ME')?></td>
							<td>
								<div id='<?=$hd?>profil-aboutme' class='content <?=$change?'edit':''?>' style='overflow-y: auto;max-height: 250px;width: 500px;'>
									<div tabindex='<?=$change?'518':''?>' id='<?=$hd?>profil-aboutme_fix' class='fix_content <?=$change?'focusin':''?>' style="overflow:hidden; width:480px;min-height: 250px;"><?=($who->shortdesc?$html_shortdesc:_('NO_DATA'));?></div>
							  		<? if($change):?>
							  		<textarea tabindex='519' class="textarea hide content_input"  name="shortdesc" id='<?=$hd?>profil-aboutme_input' prev='' style='height: 225px;width: 465px;'><?=$js_shortdesc?></textarea>
							  		<div id='<?=$hd?>profil-aboutme_box' class='hide postBox' style='margin-left:7px;float:left'>
										<span class="yoo-icon right" title="éditer le champ" style="margin-right: -60px; ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span>
									</div>
									<? endif;?>
								</div>
							</td>
						</tr>
						
					</table>
				</div>
				<? if ($who->profil!='C' && me()->profil!='N'):?>
				<div id='<?=$hd?>tabs-5' style="" class='content-tab <?=$hd?>tabs hide'>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<?/*<td id='<?=$hd?>profil-calendar_label' class="label"><span style='margin:5px 0;line-height: 30px;'><?=_('CALENDAR')?></span></td>
							*/?>
							
						</tr>
						<tr>
							<td>
								<div  style="height: 50px;">
									
									<div class="label" style="width: 100%;">
										<? if ($hd=='his'):?>
											<h7><?=_('CALENDAR_OF_AVAILIBILITY')?> : </h7> 
										<? else:?>
										 	<?=_('INFORM_YOUR_AVAILIBILITY')?>:
										<? endif;?>
									</div>
									<div class="cleared"></div>
									<div class="left">(&nbsp;</div>
									<div style="color: #685840;width: 100%;font-style: italic">
										<div class="ui-state-default left" style='font-style: normal;border-top: 1px solid #685840 !important;height: 15px;width: 15px;text-align: center' >✘</div> <div class="left">&nbsp; <?=_('Indisponible')?> &nbsp;&nbsp;&nbsp;</div>
										<div class="ui-state-default ui-selected left" style='font-style: normal;border-top: 1px solid #685840 !important;background: #C3E83B; height: 15px;width: 15px;text-align: center' >✔</div> <div class="left">&nbsp; <?=_('Disponible')?>&nbsp;&nbsp;&nbsp;</div>
										<? if ($hd!='his'):?>
											<div class='left'> - &nbsp;&nbsp;<?=_('INFO_CALENDAR_SELECT_GROUP')?></div>
										<? endif;?>
									</div>
									<div class="left">)</div>
								</div>
								
								
							
								<div id='<?=$hd?>profil-calendar' >
									<div class='head-hours' style="">
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
										<input id='<?=$hd?>-calendar-result' type='hidden' name='calendar' value='<?=$who->presta->calendar?>'/>
										<ul id="<?=$hd?>-selectable" class='calendar ui-corner-all'>
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
								
								
								<div class="cleared"></div>
								
								<div class="label" style="text-align: right;width: 140px;padding: 3px 10px 0 0;height: 50px;"><span><?=_('AVAILABLE_FROM_DATE')?></span></div>
								
								<div id='<?=$hd?>profil-datedispo' class='content <?=$change?'edit':''?>'>
									<div tabindex='<?=$change?'491':''?>' id='<?=$hd?>profil-datedispo_fix' class='fix_content <?=$change?'focusin':''?>' style="width:115px;line-height: 26px;height:26px;"><?=$who->presta->datedispo?></div>
							  		<? if($change):?>
							  		<input  tabindex='492' id='<?=$hd?>profil-datedispo_input' date='true' class="content_input styledinput date hide _input" name="datedispo" style="width:100px"  title='Date de disponibilité' value="<?=$who->presta->datedispo?>" onfocus=""/>
									<div id='<?=$hd?>profil-datedispo_box' class='hide postBox' style='margin-right:-70px;float:right'>
										<span class="yoo-icon right" title="éditer le champ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span>
									</div>
									<? endif;?>
								</div>
							</td>
							
						</tr>
					</table>
				</div>
				<div id='<?=$hd?>tabs-2' style="" class='content-tab <?=$hd?>tabs hide'>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<?/*<tr>
							<td id='<?=$hd?>profil-job_label' class="label"><span style='margin:5px 0;line-height: 30px;'><?=_('JOB_PRESTA')?></span></td>
							<td>
								<div id='<?=$hd?>profil-job' class='content <?=$change?'edit':''?>' style='width:445px;'>
									<div tabindex='<?=$change?'410':''?>' id='<?=$hd?>profil-job_fix' class='fix_content <?=$change?'focusin':''?>' style="overflow: hidden;width:445px;line-height: 26px;height: 26px"><?=$who->presta->job?$who->presta->job:_('NO_DATA')?></div>
							  		<? if($change):?>
							  		<input tabindex='411' class="hide content_input _input"  name="job" id='<?=$hd?>profil-job_input' style='width:255px' value='<?=$who->presta->job?>'/>
							  		<div id='<?=$hd?>profil-job_box' class='hide postBox' style='margin-left:47px;float:left'>
										<span class="yoo-icon right" title="éditer le champ" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span>
									</div>
									<? endif;?>
								</div>
							</td>
						</tr>*/?>
						<tr>
							<td class="label" id='<?=$hd?>profil-serv_label' style="width:225px"><label for="servhide"><?=_('SERVICES_PRESTA')?></label></td>
							<td>
								<div id='<?=$hd?>profil-serv' class='content <?=$change?'edit':''?>' style='width:445px;'>
									<div tabindex="<?=$change?'412':''?>" id='<?=$hd?>profil-serv_fix' class='fix_tag <?=$change?'focusin':''?>' style='float:left;width:445px;min-height:26px'>
										<?if (isset($who->serviceP)) foreach ($who->serviceP as $tag):?>
											<a class="textboxlist-bit textboxlist-bit-box" style='text-decoration: none;color:#685840;cursor:pointer'><?=gettext($tag)?></a>
										<?endforeach;?>
									</div>
									<? if($change):?>
									<div id='<?=$hd?>profil-serv_box' class='hide postBox' style='margin-left:60px;float:left'>
										<span class="yoo-icon right" title="éditer le champ" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span>
									</div>
									<? endif;?>
								</div>
								<? if($change):?>
								<div class='setinput hide serviceinp _input' id='<?=$hd?>profil-serv_input'>
									<div class='focusout' tabindex='413' next='412'></div>
									<div tabindex="414" class='service' id='<?=$hd?>profil-serv_service'>
										<input id='<?=$hd?>profil-serv_hidden' class='hide' type='text' value='' name='servhide'/>
									</div>
									<div class='focusout' tabindex='415' next='420'></div>
								</div>
								<? endif;?>
							</td>
						</tr>
						<tr>
							<td id='<?=$hd?>profil-price_label' class="label"><div style='margin:5px 0;line-height: 30px;'><?=_('PRICE_PRESTA')?></div></td>
							<td>
								<div id="<?=$hd?>profil-price" class='content setinput <?=$change?'edit':''?>' style='width:445px;'>
									<div tabindex="<?=$change?'420':''?>" id='<?=$hd?>profil-price_fix' class='fix_content <?=$change?'focusin':''?>' style="width:445px;line-height: 26px;height: 26px"><?=$who->presta->amont?$who->presta->amont.' '._('EUR/HOUR'):_('FREE_SERVICE')?></div>
							  		<? if($change):?>
							  			<div class='focusout' tabindex='1040' next='<?=$hd?>profil-serv'></div>
								  		<div tabindex='1041' class='hide blurinput price _input' id='<?=$hd?>profil-price_input'>
									  		<div class='focusout' tabindex='421' next='<?=$hd?>profil-serv'></div>
									  		<input class="blurinput styledinput <?=(isset($who->presta->amont) && !$who->presta->amont?"disabled":'')?>" tabindex='422' name="amont" id='<?=$hd?>profil-price_amont' style='width:105px;' value='<?=isset($who->presta->amont) && $who->presta->amont? $who->presta->amont:'0'?>' <?=isset($who->presta->amont) && !$who->presta->amont?"disabled='disabled'":''?>/>
									  		<? /*<select  id='<?=$hd?>profil-price_ccy' tabindex='463' class="blurinput styledselect" name="currency" style="width:55px;"  title='currency' <?=isset($who->presta->amont) && !$who->presta->amont?"disabled='disabled'":''?>>
												<? foreach ($ccies as $key => $curr) :?>
													<option <? if(isset($who->presta->currency) && $who->presta->currency == $curr['unity_ccy']) echo 'selected'?> value="<?=$curr['unity_ccy']?>"><?=$curr['unity_ccy']?></option>
												<? endforeach;?>
											</select> */
											?>
											<input type='hidden' name='currency' value='<?=getCurrency(me())?> / <?=_('HOUR')?>'/>
											<?=getCurrency(me())?> / <?=_('HOUR')?>
											<input type='hidden' name='frequency' value='H'/>
									  		<? /*<select  tabindex='464' id='<?=$hd?>profil-price_freq' class="blurinput styledselect" name="level" style="width:65px;"  title='frequency' <?=isset($who->presta->amont) && !$who->presta->amont?"disabled='disabled'":''?>>
												<option <? if(isset($who->presta->frequency) && $who->presta->frequency == '-') echo 'selected'?> value="-">-</option>
												<option <? if(isset($who->presta->frequency) && $who->presta->frequency == 'D') echo 'selected'?> value="D"><?=_('DAY')?></option>
												<option <? if(isset($who->presta->frequency) && $who->presta->frequency == 'H') echo 'selected'?> value="H"><?=_('HOUR')?></option>
											</select>
											 */ ?>
											<input tabindex='425' type='checkbox' class='blurinput costfree' name="free" id='<?=$hd?>profil-price_free'   <?=isset($who->presta->amont) && !$who->presta->amont?"checked='checked'":''?> style='margin-left:30px' />
											<label class='blurinput' for="<?=$hd?>profil-price_free"><?=_('FREE_SERVICE')?></label>
											<div tabindex='426' class='focusout' next='430'></div>
										</div>
										<div tabindex='1042' class='focusout' next='<?=$hd?>profil-serv'></div>
								  		<div id='<?=$hd?>profil-price_box' class='hide postBox' style='margin-left:47px;float:left'>
											<span class="yoo-icon right" title="éditer le champ" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">
												<span class="ui-icon ui-icon-pencil"></span>
											</span>
										</div>
									<? endif;?>
								</div>
							</td>
						</tr>
						<tr>
							<td class="label" style='lin-height: 10px;margin:5px 0'><?=_('EXPERIENCES')?></td>
							<td>
								<div class="left" style="width:60px;margin-left:-90px;">
								 	<span id='<?=$hd?>profil-skill_label' class='label' style='line-height: 30px;text-align: right; width: 80px;'>Tags</span>
								</div>
								<div class="left" style="width:445px">
									<div id='<?=$hd?>profil-skill' class='content <?=$change?'edit':''?>' style='width:445px;'>
										<div tabindex='<?=$change?'430':''?>' id='<?=$hd?>profil-skill_fix' class='fix_tag <?=$change?'focusin':''?>' style='float:left;width:445px;margin-top: 6px;'>
											<?if (isset($who->skill)) foreach ($who->skill as $tag):?>
												<a class="textboxlist-bit textboxlist-bit-box" style='text-decoration: none;color:#685840;cursor:pointer'><?=$tag?></a>
											<?endforeach;?>
											<? if (count($who->skill)==0) echo _('NO_DATA');?>
										</div>
										<? if($change):?>
										<div tabindex='431' class='hide input_bulle _input' id='<?=$hd?>profil-skill_input' prev='420' next='440'>
											<input  id='<?=$hd?>profil-skill_input2' bulle="true" class="input-tags styledinput" name="skill" style="width:255px"  title="Compétances" value="<?=$setskill?>"/>
										</div>
										<div id='<?=$hd?>profil-skill_box' class='hide postBox' style='margin-left:60px;float:left'>
											<span class="yoo-icon right" title="éditer le champ">
												<span class="ui-icon ui-icon-pencil"></span>
											</span>
										</div>
										<? endif;?>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="label" style='lin-height: 10px;'><div style='margin:10px'></div></td>
							<td>
								<div class="left" style="width:60px;margin-left:-90px;">
									<span class='label' style='line-height: 30px;text-align: right; width: 80px;'><?=_('DEGREES')?></span>
								</div>
								<div class="left" style="width:445px;">
									<div id='<?=$hd?>profil-degree' class='content <?=$change?'edit':''?>' style='width:445px;'>
										<div tabindex='<?=$change?'440':''?>' id='<?=$hd?>profil-degree_fix' class='fix_tag <?=$change?'focusin':''?>' style='float:left;width:445px;margin-top: 6px;'>
											<?if (isset($who->degree)) foreach ($who->degree as $tag):?>
												<a class="textboxlist-bit textboxlist-bit-box" style='text-decoration: none;color:#685840;cursor:pointer'><?=$tag?></a>
											<?endforeach;?>
											<? if (count($who->degree)==0) echo _('NO_DATA');?>
										</div>
										<? if($change):?>
										<div tabindex='441' class='hide input_bulle _input' id='<?=$hd?>profil-degree_input' prev='430' next='450'>
											<input  id='<?=$hd?>profil-degree_input2' bulle="true" class="input-tags content_input" name="degree" style="width:255px" title="Diplomes et études" value="<?=$setdegree?>"/>
										</div>
										<div id='<?=$hd?>profil-degree_box' class='hide postBox' style='margin-left:60px;float:left'>
											<span class="yoo-icon right" title="éditer le champ">
												<span class="ui-icon ui-icon-pencil"></span>
											</span> 
										</div>
										<? endif;?>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td id='<?=$hd?>profil-level_label' class="label" style='margin:5px 0'></td>
							<td>
								<div class="left" style="width:60px;margin-left:-90px;">
								 	<span class='label' style='line-height: 30px;text-align: right; width: 80px;'><?=_('LEVEL')?></span>
								</div>
								<div class="left" style="width:445px;height:30px;line-height: 30px;">
									<div id='<?=$hd?>profil-level' class='content <?=$change?'edit':''?>' style='width:445px;height: 30px'>
										<div tabindex='<?=$change?'450':''?>' id='<?=$hd?>profil-level_fix' class='fix_content <?=$change?'focusin':''?>' style="width:445px;line-height: 26px;height: 26px"><?=$who->presta->level?gettext($who->presta->level):_('JUNIOR')?></div>
										<? if($change):?>
										<select tabindex='451' prev='440' next='460' id='<?=$hd?>profil-level_input' class="content_input styledselect hide _input level" name="level" style="width:260px;"  title='Votre niveau' >
											<option <?php if($who->presta->level && gettext($who->presta->level) == _('JUNIOR')) echo 'selected'?> value="JUNIOR"><?=_('JUNIOR')?></option>
											<option <?php if($who->presta->level && gettext($who->presta->level) == _('INTERMEDIATE')) echo 'selected'?> value="INTERMEDIATE"><?=_('INTERMEDIATE')?></option>
											<option <?php if($who->presta->level && gettext($who->presta->level) == _('EXPERT')) echo 'selected'?> value="EXPERT"><?=_('EXPERT')?></option>
										</select>
										<div id='<?=$hd?>profil-level_box' class='hide postBox' style='margin-left:47px;float:left'>
											<span class="yoo-icon right" title="éditer le champ">
												<span class="ui-icon ui-icon-pencil"></span>
											</span>
										</div>
										<? endif;?>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td id='<?=$hd?>profil-yearsexp_label' class="label" style='lin-height: 10px;'><div style='margin:10px'></div></td>
							<td>
								<div class="left" style="width:60px;margin-left:-90px;">
									<span class='label' style='line-height: 30px;text-align: right; width: 80px;' title="<?=_('YEARS_EXPERIENCES')?>"><?=_('YEARS')?></span>
								</div>
								<div class="left" style="width:445px;">
									<div id='<?=$hd?>profil-yearsexp' class='content <?=$change?'edit':''?>' style='width:445px;'>
										<div tabindex='<?=$change?'460':''?>' id='<?=$hd?>profil-yearsexp_fix' class='fix_content <?=$change?'focusin':''?>' style="width:445px;line-height: 30px;height: 26px"><?=$who->presta->yearsexp?></div>
								  		<? if($change):?>
								  		<input tabindex='461' prev='450' next='520' id='<?=$hd?>profil-yearsexp_input' class="content_input styledinput hide _input" name="yearsexp" style="width:255px"  title="Nombre d'années d'expériences" value="<?=$who->presta->yearsexp?>"/>
										<div id='<?=$hd?>profil-yearsexp_box' class='hide postBox' style='margin-left:47px;float:left'>
											<span class="yoo-icon right" title="éditer le champ">
												<span class="ui-icon ui-icon-pencil"></span>
											</span> 
										</div>
										<? endif;?>
									</div>
								</div>
							</td>
						</tr>
						
						
						
					</table>
				</div>
				<? endif;?>
				<? if ($who->profil!='P'):?>
				<div id='<?=$hd?>tabs-3' style="" class='content-tab <?=$hd?>tabs hide'>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<?/*<tr>
							<td id='<?=$hd?>profil-job-c_label' class="label"><div style='margin:5px 0;line-height: 30px;'><?=_('JOB_CUSTO')?></div></td>
							<td>
								<div id='<?=$hd?>profil-job-c' class='content <?=$change?'edit':''?>' style='width:445px;'>
									<div tabindex="<?=$change?'311':''?>"  id='<?=$hd?>profil-job-c_fix' class='fix_content <?=$change?'focusin':''?>' style="width:445px;line-height: 26px;height: 26px"><?=$who->custo->job?$who->custo->job:_('NO_DATA')?></div>
							  		<? if($change):?>
							  		<input tabindex='313' class="hide content_input _input"  name="job_c" id='<?=$hd?>profil-job-c_input' style='width:255px' value="<?=$who->custo->job?>"/>
							  		
							  		<div id='<?=$hd?>profil-job-c_box' class='hide postBox' style='margin-left:47px;float:left'>
										<span class="yoo-icon right" title="éditer le champ" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span>
									</div>
									<? endif;?>
								</div>
							</td>
						</tr>
						<tr>
							<td id='<?=$hd?>profil-price-c_label' class="label"><div style='margin:5px 0;line-height: 30px;'><?=_('PRICE_CUSTO')?></div></td>
							<td>
								<div id="<?=$hd?>profil-price-c" class='content setinput <?=$change?'edit':''?>' style='width:445px;'>
									<div tabindex="<?=$change?'320':''?>" id='<?=$hd?>profil-price-c_fix' class='fix_content <?=$change?'focusin':''?>' style="width:445px;line-height: 26px;height: 26px"><?=isset($who->custo->amont) && $who->custo->amont? $who->custo->amont.' '.getCurrency(me()).' / '._('HOUR'):_('FREE_SERVICE')?></div>
							  		<? if($change):?>
							  			<div class='focusout' tabindex='1010' next='<?=$hd?>profil-job-c'></div>
								  		<div tabindex='1011' class='hide blurinput price _input' id='<?=$hd?>profil-price-c_input'>
									  		<div class='focusout' tabindex='321' next='<?=$hd?>profil-job-c'></div>
									  		<input class="blurinput styledinput <?=(isset($who->custo->amont) && !$who->custo->amont?"disabled":'')?>" tabindex='322' name="amont_c" id='<?=$hd?>profil-price-c_amont' style='width:105px' value="<?=isset($who->custo->amont) && $who->custo->amont? $who->custo->amont:'0'?>" <?=isset($who->custo->amont) && !$who->custo->amont?"disabled='disabled'":''?>/>
									  		<? /*<select  id='<?=$hd?>profil-price-c_ccy' tabindex='323' class="blurinput styledselect" name="currency_c" style="width:55px;"  title='currency' <?=isset($who->custo->amont) && !$who->custo->amont?"disabled='disabled'":''?>>
												<? foreach ($ccies as $key => $curr) :?>
													<option <? if(isset($who->custo->currency) && $who->custo->currency == $curr['unity_ccy']) echo 'selected'?> value="<?=$curr['unity_ccy']?>"><?=$curr['unity_ccy']?></option>
												<? endforeach;?>
											</select>
											 */ 
											 /*?>
											<input type='hidden' name='currency_c' value='EUR'/>
											<?=getCurrency(me())?> / <?=_('HOUR')?>
											<input type='hidden' name='frequency_c' value='H'/>
									  		<? 
									  			/*<select  tabindex='324' id='<?=$hd?>profil-price-c_freq' class="blurinput styledselect" name="frequency_c" style="width:65px;"  title='frequency' <?=isset($who->custo->amont) && !$who->custo->amont?"disabled='disabled'":''?>>
												<option <? if(isset($who->custo->frequency) && $who->custo->frequency == '-') echo 'selected'?> value="-">-</option>
												<option <? if(isset($who->custo->frequency) && $who->custo->frequency == 'D') echo 'selected'?> value="D"><?=_('DAY')?></option>
												<option <? if(isset($who->custo->frequency) && $who->custo->frequency == 'H') echo 'selected'?> value="H"><?=_('HOUR')?></option>
												</select>*/
											/*?>
											<input tabindex='325' type='checkbox' class='blurinput costfree' name="free_c" id='<?=$hd?>profil-price-c_free'   <?=isset($who->custo->amont) && !$who->custo->amont?"checked='checked'":''?> style='margin-left:30px' />
											<label class='blurinput' for="<?=$hd?>profil-price-c_free"><?=_('FREE_SERVICE')?></label>
											<div tabindex='326' class='focusout' next='<?=$hd?>profil-serv-c'></div>
										</div>
										<div tabindex='1012' class='focusout' next='<?=$hd?>profil-serv-c'></div>
								  		<div id='<?=$hd?>profil-price-c_box' class='hide postBox' style='margin-left:47px;float:left'>
											<span class="yoo-icon right" title="éditer le champ" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">
												<span class="ui-icon ui-icon-pencil"></span>
											</span>
										</div>
									<? endif;?>
								</div>
							</td>
						</tr>*/?>
						<tr>
							<td class="label" id='<?=$hd?>profil-serv-c_label' style="width:120px"><label for="servhide" class=""><?=(me()->profil=='N'?_('SERVICES_SUIVIS'):_('SERVICES_CUSTO'))?></label></td>
							<td style="width:100%">
								<div id="<?=$hd?>profil-serv-c" class='content <?=$change?'edit withfocus':''?>' style='width:445px;'>
									<div tabindex="<?=$change?'330':''?>" id='<?=$hd?>profil-serv-c_fix' class='fix_tag <?=$change?'focusin':''?>' style='float:left;width:445px;min-height:180px'>
										<?if (isset($who->serviceC)) foreach ($who->serviceC as $tag):?>
												<a class="textboxlist-bit textboxlist-bit-box" style='text-decoration: none;color:#685840;cursor:pointer'><?=gettext($tag)?></a>
											<?endforeach;?>
									</div>
									<? if($change):?>
									<div id='<?=$hd?>profil-serv-c_box' class='hide postBox' style='margin-left:60px;float:left'>
										<span class="yoo-icon right" title="éditer le champ" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span>
									</div>
									<? endif;?>
								</div>
								<? if($change):?>
								<div class='setinput hide serviceinp _input' id='<?=$hd?>profil-serv-c_input'>
									<div class='focusout' tabindex='331' next='<?=$hd?>profil-price-c'></div>
									<div tabindex="332" class='service' id='<?=$hd?>profil-serv-c_service'>
										<input id='<?=$hd?>profil-serv-c_hidden' class='hide' type='text' value='' name='servhide_c'/>
									</div>
									<div class='focusout' tabindex='333' next='<?=$who->profil=='C'?'500':'400'?>'></div>
								</div>
								<? endif;?>
							</td>
						</tr>
					</table>
				</div>
				<? endif;?>
				<div id='<?=$hd?>tabs-4' style="" class='content-tab <?=$hd?>tabs <?=($hd=='my'?'':'hide')?>'>
					<?if ($isme || ($who->me_ == 'A' && $who->_me == 'A') ):?>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td style='width: 170px;margin :4px 0;' class="label"><?=_('COORDONNEES')?></td>
							<td>
								<div class="left" style="width:60px;margin-left:-90px;">
								 	<span id='<?=$hd?>profil-birth_label' class='label' style='margin :4px 0;line-height: 20px;text-align: right; width: 80px;'>Email</span>
								 	<span id='<?=$hd?>profil-birth_label' class='label' style='margin :4px 0;line-height: 20px;text-align: right; width: 80px;'><?=_('TEL.')?></span>
								</div>
								<div class="left" style="width:320px;">
										<div id='<?=$hd?>profil-email' class='content' style=''>
											<div id='<?=$hd?>profil-email_fix' class='fix_content' style='margin :4px 0;line-height: 20px;width:300px;'><?=$who->email?></div>
									  		<? if($change):?>
									  		<input  id='<?=$hd?>profil-email_input' class="content_input styledinput hide " name="email" style="width:300px;float:left;"  title='Votre email...' value="<?=$who->email?>"/>
									 		<div id='<?=$hd?>profil-email_box' class='hide postBox' style='margin-left:-10px;float:right'>
												<span class="yoo-icon right" title="éditer le champ">
													<span class="ui-icon ui-icon-pencil"></span>
												</span>
											</div>
											<? endif;?>
										</div>
										
										<div id='<?=$hd?>profil-mobile' class='content <?=$change?'edit':''?>' style=''>							 			
											<div tabindex='<?=$change?'116':''?>' id='<?=$hd?>profil-mobile_fix' class='fix_content <?=$change?'focusin':''?>' style='margin :4px 0;line-height: 20px;float:left;width: 300px;'><?=$who->mobile?$who->mobile:_('NO_DATA')?></div>
									  		<? if($change):?>
									  		<input tabindex='117' id='<?=$hd?>profil-mobile_input' class="content_input styledinput phone hide _input" name="mobile" style="width:300px;"  title='Votre mobile...' value="<?=$who->mobile?>"/>
											<div id='<?=$hd?>profil-mobile_box' class='hide postBox' style='margin-left:-10px;float:right'>
												<span class="yoo-icon right" title="éditer le champ">
													<span class="ui-icon ui-icon-pencil"></span>
												</span> 
											</div>
											<? endif;?>
										</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<td style='width: 100px' class="label" id='<?=$hd?>profil-address_label'><div style='margin:5px 0'><?=_('LOCATION')?></div></td>
							<td>
								<div id='<?=$hd?>profil-address' class='content <?=$change?'edit':''?>' style='width:445px;height:40px;margin:5px 0'>
									<div tabindex='<?=$change?'120':''?>' id='<?=$hd?>profil-address_fix' class='fix_loc <?=$change?'focusin':''?>' style='float:left;width:445px;line-height:26px'>
										<?=$location?>
									</div>
									<? if($change):?>
									<div  tabindex='121' class='hide input_bulle _input' id='<?=$hd?>profil-address_input' next='122' prev='118'>
										<input id='<?=$hd?>profil-address_input2' class='input-loc styleinput' style="width:255px" type='text' name='address' value='<?=$locset?>'>
									</div>			
									<div id='<?=$hd?>profil-address_box' class='hide postBox' style='margin-left:60px;float:left'>
										<span class="yoo-icon right" title="éditer le champ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span> 
									</div>
									<? endif;?>
								</div>
							</td>
						</tr>
						<tr>
							<td style='width: 100px' id='<?=$hd?>profil-web_label' class="label" style="width:225px">Websites (URL)</td>
							<td>
								<div id='<?=$hd?>profil-web' class='content <?=$change?'edit':''?>' style='width:445px;height:25px;margin-left:-2px'>
									<div tabindex='<?=$change?'122':''?>' id='<?=$hd?>profil-web_fix' class='fix_tag <?=$change?'focusin':''?>' style='float:left;width:445px;'>
										<?if (isset($who->webs)) foreach ($who->webs as $tag):?>
											<a class="textboxlist-bit textboxlist-bit-box" style='text-decoration: none;color:#685840;cursor:pointer'><?=$tag?></a>
										<?endforeach;?>
										<? if (count($who->webs)==0) echo _('NO_DATA');?>
									</div>
									<? if($change):?>
									<div tabindex='123' class='hide input_bulle _input' id='<?=$hd?>profil-web_input' next='<?=$who->profil=='P'?'400':'300'?>' prev='120'>
										<input class="content_input input-url"  bulle=true name="website" id='<?=$hd?>profil-web_input2' style='width:255px' value='<?=$setweb?>'/>
									</div>
									<div id='<?=$hd?>profil-web_box' class='hide postBox' style='margin-left:60px;float:left'>
										<span class="yoo-icon right" title="éditer le champ" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span>
									</div>
									<? endif;?>
								</div>
							</td>
						</tr>
						
					</table>
					<?else:?>
						<?=$this->render('layout/messages/warningBubble', array('msg'=>_('ERR_NO_COLLABORATE')));?>
						<br/>
						<?=_('SUGEST_COLLABORATE')?>.
						<br/>
						<br/>
						<div class='cleared'></div>
						<div class="art-button-wrapper left hide <?=$who->id?>-follow" style='overflow:visible; height: 45px' id=''>
							<?=$this->render('people/inner/actions-follow',array('usr'=>$who));?>
						</div>
					<?endif;?>
				</div>
				
				
			</div>	
			<br/>
			
			<div class='clear'></div>
			<? if($change):?>
			<div style='margin:auto;width: 150px;margin-bottom: 10px'>
				<input type="hidden" value="" name="id" id="id">
				<input tabindex="520" style='padding:8px;text-transform:uppercase;font-weight: bold' class="button" type='submit' name='save' value='<?=_('SAVE')?>' onkeydown="if(event.which==13) $('#profil-form').submit();"/>
            
				<?/*<input tabindex="521" style='padding:8px;text-transform:uppercase;font-weight: bold' class="button" type='button' name='close' value='<?=_('CLOSE')?>' onclick="$('#my-profil').slideUp();" onkeydown="if(event.which==13) $('#my-profil').slideUp();" />*/?>
                
                <div class='focusout' tabindex='522' next='100'></div>
			</div>
			<div id="profil-success" class='hide' style='left:0;bottom:0px;margin: 0px 0px 0px 0px;position: absolute;width: 100%'>
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tbody><tr>
					<td class="green-left"><?=_('UPDATE_PROFIL_SUCCESSFULLY')?></td>
					<td class="green-right"><a class="close-green" onclick="$('#profil-success').fadeOut('slow')">
						<img style='margin-left:-1px' alt="" src="/css/images/messages/icon_close_green.gif"></a>
					</td>
				</tr>
				</tbody>
				</table>
			</div>
			<div id="profil-summary" class='area-error hide' style='left:0;bottom:0px;margin: 0px 0px 0px 0px;position: absolute;width: 100%;' >
				<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="red-left" style='padding: 5px;'></td>
					<td class='red-right'>
						<a class="close-red" style='class' onclick="$('#profil-summary').fadeOut('slow')">
							<img style='margin-left:-20px' src="/css/images/messages/icon_close_red_in.gif"  alt="" />
						</a>
					</td>
				</tr>
				</table>
			</div>
			<div style='clear:both;'></div>
		</form>
		<? else:?>
		 <?/*<span class="art-button-wrapper" style='margin:-15px 300px 3px 0;'>
				<span class="l"> </span>
                    <span class="r"> </span>
                    <span><input class="art-button form-reset" type='button' name='close' value='fermer' onclick="$('#<?=$hd?>-profil').slideUp();"/></span>
                </span>
            */?>
		</div>
		<? endif;?>
		<?/*if ($change):?>
			</td><td class='mr-transborder'></td>
			</tr>
			<tr>
				<td class='bl-transborder'></td><td class='bm-transborder'></td><td class='br-transborder'></td>
			</tr>
		</table>
		<? endif;*/?>
	
</div>
			