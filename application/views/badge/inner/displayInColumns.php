<? if ($badges) : ?>
	
	<div class='first left' style="width: 100%">
		
		<div class='profile-tabs tabs left badges isotope' style="background: none;width:80%;opacity: 0;min-height: 30px">
			<? 
				$multiple = ceil(count($badges)/4); 
				foreach ($badges as $index => $bdg):
					$lang = $this->session->get('lang');
					//if (($index % $multiple) == 0) echo '<div class="column-badge left">';
			?>
				<div class='big-badge img-badge left tooltips isotope-post' name="<?=$bdg->name?>" style="width: 160px;border-right: none;padding: 0 5px 8px;color:#826D4F;cursor:help;margin:0 -5px;"
					content="<b>Badge <?=$bdg->name?></b> (<?=$bdg->type=='SKILL'?_('Know-How'):_('Personality')?>) <br/> <p><?=preg_replace('#\"(.*)\"#is', '«\\1»', $bdg->desc)?></p>"
					toolposition='leftMiddle' targetposition='rightMiddle' > 
					<span class='left' style="color:#8F8D89;width:40px;margin:0 0 -20px 5px"><?=$bdg->count?> x</span>
					
					<a class='right' style='margin-left:-35px;width: 160;margin-bottom:155px;'>
						<? for ($i=0; $i < min($bdg->count,5); $i++)  {?>
							<div style="height: 5px;z-index:<?=99-$i?>;position:relative">
								<img src="<?=$bdg->img160?>" >
							</div>
						<?}?>
					</a>
					<div class='hide' css-desc-badge desc-badge desc-badge-<?=$bdg->name?>"> 
						<p>
							<b>Badge <?=$bdg->title?> : </b><?=$bdg->desc?>
						</p>
						
					</div>
				
				</div>
			<?
				//if (($index % $multiple) == $multiple-1) echo '</div>';
			endforeach;
			//if (($index % $multiple) != $multiple -1) echo '</div>'?>
		</div> 
	</div>
<? else:?>
	<h3 class='none' style=''>None</h3>
<? endif;?>