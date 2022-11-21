
<div style='margin-left:10px;width:400px;float:left'>
 <form id="mainsearch" class='ET-box' method='post' action='/search/<?=$this->controller=='people'?'network':'flux'?>/'>             
	<div>
		<button id='submit-mainsearch' onclick="convertUrl()" type='submit'>Ƃ<span class='ti'>-</span>Ƌ</button>								
		<button type="button" name="context" id="input_bysearch" class='ui-corner-left' key='a'>Tous</button>
		<input type="text" value="" name="term" id="input_mainsearch" class='ui-corner-right' title=''/>
		<ul class="ul-filter" >
			<li class="wrapper"></li>
			<li class="li-critere"><a href="javascript:;"  key='a' value='Tous'>Tous</a><span class='right'>(shift+A)</span></li>
			<li class="li-critere"><a href="javascript:;" class="" key='c' value='Contenu'>Par contenu </a><span class='right'>(shift+C)</span></li>
			<li class="li-critere"><a href="javascript:;" class="" key='l' value='Lieu'>Par lieu</a><span class='right'>(shift+L)</span></li>
			<li class="li-critere"><a href="javascript:;" class="" key='p' value='Person'>Par personne</a><span class='right'>(shift+P)</span></li>
			<li class="li-critere"><a href="javascript:;" class="" key='t' value='Tag'>Par tag</a><span class='right'>(shift+T)</span></li>
			<li class="li-critere"><a href="javascript:;" class="" key='s' value='Service'>Par service</a><span class='right'>(shift+S)</span></li>
		</ul>
	</div>	
</form>
</div>
<? if(in_array($this->controller,array('people','content'))):?>
<div class='right'>
	<ul class='art-submenu'>
		<li class='<?=$this->controller=='people'?'active':''?>'><a href='/network'><span class='t'><?=_('NETWORK')?></span></a></li>
		<li class='<?=$this->controller=='content'?'active':''?>'><a href='/flux'><span class='t'><?=_('FLUX')?></span></a></li>
	</ul>
</div>
<? endif;?>
















<div class="poster" style='float:right;margin: -6px 0px 0px 100px;'>
                            			
		                        		<ul class="art-Post-menu art-post-share" style="margin:-20px 0 0 0">
		                        			<li class="logopost"><span class="art-PostHeaderIcon-wrapper"></span></li>
					                		<li id='1-share_Button' class="apply toogle down butshare" style='width: 300px;margin-right: 50px;'>
					                			
					                			<div id="post-offer" style='margin-right:0px;margin-top:4px;color:#AC9A99' class=' AND-OR-button-set right' >
													<?/*<input type='hidden' id='presta_flux' value='<?=$postAct?>' name=''/>*/?>
													<input type="radio" id="post-presta" name="service" <?php if( $postAct=='SV') echo 'checked="checked"'?> value='SV'/>
													<label class='radio-OR' for="post-presta" onclick="openShareBox('SV')" style='text-align: center;width:75px;font-size:0.9em;-moz-border-radius: 4px 0 0 0; -webkit-border-radius: 4px 0 0 0; border-radius: 4px 0 0 0;'>
														prestation 
													</label>
													<input type="radio" id="post-job" name="service" <?php if($postAct=='JB') echo 'checked="checked"'?> value='JB'/>
													<label class='radio-ET' for="post-job" onclick="openShareBox('JB')" style='font-size:0.9em;width:75px;-moz-border-radius: 0 4px 0 0; -webkit-border-radius: 0 4px 0 0; border-radius: 0 4px 0 0;text-align: center;'>
														recrutement
													</label>
												</div>
												<a class="" href="#" style='margin: 5px 5px 0px;float:right'>
					                					<span class="t" ><?='Poster une Offre de'?></span>
					                				</a>
					                		</li>
											<?/*<li id='2-share_Button' class="apply toogle"><a href="#"><span class="t" >une Offre d'Emploi / Mission</span></a></li>*/?>
					                	</ul>
					                	<div style='clear:both;'></div>   
									</div>