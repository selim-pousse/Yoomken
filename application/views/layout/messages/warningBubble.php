<div id="message-noresult" class='' style='width:100%'>
	<table cellspacing="0" cellpadding="0" border="0" width="99%" style='font-size: 11px'>
	<tbody><tr>
		<td class="yellow-left" >
			<div style='<?=$nbfilters?'margin-top:-5px':''?>'>
			<?=$msg?>
			<? if (isset($nbfilters) && $nbfilters) echo '<br>'._('TRY_DISBABLE_FILTER'); ?>
			</div>
		</td>
		<td class="yellow-right"><a class="close-green"><img alt="" src="/css/images/messages/icon_close_yellow.gif"></a></td>
	</tr>
	</tbody>
	</table>
</div>