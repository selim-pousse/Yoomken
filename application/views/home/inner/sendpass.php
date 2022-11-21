<div style=''>
	<div id="" style="border-top:none;position: relative">
		
		<div id='' class='' style='width:700px;margin:auto;padding:10px 0px' >
		</div>
		<? if (isset($error) && $error):
			echo $error;
		 endif;?>
		<br>
		<h3 style="text-align: center;font-variant: small-caps;font-size: 20px"><?=_('TITLE_INIT_PASS')?></h3>
		<br/>
		<form id='send_newpass' style=''  method="POST">
		<table class="noBorder" style='width:710px;margin:auto;'>
			<tbody>
				<tr>
					<td></td>
					<td>
							<span style="font-size: 13px"> <?=_('TXT_SEND_LINK_PASSWORD')?></span>
						<br/><br />
					</td>
				</tr>
				<tr  >
					<td class="label td-label" style="width:150px;"><?=_('EMAIL_OR_USERNAME')?>&nbsp;:</td>
					<td class="data">
						<input type="text" class="enabled ui-corner-all" name='pseudo'  id="" value="" style='border: 1px solid #ccc; padding: 5px;width: 230px'/>
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
						<input style='margin-top:13px;font-size: 13px' class="art-buttonv2 form-submit" type='submit' name='save' value="<?=_('RESET')?>"/>
					</td>
					<td class="rightCol"></td>
				</tr>
				
			</tbody>
		</table>
		<div id="sendpass-success" class='hide' style='bottom:0px;margin: 0;position: absolute;width: 100%'>
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tbody><tr>
					<td class="green-left"><?=_('SENDPASS_SUCCESSFULLY')?></td>
					<td class="green-right"><a class="close-green" onclick="$('#sendpass-success').fadeOut('slow')">
						<img style='margin-left:-1px' alt="" src="/css/images/messages/icon_close_green.gif"></a>
					</td>
				</tr>
				</tbody>
				</table>
			</div>
		<div id="summarypass" class='area-error hide' style='bottom:5px;margin: 0;position:absolute;width:100%' >
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td class="red-left" ></td>
				<td class='red-right'>
					<a class="close-red" style='class' onclick="$('#summarypass').fadeOut('slow')">
						<img style='margin-left:-20px' src="/css/images/messages/icon_close_red_in.gif"  alt="" />
					</a>
				</td>
			</tr>
			</table>
		</div>
		</form>
	</div>
</div>
