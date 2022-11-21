<?php 
$type = $act->type;
switch ($type)
{
		case 'FU':
		case 'CU':
		case 'LU':
			$contentSentence 	= ' ' . ($type=='FU'?_('NOWFOL'):($type=='CU'?_('NOWCOLLABO'):_('NOWRECOMAND'))) . ' ';			
			$fwings				= explode(";",$act->related);
			if (isset($act->userplus))
			{
				foreach($fwings as $key=>$fwing)
				{
					if (isset($act->userplus[$fwing]))
					{
						if (in_array($type,array('FU','LU','CU')) )
						{
							$contentSentence .= '<a href="/' . $act->userplus[$fwing]->url . '/timeline/wall">' . $act->userplus[$fwing]->name . '</a>';
						}
						if ( $key== count($fwings)-2)
						{
							$contentSentence.= ' '.strtolower(_('AND')).' ';
						}
						else if ($key==count($fwings)-1)
						{
							break;
						}
						else
						{
							$contentSentence.=', ';
						}
					}
				}
			}
			break;
		case 'LA':
			$fol 	= $act->related;
			if (isset($act->actplus))
			{
				if (isset($act->actplus[$fol]))
				{
					$contentSentence 	= ' ' . preg_replace('/\{\#user\}/','<a href="/'.$act->actplus[$fol]->user->url.'/timeline/journal">'.$act->actplus[$fol]->user->name.'</a>',_('LIK_ACT'))
											. '<br>'. $act->actplus[$fol]->shortdesc .'<a href="/journal/' . $act->actplus[$fol]->id . '"> ('._('GETMORE').')</a>';
				}
			}
			break;
		case 'GB':
		case 'RB':
			if (isset($act->bdgplus[$act->related->badge]) && isset($act->userplus[$act->related->towho]))
			{
				$joomla = ($act->type=='GB')?_('HAVE_GIVEN_TO_USER'):_('HAVE_RECEIVED_FROM_USER');
				$contentSentence 	=  preg_replace('/\{\#user\}/','<a href="/'.$act->userplus[$act->related->towho]->url.'">'.$act->userplus[$act->related->towho]->name.'</a>',$joomla)
										. ' '.'<a href="/badges/' . $act->bdgplus[$act->related->badge]->name . '">'. $act->bdgplus[$act->related->badge]->title .' </a>';
			}
			
			break;
		case 'SU':
			/*$typeName 			= MENU_SIGN_UP;
			$contentSentence 	= HASJOIN;*/
			break;
			
		case 'PU': 
			$contentSentence = $isservice = false;
			$related = json_decode($act->related,true);		
			if( $related != '' )
			{
				if(isset($related['services']) && $related['services'])
				{
					$isservice = true;
					if($contentSentence)
						$contentSentence.=", ";
					$contentSentence.=(me()->lang=='fr'?_('HIS_HER_S'):($act->user->gender=='M'?_('HIS'):_('HER')) ).' '.strtolower(_('SERVICES_FOLLOWED'));	
				}
				if (isset($related['fullname']) && $related['fullname'])
				{
					if($contentSentence)
						$contentSentence.=", ";
					$contentSentence	.= (me()->lang=='fr'?_('HIS'):($act->user->gender=='M'?_('HIS'):_('HER')) ).' '.strtolower(_('FULLNAME'));
				}
				/*if(isset($related['gender']) && $related['gender'])
				{
					if($contentSentence)
						$contentSentence.=", ";
					$contentSentence.=_('HIS').' '.strtolower(_('GENDER'));	
				}*/
				if(isset($related['birthday']) && $related['birthday'])
				{
					if($contentSentence)
						$contentSentence.=", ";
					$contentSentence.=(me()->lang=='fr'?_('HER'):($act->user->gender=='M'?_('HIS'):_('HER'))).' '.strtolower(_('BIRTHDATE'));	
				}
				if(isset($related['shortdesc']) && $related['shortdesc'])
				{
					if($contentSentence)
						$contentSentence.=", ";
					$contentSentence.=(me()->lang=='fr'?_('HER'):($act->user->gender=='M'?_('HIS'):_('HER'))).' '.strtolower(_('BIOGRAPHIE'));	
				}
				if(isset($related['mobile']) && $related['mobile'])
				{
					if($contentSentence)
						$contentSentence.=", ";
					$contentSentence.=(me()->lang=='fr'?_('HIS'):($act->user->gender=='M'?_('HIS'):_('HER'))).' '.strtolower(_('NO_TEL'));	
				}
				if(isset($related['spot']) && $related['spot'])
				{
					if($contentSentence)
						$contentSentence.=", ";
					$contentSentence.=(me()->lang=='fr'?_('HIS'):($act->user->gender=='M'?_('HIS'):_('HER'))).' '.strtolower(_('LOCATION'));	
				}				
				if(isset($related['email']) && $related['email'])
				{
					if($contentSentence)
						$contentSentence.=", ";
					$contentSentence.=(me()->lang=='fr'?_('HIS'):($act->user->gender=='M'?_('HIS'):_('HER'))).' '.strtolower(_('EMAIL'));	
				}
				if(isset($related['picture']) && $related['picture'])
				{
					if($contentSentence)
						$contentSentence.=", ";
					$contentSentence.=(me()->lang=='fr'?_('HER'):($act->user->gender=='M'?_('HIS'):_('HER'))).' '.strtolower(_('PROFILE_PICTURE'));	
				}
				if(isset($related['url']) && $related['url'])
				{
					if($contentSentence)
						$contentSentence.=", ";
					$contentSentence.=(me()->lang=='fr'?_('HIS'):($act->user->gender=='M'?_('HIS'):_('HER'))).' '.strtolower(_('PSEUDO'));	
				}
				if(isset($related['calendar']) && $related['calendar'])
				{
					if($contentSentence)
						$contentSentence.=", ";
					$contentSentence.=(me()->lang=='fr'?_('HIS'):($act->user->gender=='M'?_('HIS'):_('HER'))).' '.strtolower(_('UPD_CALENDAR'));	
				}
				if (!$contentSentence)
				{
					$contentSentence = (me()->lang=='fr'?_('HIS'):($act->user->gender=='M'?_('HIS'):_('HER'))).' '.strtolower(_('PROFILE'));
				}
				
			}

			$contentSentence= strtolower($contentSentence);
			$contentSentence 	= ' ' . _('HAS_UPDATED') . ' <a href="/boxy/profil/'.$act->user->id.'" class="boxy" titlebox="'.$act->user->name.' ▸ Profil" title="'.$act->user->name.'">'.$contentSentence .'</a>.';
			
			break;
	default:
			return;
}

$typePIC = array('FU' => 'act_FU_ico25',	'LU' => 'act_LU_ico25','LA' => 'act_LA_ico25',	'CU' => 'act_CU_ico25', 'PU' => 'act_PU_ico25','GB' => 'act_GB_ico25','RB' => 'act_GB_ico25');

// for user location, it depends; we prioritize on meta value, otherwise id_spt_usr
//
list($location,$idspot) = isset($act->spot->id) && $act->spot->id!='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' ? array(getLocation($act->spot,true),$act->spot->id) : ( isset($act->user->spot->id) ? array(getLocation($act->user->spot,true),$act->user->spot->id) : array(_('SOMEWHERE'),null) );
if ($idspot==null) $locset = '';
else $locset = $location.'!#!'.$idspot.'!#!'.$location;
$this->set('location',$location);
//_debug($idspot);

$isOwner = ($this->session->isLogged() && $this->session->getUserVar('id')==$act->user->id);

?>
<div class='art-postDash block-sub-more left' style='position:relative;margin-bottom: -3px' id='<?=$act->id?>-act'>
	
	<div class='type-flux' idact='<?=$act->id?>' action='/ajax/content/view/' style='left:0px;top: 6px;'>
		<div title='<?=gettext('TOOLTIP_'.$act->type)?>' style="height: 25px;width: 25px;text-align: center;background-image: url('/css/images/<?=$typePIC[$act->type]?>.png')"></div>
	</div>
	
	<div class='art-PostContent post-form'  style='margin: 0px 35px;display: inline-block;'>
		
		
		<div class='post-right'>
				<div id='<?=$act->id?>-postTitle' class='content <?=$isOwner? '':''?>' style=''>
					<div class='orange shortcut'></div>
					<img src="<?=getUserPic($act->user->id,$act->user->id_img,24,$act->user->email)?>" 
						alt="<?=$act->user->name?>" 
						class="ppict profil-usr"
						title="<?=$act->user->name?>" style='padding:0;width:15px;height:15px;'/>
					<span>
						<b id='<?=$act->id?>-postTitle_fix' class='content title' style=''>
							<a style='color:#685840' href='/<?=$act->user->url?>'><?/*if ($act->flux) echo ($act->flux=='JB'?'Asker':'Provider')*/?>&nbsp;<?=$act->user->name?></a>	
						</b>
						<?=$contentSentence?>
					</span>
				</div>
				<div class='cleared'> </div>
		</div>
		
		<div class='right' style='font-size:11px;'><?=formatDate($act->date)?></div>
	</div> 
	<div style='clear:both;'></div>
</div>


