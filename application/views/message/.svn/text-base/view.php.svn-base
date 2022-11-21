<? 
$me = $this->session->get('user');
$thumb = getPictureThumb($me->id, $me->id_img, 40,$me->email);
?>
	<div class="left <?=$who->id?>-subsub-msg msg-All" style="width:710px;">
		<? if ($setrec != '00' && $who->me_=='A' ):?>
		<div class='tchat-bulle'>
			<img class="img-bulle" src="<?=$thumb?>" alt="" style="margin-top: 4px;"/>
			<form action='/ajax/msg/share' class="msg-bulle form-msg " style='margin:0px' method="post">
				<textarea id='' class="left infieldlabel autoresize ui-corner-all" placeholder="<?=_('WRITE_MSG')?>" name="msg" style="height: 20px;padding:5px;width:80%;border-color:#ccc" ></textarea>
				<input class="action button" type="submit" name="post" value="<?=_('POST')?>" style='margin-left:5px'/></span>  
				<input type='hidden' name='setrec' value='<?=$setrec?>'/> 
			</form>
		</div>
		<?endif;?>
		
		<div class='cleared'></div>
		<br class='start-tchat'/>
		
		<?=$this->render('message/inner/displayDash');?>
		<div class='cleared'></div>
	</div>