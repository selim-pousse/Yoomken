<script>
function initBoxy()
{
	enableTabs('#boxy-profil-<?=$user->id?>');
}	
</script>
<div id='boxy-profil-<?=$user->id?>' class='art-Post-inner' style='width:680px'>
	<?=$this->render('layout/module/myProfile',array('who' =>$user,'change'=>0))?>
</div>