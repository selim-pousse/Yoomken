<? if (SERVER_ENV == 'live') :?>
	<script type="text/javascript">
	var fb_param = {};
	fb_param.pixel_id = '6009685135765';
	fb_param.value = '1.00';
	(function(){
	  var fpw = document.createElement('script');
	  fpw.async = true;
	  fpw.src = '//connect.facebook.net/en_US/fp.js';
	  var ref = document.getElementsByTagName('script')[0];
	  ref.parentNode.insertBefore(fpw, ref);
	})();
	</script>
	<noscript><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/offsite_event.php?id=6009685135765&amp;value=1" /></noscript>
<?endif;?>

<div style='padding:0;'>
	<div id="" style="border:1px solid #EBEBEB;border-top:none;position: relative">
		<? if(isset($via) && $via == 'goo'):?>
		<div id="" 
		style="border: 1px solid #EBEBEB;
		border-right: none;
		border-top: none;
		background-color:whiteSmoke;border-left:none;padding:10px;">
			<img style="margin-right: 3px;" src="/media/img/google-icon.png" height="16" width="16">
			<?=_('FORM_SIGNUP_PREREMPPLI')?> 
			<span class="google" style=''>
  				<span>G</span><span>o</span><span>o</span><span>g</span><span>l</span><span>e</span> <span style='color:#1f47b2;'>Account</span>
  			</span> <?=_('TO_SAFE_TIME')?>.
		</div>
		<? endif;?>
		<div id='' class='' style='width:400px;margin:auto;padding:10px 0px' >
		</div>
		<h3 style="text-align: center;font-variant: small-caps;font-size: 20px"><?=_('JOIN_YOOMKEN_NOW')?></h3>
		<br/>
		<form id='signup_form' style='font-size: 12px' action='/signup' method="POST">
		<input type='hidden' value='<?=isset($via)?$via:'yoo'?>' name='via' id=""/>
		<table class="noBorder" style='width:700px;margin:auto;'>
			<tbody>
				<tr class="dataRow">
					<td class="label td-label"><?=_('LABEL_FNAME')?>&nbsp;:</td>
					<td class="data"> 
						<? if ($via=='yoo' || $via=='invit'):?>
							<input type="text" name='fullname' class="enabled ui-corner-all" id="" value="<?=$usr->fullname?>"/>
						<? else:?>
							<input type='hidden' name='fullname' value="<?=$usr->fullname?>" id=""/>
							<input type="text" class="disabled ui-corner-all" id="" value="<?=$usr->fullname?>" disabled="disabled"/>
						<?endif?>
					</td>
					<td class="rightCol"></td>
				</tr>
				<tr class="dataRow">
					<td class="label td-label"><?=_('LABEL_PSEUDO')?>&nbsp;:</td>
					<td class="data">
						<input type="text" class="enabled ui-corner-all" name='pseudo'  id="" value="<?=$usr->url?>" style=''/>
					</td>
					<td class="rightCol"></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input id="chk_privacy" type="checkbox" name="privacy" style="float: left;" checked="checked">
						<div style="width:450px;">
							<label for='chk_privacy'>&nbsp; <?=_('LABEL_PRIVACY')?></label><br/>
						</span>
						<br/>
					</td>
				</tr>
				<tr class="dataRow">
					<td class="label td-label"><?=_('LABEL_EMAIL')?>&nbsp;:</td>
					<td class="data">
						<? if ($via=='yoo'):?>
							<input type="text" name='email' class="enabled ui-corner-all" id="" value="<?=$usr->email?>"/>
						<? elseif ($via=='goo' || $via=='invit'):?>
							<input type='hidden' name='email' value="<?=trim($usr->email)?>" id=""/>
							<input type="text" class="disabled ui-corner-all" id="" value="<?=trim($usr->email)?>" disabled="disabled" style=''/>
						<? endif;?>
					</td>
					<td class="rightCol"></td>
				</tr>
				
				<tr class="dataRow">
					<td class="label td-label"><?=_('LABEL_PROFIL')?>&nbsp;:</td>
					<td class="data">
						<select class="enabled  ui-corner-all" id="" name='profil' style='width:245px'>
							<option value='N' <?=(!isset($usr->profil) || $usr->profil=='N'?"selected='selected'":'')?>><?=_('NEUTRAL_PROFIL')?></option>
							<option value='P' <?=($usr->profil=='P'?"selected='selected'":'')?>><?=_('PRESTA')?> (Provider)</option>
							<option value='C' <?=($usr->profil=='C'?"selected='selected'":'')?>><?=_('EMPLOYER')?> (Asker)</option>
							<option value='B' <?=($usr->profil=='B'?"selected='selected'":'')?>><?=_('BOTH_PROFIL')?> (Provider & Asker)</option>
						</select>
					</td>
					<td class="rightCol"></td>
				</tr>
				<tr class="dataRow">
					<td class="label td-label"><?=_('LABEL_MDP')?> Yoomken&nbsp;:</td>
					<td class="data">
						<input type="password" class="enabled  ui-corner-all" id="mdp" value="" name='password' style=''/>
					</td>
					<td class="rightCol"></td>
				</tr>
				<tr class="dataRow">
					<td class="label td-label"><?=_('LABEL_MDP2')?>&nbsp;:</td>
					<td class="data">
						<input type="password" class="enabled ui-corner-all" id="mdp2" value="" name='confirm_pass' style=''/>
					</td>
					<td class="rightCol"></td>
				</tr>
				<tr class="dataRow">
					<td class="label td-label" ><?=_('LABEL_LOCATION')?>&nbsp;:</td>
					<td class="data" >
						<div style="width: 246px">
						<input type="text" class="enabled" id="signup_address" value="<?=$usr->spot->location?>" name='location' style=''/>
						</div>
					</td>
					<td class="rightCol"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>
					</td>
				</tr>
				<tr class="dataRow" style=''>
					<td class="label td-label">&nbsp;</td>
					<td class="data">
						<input id="policy" type="checkbox" name="policy" style="float: left;">
						<span style="">
							<label for='policy'>&nbsp; <?=preg_replace('/\<a\>/i',"<a class='boxy' href='/ajax/privacy-and-terms' boxywidth='700px'>",_('ACCEPT_POLICY'));?></label><br/>
						</span>
						<input style='margin-top:13px' class="art-buttonv2 form-submit" type='submit' name='save' value='Inscription'/>
					</td>
					<td class="rightCol"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
					</td>
				</tr>
			</tbody>
		</table>
		<div id="register-success" class='hide' style='bottom:0px;margin: 0;position: absolute;width: 100%'>
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tbody><tr>
					<td class="green-left"><?=_('SIGNUP_SUCCESSFULLY')?></td>
					<td class="green-right"><a class="close-green" onclick="$('#register-success').fadeOut('slow')">
						<img style='margin-left:-1px' alt="" src="/css/images/messages/icon_close_green.gif"></a>
					</td>
				</tr>
				</tbody>
				</table>
			</div>
		<div id="summary2" class='area-error hide' style='bottom:0px;margin: 0;position: absolute;width: 100%' >
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td class="red-left" ><?=$signup_error?></td>
				<td class='red-right'>
					<a class="close-red" style='class' onclick="$('#summary2').fadeOut('slow')">
						<img style='margin-left:-20px' src="/css/images/messages/icon_close_red_in.gif"  alt="" />
					</a>
				</td>
			</tr>
			</table>
		</div>
		</form>
	  	<div class="" style='border: 1px solid #EBEBEB;border-left:none;
		border-right: none;
		border-bottom: none;padding: 10px;' >
			<div class="fbRegistrationDisclaimer fss fwn fcg" style='font-size: 11px;text-align: center;'>
				* <?=_('DATA_NOT_COPIED_UNTIL_SIGNUP')?>
			</div>
		</div>
		
		<?php /*<div id="message-success2" class='hide' style='margin: -32px 0px 0px;position:relative;'>
			<table cellspacing="0" cellpadding="0" border="0" width="100%">
			<tbody><tr>
				<td class="green-left">Opération réussite: inscription achevée!</td>
				<td class="green-right"><a class="close-green" onclick="$('#message-success').fadeOut('slow')">
					<img style='margin-left:-1px' alt="" src="/css/images/messages/icon_close_green.gif"></a>
				</td>
			</tr>
			</tbody>
			</table>
		</div> */?>
		
	</div>
</div>
