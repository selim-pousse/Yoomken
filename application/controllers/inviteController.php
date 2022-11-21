<?php
/**
 * Manifest
 * 
 * application/controllers/userController
 * 
 * Manages user actions like login and logout
 * 
 * @copyright: Yoomken Li
 * 
 */
Class InviteController Extends AppController 
{
	/**
	 * Needs to be implemented
	 * 
	 * @see system/lib/baseController#index()
	 *
	 */
	public function index($format = 'full')
	{
	
		$user = me();
		$this->template->page( 'invite/view',array('cacheMainSearch'=>'1','title'=>'Invite your friends'));
	}
	
	
	public function ajax(){
		// 	general protection: user must be logged in
		if (!$this->session->isLogged())
		{
			echo jsonRet('not logged',false);
			return;
		}
		
		$act = $this->get_post('act');
		switch ($act)
		{
			case 'nearby':
					$this->nearby();
				return;
			case 'light':
			case 'view':
					$data = $this->index($act);
					echo  jsonRet(_('DONE'), true,null,$data['meta'], $data['view'], 1);
				return;
			case 'status':
					$sta= $this->get_post('id');
					$this->model('user');
					if($this->user->changeStatus($sta)){
						echo jsonRet('status changed',true);
						return;
					}
				break;
			case 'myOption':
			case 'myProfile':
					$view = $this->template->render('layout/module/'.$act,array('who'=>$this->session->get('user'),'change'=>1));
					echo jsonRet(_('DONE'), true,null,$act=='myOption'?'#my-options':'#my-profil', $view, 1);
					return;
			default:
				// finally, return an error if execution has not been halted before
				
		}
		echo jsonRet('100',false);
		
	}
}
?>
