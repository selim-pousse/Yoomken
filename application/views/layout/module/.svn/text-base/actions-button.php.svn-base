
<? if ($this->session->isLogged()):?>
	<div class='actions-profil' >
		<? if ($usr->id == me()->id):?>
			<div class="art-button-wrapper left" >
					  	<a href="#" action="/ajax/myprofil/" <?//onclick="loadMyProfil();"?>  idact='id-myp' class="action button myprofil get-more" title="" style="cursor:default">
					  		<span class='left' title=""  style="margin:-7px 0 -5px;padding:7px 0px 5px 30px;background-image: url(/css/images/ico-pen.png);background-repeat: no-repeat;background-position: 0% 50%;">></span><span class='first-button hide' style=''>Modifier profil</span>
					  	</a>
				</div>
				
				
				<? if ($all =='true' ):?>
				<div class="art-button-wrapper left" >
					  	<a href="#" action="/ajax/myoptions/" <?//onclick="loadMyOptions();"?> idact='id-myo' class="action button myprofil get-more" title="" style="cursor:default">
					  		<span class='left' title=""  style="margin:-5px 0;padding:5px 0px 5px 30px;background-image: url(/css/images/ico-gear.png);background-repeat: no-repeat;background-position: 0% 50%;">></span><span class='first-button hide' style=''>Paramètres</span>
					  	</a>
				</div>
				<?endif;?>
		<? else:?>
			<div class="art-button-wrapper left <?=$usr->id?>-follow" >
				 <?=$this->render('people/inner/actions-follow',array('usr'=>$usr));?>
			</div>	
		
			<? if ($all =='true' ):?>
				<div class="art-button-wrapper left" >
				  	<a class="action button" title="" style="cursor:default">
				  		<ul class="art-button-more">
				  			<li class="art-libut-more boxy" title="<?=_('ASK').' '.$usr->name.' '._('FOR').' Badge'?>" href="/ajax/badges/transfert/user/ASK/<?=who()->id?>" titlebox="<?=_('ASK').' '.$usr->name.' '._('FOR').' Badge'?>">
				  				<span class='second-button'><?=_('ASKING BADGE')?></span>
				  			</li>
				  		</ul>
				  		<span class='left' title=""  style="margin:-7px 0 -5px;padding:7px 0px 5px 30px;background-image: url(/media/img/badges/badge.png);background-repeat: no-repeat;background-position: 0% 50%;">></span><span class='first-button hide boxy' href="/ajax/badges/transfert/user/GIV/<?=who()->id?>"  titlebox="<?=_('GIVE BADGE').' '._('TO').' '.$usr->name?>" title="<?=_('GIVE BADGE').' '._('TO').' '.$usr->name?>" style=''><?=_('DON BADGE')?></span>
				  	</a>
				</div>
				
				
				<div class="art-button-wrapper left">
					<div class='form-recommand left' style='padding: 0;margin: 0;' >
					  	<div href="/ajax/people/recommand/<?=$usr->id?>" class="action button boxy" title="" style="cursor:default" titlebox="<?=_('RECOMMAND').' '.$usr->name.' '._('TO')?>">
					  		<span class='left' title=""  style="margin:-7px 0 -5px;padding:7px 0px 5px 30px;background-image: url(/css/images/plus_like2.png);background-repeat: no-repeat;background-position: 0% 50%;">></span><span class='first-button hide' style=''><?=_('RECOMMAND')?></span>
					  	</div>
					</div>
				</div>
			<?endif;?>
			
			<? if( $usr->id != me()->id /*&& $usr->count_collaboWithMe*/ && ($usr->status==1 || $usr->status==2) ) :
			
				$href = '#';$classAction = '';
				if ($usr->me_!='A') { $classAction = 'boxy'; $href='/ajax/people/invitework/'.$usr->id.'/1';}
				elseif ($all !='true') {$classAction = 'get-more';}
				else if ($all == 'true') $href = '/'.$usr->url.'/messages';
			?>
			<div class="art-button-wrapper left" >
				<form action="/" method="post" >
				  	<a href="<?=$href?>" class="action button <?=($usr->count_msg?'done':'')?> <?=$classAction?>" title="contact" titlebox="<?=_('INVIT').' '.$usr->name.' '._('TO_COLLABORATE')?>" style="cursor:default" id='msg-more-<?=$usr->id?>'  idact='<?=$usr->id?>' action='/ajax/tchat/view/'>
				  		<span class='left' title=""  style="margin:-2px;padding:2px 0px 2px 30px;background-image: url('/css/images/letter-icon.png');background-repeat: no-repeat;background-position: 10% 60%;">></span></span><span class='first-button hide' style=''>Contacter</span>
				  	</a>
				</form>
			</div>
		<? endif;?>
		
		<?endif;?>
	</div>
<? endif;?>