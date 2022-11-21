<?php //$fb = Registry::getInstance()->get('fb');?>
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

<div style='padding:0;margin-top:11px;margin-bottom: 40px'>
	<div id="" style='margin:auto;'>
	
	<fb:registration 
	  fields="[
	 {'name':'name'},
	 {'name':'first_name'},
	 {'name':'last_name'},
	 {'name':'email'},
	 {'name':'gender'},
	 {'name':'location'},
	 {'name':'profil',    'description':'<?=_('LABEL_PROFIL')?>',  'type':'select', 'options':{'N': '<?=_('NEUTRAL_PROFIL')?>','C':'<?=_('EMPLOYER')?> (Asker)','P':'<?=_('PRESTA')?> (Provider)','B':'<?=_('BOTH_PROFIL')?> (Asker & Provider)'}, 'default':'N'},
	 {'name':'password','view':'prefilled'},
	 {'name':'privacy',    'description':'', 'type':'hidden','default':'P'}
	 ]" 
	  redirect-uri="<?='http://' . $_SERVER["HTTP_HOST"] . '/app.php?go=user/signup_fb'?>"
	  width="690">
	</fb:registration>
	<?//=str_replace("'", "\'", _('ACCEPT_POLICY'))?>
	</div>
	<div id="summary2" class='area-error hide' style='margin: -94px 0px 0 0px;position:relative;width:97%' >
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
	<div id="message-noresult" class='' style='margin:0px;width: 690px;position: absolute; bottom:0px'>
			<table cellspacing="0" cellpadding="0" border="0" width="100%" style='font-size: 11px'>
			<tbody><tr>
				<td class="yellow-left" >
					En cliquant sur Incription vous accepter en même temps les conditions d'utilisation de Yoomken.
				</td>
				<td class="yellow-right"><a class="close-green"><img alt="" src="/css/images/messages/icon_close_yellow.gif"></a></td>
			</tr>
			</tbody>
			</table>
		</div>
	<?/*<div id="" style="border:1px solid #c1c1c1;width:520px;margin: 20px auto">
		<div id="fbRegistrationEnabledTopBox" 
		style="border: 1px solid #CCC;border-left: none;
		border-right: none;
		border-top: none;
		background-color: #F2F2F2;padding: 10px;">
			<div class="UIImageBlock clearfix" id="fbRegistrationHeaderBlock">
				<img class="UIImageBlock_Image UIImageBlock_ICON_Image img" style='float:left;margin:5px' src="http://static.ak.fbcdn.net/rsrc.php/v1/yH/r/eIpbnVKI9lR.png" alt="Register using Facebook" id="fbRegistrationHeaderIcon" width="14" height="14">
				<div class="UIImageBlock_Content UIImageBlock_ICON_Content fsm fwn fcg" style='color: gray;display: table-cell;' id="fbRegistrationEnabledTopInfo">Pour les personnes déjà inscrites auparavant via Facebook et désynchronisé de Yoomken</div>
			</div>
		</div>
		<div id='' class='' style='width:120px;margin:auto;padding:20px' >
	    	<a  href="<?=$fb->getLoginUrl()?>" class="fb_button fb_button_medium"><span class="fb_button_text">Synchroniser</span></a>
	  	</div>
	  	<div class="" style='border: 1px solid #CCC;border-left: none;
		border-right: none;
		border-bottom: none;padding: 10px;' ><div class="fbRegistrationDisclaimer fss fwn fcg" style='font-size: 9px;color:gray'>Ce genre de cas se produit lorsque vous avez déconnecté l'application Yoomken de votre compte Facebook.</div></div>
	</div>
	*/?>
</div>
<?php
//{'name':'location',       'description':'cuurent location',       'type':'typeahead', 'categories':['city','country','state_province']}
?>