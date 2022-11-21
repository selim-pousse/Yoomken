
var mainsearch = null;


//pre-submit callback 
function convertUrl() {
	var vars = $("#mainsearch").formSerialize();
	var term = vars.split('=');
	if (term[1]!=label.search && term[1]!='')
		document.location.href = $("#mainsearch").attr('action')+term[1].replace(/%2F/,'/');
	else 
		document.location.href = $("#mainsearch").attr('action');
	
    return false;
}



$(document).ready(function() {
	//attach handler to form's submit event 
	$('#mainsearch').submit(convertUrl);
	
	//,bitsOptions:{editable:{stopEnter:false}}
	mainsearch = new $.Smartsearch($('#input_mainsearch'),{plugins: {autocomplete: {
		queryRemote: true, onlyFromValues :true,remote:{ controller:system.controller}
	}}});
	
	
	$('#input_bysearch').click(function(){
		$('.ul-filter li a[key="'+$(this).attr('key')+'"]').parent().toggleClass('hide');
		$('.ul-filter').toggleClass('ul-filter-show');
		$(this).toggleClass('down');
		//console.log($(this).attr('key'));
		
	});
	
	$('.ul-filter li a').click(function(){
		//$('.ul-filter li a').show();
		$('#input_bysearch').click();
		$('#input_bysearch').text($(this).attr('value'));
		$('#input_bysearch').attr('key',$(this).attr('key'));
		//$('.ul-filter').removeClass('ul-filter-show');
	});
	//'#mainsearch'
	$(document).ctrl('P',true,function(){
		$('#input_bysearch').text('Person');
		$('#input_bysearch').attr('key','p');
	});
	$(document).ctrl('A',true,function(){
		$('#input_bysearch').text('Tous');
		$('#input_bysearch').attr('key','a');
	});
	$(document).ctrl('I',true,function(){
		$('#input_bysearch').text('Tous');
		$('#input_bysearch').attr('key','i');
	});
	$(document).ctrl('T',true,function(){
		$('#input_bysearch').text('Tag');
		$('#input_bysearch').attr('key','t');
	});
	$(document).ctrl('S',true,function(){
		$('#input_bysearch').text('Service');
		$('#input_bysearch').attr('key','s');
	});
	$(document).ctrl('C',true,function(){
		$('#input_bysearch').text('Contenu');
		$('#input_bysearch').attr('key','c');
	});
	$(document).ctrl('L',true,function(){
		$('#input_bysearch').text('Lieu');
		$('#input_bysearch').attr('key','l');
	});
	
});
