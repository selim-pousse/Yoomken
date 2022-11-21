<script type="text/javascript">
	function listenFindFriend(id){
		$(id).find('.user').click(function(){
			var that = $(this);
			var idusr = that.attr('idbadge'); 
			var clone = that.clone().addClass('f-selected');
			$('#block-find-badge').html(clone);
			$('#form-find-badge').find("input[name='thebadge']").val(idusr);
		});
		
	};
		
		
	var msglabel = "<?=_('ADD_NOTE')?>";
	
	function initBoxy()
	{
		$("#form-find-badge").validate({
			errorContainer: $("#warning, #warning-message-boxy"),
			errorPlacement: function(error, element) {
				error.appendTo( $('#warning-message-boxy .red-left'));
			},
			rules: {
				thebadge: {
					required: true
				}
			},
			messages: {
		                thebadge: {
		                	required: ""
		                }
		     },
			submitHandler: function(form) {
				jQuery(form).ajaxSubmit({
					dataType:  'json',
			        success:   function(data) { 
			        	var boxy = Boxy.get('#boxy-find-badges'); 
			        	boxy.hide().unload(); 
			        	
			        	
			        	sendMail('00',data.meta.towho);
			        	Boxy.alert(data.message);
			        }
				});
			}
		});
		
		inFieldLabel('#form-find-badge');
		$('#form-find-badge').find('.autoresize').elastic();
		
		$('#form-find-badge').find("input[name='thebadge']").val('');
		listenFindFriend('#block-find-badge');
		$("input[name='searchbadge']").keyup(function() {
			$('#form-find-badge').find("input[name='thebadge']").val('');
			$.ajax({
			  url:'/ajax/badges/find',
			  dataType: 'json',
			  type:'POST',
			  data : {term:$(this).val()},
			  success:function(data){
					$('#block-find-badge .user').unbind('click');
	  				$('#block-find-badge').html(data.html);
	  				listenFindFriend('#block-find-badge');
	  				
	  				if ($('#block-find-badge .user').size()==1) $('#block-find-badge .user').click();
	  			}
			});
		});
	}
</script>

<?

	$lblButton = $typereq=='GIV'?_('GIVE_IT'):_('ASK_IT');
	$titButton = $typereq=='GIV'?_('TITLE_GIVE'):_('TITLE_ASK');
			
?>

<div  id='boxy-find-badges' style="width:500px">
	<div style="margin:0 auto;width: 320px;">
     <input type="text" name='searchbadge' class="enabled left ui-corner-all" id="" value="" placeholder="<?=_('SEARCH_BADGES')?>" style="padding:5px 25px 5px 5px;width: 280px;"/>
     <button  style='font-size: 12px;background-color: transparent;border-color: transparent;margin: 8px 5px 5px -30px;padding:0;font-weight:normal;color: #685840;float: left;' >Ƃ<span class="ti" style='cursor:pointer' >-</span>Ƌ</button>
    </div>
    
     <div class='cleared'></div>
    <div class='separate-find' style="border-bottom: 2px solid #ddd;margin-top: 10px;position: relative">
		 	<div class='speaker-bulle' style="top:-10px;right:50%;border-bottom-color: #ccc;border-width: 0px 10px 10px;"></div>
			<div class='speaker-bulle' style="top:-8px;right:50%;border-bottom-color: white;border-width: 0px 10px 10px;"></div>
    </div>

     <div id='block-find-badge' class="" style="overflow-y: auto;height: 360px;width: 500px">
     	<?=$this->render('badge/inner/displayForSelect',array('badges'=>$badges));?> 
	 </div> 

	 <div class='' style="border-top: 2px solid #ddd;"></div>
	 <form id='form-find-badge'  style="padding: 10px 0;display: block"  method="POST" action="/ajax/badges/transfert/user/<?=$typereq?>">
		 <a class='right'>
			<img src="<?=getUserPic(me()->id,me()->id_img,40,me()->email)?>" alt="<?=me()->name?>" class="photo" style='width: 40px;height: 40px;margin: 0' />
		 </a>
		 <div class="right " style='margin:0 10px 0 0;width: 350px;position: relative' method="post">
		 	<div class='speaker-bulle' style="top:10px;right:-14px;border-left-color: #ccc;"></div>
			<div class='speaker-bulle' style="top:10px;right:-13px;border-left-color: white;"></div>
			<textarea class="left infieldlabel autoresize ui-corner-all" placeholder="<?=_('ADD_NOTE')?>" name="msg" style="height: 30px;padding:5px;width:95%;max-height: 60px;border:1px solid #ccc" ></textarea>
		</div>			  		
		
		<input type='hidden' name='towho' value="<?=$towho?>"/>	  	 
		<input type='hidden' name='thebadge' value='' id='thebadge'/>
		<input type='hidden' name='act' value='save'/>
		<input class="action button left" title="" style="cursor:pointer;width: auto;float: left;padding: 15px 5px" value="<?=$lblButton?>" title="<?=$titButton?>" type='submit'/>
	 	<div class='cleared'></div>
	</form>
	<div id="warning-message-boxy" class='area-error hide' style='margin: 0;width: 100%;' >
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td class="red-left" style='padding: 5px;'><?=_('MUST SELECT BADGE')?></td>
			<td class='red-right'>
				<a class="close-red" style='class' onclick="$('#warning-message-boxy').fadeOut('slow')">
					<img style='margin-left:-20px' src="/css/images/messages/icon_close_red_in.gif"  alt="" />
				</a>
			</td>
		</tr>
		</table>
	</div>
</div>