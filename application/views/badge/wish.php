<?= $this->render($this->controller.'/blocks/subMenu')?>

<div id='badges-wished' class='first left' style="width: 700px;;font-size: 13px">
		
<? if ($badges):?>
	<table style="width: 100%;" style="">
	<? foreach ($badges as $key => $bdg) :?>
		<tr style="vertical-align: top;border-bottom: 1px solid #EBEBEB; float: left;width: 695px;padding: 10px 0">
			<td style="width: 60px">
				<? if ($bdg->status == -3):?>
					<?=$this->render('like/inner/action-like',array('act'=>$bdg,'sort'=>'ACT'));?>
				<? elseif ($bdg->status == -2) :?>
				<div class='label-rotated ui-corner-all buttonv2'>
					<?=_('Planed')?>
				</div>
				<? else :?>
				<div class='label-rotated ui-corner-all buttonv2'>
					<?=_('Accepted')?>
				</div>
				<? endif;?>
			</td>
			<td style="width: 150px">
				<b><?=ucfirst($bdg->title)?></b>
				<br/>
				<a href="/<?=$bdg->user->url?>/about"  style='font-size: 11px'>
					<?=_('by').' '.$bdg->user->name?>
				</a>
			</td>
			<td style="">
				<?=_2br($bdg->desc) ?>
			</td>
		</tr>
	<? endforeach;?>
	</table>
<? else :?>
	<br/>
	<h3 class='none' style=''>None</h3>
<? endif;?>
</div>