<? foreach($people as $usr) :
	//if ($me && $me->id==$usr->id) continue; 
	//_debug($usr->filters);
?>
	<div href="#" class='art-Post-inner left <?=$usr->id?>-usr ui-corner-all isotope-post' style='' id='<?=$usr->id?>-usr'>
		
		<div class="entry drop-shadow curved ui-corner-all">
			<?/*<ul class='post-left myfilter droppable' style='width: 100px;padding:5px 0;overflow: hidden' idact='<?=$usr->id?>'>
			<?if (0 && isset($usr->filters)) foreach ($usr->filters as $filter):?>
				<li>
					<span href="/ajax/filter/dettach/<?=$filter->id?>/<?=$usr->id?>/<?=$typeFilter?>" class="dettach-filter right yoo-icon" title="déttacher le filtre"><span class="ui-icon ui-icon-closethick"></span></span>
					<a class='ui-state-default  etiquette' style='background-color:#F1EEE9;' href='/filter/<?=$filter->id?>/<?=$typeFilter?>'><?=$filter->alias?></a>
				</li>
			<?endforeach;?>
			</ul>*/?>
			
			<?/**<div title='About him' class='get-more get-more-css postActions'  style='' action='/ajax/about/view/' idact='<?=$usr->id?>'>
				<div style='z-index:50;margin:-10px 5px 0; top:50%;position:absolute; font-size: 1.5em;font-weight: bold;'>
					‹‹
				</div>
			</div>**/?>
				
			<div class='relation-bulle' style="" id='<?=$usr->id?>-act'>
				<?=$this->render('/people/inner/displayBulle',array('usr'=>$usr));?>
			</div>
			
			<div class="clear"></div>
		</div>
		
		<? //if ($people[count($people)-1]->id != $usr->id) :?> 
		<?/*<div class='break-usr <?=$usr->id?>-usr break-wrap-usr' style=""></div><?//endif?>*/?>
	</div>
<?endforeach;?>