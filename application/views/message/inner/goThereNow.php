<p>
	<a href="http://<?=$_SERVER['SERVER_NAME'].$posturl?>" target="_blank"  style="text-transform: uppercase;
		background: #FFB53E url(<?='http://'.$_SERVER['SERVER_NAME'].'/css/images/glass-light.png'?>) repeat-x 0 50%;
		padding: 8px 8px;font-weight: bold;color : #DB430E;text-decoration: none;border: none;border-radius: 6px;cursor: pointer;">
			<?=isset($labelbut)?$labelbut:_('Go there now')?>
	</a>
</p>