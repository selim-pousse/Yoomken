<?php 
	$email = $name ='';
	if ($this->session->isLogged())
	{
		$me = $this->session->get('user');
		$name = $me->name;
		$email = $me->email;
	}
?>
 <div id="contactable">
 	<form class='' id="contactForm" method="post" action="/feedback">
    	<div class="border-white">
    		<div id="loading"></div>
    		<div id="callback"></div>
    		<div class="holder">
    			<p class='<?=$this->session->isLogged()?"hide":""?>'>
    				<input id="name" class="contact infieldlabel left" name="name" title='<?=_('LABEL_LFNAME')?>...' placeholder='<?=_('LABEL_LFNAME')?>...' value='<?=$name?>' type="text"/>
    			</p>
    			<p class='<?=$this->session->isLogged()?"hide":""?>'>
    				<input id="email" class="contact infieldlabel left" name="email" title='<?=_('LABEL_EMAIL')?>...' placeholder='<?=_('LABEL_EMAIL')?>...' value='<?=$email?>' type="text"/>
    			</p>
    			<p><textarea id="message" name="message" class="message infieldlabel left" rows="4" cols="30" title='<?=_('LABEL_MSG')?>...' placeholder='<?=_('LABEL_MSG')?>...'></textarea></p>
    			<p><input class="action button submit" style='' type="submit" value="<?=_('SEND')?>"/></p>
    			<p class="disclaimer"><?=_('TXT_FEEDBACK')?></p>
    		</div>
    	</div>
    </form>
    <div id="contactable_inner"></div>
 </div>