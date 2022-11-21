<style>
#yoom-mail-template a {color:#5b564d;text-decoration: none;font-weight: bold}
#yoom-mail-template spam {color:#5b564d;}
#yoom-mail-template p {color:#5b564d;}
</style>

<table id="yoom-mail-template" style="color:#5b564d;background-color: #F1F1F1;width: 640px;padding: 20px;"> 
	<tr>
		<td>
			<a href="http://<?=$_SERVER['SERVER_NAME']?>"><img src="http://<?=$_SERVER['SERVER_NAME']?>/media/img/logo/logoTitle_dark.png"></a>
		</td>
	</tr>
	<tr>
			<td style="padding: 20px;text-align: left;font-size: 12px;border: 1px solid #CCCCCC;background-color: #FBFBFB;-webkit-border-radius: 6px;-moz-border-radius:6px;border-radius: 6px;"> 
					<p><?=_('HI')?> {#hi_receiver},</p>
					
					{#content_message}
					
					<p><?=_('YOO_TEAM_END_MAIL')?></p>
			</td>
	</tr>
	<tr style="width:100%;font-size:11px;">
		<td>
			<p>
				<b>Copyright © 2013 Yoomken, All rights reserved.</b><br/>
				<a href="http://yoomken.com" style='{#astyle}'>yoomken.com</a> : Quellenstrasse 4, 8307 Effretikon - Schweiz.
			</p>
			
		</td>
	</tr>
</table>
