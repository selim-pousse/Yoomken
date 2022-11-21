<\?xml version="1.0" encoding="UTF-8"?>
<urlset
      xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">

<!-- Sitemap for yoomken.com Date: <?=$date?> -->
	<url>
	  <loc>http://www.yoomken.com/</loc>
	  <changefreq>daily</changefreq>
	  <priority>1.00</priority>
	</url>
	<url>
	  <loc>http://www.yoomken.com/advice/aboutus</loc>
	  <changefreq>monthly</changefreq>
	  <priority>0.70</priority>
	</url>
	<url>
	<url>
	  <loc>http://www.yoomken.com/advice/aboutus/team</loc>
	  <changefreq>monthly</changefreq>
	  <priority>0.64</priority>
	</url>
	<url>
	
	<!--Sitemap part for the users' pages-->
	<? 	foreach ($users as $user) 
		{
			echo createPart('user',$user->url,'weekly','0.70');
		}?>

</urlset>
<?	function createPart($_link,$_changefreq,$_priority)
	{ ?>
	<url>
  	<loc>http://www.yoomken.li/<?=$_link?></loc>
  	<changefreq><?=$_changefreq?></changefreq>
  	<priority><?=$_priority?></priority>
	</url>
<?	} ?>