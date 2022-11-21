<?php 
?>
<script type="text/javascript">
function initBoxy()
{
	
	$( "#radio-nearby").buttonset();
	$( "#radio-static").click(function(){
		$('#tab-provider').hide();
		$('#tab-asker').show();
	});
	$( "#radio-auto").click(function(){
		$('#tab-asker').hide();
		$('#tab-provider').show();
	});
	
	
	$('#filter-mysp_input').viewedit(
	{	
		profondeur: 2,
		name:'service_P',
		json_url:'/services/P'
	});
	
	$('#filter-mysa_input').viewedit(
	{	
		profondeur: 2,
		name:'service_C',
		json_url:'/services/C'
	});
}
</script>

<form id="smartfilter_form" class="" method="POST" action="/ajax/filter/myservices/save" accept-charset="utf-8" style='width:460px;min-height: 220px;padding: 20px'>
	<div style=''>
		<input type='hidden' name='type' value='<?=$type?>'/>
      	<?/*<input disabled="disabled" class='disabled'  type='text' value='<?=_('MY_SERVICES')?>' name='alias' title='<?=_('LABEL_FILTER')?>' style='width:150px;text-transform: uppercase'/><br/>*/?>
    </div>
                
		<? if (me()->profil=='B'):?>
			<div id="radio-nearby" style='font-size: 0.8em;float:left;margin:0 0 -5px 2px;color:#AC9A99' class='AND-OR-button-set'>
				<input type="radio" id="radio-auto" name="mode" <?php if( me()->profil!='C') echo 'checked="checked"'?> value='A'/>
				<label class='radio-OR' for="radio-auto" style='text-align: center;width:90px;font-size:0.9em;-moz-border-radius: 4px 0 0 0; -webkit-border-radius: 4px 0 0 0; border-radius: 4px 0 0 0;border: 1px solid #C3C3C3;'>
					<?=_('MYSERVICES_PROVIDER')?>
				</label>
				<input type="radio" id="radio-static" name="mode" <?php if( me()->profil=='C') echo 'checked="checked"'?> value='S'/>
				<label class='radio-ET' for="radio-static" style='font-size:0.9em;-moz-border-radius: 0 4px 0 0; -webkit-border-radius: 0 4px 0 0; border-radius: 0 4px 0 0;text-align: center;width:90px;border: 1px solid #C3C3C3;'>
					<?=_('MYSERVICES_ASKER')?>
				</label>
			</div>
		<? endif;?>
		<div class='cleared'></div>
		<? if (me()->profil!='C' && me()->profil!='N'):?>			
 		<div id='tab-provider'>
	        <div  class='service' id='filter-mysp_input'>
				<input id='filter-mysp_hidden' class='hide' type='text' value='' name='servhide_provider'/>
			</div>
		</div>
		<? endif;?>
		<? if (me()->profil!='P'):?>
		<div id='tab-asker' class='<?=(me()->profil=='B')?'hide':''?>'>
			<div class='service' id='filter-mysa_input'>
				<input id='filter-mysa_service' class='hide' type='text' value='' name='servhide_asker'/>
			</div>
		</div>
		<? endif;?>
	<br/>
	<div class='cleared'></div>
	<div style="width: 440px">
		<input style="float:left" class="art-buttonv2 form-submit" type="submit" name="save" value="Soumettre">
		<input style="float:right" class="art-buttonv2 form-submit close" type="button" value="Annuler">
	</div>
	<div class='cleared'></div>
</form>