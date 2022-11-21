<script>function initBoxy(){}</script>
<?php foreach ($activities as $act):

$desc_html  = addActiveLinks(_2br(detectTitle($act->desc)))
	?>
<div class='art-postDash block-sub-more' style='position:relative' >
	
	<?/*
	<div class='type-flux' idact='<?=$act->id?>' action='/ajax/content/view/' style='left:-5px'>
		<div title='<?=gettext('TOOLTIP_'.$act->type)?>' style="height: 25px;width: 25px;text-align: center;background-image: url('/css/images/<?=$typePIC[$act->type]?>.png')"></div>
	</div>*/?>
	
	<div class='art-PostContent post-form'  style='border-top:1px solid #EBEBEB;padding-top:5px;margin: 0 30px;display: inline-block;width:580px'>
		<div class='post-right'>
				<div id='<?=$act->id?>-postTitle' class='content <?=$isOwner? '':''?>' style='min-height:25px;width:<?=$widthCnt?>px'>
					<div class='orange shortcut'></div>
					
					<b id='<?=$act->id?>-postTitle_fix' class='content title' style=''>
						<img src="<?=getUserPic($act->user->id,$act->user->id_img,24,$act->user->email)?>" 
						alt="<?=$act->user->name?>" 
						class="ppict profil-usr"
						title="<?=$act->user->name?>" style='padding:0;width:15px;height:15px;margin-top:-3px'/>
						<?=_('AVIS').' '._('OF')?>&nbsp;<a style='color:#292319' href='/<?=$act->user->url?>'><?/*if ($act->flux) echo ($act->flux=='JB'?'Asker':'Provider')*/?>&nbsp;<?=$act->user->name?></a>	
					</b>
				</div>
				<div class='cleared'> </div>
				<span><?=$desc_html?></span>
		</div>
		
				<div class='right' style='font-size:11px;'><?=formatDate($act->date)?></div>
	</div> 
	<div style='clear:both;'></div>
</div>
<? endforeach;?>