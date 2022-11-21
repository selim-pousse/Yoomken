$(document).ready(function() { 
	
	$('.smart-Filtre input:checkbox').checkBox({icon:'check'});
	$('.filter-static input:radio').checkBox({icon:'bullet'});
	
	//$(".filter-boxy").click(function(e) {
	//	Boxy.load($(this).attr('href'),{afterShow:function(){initFilter();},modal:true,unloadOnHide:true,title:"Paramétrage du filtre",center:true/*,x:e.pageX,y:50*/});
	//});
	
	$("#menu-smartFilter a[typecrtl],.category-filter .filter-sub").click(function(e){
		//document.location.href= '/filter-+/'+ $(this).find('input:checkbox').val()+'/' + $(this).find('input[type=hidden]').val() ;
		e.preventDefault();
		var typeControleur = $(this).attr('typecrtl');
		var objData = null;
		
		/*if ($(this).attr('filter')=='static')
		{
			$('.filter-static a').removeClass('active');
			$(this).find('span').addClass('ui-icon ui-icon-check');
			$(this).find('b').addClass('active');
		}
		else */
		if ($(this).hasClass('filter-sub')) {
			objData = {type : $(this).attr('idalias'), journal : $(this).attr('journal')};
			
			$('.category-filter .filter-sub').removeClass('selected');
			$(this).addClass('selected');
		}
		else 
		{
			objData = {checked : $(this).attr('idalias')};
			
			if ($(this).hasClass('box-check-all')) {
				$("#menu-smartFilter .box-check input").removeAttr('checked').next().removeClass('ui-icon-check');
				$("#menu-smartFilter .elem-filter").removeClass('active');
			}
			else $(this).parent().find('.elem-filter').toggleClass('active');
			
			if ($(this).hasClass('box-check-all')) $('#resume-filter').html('');
			else if ($('#filter-tag-'+ objData.checked).length) $('#filter-tag-'+ objData.checked).remove();
			else {
				var textfilter = $(this).next().text();
				var newfil = $('<li id="filter-tag-'+ objData.checked +'" class="type-offer left"><a>'+ textfilter +'</a></li>');
				$('#resume-filter').append(newfil).show('hightlight');
			}
		}
		
		
		beg = 0;
		fetchMore(typeControleur,objData,0);
	});
	
	$(".delete-filter").click(function(e) {
		var url = $(this).attr('href');
		var title = $(this).attr('title');
		var alias = $(this).attr('alias');
		var li = $(this).parents('.filtre');
		if (alias == undefined) alias ='';
		else alias = "'"+alias+"'";
		Boxy.ask("Êtes-vous certain de vouloir "+title+" "+alias+"?", ['Oui', 'Annuler'], function(response) {
            if (response == 'Oui') {
            	$.getJSON (url,function(data){if (data.success) li.hide('drop',{direction:'right'},500,function(){$(this).remove();});});
            }
        });
	});
	
	
	$( "a.draggable" ).draggable({
		appendTo: "body",
		helper: "clone"
	});

	repeatForFilter('#art-main');
	//$( ".droppable .etiquette" ).draggable({ revert: true }).css('z-index:9999');
});

function repeatForFilter(id)
{
	$(id).find( ".droppable" ).droppable({
		activeClass: "ui-state-hover",
		hoverClass: "ui-state-highlight",
		accept: ":not(.ui-sortable-helper)",
		drop: function( event, ui ) {
			if (!$(this).find('#'+ui.draggable.attr('id')).length){
					// submit the form 
				var clone = ui.draggable.clone();
				var self = this;
				var val = clone.attr('id').split('-');
				var smaid = val[0];
				var smatyp = val[1];
				var actid = $(this).attr('idact');
				$.ajax({
					  url: '/ajax/filter/attach',
					  type:'POST',
					  dataType: 'json',
					  data: {idsmart:smaid,idact:actid,type:smatyp},
					  success: function(data)
					  {
						  if (data.success)
						  {
								//$( this ).find( ".placeholder" ).remove();
							  	var icon = $('<span href="/ajax/filter/dettach/'+smaid+'/'+actid+'/'+smatyp+'" class="dettach-filter right yoo-icon" title="déttacher le filtre"><span class="ui-icon ui-icon-closethick"></span></span>');
							  	$( "<li/>" ).append(icon).append(clone).appendTo( self );
							  	repeatForDetachFilter(self);
								return true;
						  }
					  }
				});
				
			}
			return false;
		}

	});
	repeatForDetachFilter('#art-main');
}

function repeatForDetachFilter(id)
{
	$(id).find(".dettach-filter").click(function(e) {
		var url = $(this).attr('href');
		var li = $(this).parent();
		$.getJSON (url,function(data){if (data.success) li.hide('drop',{},500,function(){$(this).remove();});});
	});
}