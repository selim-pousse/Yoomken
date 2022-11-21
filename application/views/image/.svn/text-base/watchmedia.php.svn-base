<?
	$thumbs = explode(',',$act->thumbnail);
?>

<div id='watchmedia' style="height:480px;padding: 0px;margin: 0;width: 0">
	
<script type="text/javascript">
	function ws_fade(c,a,b){var e=jQuery;var d=e("ul",b);var f={position:"absolute",left:0,top:0,width:"100%",height:"100%"};this.go=function(g,h){var i=e(a.get(g)).clone().css(f).hide().appendTo(b);if(!c.noCross){var j=e(a.get(h)).clone().css(f).appendTo(b);d.hide();j.fadeOut(c.duration,function(){j.remove()})}i.fadeIn(c.duration,function(){d.css({left:-g+"00%"}).show();i.remove()});return g}};
	
	function initBoxy()
	{
		var objmedia = $('#watchmedia');
		var objBoxy  =  Boxy.get(objmedia);
		var width = objmedia.find('img').width();
		var height = objmedia.find('img').height();
		objmedia.find('.watch').height(objmedia.height());
		/*objmedia.find('.watch-inner').css({'width':width+'px','top':((objmedia.height()-height)/2)+'px'});*/
		objBoxy.center('y');
		objmedia.hide();
		objmedia.show('slow');
		
		jQuery("#wowslider-container1").wowSlider({effect:"fade",prev:"",next:"",duration:20*100,delay:20*100,width:480,height:480,autoPlay:false,playPause:false,stopOnHover:false,loop:false,bullets:true,caption:false,captionEffect:"fade",controls:true,onBeforeStep:0,images:0});
	}

</script>
	
	<section class="widescreen show-picture" style="margin: 0;padding: 0">
	    <div class="watch">
	    	
	    	<a class="close" href="#" style="visibility: visible;"></a>
	    	<div class="watch-inner">
				<div id="wowslider-container1">
					<div class="ws_images">
						<ul>
							<li><img src="<?=getPictureThumb($act->user->id, $selected, 480);?>" id="wows1_<?=$selected?>"/></li>
							<? foreach($thumbs as $idimg) : if($selected != $idimg) :?>
								<li><img src="<?=getPictureThumb($act->user->id, $idimg, 480);?>" id="wows1_<?=$idimg?>"/></li>
							<?endif; endforeach;?>
						</ul>
					</div>
					<div class="ws_bullets">
						<div>
							<a href="#wows1_<?=$selected?>" ><img src="<?=getPictureThumb($act->user->id, $selected, 75);?>"/><?=$j?></a>
							<? foreach($thumbs as $j => $idimg) :  if($selected != $idimg) :?>
								<a href="#wows1_<?=$idimg?>" ><img src="<?=getPictureThumb($act->user->id, $idimg, 75);?>"/><?=$j?></a>
							<? endif; endforeach;?>
						</div>
					</div>
					<div class="ws_shadow"></div>
					<a class="ws_prev" href="#" style="visibility: visible;"></a>
					<a class="ws_next" href="#" style="visibility: visible;"></a>
				</div>
	    	</div>
	     	
	     </div>
	</section>
</div>