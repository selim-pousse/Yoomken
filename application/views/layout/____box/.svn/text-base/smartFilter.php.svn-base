<script type="text/javascript">
function addFilter(notd, befortd, notr, befortr, join, valuefil, valueop, valueinp, labelinp, attach_mit) {

    var gab_fil = jQuery.format($("#gabarit-filtre").val(),notd,join,notr);
    //var gab_fil = $.tmpl( "<li>${Name}</li>", { "0" : "John Doe" })
    if (join == 'OU') 
    {
        gab_fil = 	"<tr id='tr-filtre-"+notr+"'>" 
        				+gab_fil+
        			"</tr>"+
        			"<tr id='tr-op-"+notr+"' width='100%' class='tr-op'>"+
        				"<td colspan='4'><button id='OU-"+notr+"' class='OU' type='button' value='OU' notd='"+notd+"' notr='"+notr+"' style='width:100%;'>OU</button>"+
        			"</td></tr>";
        $('#tr-op-'+befortr).after(gab_fil);
        $( "#OU-"+notr).css('position','static').button({text: true});
    }
    else if ( join == 'ET')
    {
        $('#td-filtre-'+befortd).after(gab_fil);
    }
    else 
    {
    	gab_fil = "<tr id='tr-filtre-"+notr+"'>"+gab_fil+"</tr>";
    	$("#orderitems tfoot").append(gab_fil);
    	$("#orderitems tfoot").append("<tr id='tr-op-"+notr+"' width='100%' class='tr-op'><td colspan='4'><button id='OU-"+notr+"' class='OU' type='button' value='OU' notd="+notd+" notr='"+notr+"' style='width:100%;padding-right:-50px'>OU</button></td></tr>");
    	$( "#OU-"+notr).css('position','static').button({text: true});
	}
    

    var option_fil = null;
    if (valuefil == undefined) option_fil = $('#select-filtre-'+notd+' option:first-child');
    else option_fil = $('#select-filtre-'+notd+' option[value="'+valuefil+'"]');
    option_fil.attr('selected','selected');
    var id_fil = option_fil.val();

	//var operator = jQuery.format($("#gabarit-op").val());

	addOp(notd,id_fil,valueop,valueinp,labelinp,attach_mit);

    $('#select-filtre-'+notd).change(function(event,ui) {
		addOp($(this).attr('notd'),this.value);
	});

    $('#ET-'+notd).click(function() {
        var no = $(this).attr('notd');
        var curTr = $(this).attr('notr');
        addFilter(i,no,curTr,curTr,'ET');
        var next = $("#dyna_next-"+no).attr('value');
        $("#dyna_next-"+i).attr('value',next);
        $("#dyna_next-"+no).attr('value',i);
        i++;
	});

    $('#DEL-'+notd).click(function() {
       var _notd = $(this).attr('td');
       var _notr = $(this).attr('tr');
       if($('#tr-filtre-'+_notr+' td.td-filtre').length==1){
    	   $('#tr-filtre-'+_notr).remove();
    	   $('#tr-op-'+_notr).remove()
       }
       else $('#td-filtre-'+_notd).remove();
	});

	if (join != 'ET')
	{
	    $('#OU-'+notr).click(function() {
	        var no 	  = $(this).attr('notd');
	        var curTr = $(this).attr('notr');
	        addFilter(i,no,noOr,curTr,'OU');
	        var next = $("#dyna_next-"+no).attr('value');
	        $("#dyna_next-"+i).attr('value',next);
	        $("#dyna_next-"+no).attr('value',i);
	        i++;
	        noOr++;
		});
	}          

}



function addOp(id,id_fil,valueop,valueinp,labelinp,attach_mit) {
    var gab_op = jQuery.format($("#gabarit-op-"+id_fil).val(),id);
    var place_op = $('#op-'+id);
    place_op.empty();
    $(gab_op).appendTo(place_op);
	var option_op = null;
	if (valueop == undefined) option_op = $('#select-op-'+id+' option:first-child');
	else option_op = $('#select-op-'+id+' option[value="'+valueop+'"]');
	option_op.attr('selected','selected');
	var id_inp = option_op.attr('related');
	addInput(id,id_inp,valueinp,labelinp,attach_mit);
	$('#select-op-'+id).change(function() {
		addInput($(this).attr('notd'),$(this).children('option:selected').attr('related'));
    });        
}



function addInput(id,id_inp,valueinp,labelinp,attach_mit) 
{ 
	var gab_inp = jQuery.format($("#gabarit-in-"+id_inp).val());
	var place_inp = $('#input-'+id);
	place_inp.empty();
    $(gab_inp(id,valueinp,labelinp,attach_mit)).appendTo(place_inp);
}


var i = 1;
var noOr = 1;


function initFilter() {
	<?if (!isId($filter->id)):?>
    	addFilter(i++,1,noOr++,1,'');
    <?else: $parts_or = explode('OR',$filter->sequence);?>
    	var befortd = 1, befortr = 1 , isor = false;
    	<?foreach ($parts_or as $or): $parts_and = explode('AND',$or);?>
    		<?foreach ($parts_and as $and): $filt = $filters[$and];?>
    				addFilter(i,befortd,noOr,befortr,i==1?'':(isor?'OU':'ET')
    							,'<?=$filt->id_fildef?>','<?=$filt->id_op?>'
    							,'<?=$filt->value?>','<?=utf8_decode($filt->label)?>','<?=$filt->attach?>');
    				befortd = i++;
    		<?endforeach;?>
    		isor = true;
    		befortr = noOr++;
    	<?endforeach;?>
    <?endif;?>

    
    $('#DEL-1').css('visibility','hidden');
    $('#DEL-1').prev().hide();  

    jQuery.validator.addMethod("isalias", function(value, element) { 
		if (element.value == '<?=_('LABEL_FILTER')?>')  return false;
		 return true;
	});

    $("#smartfilter_form").validate({
		rules: {
			alias: {
    			required: true,
    			isalias: true
			}
		},
		messages: {
			alias: {
				required: "Saisisser un nom à votre filtre personalisé.",
				isalias: "Saisisser un nom à votre filtre personalisé."
			}
		}
	});
};

</script>
<!--  -->
<div style='display: none !important;'>
<textarea class="hide" id="gabarit-filtre">
	
    <td id='td-filtre-{0}' class='td-filtre' align="left">
    <script type="text/javascript">
	$(document).ready(function() { 
			/*$( "#DEL-{0}").button({
            icons: {
                primary: "ui-icon-closethick"
            },
            text: false});*/
			$( "#ET-{0}").button({text: true});
		});
	$('#DEL-{0}').hover(
		function () {
			$(this).addClass('ui-state-default ui-corner-all').css('margin','-1px');
			$('#td-filtre-{0}').addClass('ui-corner-all ui-state-hover').css({'font-weight':'normal','border':'0'});
	  	}, 
	  	function () {
	  		$(this).removeClass('ui-state-default ui-corner-all').css('margin','0px');
	  		$('#td-filtre-{0}').removeClass('ui-corner-all ui-state-hover');
	  	}
	);
	</script>
    <table>
    	<tr class='tr-title' style='border-spacing: 0px 2px'>
    		<td class=''>
    			<b>Règle {0}:</b>
    			
    		</td>
    		<td class='' align="">
    			<span id='DEL-{0}' td='{0}' tr='{2}' class='' title='supprimer cette règle' style='float:right;'>
    				<span class="ui-icon ui-icon-closethick" ></span>
    			</span>
    		</td>
    	</tr>
    	<tr>
    		<td class='filter-rules'>
			    <ul style='list-style-type: none;'>
			    	<input type='hidden' name='dyna_join-{0}' value='{1}'/>
			    	<input type='hidden' id='dyna_next-{0}' name='dyna_next-{0}' value=''/>
			    	
			        <li>
			            <select id="select-filtre-{0}" name="dyna_filtre-{0}" notd='{0}'>
			            <?foreach ($filtersdef as $key => $val) :?>
			                <option value="<?=$key?>" related="gabarit-op-<?=$key?>"><?='Filtrer par '.constant('_6_'.$key)?></option>
			            <? endforeach;?>
			            </select>
			
			        </li>
			        <li id='op-{0}'></li>
			        <li id='input-{0}'></li>
			    </ul>
	    	</td>
	    	<td id='td-op-{0}' height="100%" class='td-op' width="26px">
	    		<button id='ET-{0}' class='ET' notd='{0}' notr='{2}' type="button" value='ET' style='height: 100%'>ET</button>
	    	</td>
    	</tr> 
    </table>
    </td>
</textarea>


<? foreach ($filtersdef as $key => $filt) :?>
<textarea class='hide' id="gabarit-op-<?=$key?>" >
    <select id='select-op-{0}' name='dyna_op-{0}' notd='{0}'>
	<? foreach ($filt as $opin) :?>
          <option value="<?=$opin->op?>" related="<?=$opin->in?>"><?=utf8_encode($operators[$opin->op]->alias)?></option>
    <? endforeach;?>
    </select>
</textarea>
<? endforeach;?>



<? foreach ($inputs as $in):?>
<textarea style="display:none" id="gabarit-in-<?=$in->id?>">
	<?if($in->id != '5' && $in->id != '7'):?>	
	<div id="radio-{0}" style='font-size: 0.8em;float:right;margin-right:2px;color:#AC9A99' class='AND-OR-button-set'>
		Rattacher mes valeurs par l'opérateur: 
		<input type="radio" id="radio-OR-{0}" name="attach-{0}" checked="checked" value='OR'/><label class='radio-OR' for="radio-OR-{0}" style='font-size:0.9em;-moz-border-radius: 4px 0 0 0; -webkit-border-radius: 4px 0 0 0; border-radius: 4px 0 0 0;'>ou</label>
		<input type="radio" id="radio-AND-{0}" name="attach-{0}" value='AND'/><label class='radio-ET' for="radio-AND-{0}" style='font-size:0.9em;-moz-border-radius: 0 4px 0 0; -webkit-border-radius: 0 4px 0 0; border-radius: 0 4px 0 0;'>et</label>
	</div>
	<div class='cleared'></div>
	<?endif;?>
	<input id='input-txt-{0}' type='text' value="" name='dyna_txt-{0}' title=''/>
	<input id='input-inp-{0}' type='hidden' value="<?=$in->id?>" name='dyna_inp-{0}'/>   
    <script type="text/javascript">
	$(document).ready(function() { 
		<?if($in->id != '5' && $in->id != '7'):?>	
		$( "#radio-{0}").buttonset();
		$( "#radio-OR-{0}").click(function(){$(this).parent().parent().removeClass('ET-box');});
		$( "#radio-AND-{0}").click(function(){$(this).parent().parent().addClass('ET-box');});

		if ('{3}' == 'AND') {
			$( "#radio-AND-{0}").click();
			$( "#radio-{0} .radio-ET" ).click();
		}
		<?endif;?>
		
		var input{0} = null;	
		<?switch($in->type):
			case 'auto':?>
			_input{0} = new $.TextboxList('#input-txt-{0}', {unique: true, plugins: {autocomplete: {
				queryRemote: true,
				<?=$in->remote?>,
				<?=$in->rules?>
			}}});
			<?break;?>
			
			<?case 'text':
			default:?>
			_input{0} = new $.TextboxList($('#input-txt-{0}'),{bitsOptions:{editable:{addKeys: [188,13]}}});	
			<?break;?>
		<?endswitch;?>
		
		if ('{1}'=='undefined') return true;
		var values = '{1}'.split('+'),labels = '{2}'.split('+');
		for (var i = 0, I = values.length; i < I; i++) 
		{
			var html = labels[i];
			if (values[i]!='' && labels[i]!='') _input{0}.add(labels[i],values[i],html);
		}
	});
	</script>
</textarea>

<? endforeach;?>
</div>

<form id="smartfilter_form" class="" method="POST" action="/smartfilter/save" accept-charset="utf-8">

    <h2 id="summary"></h2>
  
	<div style='width:260px;'>

      	<input class='infieldlabel' placeholder='Alias du filtre...' type='text' value='<?=$filter->alias?>' name='alias' title='<?=_('LABEL_FILTER')?>' style='width:260px;'/><br/>
     	<input type='hidden' value='<?=$filter->id?>' name='idfilter'/> 
    </div>
                
    <fieldset>

        <legend>Gestion des règles de filtrage</legend>

        <table id="orderitems" >
            <tbody>
            </tbody>

            <tfoot>
            </tfoot>

        </table>

    </fieldset>

    <input type='submit' value='Soumettre'></input> <input type="button" class='close' value="Annuler"/>

</form>