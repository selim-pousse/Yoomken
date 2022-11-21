<?php
/**
 * Manifest
 * 
 * application/models/contentsModel
 * 
 * Model for contents (videos, pictures and so forth)
 * 
 * @copyright: Yoomken Li
 * 
 */
class YOO_ContentsModel extends YOO_ActivitiesModel
{
	/*
	 *  the view to handle
	 */
	private $vac = 'view_content';
	protected $model = 'contents';
	
	/*
	 * Constructor
	 */
	public function __construct()
    {
   		parent::__construct();
   	}
	
	/**
	 * Creates a query bit for the content type parameter
	 * 
	 * @param string $type One of 'VI', 'PI', etc
	 * @param boolean wall mode, show absolutely all types
	 * 
	 * @return string the query bit
	 */
	public function getWhereType($journal, $types = null)
	{
		$whereType = parent::getWhereType($journal, $types);
		
		//if (isset($this->filters['SEARCH']) || isset($this->filters[md5('PP'.who()->id)]))  // include only the content if the user process for searching or enable the filter MY_POST (PP)
			
			$whereType .= ' AND type_' .$this->sfx. ' '.($types=='AC'?'NOT':''). ' IN ("NW","AV","OF","QU","CR") '; 
				
		return $whereType;
	}
	
	/* 
   	 *  Save a stack of new Contents or update an existing one...
	 * 
	 * @return array including the Activity's datas
	 * 
	 */
	public function save($datas = array())
	{
		// vars
		$return  	= true;
		
		// parse activities
		foreach ($datas as $act)
		{
			$return &= $this->saveOne($act);
		}
		
		return $return;
	}
	
	/**
	 * Saves a content into database;
	 * 	It only affects content, it assumes that the insert into activity table has succeeded
	 * 
	 * @see application/models/ActivitiesModel#saveOne($act)
	 * 
	 * @params mixed array of content
	 * 
	 * @return boolean
	 */
	public function saveOne(&$act)
	{
		if (is_array($act)) $act = new ActivityAdapter($act);
		
		
		// vars
		$successAct = false;
		$successCon	= false;
		$success	= false;
		
		//print_r($act);die();
					
		// at first we save the datas in the activity Table
		list($successAct,$new)	= parent::saveOne($act);
		$success	= $successAct;
		// afterwards  datas in the Content Table 
		if ($successAct && in_array($act->type,array("NW","AV","CR","OF","QU","WB")) && !$act->jumpcnt)
		{
			if ($new)
			{														
				$query = 'INSERT INTO content VALUES("' .	$act->id . '","' . 
													 		me()->id . '","' .
															$act->privacy  . '","' . 
															$act->id_spt  . '","' . 
															addslashes($act->media)  . '","' . 
															escape($act->title,'rich') . '","' . 
															$act->views  . '","' . 
															$act->featured . '","' . 
															escape($act->desc,'rich') . '","' . 
															escape($act->shortdesc,'rich') . '","' . 
															$act->thumbnail . '",
															1,"' . 
															$act->paie. '","' . 
															$act->currency. '")';	
			}
			else {
				$query = '	UPDATE content 
							SET id_spt_cnt = "'.$act->id_spt.'",
								shortdesc_cnt = "'.escape($act->shortdesc,'rich').'",
								desc_cnt ="'.escape($act->desc,'rich').'" ,
								paie_cnt ='.$act->paie.'
							WHERE id_act_cnt = "'.$act->id.'"';
			}
			$successCon = Db::write($query);
			$successCon = $new? $successCon:1;
			//echo html_entity_decode($res[0]['media_cnt']);
			$success	= $successCon;
		}
		
		if (ishim() && in_array($act->type,array('NW','AV','OF','QU','CR'))) 
    	{
    		$msg = new Adapter();
    		$rcv = me();
			$dest= who();
			$this->model('message');
			$msg->content 	= preg_replace('/\{#user\}/','{a#'.$rcv->name.'|'.$rcv->url.'#a}', _('POSTED_ON_YOUR_WALL').'. {a#'._('Go there now').'|/journal/'.$act->id.'#a}.');
			$msg->id_usr 	= '00'; 
			$msg->smail 	= 0;
			$msg->mail 		= Template::getInstance()->render('message/mail/postedInWall',array('posteur'=>me(),'post'=>$act->shortdesc,'posturl'=>'/journal/'.$act->id));
			$msg->subject	= preg_replace('/\{#user\}/',$rcv->name, _('POSTED_ON_YOUR_WALL'));
			$this->message->saveOne($msg,array($dest->id));
			$this->message->sendMail('00',$dest->id);
    	}
		else if($act->type=='WB'){
			$query = 'INSERT INTO badge VALUES("' .	$act->title . '",
													"' . $act->title  . '",
													"' .$act->desc  . '",
													"",
													"WISH",
													NULL,
													-3,
													"' . $this->session->get('lang'). '");';
			$success = Db::write($query);
		}	
		
		
		return $success;
	}
	
	public function getCritiquesTo($iduser)
	{
		$query = '
								SELECT a.*,u.*
								FROM `'.$this->view.'` AS a
								INNER JOIN `user` AS u ON a.id_usr_'.$this->sfx.' = u.id_usr
								WHERE  a.related_'.$this->sfx.'="'.$iduser.'" and type_'.$this->sfx.' = "AV"
					';
		$res = Db::read($query);
		
		foreach ($res as &$value)
		{
			$value = new ActivityAdapter($value);
		}
		
		if(count($res))
   		{
   			return $res;
  	   	}
		else return false;
	}
}
?>