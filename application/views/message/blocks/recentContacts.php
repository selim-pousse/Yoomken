<div  class='' style='margin:20px 0'>
	     <input type="text" name='searchcontact' class="enabled left ui-corner-all" id="" value="" placeholder="<?=_('SEARCH_CONTACT')?>" style='padding-right: 25px;width: 180px;margin:0 4px'/>
	     <button type="submit" style='font-size: 12px;background-color: transparent;border-color: transparent;margin: 2px 0px 0px -38px;color: #685840;float: left;' >Ƃ<span class="ti" style='cursor:pointer' >-</span>Ƌ</button>
	     <div class='cleared'></div>
	     <div class='separate-find' style="border-bottom: 2px solid #ddd;margin-top: 10px;position: relative">
			 	<div class='speaker-bulle' style="top:-10px;right:50%;border-bottom-color: #ccc;border-width: 0px 10px 10px;"></div>
				<div class='speaker-bulle' style="top:-8px;right:50%;border-bottom-color: white;border-width: 0px 10px 10px;"></div>
	    </div>
	     
	     <div id='block-recent-contact'>
	     	<?=$this->render('message/inner/displayContacts');?> 
		 </div> 
		  <div class='separate-find' style="border-bottom: 2px solid #ddd;position: relative;padding: 0;margin: 0"></div>
</div>