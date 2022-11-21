	<?php 
		if( $this->session->isLogged() ) {
			$me = $this->session->get('user');
			$who = $this->session->who();
		}
	?>
	
	<script type="text/javascript">
	var beg = <?=isset($nbread)&&$nbread?$nbread:'0'?>;
	var lib = {map:false};
	
	var system = {
			<? echo '
					loading 	: 	"'._('LOADING').'",
					controller	: "'.$this->controller.'",
					currency	: "'.getCurrency(me()).'",
					typeJournal	: "'.(isset($journal)?$journal:'').'",
					upload_progress_name : "'.ini_get("session.upload_progress.name").'",
			'; 
			?>
		};
		
		
	var level = {
			<? echo '
					JUNIOR 			: 		"'._('JUNIOR').'",
					INTERMEDIATE	: 		"'._('INTERMEDIATE').'",
					EXPERT 			: 		"'._('EXPERT').'",
			'; 
			?>
		};		
	var label = {
			<?php
		
			echo '
				fname 		: 	"'._('LABEL_FNAME').'",
				lname 		: 	"'._('LABEL_LNAME').'",
				mdp 		: 	"'._('LABEL_MDP').'",
				mdp2 		: 	"'._('LABEL_MDP2').'",
				profil 		: 	"'._('LABEL_PROFIL').'",
				email 		: 	"'._('LABEL_EMAIL').'",
				
				login_email_pseudo 	: 	"'._('ERR_LOGIN_EMAIL_PSEUDO').'",
				notexist_email_pseudo : 	"'._('ERR_NOTEXIST_EMAIL_PSEUDO').'",
				
				man 		: 	"'._('MAN').'",
				woman 		: 	"'._('WOMAN').'",
				
				title_sv 	: 	"'._('LABEL_TITLE_PRESTA').'",
				title_jb 	: 	"'._('LABEL_TITLE_JOB').'",
				desc_sv 	: 	"'._('LABEL_DESC_PRESTA').'",
				desc_jb 	: 	"'._('LABEL_DESC_JOB').'",
				location 	: 	"'._('LABEL_LOCATION').'",
				city	 	: 	"'._('LABEL_CITY').'",
				tags		: 	"'._('LABEL_TAGS').'",
				collaborator:	"'._('LABEL_COLLABO').'",
				search		: 	"'._('SEARCH').'",
				err_required: 	"'._('ERR_FIELD_REQUIRED').'",
				msg			: 	"'._('WRITE_MSG').'",
				cmt			: 	"'._('LEAVE_CMT').'",
				time		: 	{
									now : "'._('FEW_SEC_AGO').'"
								},
				textaera_NW		: "'._('LABEL_DESC_NEWS').'",
				textaera_AV		: "'._('LABEL_DESC_AVIS').'",
				textaera_CR		: "'._('LABEL_DESC_CREATION').'",
				textaera_QU		: "'._('LABEL_DESC_QUESTION').'",
				textaera_OF_B	: "'._('LABEL_DESC_OFFER_B').'",
				textaera_OF_P	: "'._('LABEL_DESC_OFFER_P').'",
				textaera_OF_C	: "'._('LABEL_DESC_OFFER_C').'",
				
				
				status_1		: "'._('AVAILABLE').'",
				status_2		: "'._('AVAILABLE').'",
				status_4		: "'._('UNAVAILABLE').'",
				status__1		: "'._('INVISIBLE').'",
				
				serviceOnLeft	: 	"'._('SERV_SELECT_LEFT').'",
				serviceOnRight	: 	"'._('SERV_SELECT_RIGHT').'",
				
				serviceFree		: "'._('FREE_SERVICE').'",
				hour			: "'._('HOUR').'",
									
			';
		
		?>
	};
	
	var signup = {
			<?php
		
			echo '
				fullname		: 	{
									required : "'._('FULLNAME_REQUIRED').'",
									minlength : "'.preg_replace('/\{\#n\}/',5,_('FULLNAME_MAX_CHAR_ALLOWED')).'"
								},
				password		: 	{
									required : "'._('PWD_REQUIRED').'",
									minlength : "'.preg_replace('/\{\#n\}/',8,_('PWD_MAX_CHAR_ALLOWED')).'"
								},
				confirm_pass	: 	{
									required : "'._('PWD2_REQUIRED').'",
									equalTo : "'._('PWD2_EQUALTO').'"
								},		
				email			: 	{
									required : "'._('EMAIL_REQUIRED').'",
									email : "'._('EMAIL_MUST_VALID').'",
									remote : "'._('EMAIL_REMOTE').'"
								},
				location		: 	{
									required : "'._('LOCATION_REQUIRED').'"
								},
				policy			: 	{
									required : "'._('POLICY_REQUIRED').'"
								},
				pseudo		: 	{
									required : "'._('PSEUDO_REQUIRED').'",
									remote   : "'._('PSEUDO_REMOTE').'",
									pseudoRegex : "'._('PSEUDO_REGEX').'",
									minlength : "'.preg_replace('/\{\#n\}/',2,_('PSEUDO_MAX_CHAR_ALLOWED')).'"
								},
				weburls			:{
									unvalid : "'._('WEBS_URL_UNVALID').'"
								},
				resumy		: 	{
									nberrors : "'._('RESUMY_NB_ERRORS').'"
								}, 
				datedispo		: {
									unvalid : "'._('DATEDISPO_UNVALID').'"
								},
				birthdate		: {
									unvalid : "'._('BIRTHDATE_UNVALID').'"
								}
			';
		
		?>
	};
	
	var sharebox = {
			<?php
		
			echo '
				title		: {
									maxlength : "'.preg_replace('/\{\#n\}/',60,_('TITLE_MAX_CHAR_ALLOWED')).'"
								},
				description		: {
									required : "'._('DESC_REQUIRED').'",
									maxlength : "'.preg_replace('/\{\#n\}/',1500,_('DESC_MAX_CHAR_ALLOWED')).'"
								},
				collaborator		: 	{
									required : "'._('AVIS_COLLABO_REQUIRED').'",
									notexist : "'._('AVIS_COLLABO_NOTEXIST').'"
								},
				services	: 	{
									required : "'._('ASK_SERVICES_REQUIRED').'",
									asker 	 : "'._('SERVICES_ASKER_REQUIRED').'",
									provider : "'._('SERVICES_PROVIDER_REQUIRED').'",
									neutral : "'._('SERVICES_REQUIRED').'"
								}
			';
		
		?>
	};
	var button = {
			<?php
		
			echo '
				accepted 	: 	"'._('ACCEPTED').'",
				rejected 	: 	"'._('REJECTED').'"
				';
		
		?>
	}
	</script>
	<?php if (ONLINE): ?>
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<?  $me = $this->session->me();
			$isnearby = $this->session->isLogged() && isset($filters) && $filters[md5('XXX'.$me->id)]->active && $this->controller=='people';
			if ($isnearby):?>
		<script alias='map' src="/js/google/markerClusterer.js" type="text/javascript"></script>
		<?else:?>
			<script type="text/javascript">function refreshMap(){return null;}</script>
		<? endif;?>
		<script src="/js/google/geocode.js" type="text/javascript"></script>
		<script type="text/javascript">
			 function initialize() {
		      	/* load the map if filter nearby enabled */
		      	<? if ($isnearby):
					$position = getPositionUser($who); 
					$position = '['.$position[0].','.$position[1]. ']';
				?>
					lib.map = true;
		        	initializeMap(<?=$position.',"'.$who->shortname.'",'.($me->option->nbresult?$me->option->nbresult:10).',"'.$this->input->get_post('term').'"'?>);
		        <? endif;?>
		        
		        /*geocalise my position  */
		      	geocoder = new google.maps.Geocoder();
		        <? if( $this->session->isLogged() && $me->nearby->mode!='S' /*&& $me->nearby->date != date('Y-m-d',time())*/):?>
		        	initializeNearby();
		        <? endif;?>
		     }
      
			google.load("jquery", "1.7");
		  	google.load("jqueryui", "1.8.8");
		</script>
	<?else: ?>
		<script src="/js/jquery-lib/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="/js/jquery-lib/jquery-ui-1.8.8.js" type="text/javascript"></script>
	<?endif;?>
	
	<!--<script type="text/javascript" src="/js/plugin-js/wowslider.js"></script>-->
	<script type="text/javascript" src="/js/jquery-plugin/jquery.flexslide.min.js"></script>
	<script type="text/javascript" src="/js/jquery-plugin/jquery.isotope.js"></script>
	<script src="/js/jquery-lib/underscore-min.js" type="text/javascript"></script>

	<script src="/js/jquery-plugin/jquery.qtip.js" type="text/javascript"></script>
	<script src="/js/jquery-plugin/jquery.form.js" type="text/javascript"></script>
	<script src="/js/jquery-plugin/jquery.validate.js" type="text/javascript"></script>
	<script src="/js/jquery-plugin/jquery.boxy.js" type="text/javascript"></script>
	<script src="/js/jquery-plugin/jquery.autosize.min.js" type="text/javascript"></script>
	<script src="/js/plugin-js/encoder.js" type="text/javascript"></script>
	<script src="/js/main-<?=filemtime($_SERVER['DOCUMENT_ROOT'].'/js/main.js')?>.js" type="text/javascript"></script>
	<script src="/js/helpers/format.js" type="text/javascript"></script>
	<script src="/js/filter.js" type="text/javascript"></script>
	<script src="/js/plugin-js/fileuploader.js" type="text/javascript"></script>
	<script src="/js/jquery-plugin/jquery.contactable.js" type="text/javascript"></script>
	<script src="/js/jquery-plugin/jquery.ui.calendar.js" type="text/javascript"></script>
	
	
	<script src='/js/jquery-plugin/jquery.mentionsInput.js' type='text/javascript'></script>
	<script src='/js/jquery-plugin/jquery.elastic.source.js' type='text/javascript'></script>
	
	<script src="/js/like.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() { 
			$('#contactable').contactable({subject: 'feedback URL:'+location.href});
			inFieldLabel('#signup_form,#login_form');
			
			$( "#his-selectable" ).calendar({ disabled: true });
			<? if ($this->controller=='user'):?>
				enableTabs('#page-link-profil');
			<?endif;?>
			
			/*if (screen.width >1170) {
				$('.can-be-fixed').css({'position':'fixed','marginBottom':0});
			}
			else $('.can-be-fixed').css({'position':'static','marginBottom':-36});*/
		});
	</script>
	
	<?php if (ONLINE): ?>
		<?//facebook ?>
		<div id="fb-root"></div>
		<script src="http://connect.facebook.net/fr_FR/all.js#appId=<?=FB_APP?>&xfbml=1"></script>
		<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4e67eefe4c1dd35b"></script>
	<? else :?>
		<script type="text/javascript"> 
			function codeAddress(){};
			function addthis(element, options) {};
			addthis.toolbox = function(){};
		</script>
	<? endif;?>


	<script src="/js/jquery-plugin/jquery.scrollTo.js" type="text/javascript" charset="utf-8"></script>
	<script src="/js/jquery-plugin/GrowingInput.js" type="text/javascript" charset="utf-8"></script>
	<script src="/js/plugin-custo/TextboxList.js" type="text/javascript" charset="utf-8"></script>		
	<script src="/js/plugin-custo/TextboxList.Autocomplete.js" type="text/javascript" charset="utf-8"></script>
	<script src="/js/search/Smartsearch.js" type="text/javascript" charset="utf-8"></script>
	<script src="/js/search/Smartsearch.Autocomplete.js" type="text/javascript" charset="utf-8"></script>
	<script src="/js/jquery-plugin/jquery.timer.js" type="text/javascript"></script>
	
	<script src="/js/search/search.js" type="text/javascript"></script>
	<script src="/js/jquery-plugin/jquery.ui.viewedit.js" type="text/javascript"></script>
	
	<?if($this->controller=='people'):?>
		<script src="/js/people.js" type="text/javascript"></script>
	<?elseif (in_array($this->controller,array('content','question'))):?>
		<script src="/js/content-<?=filemtime($_SERVER['DOCUMENT_ROOT'].'/js/content.js')?>.js" type="text/javascript"></script>
	<?elseif ($this->controller=='badge'):?>
		<script src="/js/badge.js" type="text/javascript"></script>
	<?endif;?>
	
	
	<script src="/js/jquery-plugin/inFieldLabel.js" type="text/javascript"></script>
	<script src="/js/jquery-plugin/jquery.ui.checkbox.js" type="text/javascript"></script>
	<script src="/js/static.js" type="text/javascript"></script>
	
	<script src="/js/plugin-js/detect-zoom.js" type="text/javascript"></script>	

<? if( $this->session->isLogged() ) : 
		//$ok = $user->activateUser( $this->input->get('act'));?>
		<script src="/js/jquery-plugin/jquery.maskedinput.js" type="text/javascript"></script>
		<script src="/js/user/myprofile.js" type="text/javascript"></script>
		<script type="text/javascript">
			var idwho = "<?=($who)?($who->id==$me->id?'00':$who->id):'';?>"; 
			var idme = "<?=(me())?me()->id:'';?>"; 
			var unread = <?=isset($unread)?$unread:'0'?>;
			$('.art-button-wrapper').removeClass('hide');	
			
			<?if($this->controller=='content'):?>
				$(document).ready(function() { 
					<?if($typeJournal!='OF' && $typeJournal!='AV' && $typeJournal!='QU'):?>
						changeShareBox('NW','TAG','<?=$me->profil?>');
					<? elseif($typeJournal=='OF'):?>
						changeShareBox('OF_<?=$me->profil=='N'?'B':$me->profil?>','TAG','<?=$me->profil?>');
					<? elseif($typeJournal=='AV'):?>
						changeShareBox('AV','COL','<?=$me->profil?>');
					<? elseif($typeJournal=='QU'):?>
						changeShareBox('QU','SEV','<?=$me->profil?>');	
					<?endif;?>
				});
			<?endif;?>
		</script>
		
		<?if (in_array($this->controller,array('people','message'))):?>
			<script src="/js/msg.js" type="text/javascript"></script>
		<?endif;?>
		<script src="/js/comment.js" type="text/javascript"></script>
		
		<?// load module TCHAT AjaxIM?>
		<?//<script type="text/javascript" src="/AjaxIM/js/im.load.js?php"></script>
		// <script src='https://swww.tokbox.com/v1.1/js/TB.min.js'></script> ?>
		
		
		<?/* il semble qui ne sert à rien
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="1" height="1" id="jStoreFlash">
		<param name="allowScriptAccess" value="always" /><param name="movie" value="jStore.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#ffcc00" />
		<embed src="/AjaxIM/js/jStore.swf" quality="high" bgcolor="#ffcc00" width="1" height="1" name="jStoreFlash" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
		</object>
		
		<div id="ajaxim"></div> 
		<script type="text/javascript">
		    AjaxIM.loaded(function() { AjaxIM.client.form('#ajaxim'); });
		</script>
		 
		<script type="text/javascript" src="/forum/plugins/embedvanilla/remote.js"></script>
		 * */?>
<? else: 
		$openid_params = Registry::getInstance()->get('openid_params');?>	
		<script src="/js/plugin-js/popuplib.js" type="text/javascript"></script>
		
		<script type="text/javascript" src="/js/jquery-plugin/jquery.coin-slider.min.js"></script>
		
		<script type="text/javascript">
		  var upgradeToken = function() {
		    window.location = '<?= isset($_SESSION['redirect_to'])?$_SESSION['redirect_to']:'/' ?>';
		  };
		  var extensions = <?php echo json_encode(Registry::getInstance()->get('openid_ext')); ?>;
		  var googleOpener = popupManager.createPopupOpener({
		    'realm' : '<?=$openid_params['openid.realm'] ?>',
		    'opEndpoint' : 'https://www.google.com/accounts/o8/ud',
		    'returnToUrl' : '<?=$openid_params['openid.return_to'] . '?popup=true' ?>',
		    'onCloseHandler' : upgradeToken,
		    'shouldEncodeUrls' : true,
		    'extensions' : extensions
		  });
		  $(document).ready(function () {
		    jQuery('.LoginWithGoogleLink').click(function() {
		      googleOpener.popup(450, 500);
		      return false;
		    });
		    
		    $('#coin-slider').coinslider({width: 530,height:300, navigation: false,links : false});
		  });
		</script>
		
		<? if(in_array($this->action,array('signup_goo','login_goo','signup_fb')) || $this->controller=='home'):?>
			<script src="/js/user/signup.js" type="text/javascript"></script>
			<script src="/js/user/initpass.js" type="text/javascript"></script>
		<?endif;?>
		
<?	endif; ?>	



