<script type="text/javascript">
		
	function initBoxy()
	{
		inFieldLabel('#form-invit-work');
		$('#form-invit-work').find('.autoresize').elastic();
		
		$("#form-invit-work").validate({
			rules: {
				towho: {
					required: true
				}
			},
			messages: {
		                towho: {
		                	required: ""
		                }
		     },
			submitHandler: function(form) {
				jQuery(form).ajaxSubmit({
					dataType:  'json',
			        success:   function(data,none,form) {
			        	var boxy = Boxy.get('#boxy-invit-work'); 
			        	boxy.hide().unload(); 
			        	attach(data,none,form);
			        	
			        	sendMail('00',data.meta.towho);
			        	
			        	Boxy.alert(data.message);
			        }
				});
			}
		});
		
	}
</script>


<div id='boxy-invit-work' class='' style="width:500px">
	
		<p>
			<?
			$mdl = new YOO_PeopleModel();
			$myrel = $mdl->getRelations(me()->id,null,null,1);
			$hisrel = $mdl->getRelations($towho->id,null,null,1);
			
			if ($myrel[0]) $myrel = $myrel[1][0];
			else $myrel = new Adapter();
			
			if ($hisrel[0]) $hisrel = $hisrel[1][0];
			else $hisrel = new Adapter();

			if ($contact):?>
				<?=$this->render('layout/messages/warningBubble', array('msg'=>preg_replace('/\{#user\}/',$towho->name,_('YOU CAN CONTACT WITHOUT COLLABORATING'))));?>
			<?else:?>
				<?=preg_replace('/\{#user\}/',$towho->name,_('ABOUT TO INVITE FOR COLLABORATING'))?>
			<? endif;?>
			
		</p>
	     <div id='block-invit-work' class="" style="width: 500px;height: 200px">
	     	<div style="width: 224px;position: relative;margin: 0 auto;">
	     		<? if($myrel && $hisrel):?>
	     		<img src="<?=getUserPic($myrel->id,$myrel->id_img,40,$myrel->email)?>" alt="<?=$myrel->name?>" class="wrap-collabo-photo" style='margin: 0;position: absolute;top:144px;left: 91px;' />
	     		<img src="<?=getUserPic($hisrel->id,$hisrel->id_img,40,$hisrel->email)?>" alt="<?=$hisrel->name?>" class="wrap-collabo-photo" style='margin: 0;position: absolute;top:8px;left: 91px;' />
	     		<? endif;?>
	     		<img src="<?=getUserPic(me()->id,me()->id_img,75,me()->email)?>" alt="<?=me()->name?>" class="wrap-collabo-photo" style='margin: 0;position: absolute;top:56px;left: 13px;' />
	     		<img src="<?=getUserPic($towho->id,$towho->id_img,75,$towho->email)?>" alt="<?=$towho->name?>" class="wrap-collabo-photo" style='margin: 0;position: absolute;top:56px;left: 136px;' />
	     		<img src="/css/images/wrap_collabo.png" style="position: absolute;top: 0"/>
	     	</div>
		 </div> 
		 <p>
			<?=preg_replace('/\{#user\}/',$towho->name,_('MSG_WARN_INVIT_DEAL'))?>
		</p>
	
		 <div class='' style="border-top: 2px solid #ddd;margin-bottom: 10px"></div>
	 
	  <form id='form-invit-work'  style="padding: 10px 0;display: block"  method="POST" action="/ajax/attach/D">
		 <a class='right'>
			<img src="<?=getUserPic(me()->id,me()->id_img,40,me()->email)?>" alt="<?=me()->name?>" class="photo" style='width: 40px;height: 40px;margin: 0' />
		 </a>
		 <div class="right " style='margin:0 10px 0 0;width: 340px;position: relative' method="post">
		 	<div class='speaker-bulle' style="top:10px;right:-14px;border-left-color: #ccc;"></div>
			<div class='speaker-bulle' style="top:10px;right:-13px;border-left-color: white;"></div>
			<textarea class="left infieldlabel autoresize ui-corner-all" placeholder="<?=_('ADD_NOTE')?>" name="msg" style="height: 30px;padding:5px;width:95%;max-height: 60px;border:1px solid #ccc" ></textarea>
		</div>			  		
		
		<input type='hidden' name='id' value='<?=$towho->id?>'/>	
		<input class="action button left" title="" style="cursor:pointer;width: auto;float: left;padding: 15px 10px" value="<?=_('DEAL')?>" title="<?=_('TIPS_DEAL')?>" type='submit'/>
			
	 	<div class='cleared'></div>
	</form>
	
</div>
