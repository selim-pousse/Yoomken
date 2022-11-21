<script type="text/javascript">
	
		
		
	var msgdone = "<?=_('IDEA_MESSAGE_SUBMITED')?>";
	
	function initBoxy()
	{
		$("#form-add-badge").validate({
			errorElement: "em",
			errorContainer: $("#warn-message-addnadge"),
			errorPlacement: function(error, element) {
				error.appendTo($('#warn-message-addnadge .red-left'));
			},
			rules: {
				title: {
					required: true,
					maxlength: 64,
					remote:'/ajax/badges/availableName',
					
				},
				desc: {
					required: true
				}
			},
			messages: {
		                title: {
		                	required: "<?=_('TITLE_REQUIRED')?>",
		                	remote: "<?=_('NAME_BADGE_UNAVAILABLE')?>",
		                	maxlength: "<?=_('TITLE_MAX_PASSED')?>",
		                },
		                desc: {
		                	required: "<?=_('DESC_REQUIRED')?>"
		                }
		                
		    },
			submitHandler: function(form) {
				jQuery(form).ajaxSubmit({
					dataType:  'json',
			        success:   function(data) { 
			        	var boxy = Boxy.get('#boxy-find-badges'); 
			        	boxy.hide().unload(); 
			        	
			        	Boxy.alert(msgdone,function(){
			        		location.href = '/badges/wish';
			        	});
			        	
			        }
				});
			}
		});
		
		inFieldLabel('#form-add-badge');
		$('#form-add-badge').find('.autoresize').autoResize({}).trigger('change');
		
	}
</script>

<?

	
			
?>

<div  id='boxy-find-badges' style="width:450px">
	<div style="margin:0 auto;width: 400px;">
	 <form id='form-add-badge'  style="padding:0;display: block"  method="POST" action="/ajax/post">
		 
		 <input id='' class="infieldlabel ui-corner-all enabled" name="title" title='<?=_('TITLE_BADGE')?>' placeholder='<?=_('TITLE_BADGE')?>' type="text" style="padding:5px;width:96%;margin: 15px 0"/>
		 
		 <textarea id='' class="infieldlabel autoresize ui-corner-all enabled" name="desc" placeholder="<?=_('DESC_BADGE')?>"  style="height: 30px;max-height: 100px;padding:5px;width:96%" ></textarea>
					 	 
		<input type='hidden' name='type' value='WB' id=''/>
		<input class="action button right" title="" style="margin:15px 0px 0" value="<?=_('SUBMIT_BADGE')?>" title="" type='submit' name='submit'/>
	 	<div class='cleared'></div>
	 	
	 	<div id="warn-message-addnadge" class='area-error hide' style='margin: 15px 0 0;width: 100%;' >
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td class="red-left" style='padding: 5px;'></td>
			<td class='red-right'>
				<a class="close-red" style='' onclick="$('#warn-message-addnadge').fadeOut('slow')">
					<img style='margin-left:-20px' src="/css/images/messages/icon_close_red_in.gif"  alt="" />
				</a>
			</td>
		</tr>
		</table>
	</div>
	
	</form>
	
	
</div>