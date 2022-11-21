<?
$me = $this->session->get('user');
list($location,$idspot) = isset($who->spot->id)? array(trim(getLocation($who->spot)),$who->spot->id):array(_('SOMEWHERE'),null);
if ($idspot==null) $locset = '';
else $locset = $location.'!#!'.$idspot.'!#!'.$location;

$setdegree = isset($who->degreeset)? implode('!+!',$who->degreeset):'';
$setweb = isset($who->webset)? implode('!+!',$who->webset):'';
$setskill = isset($who->skillset)? implode('!+!',$who->skillset):'';

$thumb = getPictureThumb($who->id, $who->id_img, 75);
$hd = $isme?'my':'his';
?>

	<div class='art-profil page-profil hide' id='<?=$hd?>-profil'>
		<? if($isme):?>
		<div id="profilupload" class='' style='z-index:-1;position:absolute;left:-200px;top:50px;width:150%;height: 100%'></div>
		<form id="profil-form" action="/user/save" method="post" style='margin:auto;width:650px;'>
		<?php else:?>
		<div style='margin:auto;width:650px;'>
		<? endif;?>	
			<h4 style='margin:-10px 0 2px 0'>
				<?= $who->firstname.' '.$who->lastname;?>
			</h4>
			
			<div class="cleared"></div>
			<div class="profil-tabs" style='min-height:300px;'>
				<ul class="ui-filter-fix" style='margin: 0 0px 15px 0px;' >
					<li class="ui-state-default ui-corner-bottom"><a href='#<?=$hd?>tabs-2'>A propos de moi</a></li>
					<li class="ui-state-default ui-corner-bottom ui-state-active"><a href="#<?=$hd?>tabs-1">Profil</a></li>
				</ul>
				<div id='<?=$hd?>tabs-1' style="" class='content-tab'>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td class="label">Contact détails</td>
							<td>
								<div class="left" style="width:60px;margin-left:-90px;">
								 	<span id='<?=$hd?>profil-lastname_label' class='label' style='line-height: 26px;text-align: right; width: 80px;'>Nom</span>
								 	<span id='<?=$hd?>profil-firstname_label' class='label' style='line-height: 26px;text-align: right; width: 80px;'>Prénom</span>
								 	<span id='<?=$hd?>profil-birth_label' class='label' style='line-height: 26px;text-align: right; width: 80px;'>Age</span>
								</div>
								<div class="left" style="width:100px;">
										<div id='<?=$hd?>profil-lastname' class='content <?=$isme?'edit':''?>' style='height: 20px'>
											<div id='<?=$hd?>profil-lastname_fix' class='fix_content' style="width:115px;line-height: 20px;"><?=$who->lastname?></div>
									  		<? if($isme):?>
									  		<input  id='<?=$hd?>profil-lastname_input' class="content_input styledinput hide" name="lastname" style="width:100px" title='Votre nom...' value="<?=$who->lastname?>"/>
											<div id='<?=$hd?>profil-lastname_box' class='hide postBox' style='margin-right:-70px;float:right'>
												<span class="yoo-icon right" title="éditer le champ">
													<span class="ui-icon ui-icon-pencil"></span>
												</span>
											</div>
											<? endif;?>
										</div>
										<div id='<?=$hd?>profil-firstname' class='content <?=$isme?'edit':''?>' style='height: 20px'>
											<div id='<?=$hd?>profil-firstname_fix' class='fix_content' style="width:115px;line-height: 20px;"><?=$who->firstname?></div>
									  		<? if($isme):?>
									  		<input  id='<?=$hd?>profil-firstname_input' class="content_input styledinput hide" name="firstname" style="width:100px"  title='Votre prénom...' value="<?=$who->firstname?>"/>
											<div id='<?=$hd?>profil-firstname_box' class='hide postBox' style='margin-right:-70px;float:right'>
												<span class="yoo-icon right" title="éditer le champ">
													<span class="ui-icon ui-icon-pencil"></span>
												</span>
											</div>
											<? endif;?>
										</div>
										<div id='<?=$hd?>profil-birth' class='content <?=$isme?'edit':''?>' style='height: 20px'>
											<div id='<?=$hd?>profil-birth_fix' class='fix_content' style="width:115px;line-height: 20px;"><?=$who->age?$who->age:''?></div>
									  		<? if($isme):?>
									  		<input  id='<?=$hd?>profil-birth_input' date='true' class="content_input styledinput date hide" name="birth" style="width:100px"  title='Votre date de naissance...' value="<?=$who->birthdate?>" onfocus=""/>
											<div id='<?=$hd?>profil-birth_box' class='hide postBox' style='margin-right:-70px;float:right'>
												<span class="yoo-icon right" title="éditer le champ">
													<span class="ui-icon ui-icon-pencil"></span>
												</span>
											</div>
											<? endif;?>
										</div>
								</div>
								
								 <div class="left profil-img" style='margin-left:25px;margin-right:-5px' onmouseover="/*$('#profilupload-button').fadeIn('slow')*/" >
										<input id='<?=$hd?>profilupload-hidden' type='hidden' name='thumb' value=''/>
                                  		<img id='<?=$hd?>profilupload-img' class="art-article" src="<?=$thumb?>" alt="Profile/Logo"/>
                                  		<? if($isme):?>
								 			<div class='my-upload-button hide' style='cursor: pointer;' onclick="$('#profilupload input[name=file]').click()">Uploader</div>
										<? endif;?>
								 </div>
													 
								 <div class="left" style="margin-left:20px;width:160px">
							 		<div id='<?=$hd?>profil-email' class='content' style='width:160px;height: 20px'>
										<div id='<?=$hd?>profil-email_fix' class='fix_content' style='float:right;width: 160px;margin-top:3px;margin-right:-60px'><?=$who->email?></div>
								  		<? if($isme):?>
								  		<input  id='<?=$hd?>profil-email_input' class="content_input styledinput hide" name="email" style="width:145px;float:right;margin-right:-50px"  title='Votre email...' value="<?=$who->email?>"/>
								 		<? endif;?>
								 		<div class='label' id='<?=$hd?>profil-email_label' style='line-height:22px;width:50px;float:right;margin-right:10px;text-align: right;'>Email</div>
										<? if($isme):?>
										<div id='<?=$hd?>profil-email_box' class='hide postBox' style='float:right;margin: 0 -220px -30px 0'>
											<span class="yoo-icon right" title="éditer le champ">
												<span class="ui-icon ui-icon-pencil"></span>
											</span>
										</div>
										<? endif;?>
									</div>
									<div id='<?=$hd?>profil-mobile' class='content <?=$isme?'edit':''?>' style='width:160px;height: 20px'>							 			
										<div id='<?=$hd?>profil-mobile_fix' class='fix_content' style='float:right;width: 160px;margin-top:3px;;margin-right:-60px'><?=$who->mobile?></div>
								  		<? if($isme):?>
								  		<input  id='<?=$hd?>profil-mobile_input' class="content_input styledinput phone hide" name="mobile" style="width:145px;float:right;margin-right:-50px"  title='Votre mobile...' value="<?=$who->mobile?>"/>
								 		<? endif;?>
								 		<div class='label' style='line-height:22px;width:50px;float:right;margin-right:10px;text-align: right;'>Mobile</div>
										<? if($isme):?>
										<div id='<?=$hd?>profil-mobile_box' class='hide postBox' style='float:right;margin: 0 -220px -30px 0'>
											<span class="yoo-icon right" title="éditer le champ">
												<span class="ui-icon ui-icon-pencil"></span>
											</span> 
										</div>
										<? endif;?>
									</div>
									<div id='<?=$hd?>profil-phone' class='content <?=$isme?'edit':''?>' style='width:160px;height: 20px'>							 			
										<div id='<?=$hd?>profil-phone_fix' class='fix_content' style='float:right;width: 160px;margin-top:3px;margin-right:-60px'><?=$who->phone?></div>
								  		<? if($isme):?>
								  		<input  id='<?=$hd?>profil-phone_input' class="content_input styledinput phone hide" name="phone" style="width:145px;float:right;margin-right:-50px"  title='Votre phone...' value="<?=$who->phone?>"/>
								 		<? endif;?>
								 		<div class='label' id='<?=$hd?>profil-phone_label' style='line-height:22px;width:50px;float:right;margin-right:10px;text-align: right;'>Phone</div>
										<? if($isme):?>
										<div id='<?=$hd?>profil-phone_box' class='hide postBox' style='float:right;margin: 0 -220px -30px 0'>
											<span class="yoo-icon right" title="éditer le champ">
												<span class="ui-icon ui-icon-pencil"></span>
											</span>
										</div>
										<? endif;?>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="label" id='<?=$hd?>profil-address_label'><div style='margin:5px 0'>Lieu</div></td>
							<td>
								<div id='<?=$hd?>profil-address' class='content <?=$isme?'edit':''?>' style='width:445px;height:40px;margin:5px 0'>
									<div id='<?=$hd?>profil-address_fix' class='fix_loc' style='float:left;width:445px;'>
										<?=$location?>
									</div>
									<? if($isme):?>
									<div class='hide' id='<?=$hd?>profil-address_input'>
										<input id='<?=$hd?>profil-address_input2' class='input-loc content_input styleinput' style="width:255px" type='text' name='address' title='Votre localisation...' value='<?=$locset?>'>
									</div>			
									<div id='<?=$hd?>profil-address_box' class='hide postBox' style='margin-left:60px;float:left'>
										<span class="yoo-icon right" title="éditer le champ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span> 
									</div>
									<? endif;?>
								</div>
							</td>
						</tr>
						<tr>
							<td id='<?=$hd?>profil-job_label' class="label"><div style='margin:5px 0'>Profession</div></td>
							<td>
								<div id='<?=$hd?>profil-job' class='content <?=$isme?'edit':''?>' style='width:445px;'>
									<div id='<?=$hd?>profil-job_fix' class='fix_content' style="width:445px;"><?=$who->job?></div>
							  		<? if($isme):?>
							  		<input class="textarea hide content_input"  name="job" id='<?=$hd?>profil-job_input' style='width:255px' value='<?=$who->job?>'/>
							  		<div id='<?=$hd?>profil-job_box' class='hide postBox' style='margin-left:47px;float:left'>
										<span class="yoo-icon right" title="éditer le champ" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span>
									</div>
									<? endif;?>
								</div>
							</td>
						</tr>
						
						<tr>
							<td id='<?=$hd?>profil-level_label' class="label" style='lin-height: 10px;margin:5px 0'>Expérience</td>
							<td>
								<div class="left" style="width:60px;margin-left:-90px;">
								 	<span class='label' style='line-height: 26px;text-align: right; width: 80px;'>Niveau</span>
								</div>
								<div class="left" style="width:445px;height: 25px">
									<div id='<?=$hd?>profil-level' class='content <?=$isme?'edit':''?>' style='width:445px;'>
										<div id='<?=$hd?>profil-level_fix' class='fix_content' style="width:445px;line-height: 20px;"><?=constant($who->level)?></div>
										<? if($isme):?>
										<select id='<?=$hd?>profil-level_input' class="content_input styledselect hide" name="level" style="width:260px;"  title='Votre niveau'>
											<option <?php if(constant($who->level) == _('JUNIOR')) echo 'selected'?> value="JUNIOR"><?=_('JUNIOR')?></option>
											<option <?php if(constant($who->level) == _('INTERMEDIATE')) echo 'selected'?> value="INTERMEDIATE"><?=_('INTERMEDIATE')?></option>
											<option <?php if(constant($who->level) == _('EXPERT')) echo 'selected'?> value="EXPERT"><?=_('EXPERT')?></option>
										</select>
										<div id='<?=$hd?>profil-level_box' class='hide postBox' style='margin-left:47px;float:left'>
											<span class="yoo-icon right" title="éditer le champ">
												<span class="ui-icon ui-icon-pencil"></span>
											</span>
										</div>
										<? endif;?>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td id='<?=$hd?>profil-yearsexp_label' class="label" style='lin-height: 10px;'><div style='margin:10px'></div></td>
							<td>
								<div class="left" style="width:60px;margin-left:-90px;">
									<span class='label' style='profil-yearsexp_label' style='line-height: 26px;text-align: right; width: 80px;'>Nbre d'années</span>
								</div>
								<div class="left" style="width:445px;height:25px">
									<div id='<?=$hd?>profil-yearsexp' class='content <?=$isme?'edit':''?>' style='width:445px;'>
										<div id='<?=$hd?>profil-yearsexp_fix' class='fix_content' style="width:445px;line-height: 20px;"><?=$who->yearsexp?></div>
								  		<? if($isme):?>
								  		<input  id='<?=$hd?>profil-yearsexp_input' class="content_input styledinput hide" name="yearsexp" style="width:255px"  title="Nombre d'années d'expériences" value="<?=$who->nbYearExp?>"/>
										<div id='<?=$hd?>profil-yearsexp_box' class='hide postBox' style='margin-left:47px;float:left'>
											<span class="yoo-icon right" title="éditer le champ">
												<span class="ui-icon ui-icon-pencil"></span>
											</span> 
										</div>
										<? endif;?>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="label" id='<?=$hd?>profil-serv_label' style="width:225px"><label for="servhide">Services prônés</label></td>
							<td>
								<div id='<?=$hd?>profil-serv' class='content <?=$isme?'edit':''?>' style='width:445px;'>
									<div id='<?=$hd?>profil-serv_fix' class='fix_tag' style='float:left;width:445px;min-height:100px'>
										<?if (isset($who->service)) foreach ($who->service as $tag):?>
												<a class="textboxlist-bit textboxlist-bit-box" style='text-decoration: none;color:#685840;cursor:pointer'><?=$tag?></a>
											<?endforeach;?>
									</div>
									<? if($isme):?>
									<div id='<?=$hd?>profil-serv_box' class='hide postBox' style='margin-left:60px;float:left'>
										<span class="yoo-icon right" title="éditer le champ" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span>
									</div>
									<? endif;?>
								</div>
								<? if($isme):?>
								<div id='<?=$hd?>profil-serv_input' class='hide'>
									<input id='<?=$hd?>profil-serv_hidden' class='hide' type='text' value='' name='servhide'/>
								</div>
								<? endif;?>
							</td>
						</tr>
						
					</table>
				</div>
				<div id="<?=$hd?>tabs-2" style="" class='content-tab hide'>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td class="label" style='lin-height: 10px;margin:5px 0'>Tags</td>
							<td>
								<div class="left" style="width:60px;margin-left:-90px;">
								 	<span id='<?=$hd?>profil-skill_label' class='label' style='line-height: 26px;text-align: right; width: 80px;'>Compétances</span>
								</div>
								<div class="left" style="width:445px;height: 40px">
									<div id='<?=$hd?>profil-skill' class='content <?=$isme?'edit':''?>' style='width:445px;'>
										<div id='<?=$hd?>profil-skill_fix' class='fix_tag' style='float:left;width:445px;'>
											<?if (isset($who->skill)) foreach ($who->skill as $tag):?>
												<a class="textboxlist-bit textboxlist-bit-box" style='text-decoration: none;color:#685840;cursor:pointer'><?=$tag?></a>
											<?endforeach;?>
										</div>
										<? if($isme):?>
										<div class='hide' id='<?=$hd?>profil-skill_input'>
											<input  id='<?=$hd?>profil-skill_input2' bulle="true" class="input-tags content_input styledinput" name="skill" style="width:255px"  title="Compétances" value="<?=$setskill?>"/>
										</div>
										<div id='<?=$hd?>profil-skill_box' class='hide postBox' style='margin-left:60px;float:left'>
											<span class="yoo-icon right" title="éditer le champ">
												<span class="ui-icon ui-icon-pencil"></span>
											</span>
										</div>
										<? endif;?>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="label" style='lin-height: 10px;'><div style='margin:10px'></div></td>
							<td>
								<div class="left" style="width:60px;margin-left:-90px;margin-bottom:20px">
									<span class='label' style='line-height: 26px;text-align: right; width: 80px;'>Diplomes</span>
								</div>
								<div class="left" style="width:445px;height:40px">
									<div id='<?=$hd?>profil-degree' class='content <?=$isme?'edit':''?>' style='width:445px;'>
										<div id='<?=$hd?>profil-degree_fix' class='fix_tag' style='float:left;width:445px;'>
											<?if (isset($who->degree)) foreach ($who->degree as $tag):?>
												<a class="textboxlist-bit textboxlist-bit-box" style='text-decoration: none;color:#685840;cursor:pointer'><?=$tag?></a>
											<?endforeach;?>
										</div>
										<? if($isme):?>
										<div class='hide' id='<?=$hd?>profil-degree_input'>
											<input  id='<?=$hd?>profil-degree_input2' bulle="true" class="input-tags content_input" name="degree" style="width:255px" title="Diplomes et études" value="<?=$setdegree?>"/>
										</div>
										<div id='<?=$hd?>profil-degree_box' class='hide postBox' style='margin-left:60px;float:left'>
											<span class="yoo-icon right" title="éditer le champ">
												<span class="ui-icon ui-icon-pencil"></span>
											</span> 
										</div>
										<? endif;?>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td id='<?=$hd?>profil-web_label' class="label" style="width:225px">Websites (URL)</td>
							<td>
								<div id='<?=$hd?>profil-web' class='content <?=$isme?'edit':''?>' style='width:445px;height:25px;margin-bottom:20px'>
									<div id='<?=$hd?>profil-web_fix' class='fix_tag' style='float:left;width:445px;'>
										<?if (isset($who->webs)) foreach ($who->webs as $tag):?>
											<a class="textboxlist-bit textboxlist-bit-box" style='text-decoration: none;color:#685840;cursor:pointer'><?=$tag?></a>
										<?endforeach;?>
									</div>
									<? if($isme):?>
									<div class='hide' id='<?=$hd?>profil-web_input'>
										<input class="content_input input-url"  bulle=true name="website" id='<?=$hd?>profil-web_input2' style='width:255px' value='<?=$setweb?>'/>
									</div>
									<div id='<?=$hd?>profil-web_box' class='hide postBox' style='margin-left:60px;float:left'>
										<span class="yoo-icon right" title="éditer le champ" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span>
									</div>
									<? endif;?>
								</div>
							</td>
						</tr>
						<tr>
							<td id='<?=$hd?>profil-aboutme_label' class="label">A propos de moi</td>
							<td>
								<div id='<?=$hd?>profil-aboutme' class='content <?=$isme?'edit':''?>' style='height: 100px;width:445px;'>
									<div id='<?=$hd?>profil-aboutme_fix' class='fix_content' style="width:445px;min-height: 90px;"><?=$who->shortdesc?></div>
							  		<? if($isme):?>
							  		<textarea class="textarea hide content_input" tabindex="7" name="shortdesc" id='<?=$hd?>profil-aboutme_input' style='height: 90px;width: 420px;'><?=$who->shortdesc?></textarea>
							  		<div id='<?=$hd?>profil-aboutme_box' class='hide postBox' style='margin-left:47px;float:left'>
										<span class="yoo-icon right" title="éditer le champ" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">
											<span class="ui-icon ui-icon-pencil"></span>
										</span>
									</div>
									<? endif;?>
								</div>
							</td>
						</tr>
						
					</table>
				</div>
			</div>	
			<br/>
			
			<div class='clear'></div>
			<? if($isme):?>
			<div style='margin:auto;width: 200px'>
				<input type="hidden" value="" name="id" id="id">
				<span class="art-button-wrapper" style='margin:-15px 130px -30px 0;'>
					<span class="l"> </span>
                    <span class="r"> </span>
                    <span><input class="art-button form-submit" type='submit' name='save' value='sauver'/></span>
                </span>
                <span class="art-button-wrapper" style='margin:-15px 40px 3px 0;'>
					<span class="l"> </span>
                    <span class="r"> </span>
                    <span><input class="art-button form-reset" type='button' name='close' value='fermer' onclick="$('#my-profil').slideUp();"/></span>
                </span>
			</div>
			<div id="message-success" class='hide' style='bottom:-5px;margin-left:-48px;position: absolute;width: 100%'>
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tbody><tr>
					<td class="green-left">Opération réussite: mise à  jour du profil achevée!</td>
					<td class="green-right"><a class="close-green" onclick="$('#message-success').fadeOut('slow')">
						<img style='margin-left:-1px' alt="" src="/css/images/messages/icon_close_green.gif"></a>
					</td>
				</tr>
				</tbody>
				</table>
			</div>
			<div id="summary" class='area-error hide' style='bottom:0px;margin: -29px 0px 0px -48px;position: absolute;width: 100%;' >
				<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="red-left" ></td>
					<td class='red-right'>
						<a class="close-red" style='class' onclick="$('#summary').fadeOut('slow')">
							<img style='margin-left:-20px' src="/css/images/messages/icon_close_red_in.gif"  alt="" />
						</a>
					</td>
				</tr>
				</table>
			</div>
			<div style='clear:both;'></div>
		</form>
		<? else:?>
		 <span class="art-button-wrapper" style='margin:-15px 300px 3px 0;'>
					<span class="l"> </span>
                    <span class="r"> </span>
                    <span><input class="art-button form-reset" type='button' name='close' value='fermer' onclick="$('#<?=$hd?>-profil').slideUp();"/></span>
                </span>
		</div>
		<? endif;?>
	</div>