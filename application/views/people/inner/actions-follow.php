<?if ($this->session->isLogged() && $usr->id!=me()->id):
		$msgMdl = new YOO_MessageModel();
		$todayDeal = $msgMdl->checkDealedLastDay($usr->id);
		$followed = true;
		$work1 = false;
		$work2 = false;
		//$usr->me_ => you're traking him at least
		// $usr->_me){  he's traking you at least
		$act3 = $act2 = false;
		if ($usr->me_ == 'F' && $usr->_me == 'W' )
		{
			$act1 ='/ajax/attach/Y';
			$lbl1 = _('ACCEPT_DEAL');
			$tips1 = _('TIPS_ACCEPT_DEAL');
			$act2 ='/ajax/attach/N';
			$lbl2 = _('REJECT_DEAL');
			$tips2 = _('TIPS_REJECT_DEAL');
			/*$act3 ='/ajax/dettach';
			$lbl3 = DETTACH;
			$tips3 = TIPS_DETTACH;*/
		}
		elseif ($usr->me_ == '0' && $usr->_me == 'W' )
		{
			$followed = false;
			$act1 ='/ajax/attach/Y';
			$lbl1 = _('ACCEPT_DEAL');
			$tips1 = _('TIPS_ACCEPT_DEAL');
			$act2 ='/ajax/attach/N';
			$lbl2 = _('REJECT_DEAL');
			$tips2 = _('TIPS_REJECT_DEAL');
			/*$act3 ='/ajax/attach';
			$lbl3 = ATTACH;
			$tips3 = TIPS_ATTACH;*/
		}	
		elseif ($usr->me_ == 'A' && $usr->_me == 'A') // must both of them accepted
		{
			$act1 ='/ajax/attach/C';
			$lbl1 = _('UNDEAL');
			$tips1 = _('TIPS_UNDEAL');
			$act2 ='/ajax/dettach';
			$lbl2 = _('DETTACH');
			$tips2 = _('TIPS_DETTACH');
		}
		elseif ($usr->me_ == 'F' && ($usr->_me == 'F' || $usr->_me == '0') )
		{
			if ($todayDeal) 
			{
				$act1 ='/ajax/dettach';
				$lbl1 = _('DETTACH');
				$tips1 = _('TIPS_DETTACH');
			}
			else 
			{
				$work1 =  'href="/ajax/people/invitework/'.$usr->id.'/0"  titlebox="'._('INVIT').' '.$usr->name.' '._('TO_COLLABORATE').'" ';
				$act1 ='/ajax/attach/D';
				$lbl1 = _('DEAL');
				$tips1 = _('TIPS_DEAL');
				$act2 ='/ajax/dettach';
				$lbl2 = _('DETTACH');
				$tips2 = _('TIPS_DETTACH');
			}
		}
		elseif ($usr->me_ == '0' && ($usr->_me == 'F' || $usr->_me == '0') )
		{
			$followed = false;
			$act1 ='/ajax/attach';
			$lbl1 = _('ATTACH');
			$tips1 = _('TIPS_ATTACH');
			if (!$todayDeal) 
			{
				$work2 =  'href="/ajax/people/invitework/'.$usr->id.'/0"  titlebox="'._('INVIT').' '.$usr->name.' '._('TO_COLLABORATE').'" ';
				$act2 ='/ajax/attach/D';
				$lbl2 = _('DEAL');
				$tips2 = _('TIPS_DEAL');
			}
		}
		elseif ($usr->me_ == 'W' && ($usr->_me == 'F' || $usr->_me == '0') )
		{
			$act1 ='/ajax/cancel';
			$lbl1 = _('CANCEL_DEAL');
			$tips1 = _('TIPS_CANCEL_DEAL');
			$act2 ='/ajax/dettach';
			$lbl2 = _('DETTACH');
			$tips2 = _('TIPS_DETTACH');
		}


		$youHe = isme()?_('YOU'):$usr->name;
		if ($usr->me_=='A' && $usr->_me == 'A') {
			 $relicon = 'dealv2_ico16';
			 $reltitle = preg_replace(array('/\{#who\}/','/\{#user\}/'), array($youHe,$usr->name), _('TXT_RELATION_ME->>'));
		}
		else if ($usr->me_ && $usr->_me) {
			$relicon = '-me-_ico16';
			$reltitle = preg_replace(array('/\{#who\}/','/\{#user\}/'), array($youHe,$usr->name), _('TXT_RELATION_<-ME->'));
		}
		else if ($usr->me_) {
			$relicon = 'me-v2_ico16';
			$reltitle = preg_replace(array('/\{#who\}/','/\{#user\}/'), array($youHe,$usr->name), _('TXT_RELATION_ME->'));
		}
		else if ($usr->_me) {
			$relicon = '-mev2_ico16';
			$reltitle = preg_replace(array('/\{#who\}/','/\{#user\}/'), array($youHe,$usr->name), _('TXT_RELATION_<-ME'));
		}
		else {
			$relicon = 'no-relationv2_ico16';
			$reltitle = preg_replace(array('/\{#who\}/','/\{#user\}/'), array($youHe,$usr->name), _('TXT_RELATION_NONE'));
		}
		$reltitle = ucfirst($reltitle);
	?>

	<form class='form-attach' method="POST" action="<?=$act1?>" style='padding: 0;'>
		<? if ($act2):?>
		<a class="action button <?=$followed?'done':''?>" title="" style="cursor:default">
			<ul class='art-button-more'>
					<li class='art-libut-more <?=($work2?'boxy':'')?>' title="<?=$tips2?>" <?=($work2?$work2:'onclick="$(this).parents(\'form\').attr(\'action\',\''.$act2.'\').submit();"')?> >
						<span class='second-button'><?=$lbl2?></span>
					</li>
				<? if ($act3):?>
					<li class='art-libut-more' title="<?=$tips3?>" onclick="$(this).parents('form').attr('action','<?=$act3?>').submit();">
						<span class='second-button'><?=$lbl3?></span>
					</li>
				<? endif;?>
			</ul>
		<?	endif;?>
		<span class='left' title="<?=$reltitle?>"  style="margin:-2px  0 0px;padding:2px 0px 0 30px;background-image: url(/css/images/<?=$relicon?>.png);background-repeat: no-repeat;background-position: 0% 50%;">&nbsp;></span><span class='first-button hide <?=($work1?'boxy':'')?>' style='' title='<?=$tips1?>'
				<?=($work1?$work1:'onclick="$(this).parents(\'form\').attr(\'action\',\''.$act1.'\').submit();"')?>><?=$lbl1?></span>
		
		</a>
		<input type='hidden' name='id' value='<?=$usr->id?>'/>	  	
		<?/*<span class="l"> </span>
		<span class="r"> </span>
		<span>
				<input class="art-button" title='<?=$tips1?>' type='button' value="<?=$lbl1?>" style='width:145px;text-align: center'
				onclick="$(this).parents('form').attr('action','<?=$act1?>').submit();"/>
				<input type='hidden' name='id' value='<?=$usr->id?>'/>
		</span>*/?>
	</form>
	
<?endif;?>