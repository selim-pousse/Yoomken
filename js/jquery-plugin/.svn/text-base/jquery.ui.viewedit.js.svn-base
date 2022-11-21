// JavaScript Document
// copyright selim pousse
jQuery(
    function ($) 
    {
		$.fn.viewedit = function (opt) {
		    return this.each(function()
			{
				opt = $.extend({
							json_url: null,
							deep:0,
							name:'default',
							data:null,
							labels: { onleft:label.serviceOnLeft, onright:label.serviceOnRight}
						},opt);
				
				var target = $(this).attr('id');
					 
				 function setUpPuce (_puce) {
					_puce.one("click", function(){
								var li = $(this).parent();
								var _pget = li.attr('valeur');
								if (_pget==-1 || _pget==0 || !_pget.length) _pget = '';
								if (opt.json_url != null)
								{
									$.ajax({
										type: "GET",
										url: opt.json_url+'/'+li.attr('deep')+'/'+_pget,
										dataType: "json",
										success: function(data) {
											extendTree(data,li);
											//gochecked(li.children('.box-check'));
											_puce.removeClass('ui-icon-circle-plus').addClass('ui-icon-circle-minus');
											if (li.next('ul').size()) {
												//li.next('ul').children('li:first-child').children('.puce').trigger('click');
												li.next('ul').children('li').children('.puce').trigger('click');
												if (li.attr('deep')>=1 /*&& li.parent().children('li:first-child').attr('valeur') == li.attr('valeur')*/ ) {
													_puce.removeClass('ui-icon-circle-minus').addClass('ui-icon-circle-plus');
													if (li.next('ul').size()) li.next('ul').hide();
												}
											}
										}
									});
								}
								else if (opt.data != null) {
									extendTree( opt.data,li);
									//gochecked(li.children('.box-check'));
									_puce.removeClass('ui-icon-circle-plus').addClass('ui-icon-circle-minus');
								}
								li.next('ul').toggle();
								
							}).click( function () {
								 if (1) {
		                                if($(this).parent().next('ul').is(':hidden'))
		                                    $(this).removeClass('ui-icon-circle-plus').addClass('ui-icon-circle-minus');
		                                else 
		                                    $(this).removeClass('ui-icon-circle-minus').addClass('ui-icon-circle-plus');
		                                $(this).parent().next('ul').toggle();
		                           }
	                                
                            });
				}
				 
				 
				 function setUpBox(_box) {
					// attribution d'un id unique pour chaque puce
					var idbox = 'box-'+_box.parent().attr('valeur');
					   _box.attr('id',idbox).addClass(idbox)
						   .attr('enabled','true')
						   .hover(
								function(event) {
									if(_box.attr('enabled')) _box.addClass("ui-state-hover");
								}, function(event) {
									if(_box.attr('enabled')) _box.removeClass("ui-state-hover");
								});
					   		
							_box.click(function(){
								 if(_box.attr('enabled')) 
								 {	 
									 var checked = _box.children('span').hasClass('ui-icon-check');
									 var ptBox;
									 //Attention, le comportement est diffÃ©rent selon si le box est dÃ©jÃ  insÃ©rÃ© dans le DOM ou en electron libre
									 if (_box.parent().parent().size())
										ptBox  = $('#'+ target + ' .'+idbox); // box existe dÃ©ja dans le DOM
									 else 
										 ptBox = [_box]; // box en electron libre (pas encore dans le DOM)
										 
									 $.each(ptBox,
										function () {
											if (checked) $(this).children('span').removeClass('ui-icon ui-icon-check');
											 else $(this).children('span').addClass('ui-icon ui-icon-check');
											gochecked($(this));
										}
									);
									 
									 checked = !checked;
									 if (checked){
										$('#'+ target + ' .resumeview').append(
											'<div id="view_'+ idbox +'" class="ui-state-default ui-priority-secondary enveloppe" style="overflow:hidden">' +
												'<div class="oneview">'+_box.parent().text() +
													'<input type="hidden" name="' + opt.name +'[]" alias="'+_box.parent().text()+'" value="'+ _box.parent().attr('valeur')+'"/>' +
												'</div>' +
											'</div>');
										$('#'+ target + ' #view_'+ idbox).click(function() {
																$('.'+idbox).each(
																		function () {
																			$(this).children('span').removeClass('ui-icon ui-icon-check');
																			gochecked($(this));
																		});
																$(this).remove();
															})
															.hover(function(event) {
																$(this).addClass("ui-state-error");
															}, function(event) {
																$(this).removeClass("ui-state-error");
															});
									 }
									 else {
										 $('#'+ target + ' #view_'+ idbox).remove();
									 }
								}
							});
					return $(this);
				 }
				 
				function extendTree(data,node){
					var ul = $(document.createElement("ul"));
					var proof;
					$.each(data, 
							function(i, val)
							{	
								if (val.value=='null' || val.value==undefined || val.value=='') {
									ul.text(val.caption);
									proof = val.deep;
								}
								else {
									ul.append(addItem(val,proof));
								}
							}
						);
					node.after(ul);
				 }
				 
				
				 
				  function gochecked(node) {
					var idli = node.attr('id');
					$('#'+ target + ' #view_'+ idli).remove();
					var ele = node.parent().next('ul').children('li').children('div.box-check').each(
						function () {
							if ($(this).length){
								var checked = node.children('span').hasClass('ui-icon-check');
								if (checked){
									$(this).children('span').addClass('ui-icon ui-icon-check');
									$(this).addClass('box-disabled');
									$(this).removeAttr('enabled');
								}
								else {
									$(this).children('span').removeClass('ui-icon ui-icon-check');
									$(this).removeClass('box-disabled');
									$(this).attr('enabled','true');
								}
								gochecked($(this));
							}
						}
					);
				 }
				 
				 function addItem(obj,proof)
				 {
					var puce = $(document.createElement("span"));
					if (opt.profondeur > proof) {
						puce.addClass("puce ui-icon ui-icon-circle-plus");
						setUpPuce(puce);
					}
					else {
						puce.addClass("puce");
						puce.css({'padding':'5px'});
					}
					var check = $(document.createElement("span"));
					var box = $(document.createElement("div"));
					box.addClass("box-check")
					   .append(check);
					var texte = $(document.createElement("span"));
					texte.text(obj.caption)
						 .addClass("li-text");
					var li = $("<li/>");
					li.attr('valeur',obj.value)
					  .attr('deep',proof)
					  .prepend(texte)
					  .prepend(box)
					  .prepend(puce);
					
					setUpBox(box);
					texte.click(function(){
						box.trigger('click');
						//gochecked(box);
					});
					if (obj.selected) {
						box.trigger('click');
						//gochecked(box);
					}
					return li;
				 }
				 
				 function init(racine) {
					var li = addItem({caption:"Tous",value:"all"},0);
					var ul = $(document.createElement("ul"));
					ul.append(li);
					 viewedit = $(document.createElement("div"));
					 viewedit.addClass('viewedit')
					 		 .append('<div class="selections" style="font-size:10px;margin-bottom:6px;padding:2px" >'+opt.labels.onleft+'</div>')
							 .append(ul);
					 
					 resumeview = $(document.createElement("div"));
					 resumeview.addClass('resumeview');
					 resumeview.append('<div class="selections" style="font-size:10px;margin-bottom:6px;padding:2px">'+opt.labels.onright+'</div>');
					 
					 racine.append(viewedit)
						   .append(resumeview);
					 
					 li.children('.puce').trigger('click');
					 li.parent().css({'height':'170px',marginTop:'-0px'}).children().hide();
				}
				init($(this));
				return $(this);
			});
		 }
	}
);