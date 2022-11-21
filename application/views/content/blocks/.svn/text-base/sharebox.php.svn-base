                         <?
                         $serviceset = isset(me()->serviceset)? implode('!+!',me()->serviceset) : '';
						 
								$thumb75  = getPictureThumb(me()->id, me()->id_img, 75,me()->email);
								$thumb150 = getPictureThumb(me()->id, me()->id_img, 150,me()->email);
                         ?>   
                         			
									<img  title='<?=me()->name?>' class=" left boxy photo80" content="<img src='<?=$thumb150?>'/>" src="<?=$thumb75?>" alt="an image" style='cursor: pointer'>
								
                                	 <div id='1-share_Block' class="art-Block sharebox" style='float: left;padding:0 10px;'>
			             						
			                                    <div class="art-BlockContent-body --bg-block-soft --ui-corner-bottom" style=''>
			                                   		
					                               <div class="art-PostContent ">
					                               <div id="postupload" class='' style='z-index:-1;right:0;top:0;position: absolute;width:100%;height: 100%'></div>
					                               <form id='presta_form' class='ad_form' method='post' action='/ajax/post' style='padding:0'>  
					                                  <input id='flux_form' type='hidden' name='flux' value='<?=$postAct?>'/>
					                                  <input id='exist_collaborator' type='hidden' name='countColla' value='<?=$countColla?>'/>
					                                  <div class="pile-grp-img post-img left" id='postupload-grp-img'>
					                                  		<div class="meter orange hide" style="overflow: hidden">
																<span style="width:0"></span>
															</div>
															<!--
																<input id='postupload-hidden' type='hidden' name='thumb[]' value=''/>
						                                  		<img id="postupload-img" class="photo postupload-img hide" src="/media/img/nopic120.png" alt="upload your picture" style="height: 120px;width: 120px"/>
					                                		-->
													 </div>
													
													  <div class='inputs-post' style='float:left;width: 510px;'>
													  		<div class='container-title hide'> 
																  <input name='title' style='padding: 5px;width: 490px;margin-bottom: 10px;border: 1px solid #ccc' id='id-sharebox-title' value='' class="left ui-corner-all"  type='text' title='' placeholder="<?=_('Title of your content')?>"  >
												
																 <div class="cleared"></div>
															 </div>
															 
													  		 <div id="post-offer" style='margin-bottom:0px;color:#AC9A99;width: 510px;' class=' AND-OR-button-set left' >
																<input type="radio" id="post-news" name="type" <?php if($typeJournal!='OF' && $typeJournal!='AV') echo 'checked="checked"'?> value='NW'/>
																<label class='radio-post' for="post-news" onclick="changeShareBox('NW','TAG','<?=$me->profil?>')"  style='text-align: center;width:126px;font-size:0.9em;-moz-border-radius: 4px 0 0 0; -webkit-border-radius: 4px 0 0 0; border-radius: 4px 0 0 0;'>
																	<img src='/css/images/cnt_NW_ico25.png' width="16" height="16" style='border: none;margin: -2px 2px'/>
																	Scoop
																</label>
																<input type="radio" id="post-creation" name="type" <?php if($typeJournal=='CR')  echo 'checked="checked"'?> value='CR'/>
																<label class='radio-post' for="post-creation"   onclick="changeShareBox('CR','TAG','<?=$me->profil?>')"  style='font-size:0.9em;width:126px;-text-align: center;-moz-border-radius: 0 4px 0 0; -webkit-border-radius: 0 4px 0 0; border-radius: 0 4px 0 0;'>
																	<img src='/css/images/cnt_CR_ico25.png' width="16" height="16" style='border: none;margin: -2px 2px'/>
																	<?=_('CREATION')?>
																</label>
																<input type="radio" id="post-ask" name="type" <?php if($typeJournal=='QU')  echo 'checked="checked"'?> value='QU'/>
																<label class='radio-post' for="post-ask"   onclick="changeShareBox('QU','SER','<?=$me->profil?>')"  style='font-size:0.9em;width:126px;-text-align: center;border-right: none;'>
																	<img src='/css/images/cnt_QU_ico25.png' width="16" height="16" style='border: none;margin: -2px 2px'/>
																	<?=_('QUESTION')?>
																</label>
																<?/*<input type="radio" id="post-avis" name="type" <?php if($typeJournal=='AV')  echo 'checked="checked"'?> value='AV'/>
																<label class='radio-post' for="post-avis"   onclick="changeShareBox('AV','COL')"  style='font-size:0.9em;width:126px;-text-align: center;-moz-border-radius: 0 4px 0 0; -webkit-border-radius: 0 4px 0 0; border-radius: 0 4px 0 0;'>
																	<img src='/css/images/cnt_AV_ico25.png' width="16" height="16" style='border: none;margin: -2px 2px'/>
																	<?=_('CRITIQUE')?>
																</label>*/?>
																
																<input type="radio" id="post-job" name="type" <?php if($typeJournal=='OF') echo 'checked="checked"'?> value='OF'/>	
																<label class='radio-post' for="post-job" onclick="changeShareBox('OF_<?=$me->profil=='N'?'B':$me->profil?>','TAG','<?=$me->profil?>')"  style='font-size:0.9em;width:126px;text-align: center;-moz-border-radius: 0 4px 0 0; -webkit-border-radius: 0 4px 0 0; border-radius: 0 4px 0 0;'>
																	<img src='/css/images/cnt_OF_ico25.png' width="16" height="16" style='border: none;margin: -2px 2px'/>
																	<?=_('OFFER')?>
																</label>
															</div>
															  <?/*<div class='grp_title left'>
								                              	<div class="orange shortcut" style='float:left;'></div>
								                              	<input class='inp_title contentText infieldlabel' type='text' title='Titre' placeholder='<?=$postAct=='SV'?_('LABEL_TITLE_PRESTA'):_('LABEL_TITLE_JOB')?>' name='title' id='presta_title'>
															  </div>*/?>
															 <div class='grp_desc left' style='min-height:28px;margin:0 0 2px;position:relative'>
															  	<div class='speaker-bulle' style="top:5px;left:-20px;border-right-color: #ccc;"></div>
			             										<div class='speaker-bulle' style="top:5px;left:-19px;border-right-color: white;"></div>
			             										<div class="left" style="">
													  				<textarea class="inp_desc  content_input infieldlabel sharebox-desc mention" style='height:45px;width: 502px;border-radius:0 0 4px 4px;' title='' placeholder='' name='desc' id='presta_desc'></textarea>
																</div> 
															 </div>
															 
															 
															  <div class="left" style="margin:0px 0 6px;color:#ccc;width:500px;" >
								                               	<? if (0 && isme()):?>
									                               	<input disabled="disabled" type="checkbox" value="g+" name="share-goo" id="post-cc-gooplus" class="check">
																	<img src="/media/img/gooplus-16x16.png" style="margin-bottom: -2px;">&nbsp;
																	<input disabled="disabled"  type="checkbox" name="share-fb" value="fb" id="post-cc-facebook" class="check">
																	<img src="/media/img/facebook-16x16.png" style="margin-bottom: -2px;">
																<?endif;?>
																&nbsp;&nbsp;&nbsp;&nbsp;
																<span title="<?=isme()?_('BETA_FONCTION'):''?>">
																	<?=_('VISIBLE_BY')?> : <b><?=isme()?_('ALL_WORLD').' ▾':who()->name?></b>
																</span>
																<span id='postupload-button'  class='sharebox-upload right' onclick="$('#postupload input[name=file]').click()" title="<?=_('Add a picture')?>"
																	style="">
																</span>
																
																<a class='right' style="margin:3px 5px 0;text-decoration: underline;color:#8f8d89;cursor: pointer;font-size: 12px" title="<?=_('Add a title to your content')?>"
																onclick="$('.container-title').fadeIn('slow');$(this).fadeOut('slow')"><?=_('Add a Title')?></a>
															  </div>
															 
															  <div class="cleared"></div>
															  
								                              <div class='grp_tag_loc hide' style='width:510px;'>
							                              			<div class='textbox-TAG' style='float:left;width: 100%'>
							                              				<div class="left">
																			<input style='padding: 4px;width: 490px;margin-top: 0px' id='presta_tags' class="" type='text' title='Mot clefs, Tags' placeholder='' name='tags' value="<?=$serviceset?>">
																		</div>
																			<div class="right sharebox-paie" style="margin-right: 10px;">
																	  			<input name='paie' style='padding: 5px 50px 4px 5px;width: 50px;margin-top: 0px;border: 1px solid #ccc' id='price-offer' value='' class="left ui-corner-all"  type='text' title='price' placeholder='<?=_('Pay')?>'  >
																	  			<input name='currency' value='<?=getCurrency(me())?>' type='hidden'/>
																	  			<span style="float:right;margin:6px 10px 0 -50px"><?=getCurrency(me())?></span>
																	  		</div>
																	  </div>
							                              			<div class='textbox-COL hide' style='float:left;'> 
																	  	<div style='float:left;'>
																			<input style='padding: 4px;width: 490px;margin-top: -1px' id='textbox_collabo<?=$countColla?'':'-noid'?>' value='' class=""  type='text' title='Le collaboratteur concernné' placeholder='<?=_('LABEL_COLLABO')?>' name='collaborator<?=$countColla?'':'-noname'?>' >
																		</div>
																	</div>
							                              			<div class='textbox-SEV hide' style='float:left'>
							                              				<div class='service' id='question-service_input' title="Catégorie de service" value="">
																			<input id='question-service_hidden' class='hide' type='text' value='' name='servhide_q'/>
																		</div>
																	</div>
															  </div> 
							                          </div> 
							                          
			                               			 
													  
													  <div style='clear:both;'></div>
													  <span class='error'></span>
													  
														  	
							                                
														<div style='clear:both;'></div>
														<div id='postupload-result'></div>
														<div id="error-post2"></div>
														<?php // margin:0 10px;position:absolute;top:100px;width: 97%?>
														
														 <div id="error-post" class='area-error hide' style='bottom: -37px;;z-index: -1;width: 500px' >
															<table border="0" width="100%" cellpadding="0" cellspacing="0">
															<tr>
																<td class="red-left" ></td>
																<td class='red-right'><a class="close-red" style='class'><img style='margin-left:-20px' src="/css/images/messages/icon_close_red_in.gif"  alt="" /></a></td>
															</tr>
															</table>
														</div>
													
														<div style='clear:both;'></div>    
			                               		 </form> 
							                           		
			                                    </div>
			                                   
			                               	</div>
			                               	<div class="cleared"></div>
			                               	<div  class="sharebox-footer hide" style="width:500px;margin-top:5px">
			                               		<?if ($me->profil!='P'):?>
				                             		<button class='action button buttonv2 asker <?=($me->profil=='N' || $me->profil=='B'?'hide':'')?>' style='margin:2px 0;z-index:-1;width: 160px;padding:6px 0' 
				                             				onclick="$('#flux_form').val('JB');$('#presta_form').submit();" >
				                                		<?=_('Publier').($me->profil=='B' || $me->profil=='N'?' '._('AS_EN').' Asker':'')?>
				                                	</button>
				                                <? endif;?>
				                                
				                                <? if ($me->profil=='N' || $me->profil=='B'):?>
				                             		<button class='action button buttonv2 neutral' style='margin:2px 0;z-index:-1;width: 160px;padding:6px 0' 
				                             				onclick="$('#flux_form').val('NE');$('#presta_form').submit();" >
				                                		<?=_('Publier')?>
				                                	</button>
				                                <? endif;?>
				                              
				                                <?if ($me->profil!='C'):?>
				                                	<button class='action button buttonv1 provider <?=$me->profil=='N' || $me->profil=='B'?'hide':''?>' style='z-index: -1;margin:2px 0;width: 160px;padding:6px 0;<?=$me->profil!='P'?'float:left':''?>' 
				                                			onclick="$('#flux_form').val('SV');$('#presta_form').submit();" >
				                                		<?=_('Publier').($me->profil=='B' || $me->profil=='N'?' '._('AS_EN').' Provider':'')?>
				                                	</button>
				                                <? endif; ?>		
			                                </div>
			                   			  	   
                                </div>
                 <?//endif;?>
