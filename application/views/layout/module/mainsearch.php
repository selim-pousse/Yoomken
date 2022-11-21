<?php 
$me = $this->session->me();
?>
<?if(!isset($cacheMainSearch)):?>
 <form id="mainsearch" class='ET-box' method='post' action='/search/<?=$this->controller=='people'?'network':'flux/'.$journal?>/' bgcolor='<?=($me && $me->profil=='C'?'#ffffff':'#f1efeb')?>'>             
	<div>
		<button id='submit-mainsearch' onclick="convertUrl()" type='submit'>Ƃ<span class='ti'>-</span>Ƌ</button>								
		<?/*<button type="button" name="context" id="input_bysearch" class='ui-corner-left' key='a'>Tous</button>*/?>
		<input type="text" value="" name="term" id="input_mainsearch" class='ui-corner-all' title=''/>
		<?/*<ul class="ul-filter" >
			<li class="wrapper"></li>
			<li class="li-critere"><a href="javascript:;"  key='a' value='Tous'>Tous</a><span class='right'>(shift+A)</span></li>
			<li class="li-critere"><a href="javascript:;" class="" key='c' value='Contenu'>Par contenu </a><span class='right'>(shift+C)</span></li>
			<li class="li-critere"><a href="javascript:;" class="" key='l' value='Lieu'>Par lieu</a><span class='right'>(shift+L)</span></li>
			<li class="li-critere"><a href="javascript:;" class="" key='p' value='Person'>Par personne</a><span class='right'>(shift+P)</span></li>
			<li class="li-critere"><a href="javascript:;" class="" key='t' value='Tag'>Par tag</a><span class='right'>(shift+T)</span></li>
			<li class="li-critere"><a href="javascript:;" class="" key='s' value='Service'>Par service</a><span class='right'>(shift+S)</span></li>
		</ul>*/?>
	</div>	
</form>
<? endif;?>