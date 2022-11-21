<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
	<head>
		<title><?=$this->title?></title>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="description" content="<?=$this->description?>" />
		<meta name="keywords" content="<?=$this->keywords?>" />
		
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
		<!--[if lte IE 8]><script type="text/javascript" charset="utf-8" > window.location="/noie8\</script><![endif]-->
				
	</head>    
    <body>
 	<?=$content_for_layout?>
	<?=$this->render('layout/javascript')?>

</body>
</html>

     