
<?php
			
	foreach ($activities as $act):
		?> <?
		if ( in_array($act->type,array('NW','AV','CR','QU','OF')) ):?>
			<?
				echo $this->render('content/inner/types/displayIsotope_Content',array('act'=>$act));
			?>
			<?
		else:
			echo $this->render('content/inner/types/displayDash_Activity',array('act'=>$act));
		endif;
	endforeach;
?>