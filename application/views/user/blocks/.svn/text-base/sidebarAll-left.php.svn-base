<?=$this->render('content/blocks/sidebar-left');
return;
?>

<?
$me = $this->session->me();
$who = $user;
if ($who) $who = ($me && $me->id == $who->id)? $me:$who; 
?>

<script>
	function activeTabProfil(id)
{
	$('.histabs').hide();
	$('#histabs-'+id).show();
	$('.atabs').removeClass('active');
	$('#atabs-'+id).addClass('active');
}	
</script>
<div class="">
	<br/><br/>
      <h4 style='margin:0px'>Navigation</h4>
      <ul class='sidebar-menu left' >
      		<li style='padding: 5px 15px;width:100px'>
      			<div class="ui-icon ui-icon-pin-w left" style='margin-left:-25px; width:20px;'></div>
				<a id='atabs-1' class='atabs active' href='#histabs-1' onclick="activeTabProfil(1)">
					<b><?=_('WHO_I_AM')?></b>
				</a>
			</li>
			<? if ($who->profil!='P'):?>
				<li style='padding: 5px 15px'>
	      			<div class="ui-icon ui-icon-pin-w left" style='margin-left:-25px; width:20px;'></div>
					<a id='atabs-3'  class='atabs' href='#histabs-2' onclick="activeTabProfil(3)">
						<b><?=_('DETAIL_CUSTO')?></b>
					</a>
				</li>
			<? endif;?>
			<? if ($who->profil!='C'):?>
				<li style='padding: 5px 15px'>
	      			<div class="ui-icon ui-icon-pin-w left" style='margin-left:-25px; width:20px;'></div>
					<a id='atabs-2'  class='atabs' href='#histabs-2' onclick="activeTabProfil(2)">
						<b><?=_('DETAIL_PRESTA')?></b>
					</a>
				</li>
				<li style='padding: 5px 15px'>
	      			<div class="ui-icon ui-icon-pin-w left" style='margin-left:-25px; width:20px;'></div>
					<a id='atabs-5'  class='atabs' href='#histabs-2' onclick="activeTabProfil(5)">
						<b><?=_('Calendrier')?></b>
					</a>
				</li>
			<? endif;?>
			<li style='padding: 5px 15px'>
      			<div class="ui-icon ui-icon-pin-w left" style='margin-left:-25px; width:20px;'></div>
				<a id='atabs-4' class='atabs' href='#histabs-3' onclick="activeTabProfil(4)">
					<b><?=_('CONTACT')?></b>
				</a>
			</li>
			
      </ul>
</div>