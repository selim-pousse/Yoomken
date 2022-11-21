<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">
	<head>
		<title><?=$this->title?></title>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="description" content="<?=$this->description?>" />
		<meta name="keywords" content="<?=$this->keywords?>" />
		
		<!--[if lte IE 8]>
			<meta http-equiv="Refresh" content="0;URL=/error/browser" />
		<![endif]-->

		<noscript>
			<meta http-equiv="Refresh" content="0;URL=/noscript" />
		</noscript>
		
				
		<link rel="image_src" href="/media/img/logo/yoomlogo.png" />
		<link rel="icon" href="/media/img/logo/yoomlogo.png" type="image/x-icon" />
		<link rel="shortcut icon" href="/media/img/logo/yoomlogo.png" type="image/x-icon" /> 
		<link rel="stylesheet" media="screen,projection" href="/css/style-<?=filemtime($_SERVER['DOCUMENT_ROOT'].'/css/style.css')?>.css" type="text/css" />
		<link rel="stylesheet/less" media="screen" href="/js/jquery-ui.css" type="text/css" />
		<link rel="stylesheet/less" media="screen" href="/js/viewedit.css" type="text/css" />
		
		<?php // required stylesheet for TextboxList.Autocomplete ?>
		<link rel="stylesheet" href="/css/TextboxList.css" type="text/css" media="screen" charset="utf-8"></link>
		<link rel="stylesheet" href="/css/TextboxList.Autocomplete.css" type="text/css" media="screen" charset="utf-8"></link>
		<link rel="stylesheet" href="/css/contactable.css" type="text/css" media="screen" charset="utf-8"></link>
		<style>		
			.textboxlist-loading { background: url('images/spinner.gif') right center no-repeat; }
			.ui-autocomplete-loading { background: white url('js/images/loading.gif') right center no-repeat; }
			#city { width: 25em; }
			.form_tags { margin-bottom: 10px; }

			/* Setting widget width example */
			
			#file-uploader-presta {z-index:-1}
			body { margin:1px; }
		</style>
		
	<?	if ( $this->css ) : ?>
		<link rel="stylesheet" media="screen,projection" href="/css/<?=$this->css?>" type="text/css" />
	<?	endif; ?>
	
		<link rel="stylesheet" media="screen,projection" href="/css/boxy.css" type="text/css" />
		
		<? if (!me()):?>
			<link rel="stylesheet" href="/css/coin-slider-styles.css" type="text/css" />
		<?endif;?>
		
		<!--[if lte IE 7]><style media="screen,projection" type="text/css">@import "/css/style.ie7.css\</style><![endif]-->
		<!--[if lte IE 7]><script type="text/javascript" charset="utf-8" > window.location="/err/browser\</script><![endif]-->
				
	<?	if ( $this->js ) :?>
		<script src="/js/<?=$this->js?>" type="text/javascript"></script>
	<?	endif; ?>
		<script src="/js/plugin-js/less.min.js" type="text/javascript"></script>
	<? if (SERVER_ENV == 'live') :?>
		<!-- Google analytic -->
		<script type="text/javascript">
		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-33921490-1']);
		  _gaq.push(['_setDomainName', 'yoomken.com']);
		  _gaq.push(['_trackPageview']);
		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();
		</script>
	<? endif; ?>
	
	
	<?=$this->render('layout/javascript')?>
		
	</head>
	<?php 
		$me = $this->session->me();
		$mberclass = 'presta';
		/*if ($me) {
			 if ($this->action=='recruiter') $mberclass = 'employ';
			 else if ($this->action=='presta') $mberclass = 'presta';
			 else if ($me->profil=='C') $mberclass = 'employ';
			 else  $mberclass = 'presta';
		}*/
	?>    
    <body class='member-<?=$mberclass?>'> 
    <?=$this->render('layout/module/feedback');?>
    
   
    <div id="art-main" style='margin-top:-180px;position: relative;z-index:1;'>
        <div class="art-Sheet" style=''>
            <div class="art-Sheet-body" style='padding-top:180px;<?//;background-colo:=$this->controller=='homee'?'#F8D080':'white'?>'>
            	<div class='art-fixed can-be-fixed' style='<?=(BROWSER_MOBILE?'position:static;margin-bottom:-36px':'')?>;z-index: 6000;'>
	                <div class="Header" style=''></div>
	               
	                <div class='clear'></div>
					<?//php if($this->controller=='home' && $this->action=='welcome' && !$this->session->get('waitActivate')):?>
	                <?//else:?>
	                	<?=$this->render('layout/mainMenu')?>
	                <?//endif;?>
                </div>
	
                <div class="art-contentLayout">
                	
                	<?/*<div class="art-sidebar0">
                		<?=$this->render($this->controller.'/blocks/sidebarAll-left');?>
                	</div>*/?>
                		
	                	<div id='myspace' class='' style="z-index: 2;"></div>
	                	<div class="art-content" style="width: 100%">
	                		<?=$content_for_layout?>
	                	</div>
	                
                	<div class="cleared"></div>
            </div>
           
        </div>
        <div class="cleared"></div>
    </div>
  </div>
  <?=$this->render('layout/footer')?>
  
  <?=$this->render('layout/javascript_end')?>
</body>
</html>