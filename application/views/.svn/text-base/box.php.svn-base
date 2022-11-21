<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
	<head>
		<title><?=$this->title?></title>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="description" content="<?=$this->description?>" />
		<meta name="keywords" content="<?=$this->keywords?>" />
		
		<noscript> 
     	<meta http-equiv="Refresh" content="0;url=/err/js" />
   		</noscript>
		
		<link rel="image_src" href="/css/images/yoomken.jpg" />
		<link rel="icon" href="/css/images/yoomken.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="/css/images/yoomken.ico" type="image/x-icon" />
		
		<link rel="stylesheet" media="screen,projection" href="/css/style-<?=filemtime($_SERVER['DOCUMENT_ROOT'].'/css/style.css')?>.css" type="text/css" />
		<link rel="stylesheet" media="screen,projection" href="/js/jquery-ui.css" type="text/css" />
		
		<style>
			.ui-autocomplete-loading { background: white url('js/images/loading.gif') right center no-repeat; }
			#city { width: 25em; }
		</style>
		
	<?	if ( $this->css ) : ?>
		<link rel="stylesheet" media="screen,projection" href="/css/<?=$this->css?>" type="text/css" />
	<?	endif; ?>
		
		<!--[if lte IE 7]><style media="screen,projection" type="text/css">@import "/css/style.ie7.css\</style><![endif]-->
		<!--[if lte IE 7]><script type="text/javascript" charset="utf-8" > window.location="/err/browser\</script><![endif]-->
				
	<?	if ( $this->js ) :?>
		<script src="/scp/js/<?=$this->js?>" type="text/javascript"></script>
	<?	endif; ?>
	</head>    
    <body>
    <br/> 
    <div id="art-main">
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
            <div class="art-Sheet-body">
                <div class="art-Header">
                 <div class='headerBox orange'>
                 	<a class='left' href="/" class="logo" style='color: inherit;margin-right: 50px;'><span class="<?=$this->controller=='content'?'':'l'?>"></span><span class="t">y<span class='a orange'>Ƃ<span class='ti orange'>-</span>Ƌ</span>mken</span></a>
                 	<div style='width:200px;margin:auto'><?=$this->title?></div>
                 	</div>	
                </div>
                <div class="clear" style="padding: 12px;"></div>
                <div class="" class="clear" style="padding: 25px;">
                	<div class="art-content">
                		<?=$content_for_layout?>
                	</div>
                </div>
                <div class="cleared"></div>
                <?=$this->render('layout/footer')?>         
            </div>
        </div>
        <div class="cleared"></div>
    </div>
    

		
	<?=$this->render('layout/javascript')?>

</body>
</html>

     