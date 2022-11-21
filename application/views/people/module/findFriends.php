<script type="text/javascript">
	
	function listenFindFriend(id){
		$(id).find('.user').click(function(){
			var that = $(this);
			var idusr = that.attr('idusr'); 
			var clone = that.clone().addClass('f-selected');
			$('#block-find-friend').html(clone);
			$('#form-find-friend').find("input[name='towho']").val(idusr);
		});
		
	};
		
	function initBoxy()
	{
		$("#form-find-friend").validate({
			errorContainer: $("#warning, #warning-message-boxy"),
			errorPlacement: function(error, element) {
				error.appendTo( $('#warning-message-boxy .red-left'));
			},
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
			        success:   function(data) {
			        	var boxy = Boxy.get('#boxy-find-friends'); 
			        	boxy.hide().unload(); 
			        	
			        	sendMail('00',data.meta.towho);
			        	
			        	Boxy.alert(data.message);
			        }
				});
			}
			
		});
		
		inFieldLabel('#form-find-friend');
		$('#form-find-friend').find('.autoresize').elastic();
		
		listenFindFriend('#block-find-friend');
		$("input[name='searchfriend']").keyup(function() {
			var _term = $(this).val();
			$('#form-find-friend').find("input[name='towho']").val('');
			$.ajax({
			  url:'/ajax/people/friends',
			  dataType: 'json',
			  type:'POST',
			  data : {term:_term,listignore:"<?=$who?>"},
			  success:function(data){
					$('#block-find-friend .user').unbind('click');
	  				$('#block-find-friend').html(data.html);
	  				listenFindFriend('#block-find-friend');
	  				
			  		if ($('#block-find-friend .user').size()==1) $('#block-find-friend .user').click();
			  		else if (isEmail(_term)) $('#form-find-friend').find("input[name='towho']").val(_term); 
	  			}
			});
		});
	}
</script>


<div id='boxy-find-friends' class='' style="width:400px">
	
		<div style="margin:0 auto;width: 320px;">
	     <input type="text" name='searchfriend' class="enabled left ui-corner-all" id="" value="" placeholder="<?=_('SEARCH_CONTACT_OR_EMAIL')?>" style="padding:5px 25px 5px 5px;width: 280px;"/>
	     <button style='font-size: 12px;background-color: transparent;border-color: transparent;margin: 8px 5px 5px -30px;padding:0;font-weight:normal;color: #685840;float: left;' >Ƃ<span class="ti" style='cursor:pointer' >-</span>Ƌ</button>
	    </div>
	    
	     <div class='cleared'></div>
	    <div class='separate-find' style="border-bottom: 2px solid #ddd;margin-top: 10px;position: relative">
			 	<div class='speaker-bulle' style="top:-10px;right:50%;border-bottom-color: #ccc;border-width: 0px 10px 10px;"></div>
				<div class='speaker-bulle' style="top:-8px;right:50%;border-bottom-color: white;border-width: 0px 10px 10px;"></div>
	    </div>
	
	     <div id='block-find-friend' class="" style="overflow-y: auto;height: 247px;width: 400px">
	     	<?=$this->render('people/inner/displayForSelect',array('friends'=>$friends));?> 
		 </div> 
	
		 <div class='' style="border-top: 2px solid #ddd;margin-bottom: 10px"></div>
	 
	  <form id='form-find-friend'  style="padding: 10px 0;display: block"  method="POST" action="<?=$typereq?'/ajax/badges/transfert/user/'.$typereq:'/ajax/people/recommand/'.$who?>">
		 <a class='right'>
			<img src="<?=getUserPic(me()->id,me()->id_img,40,me()->email)?>" alt="<?=me()->name?>" class="photo" style='width: 40px;height: 40px;margin: 0' />
		 </a>
		 
		<div class="right " style='margin:0 10px 0 0;width: 270px;position: relative' method="post">
		 	<div class='speaker-bulle' style="top:10px;right:-16px;border-left-color: #ccc;"></div>
			<div class='speaker-bulle' style="top:10px;right:-15px;border-left-color: white;"></div>
			<textarea class="left infieldlabel autoresize ui-corner-all" placeholder="<?=_('ADD_NOTE')?>" name="msg" style="height: 30px;padding:5px;width:95%;max-height: 60px;border:1px solid #ccc" ></textarea>
		</div>			  		
		
		<input type='hidden' name='towho' value='' id=''/>	  	 
		<input type='hidden' name='thebadge' value='<?=$thebadge?>'/>
		<input type='hidden' name='typereq' value='<?=$typereq?>'/>
		<input type='hidden' name='act' value='save'/>
		<?/*<input class="action button left" title="" style="cursor:pointer;width: auto" value="<?=_('RECOMMAND')?>" type='submit'/>*/?>
		<? if ($typereq) :
			$lblButton = $typereq=='GIV'?_('GIVE'):_('ASK');
			$titButton = $typereq=='GIV'?_('TITLE_GIVE'):_('TITLE_ASK');
		?>
			<input class="action button left" title="" style="cursor:pointer;width: auto;float: left;padding: 15px 5px" value="<?=$lblButton?>" title="<?=$titButton?>" type='submit'/>
			
		<? else:?>
			<div class="left" style="position:relative;">
				<div  class="button left" title="" style="padding: 20px 20px;width: auto;-webkit-border-radius: 6px;-moz-border-radius: 6px;border-radius: 6px;"  > 
					<input title="<?=_('RECOMMAND')?>" type='submit'  value='' style="cursor:pointer;padding: 20px 20px;background-image: url(/css/images/plus_like2.png);background-repeat: no-repeat;background-position: 50% 50%;position: absolute;width: 40px;height: 40px;background-color: transparent;border:none;left:0;top:0" />
				</div>
			</div>	
	 	<? endif;?>
	 	<div class='cleared'></div>
	 	
	</form>
	
	<div id="warning-message-boxy" class='area-error hide' style='margin: 0;width: 100%;' >
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td class="red-left" style='padding: 5px;'><?=_('MUST SELECT FRIEND')?></td>
			<td class='red-right'>
				<a class="close-red" style='class' onclick="$('#warning-message-boxy').fadeOut('slow')">
					<img style='margin-left:-20px' src="/css/images/messages/icon_close_red_in.gif"  alt="" />
				</a>
			</td>
		</tr>
		</table>
	</div>
</div>
