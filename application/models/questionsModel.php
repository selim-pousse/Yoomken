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
class YOO_QuestionsModel extends YOO_ActivitiesModel
{
	/*
	 *  the view to handle
	 */
	private $vac = 'view_content';
	protected $model = 'questions';
	protected $filter_type = '..1';	
	
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
	public function getWhereType($type = '')
	{
		$whereType = parent::getWhereType($type);
		$whereType .= ' AND type_' .$this->sfx. ' IN ("QU") '; 		
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
	public function saveOne($act)
	{
		if (is_array($act)) $act = new ActivityAdapter($act);
		// vars
		$successAct = false;
		$successCon	= false;
		$success	= false;
					
		// at first we save the datas in the activity Table
		list($successAct,$new)	= parent::saveOne($act);
		$success	= $successAct;

		$act->provider = 1;
		//die('dsfdsfj');
		// afterwards  datas in the Content Table 
		if ($successAct && in_array($act->type,array("QU") ))
		{
			if ($new)
			{				
				$query = 'INSERT INTO content VALUES("' .	$act->id . '","' . 
															$act->privacy  . '","' . 
															$act->id_spt  . '",
															null,
															null,
															"' .$act->views  . '",
															"' .$act->featured . '",
															"' .escape($act->desc,'rich') .'",
															null,null,1)';														
				
			}
			else {
				$query = '	UPDATE content 
							SET id_spt_cnt = "'.$act->id_spt.'",
								desc_cnt ="'.escape($act->desc,'rich').'" 
							WHERE id_act_cnt = "'.$act->id.'"';
			}
			$successCon = Db::write($query);
			$successCon = $new? $successCon:1;
			//echo html_entity_decode($res[0]['media_cnt']);
			$success	= $successCon;
		}
		return $success;
	}
}
?>