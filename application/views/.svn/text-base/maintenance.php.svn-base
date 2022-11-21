<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
	<head>
		<title><?=$this->title?></title>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="description" content="<?=$this->description?>" />
		<meta name="keywords" content="<?=$this->keywords?>" />
		
		<noscript> 
     	<meta http-equiv="Refresh" content="0;url=/noscript" />
   		</noscript>
		
		<link rel="image_src" href="/css/images/yoomken.jpg" />
		<link rel="icon" href="/css/images/yoomken.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="/css/images/yoomken.ico" type="image/x-icon" />
		
		<link rel="stylesheet" media="screen,projection" href="/css/style-<?=filemtime($_SERVER['DOCUMENT_ROOT'].'/css/style.css')?>.css" type="text/css" />
		 <link rel="stylesheet" href="/CountDown/countdown/jquery.countdown.css" />
		
		<style>
			.ui-autocomplete-loading { background: white url('js/images/loading.gif') right center no-repeat; }
			#city { width: 25em; }
		</style>
		
	<?	if ( $this->css ) : ?>
		<link rel="stylesheet" media="screen,projection" href="/css/<?=$this->css?>" type="text/css" />
	<?	endif; ?>
		
		<!--[if lte IE 7]><style media="screen,projection" type="text/css">@import "/css/style.ie7.css\</style><![endif]-->
		<!--[if lte IE 7]><script type="text/javascript" charset="utf-8" > window.location="/err/browser\</script><![endif]-->
	</head>    
    <body>
    <div id="art-main" >
        <div class="art-Sheet">
            <div class="art-Sheet-tl turn180"></div>
            <div class="art-Sheet-tr turn180"></div>
            <div class="art-Sheet-bl"></div>
            <div class="art-Sheet-br"></div>
            <div class="art-Sheet-tc"></div>
            <div class="art-Sheet-bc"></div>
            <div class="art-Sheet-cl"></div>
            <div class="art-Sheet-cr"></div>
            <div class="art-Sheet-cc"></div>
            <div class="art-Sheet-body" style="background-image: url('/media/img/maintenance/motif_maintenance.png');width: 100%">
                <div style="margin: auto;margin-bottom: -50px;margin-top: 50px;width: 690px;">
	                <div class='yoomken' style='width:220px;font-size:1.3em'>
						<a href="#" class="logo">
							<span class="t" style='color: #685840;'>
								<span>&nbsp;</span>
								<span style=''>Y</span>
								<span class='a orange'>Ƃ<span class='ti orange'>-</span>Ƌ</span>
								<span style='font-size:0.9em'>mken</span>
								<b class='' style='color: #EB8900;font-size:0.3em;margin:15px 0 0 3px;text-transform:uppercase;'>bêta</b>
								
							</span>
						</a>
					</div>
					
					
					<div class="right" style='margin-top: 15px'>
						<span class='' style='font-size: 2em;font-family: Verdana;margin-left:0px;color: #AE977B;'>
							<b style=''>&nbsp;<?=_('SLOGAN')?>.</b>
						</span>
					</div>
				</div>
	
                <div class="" class="clear" style="background-image: url('/media/img/maintenance/backv2_maintenance.png');background-position: center 153px;background-repeat:repeat-x">
                	<div style="z-index: 1;position:relative;padding: 25px;margin-top: 0px;height: 600px;width: 100%;background-image: url('/media/img/maintenance/maintenance.png');background-repeat:no-repeat; background-position: center center">
                		<?=$content_for_layout?>
                		
                	</div>
                	<div style="z-index: -1;margin-top: -175px;margin-left:50px;height: 210px;background-image: url('/media/img/maintenance/back180_maintenance.png');background-repeat:repeat-x;">
                		<div style="margin: auto;width: 600px;">
	                		<br/><br/><br/><br/>
	                		
	                		<b style="font-size: 2em"><?//=_('TXT_MAINTENANCE')?>Compte à rebours avant l'ouverture officielle du réseau.</b>
	                		<br>
	                		<br>
	                		<div style='width:'>
								<div id="countdown" style='width:500px;margin:0 auto;'></div>
								<div id='' style=';text-align:center;'>Disponible dans</div>
								<div id='note' style=';text-align:center;'></div>
							</div>
							<br/>
	                	</div>
                	</div>
                </div>
                <div class="cleared"></div>
                   
            </div>    
        </div>
        
            <?=$this->render('layout/footer');?>  
        <div class="cleared"></div>
        
        <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
        <script src="/CountDown/countdown/jquery.countdown.js"></script>
        <script src="/CountDown/js/script.js"></script>
        
    </div>
</body>
</html>

     