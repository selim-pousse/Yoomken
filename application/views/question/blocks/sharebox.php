                         <?//$postAct=='SV'????>   		
                                	 <div id='share-question_Block' class="art-Block sharebox" style='margin:auto;width:471px;margin-bottom:20px'>
			                            <div class="art-Block-body">
			                                <div class="art-BlockContent">
			                                    <div class="art-BlockContent-body bg-block-soft ui-corner-bottom" style='padding:15px;'>
			                                    	
					                               <div class="art-PostContent ">
					                               <form id='question_form' class='ad_form' method='post' action='/ajax/ask' style='padding:0'>  
					                                  <input id='flux_form' type='hidden' name='flux' value='<?=$postAct?>'/>
					                                  <input id='type_form' type='hidden' name='type' value='QU'/>
					                                  
													  <div class='inputs-post' style='float:left;width: 510px;'>
															  <div class='grp_desc left' style='min-height:28px;margin:0px 0 5px'>
															  <span class="orange shortcut" style='float:left'></span>
													  			<textarea class="inp_desc contentArea infieldlabel content_input autoresize tordu" style='height:28px;width: 430px;border-radius:0 0 4px 4px' title='' placeholder="<?=_('LABEL_DESC_QUESTION')?>" name='desc' id='presta_desc'></textarea>
																 <label for="presta_desc" generated='false' class="error" style='margin-left:20px;'></label>
															 </div>
							                          </div>  
													  <div style='clear:both;'></div>  
						                              <div class='grp_tag_loc' style='width:465px;'>
					                              			<div style='float:left'>
					                              				<div class='service' id='question-service_input' title="Catégorie de service" value="">
																	<input id='question-service_hidden' class='hide' type='text' value='' name='servhide_q'/>
																</div>
															 </div>
													  </div> 
													  
													  <div style='clear:both;'></div>
													  <span class='error'></span>
													  
														  	<?//die($me->profil);
														  	  if ($me->profil!='P'):?>
															  	<span class="art-button-wrapper right" style='background-color: #F1EEE9;margin: 17px 0px -45px 0;z-index:-1;' onclick="$('#flux_form').val('JB');$('#question_form').submit();" >
																	<span class="l" style='background-position: left top;'> </span>
							                                		<span class="r" style='background-position: left top;'> </span>
							                                		<span><input class="art-button" type="button" name='custo' style='width:150px;text-align:center' value='<?=_('Publier').($me->profil=='B'?' en Asker':'')?>'/></span>
							                                	</span>
							                                <? endif;?>
							                                <?if ($me->profil!='C'):?>
							                                	<span class="art-button-wrapper left" style='background-color: #F1EEE9;margin: 17px 0px -45px 0px;z-index: -1;' onclick="$('#flux_form').val('SV');$('#question_form').submit();" >
																	<span class="l" style='background-position: left bottom;'> </span>
							                                		<span class="r" style='background-position: left bottom;'> </span>
							                                		<span><input class="art-button" type='button' name='presta' style='width:150px;text-align:center' value='<?=_('Publier').($me->profil=='B'?' en Provider':'')?>'/></span>
							                                	</span>
							                                <? endif; ?>
							                                
														<div style='clear:both;'></div>
														<?php // margin:0 10px;position:absolute;top:100px;width: 97%?>
														
														 <div id="error-post" class='area-error hide' style='bottom: -28px;margin-left:-15px;position: absolute;' >
															<table border="0" width="100%" cellpadding="0" cellspacing="0">
															<tr>
																<td class="red-left" ></td>
																<td class='red-right'><a onclick="$('#error-post').hide();" class="close-red"><img style='margin-left:-20px' src="/css/images/messages/icon_close_red_in.gif"  alt="" /></a></td>
															</tr>
															</table>
														</div>
													
														<div style='clear:both;'></div>    
			                               		 </form> 
							                           		
			                                    </div>
			                                   
			                               	</div>
			                               	<div  class="footer-sharebox"> </div>
			                            </div>
			                        </div>
			                        
													  	   
                                </div>
                 
