<?php 
if (!$this->session->isLogged()) return;
$me = $this->session->get('user');
$prDate = '00:00:00';
foreach ($messages as $msg): 
$msg->content = addActiveButton(addActiveMyLinks(_2br($msg->content)));
$curDate = date("Y-m-d H:i",strtotime($msg->date));?>
	<div class='tchat-bulle <?=$me->id!=$msg->user->id?"recever":""?>' id='<?=$msg->id?>-msg'>
		<img class="img-bulle photo" src="<?=getUserPic($msg->user->id,$msg->user->id_img,40,$msg->user->email)?>" 
			alt="<?=$msg->user->name?>" 
			title="<?=$msg->user->name?>" style='margin-top: 4px;'/>
			<div class="msg-bulle" idmsg='<?=$msg->id?>' style='font-size: 12px'>
				<?=$msg->content?>
			</div>
			<div class='date-bulle' style="position: relative">
				<? if($msg->user->id==$me->id || $msg->user->id == '00'):?>
				<div class="delete-msg right hide" style=''>
					<span act="<?=$msg->id?>" type='msg' href="/ajax/msg/rem/<?=$msg->id?>" class="delete-act yoo-icon right alert" title="<?=_('DELETE_MSG')?>" style="margin: 0px; ">
						<span class="ui-icon ui-icon-closethick"></span>
					</span>
				</div>	
				<?endif;?>
				<div class='date'><?= (strcmp(formatDate($prDate),formatDate($curDate))==0)?'':formatDate($curDate)?></div>
			</div>
	</div>	
	<div class='cleared'></div>
<?
$prDate = date("Y-m-d H:i",strtotime($curDate));
endforeach;?>