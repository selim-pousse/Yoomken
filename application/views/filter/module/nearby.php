<?php 
	$me = $this->session->get('user');
	$nearby = $me->nearby;
	
	list($location,$idspot) = isset($me->spot->id)? array(trim(getLocation($me->spot)),$me->spot->id):array(_('SOMEWHERE'),null);
	list($locationA,$idspotA) = isset($me->nearby->spot)? array(trim(getLocation($me->nearby->spot)),$me->nearby->spot->id):array('['._('MY_CURRENT_POSITION').']',null);
	if ($idspot==null) $locset = '';
	else $locset = $location.'!#!'.$idspot.'!#!'.$location;
?>
<script type="text/javascript">
function initBoxy()
{
	$( "#radio-nearby").buttonset();
	$( "#radio-auto").click(function(){
		$('#nearbyS').parent().hide();
		$('#nearbyA').show();

		<? if( 1 /*&& $me->nearby->date != date('Y-m-d',time())*/ ):?> 
			initializeNearby();
		<? endif;?>
	});
	$( "#radio-static").click(function(){
		$('#nearbyA').hide();
		$('#nearbyS').parent().show();
	});

	var txbox = $( "#nearbyS" ).textboxlist({title:label.location,max:1,unique: true, plugins: {autocomplete: {
		queryRemote: true,
		source: codeAddress,
		onlyFromValues :true
	}}});
}
</script>

<form id="smartfilter_form" class="" method="POST" action="/ajax/filter/nearby/save" accept-charset="utf-8">
	<div style=''>
		<input type='hidden' name='type' value='<?=$type?>'/>
      	<?/*<input disabled="disabled" class='disabled' placeholder='<?=_('LABEL_FILTER')?>' type='text' value='<?=_('NEARBY')?>' name='alias' title='<?=_('LABEL_FILTER')?>' style='width:150px;text-transform: uppercase'/><br/>*/?>
    </div>
                
 
        <table id="orderitems" style='width:350px' cellspacing="0 0" cellpadding="0">
        	<tr><td></td></tr>
        	<?if ($nearby->mode=='R'):
        	$supNoRayon = 2;
        	?>
        	<tr><td>
        		<input type='hidden' name='mode' value='R'/>
        		<div id="radio-nearby" style='font-size: 0.8em;float:right;margin-right:2px;color:#AC9A99' class='AND-OR-button-set'>
						<?//=preg_replace('/\{\#rayon\}/',50,_('LABEL_NEARBY'))?>
						<b><sup>1&nbsp</sup></b><?=_('MY_POSITION_FIX')?>&nbsp
				</div>
			</td></tr>
        	<?else:
        	$supNoRayon = 3;
        	?>
        	<tr>
        		<td>
					<div id="radio-nearby" style='font-size: 0.8em;float:right;margin-right:7px;color:#AC9A99' class='AND-OR-button-set'>
						<?//=preg_replace('/\{\#rayon\}/',50,_('LABEL_NEARBY'))?>
						<?=_('MY_POSITION')?>&nbsp
						<input type="radio" id="radio-auto" name="mode" <?php if( $nearby->mode=='A') echo 'checked="checked"'?> value='A'/>
						<label class='radio-OR' for="radio-auto" style='text-align: center;width:55px;font-size:0.9em;-moz-border-radius: 4px 0 0 0; -webkit-border-radius: 4px 0 0 0; border-radius: 4px 0 0 0;border: 1px solid #C3C3C3;'>
							<b><sup>1&nbsp</sup></b><?=_('CURRENT')?>
						</label>
						<input type="radio" id="radio-static" name="mode" <?php if( $nearby->mode=='S') echo 'checked="checked"'?> value='S'/>
						<label class='radio-ET' for="radio-static" style='font-size:0.9em;-moz-border-radius: 0 4px 0 0; -webkit-border-radius: 0 4px 0 0; border-radius: 0 4px 0 0;text-align: center;width:55px;border: 1px solid #C3C3C3;'>
							<b><sup>2&nbsp</sup></b><?=_('_STATIC_')?>
						</label>
					</div>
        		</td>
        	</tr>
        	<?endif;?>
            <tr style=''>
            	<td style=''>
            		<input id='nearbyA' disabled="disabled" class='disabled <?=($nearby->mode=='A'?'':'hide')?> ui-corner-all' placeholder='<?=_('MY_CURRENT_POSITION')?>' type='text' value='<?=$locationA?>' name='addressA' title='<?=_('MY_CURRENT_POSITION')?>' style='width:338px;padding:5px;margin:0'/>
            		<div  class='nearbyS <?=($nearby->mode!='A'?'':'hide')?>' style='float:left;width:340px;'>
						<input  id='nearbyS' type='text' title='Lieu' placeholder='' name='addressS' value='<?=$locset?>'>
					</div>
            	</td>
            </tr>
            <tr><td><br/></td></tr>
            <tr style=''>
            	<td style=''>
            		<div id="radio-nearby" style='font-size: 0.8em;float:right;margin-right:2px;color:#AC9A99' class='AND-OR-button-set'>
						<?//=preg_replace('/\{\#rayon\}/',50,_('LABEL_NEARBY'))?>
						<b><sup><?=$supNoRayon?>&nbsp</sup></b><?=_('MY_RAYON_NEARBY')?>&nbsp
				   </div>
            	</td>
            </tr>
            <tr style=''>
            	<td style=''>
            		<select name='myradius' style='width:350px;padding:5px;margin:0' class="ui-corner-all">
            			<option <? if($nearby->radius == 5) echo 'selected'?> value="5">Perimêtre limité à un rayon de 5 km</option>
            			<option <? if($nearby->radius == 25) echo 'selected'?> value="25">Perimêtre limité à un rayon de 25km</option>
            			<option <? if($nearby->radius == 50) echo 'selected'?> value="50">Perimêtre limité à un rayon de 50 km</option>
            			<option <? if($nearby->radius == 100) echo 'selected'?> value="100">Perimêtre limité à un rayon de 100km</option>
            			<option <? if($nearby->radius == 'XX') echo 'selected'?> value="XX">Perimêtre illimité (rayon infini)</option>
            		</select>
            	</td>
            </tr>
            <tr><td><br/></td></tr>
            <?if ($nearby->mode!='R'):?>
            <tr>
            	<td style='font-size: 0.8em;'>
            	<b><sup>1&nbsp</sup></b><?=_('LABEL_NEARBY_1')?></td>
            </tr>
            <?endif;?>
            <tr>
            	<td style='font-size: 0.8em;'>
            		<?if ($nearby->mode=='R'):?>
            			<b><sup>1&nbsp</sup></b><?=_('LABEL_NEARBY_2_1')?>.
            		<?else:?>
            			<b><sup>2&nbsp</sup></b><?=_('LABEL_NEARBY_2_1')?>.<?=_('LABEL_NEARBY_2_2')?>
            		<?endif;?>
            	</td>
            </tr>
            <tr>
            	<td style='font-size: 0.8em;'>
            	<b><sup><?=$supNoRayon?>&nbsp</sup></b><?=_('LABEL_NEARBY_3')?></td>
            </tr>
        </table>
	<br/>
	<div class='cleared'></div>
	<input style="float:left" class="art-buttonv2 form-submit" type="submit" name="save" value="Soumettre">
	<input style="float:right" class="art-buttonv2 form-submit close" type="button" value="Annuler">
	<div class='cleared'></div>
</form>