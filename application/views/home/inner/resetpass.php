<div style=''>
	<div id="" style="border:1px solid #EBEBEB;border-top:none;position: relative">
		
		<div id='' class='' style='width:700px;margin:auto;padding:10px 0px' >
		</div>
		<h3 style="text-align: center;font-variant: small-caps;font-size: 20px"><?=_('TITLE_RESET_PASS')?></h3>
		<br/>
		<form id='reset_newpass' style=''  method="POST">
		<input type="hidden"  value="<?=$activate?>" name='act'/>
		<table class="noBorder" style='width:910px;margin:auto;'>
			<tbody>
				<tr>
					<td></td>
					<td>
							<span style="font-size: 13px"> <?=_('TXT_RESET_PASSWORD')?></span>
						<br/>
					</td>
				</tr>
				
				<tr class="dataRow">
					<td class="label td-label" style='width:200px'><?=_('LABEL_NEW_MDP')?> &nbsp;:</td>
					<td class="data">
						<input type="password" class="enabled" id="mdp" value="" name='password'/>
					</td>
					<td class="rightCol"></td>
				</tr>
				<tr class="dataRow">
					<td class="label td-label"><?=_('LABEL_MDP2')?>&nbsp;:</td>
					<td class="data">
						<input type="password" class="enabled" id="mdp2" value="" name='confirm_pass' style=''/>
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
		<div id="resetpass-success" class='hide' style='bottom:0px;margin: 0;position: absolute;width: 100%'>
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tbody><tr>
					<td class="green-left"><?=_('PASS_RESET_DONE')?></td>
					<td class="green-right"><a class="close-green" onclick="$('#resetpass-success').fadeOut('slow')">
						<img style='margin-left:-1px' alt="" src="/css/images/messages/icon_close_green.gif"></a>
					</td>
				</tr>
				</tbody>
				</table>
			</div>
		<div id="summaryresetpass" class='area-error hide' style='bottom:5px;margin: 0;position:absolute;width:100%' >
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td class="red-left" ></td>
				<td class='red-right'>
					<a class="close-red" style='class' onclick="$('#summaryresetpass').fadeOut('slow')">
						<img style='margin-left:-20px' src="/css/images/messages/icon_close_red_in.gif"  alt="" />
					</a>
				</td>
			</tr>
			</table>
		</div>
		</form>
	</div>
</div>
