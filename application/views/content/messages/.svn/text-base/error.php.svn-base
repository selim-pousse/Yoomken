<? //error handling 
if(isset($error)) :

	if($error=="private") : ?>
	<p class="warningBubble errorContentPage"><?=_('SORRY_PRIVATE_CONTENT')?></p>
<?	elseif($error=="removed") :
		header('HTTP/1.0 404 Not Found'); ?>
	<p class="warningBubble errorContentPage"><?=_('SORRY_404_CONTENT')?></p>
<?	endif;

endif; ?>