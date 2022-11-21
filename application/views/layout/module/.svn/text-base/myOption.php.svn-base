<?
$me = $this->session->get('user');
list($location,$idspot) = isset($me->spot->id)? array(trim(getLocation($me->spot)),$me->spot->id):array(_('SOMEWHERE'),null);
if ($idspot==null) $locset = '';
else $locset = $location.'!#!'.$idspot.'!#!'.$location;
$hd = 'myopt-';
if(!isset($me->option)) $me->option = new Adapter();
?>
<script>
	function aciveOngletOptions(that)
	{
		$(that).parent().parent().find('li').removeClass('profil-tab-active');
		$(that).parent().addClass('profil-tab-active').trigger('click');
	}
</script>
	<div class="page-profil" id="my-options" style="font-size: 13px">
		<?/*if ($change):?>
		<table class='tb-transborder'>
			<tr>
				<td class='tl-transborder'></td><td class='tm-transborder'></td><td class='tr-transborder'></td>
			</tr>
			<tr>
				<td class='ml-transborder'></td><td class='art-profil bg-block-soft'>*/?>
					<h3 style=''>
						<span class=''><?= $me->name;?></span><span class="">&nbsp;▸&nbsp;</span><span class=''><?=_('OPTIONS')?></span>
					</h3>
		<form id="form-opt" action="/user/setting" method="post" <?//style='margin:auto;width:650px;'?>>
			<br/>
			
			
			<div class="cleared"></div>
			<div class="profil-tabs" style='min-height:200px;'>
				<ul class="ui-filter-fix" style='margin: 0 0px 15px 0px;'>
					<li class="profil-tab-active"><a href="#<?=$hd?>tabs-3" onclick="aciveOngletOptions($(this))"><?=_('OPT_ACCOUNT')?></a></li>
					<li class=""><a href="#<?=$hd?>tabs-2" onclick="aciveOngletOptions($(this))"><?=_('GEOLOC')?></a></li>
					<li class=""><a href="#<?=$hd?>tabs-1" onclick="aciveOngletOptions($(this))">Synchronize</a></li>
				</ul>
				<div id='<?=$hd?>tabs-3' style="" class='content-tab histabs'>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td class="label" id='<?=$hd?>notif_label'><div style='margin:5px 0'>Email notification</div></td>
							<td>
								<input tabindex='551' id='chk-msg-notif' type='checkbox' name='msg_notification' <?=($me->option->msg_notification=='Y'?'checked="checked"':'')?>/> 
								<label for="chk-msg-notif"><?=_('LABEL_MSG_NOTIF')?></label>
							</td>
						</tr>
						<tr>
							<td id='<?=$hd?>nbresult_label' class="label"><div style='margin:5px 0;line-height: 30px;'><?=_('FIELD_NB_RESULT')?><sup>&nbsp1</sup></div></td>
							<td>
								<div id='<?=$hd?>nbresult' class='content' style='width:445px;height: 30px;margin-top:10px'>
									<?/*<div tabindex='555' id='<?=$hd?>nbresult_fix' class='fix_content <?=$change?'focusin':''?>' style="width:445px;line-height: 26px;height: 26px"><?=$me->option->nbresult?></div>
									*/?>
									 <select tabindex='556' id='<?=$hd?>nbresult_input' class="styledselect level" name="nbresult" style="width:260px;"  title='<?=_('LABEL_NB_RESULT')?>'>
										<option <?php if($me->option->nbresult == '5') echo 'selected'?> value="5">5</option>
										<option <?php if($me->option->nbresult == '10') echo 'selected'?> value="10">10</option>
										<option <?php if($me->option->nbresult == '20') echo 'selected'?> value="20">20</option>
										<option <?php if($me->option->nbresult == '30') echo 'selected'?> value="30">30</option>
										<option <?php if($me->option->nbresult == '50') echo 'selected'?> value="50">50</option>
									</select>
									<?/*<div id='<?=$hd?>nbresult_box' class='hide postBox' style='margin-left:47px;float:left'>
										<span class="yoo-icon right" title="éditer le champ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span>
									</div>*/?>
								</div>
							</td>
						</tr>
						<tr>
							<td><br/></td>
						</tr>
						<tr>
            				<td style='font-size: 0.8em;' colspan="2"><sup>1&nbsp</sup><?=_('LABEL_NB_RESULT')?></td>
            			</tr>
					</table>
				</div>
				<div id='<?=$hd?>tabs-2' style="" class='content-tab histabs hide'>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td class="label" id='<?=$hd?>countries_label'><div style='margin:5px 0'><?=_('OPEN_COUNTRIES')?><sup>&nbsp1</sup></div></td>
							<td>
								<?/*<div id='<?=$hd?>countries' class='content <?=$change?'edit':''?>' style='width:445px;height:40px;margin:5px 0'>
									<div tabindex='610' id='<?=$hd?>countries_fix' class='fix_loc focusin' style='float:left;width:445px;line-height:26px'>
										<?=$location?>
									</div>
									<div  tabindex='611' class='hide input_bulle _input' id='<?=$hd?>countries_input' next='620' prev='600'>
										<input id='<?=$hd?>countries_input2' class='input-loc styleinput' style="width:255px" type='text' name='address' title='Votre localisation...' value='<?=$locset?>'>
									</div>			
									<div id='<?=$hd?>countries_box' class='hide postBox' style='margin-left:60px;float:left'>
										<span class="yoo-icon right" title="éditer le champ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span> 
									</div>
								</div>*/?>
								<?=getCountryUser($me)?> <i style="float:right;color:#E79300;"><?=_('USE_LIMIT_INCOUNTRY')?></i>
							</td>
						</tr>
						<? /* <tr>
							<td id='<?=$hd?>nearby_label' class="label"><div style='margin:5px 0;line-height: 30px;'><?=_('NEARBY_DISTANCE')?><sup>&nbsp2</sup></div></td>
							<td>
								<div id="<?=$hd?>nearby" class='content setinput <?=$change?'edit':''?>' style='width:445px;'>
									<div tabindex="620" id='<?=$hd?>nearby_fix' class='fix_content focusin' style="width:445px;line-height: 26px;height: 26px"><?=$me->kmby .($me->iskm?' Km':' Miles')?></div>
						  			<div class='focusout' tabindex='1140' next='<?=$hd?>countries'></div>
							  		<div tabindex='1141' class='hide blurinput distance _input' id='<?=$hd?>nearby_input'>
								  		<div class='focusout' tabindex='621' next='<?=$hd?>countries'></div>
								  		<input class="blurinput styledinput" tabindex='622' name="distance" id='<?=$hd?>nearby_distance' style='width:105px' title='<?=_('DISTANCE_FROM_ME')?>' value='<?=isset($me->kmby) && $me->kmby? $me->kmby:'0'?>'/>
								  		
								  		<select  tabindex='623' id='<?=$hd?>nearby_unity' class="blurinput styledselect" name="unity" style="width:65px;"  title='<?=_('DISTANCE_FROM_ME')?>' >
											<option <? if(isset($me->kmby) && $me->iskm) echo 'selected'?> value="KM">Km</option>
											<option <? if(isset($me->kmby) && !$me->iskm) echo 'selected'?> value="ML">Miles</option>
										</select>
										<div tabindex='624' class='focusout' next='700'></div>
									</div>
									<div tabindex='1142' class='focusout' next='700'></div>
							  		<div id='<?=$hd?>nearby_box' class='hide postBox' style='margin-left:47px;float:left'>
										<span class="yoo-icon right" title="éditer le champ" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span>
									</div>
								</div>
								
								30 Km <i style="float:right;color:#E79300;"><?=_('USE_LIMIT_RAYON_KM')?></i>
							</td>
						</tr>*/?>
						<tr>
            				<td><br/></td>
            			</tr>
						<tr>
            				<td style='font-size: 0.8em;' colspan="3"><sup>1&nbsp</sup><?=_('LABEL_OPEN_COUNTRIES')?></td>
            			</tr>
            			<tr>
            				<td><br/></td>
            			</tr>
            			<?/*<tr>
            				<td style='font-size: 0.8em;' colspan="3"><sup>2&nbsp</sup><?=_('LABEL_NEARBY_DISTANCE')?></td>
            			</tr>*/?>
					</table>
				</div>
				<div id='<?=$hd?>tabs-1' style="" class='content-tab histabs hide'>
					<div id="message-noresult" class='' style='margin:0px;bottom:5px'>
						<table cellspacing="0" cellpadding="0" border="0" width="100%" style='font-size: 11px'>
						<tbody><tr>
							<td class="yellow-left">
								Module de syncronisation avec les comptes de réseaux sociaux tel que Facebook, Google+ etc.. <br/>
								En cours de developpement, bientôt disponible.
							</td>
							<td class="yellow-right"><a class="close-green"><img alt="" src="/css/images/messages/icon_close_yellow.gif"></a></td>
						</tr>
						</tbody>
						</table>
					</div>
				</div>
			</div>
			<br/>
			<div class='clear'></div>
			<div style='margin:auto;width: 150px;margin-bottom: 10px'>
				<input type="hidden" value="" name="id" id="id">
				<input  class="button" type='submit' name='save' value='<?=_('SAVE')?>' tabindex="998" class="art-button-wrapper" style='padding:8px;' onkeydown="if(event.which==13) $('#opt-form').submit();"/>
                <?/*<input class="button" type='button' name='close' value='<?=_('CLOSE')?>' onclick="$('#my-options').slideUp();" tabindex="999"  style='padding:8px;' onkeydown="if(event.which==13) $('#my-options').slideUp();"/>*/?>
                 
            </div>
			<div id="myoption-success" class='hide' style='left:0;bottom:0px;margin: 0px 0px 0px 0px;position: absolute;width: 100%'>
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tbody><tr>
					<td class="green-left"><?=_('UPDATE_PROFIL_SUCCESSFULLY')?></td>
					<td class="green-right"><a class="close-green" onclick="$('#message-success').fadeOut('slow')">
						<img style='margin-left:-1px' alt="" src="/css/images/messages/icon_close_green.gif"></a>
					</td>
				</tr>
				</tbody>
				</table>
			</div>
			<div id="myoption-summary" class='area-error hide' style='left:0;bottom:0px;margin: 0px 0px 0px 0px;position: absolute;width: 100%' >
				<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="red-left" style='padding: 5px;'></td>
					<td class='red-right'>
						<a class="close-red" style='class' onclick="$('#myoption-summary').fadeOut('slow')">
							<img style='margin-left:-20px' src="/css/images/messages/icon_close_red_in.gif"  alt="" />
						</a>
					</td>
				</tr>
				</table>
			</div>
			<div style='clear:both;'></div>
		</form>
		<?/*if ($change):?>
			</td><td class='mr-transborder'></td>
			</tr>
			<tr>
				<td class='bl-transborder'></td><td class='bm-transborder'></td><td class='br-transborder'></td>
			</tr>
		</table>
		<? endif;*/?>
</div>