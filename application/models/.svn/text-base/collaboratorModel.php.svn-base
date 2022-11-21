<?php
/**
 * Manifest
 * 
 * application/models/contentsModel
 * 
 * Model for collaboration
 * 
 * @copyright: Yoomken Li
 * 
 */
class YOO_CollaboratorModel extends YOO_UserModel 
{
	/*
	 *  the view to handle
	 */
	protected $model = 'collaborator';
	
	/*
	 * Constructor
	 */
	public function __construct()
    {
   		parent::__construct();
   	}
	
	/*
	 * get All the people with whom i have collaborated
	 */
	public function getAll($iduser, $limit = 8)
    {				 
		$query =	'SELECT SQL_CALC_FOUND_ROWS DISTINCT U.* FROM histo_collaborator hc
						INNER JOIN grp_usr gp_u ON (hc.id_grpusr_coll = gp_u.id_grpusr )
						INNER JOIN grp_usr gp_g ON (hc.id_grpusr_coll = gp_g.id_grpusr )
						INNER JOIN user U ON (U.id_usr = gp_g.id_usr_grpusr)
						WHERE  gp_u.id_usr_grpusr = "'.$iduser.'" 
						AND gp_g.id_usr_grpusr <> gp_u.id_usr_grpusr
						AND ( 1 OR date_end_coll IS NOT NULL)
						GROUP BY gp_u.id_usr_grpusr
						ORDER BY hc.date_begin_coll DESC 
						LIMIT '.$limit;
	    //die($query);
		$res = Db::read($query);
	   	$nokey = array();
	   	if (count($res))
	   	{
	   		foreach($res as $usr)
	   		{
	   			$usr = new UserAdapter($usr);
	   			$nokey [] = $usr;
	   		}
	   	}
		$resnb = Db::read("SELECT FOUND_ROWS()");
    	return array($resnb[0]['FOUND_ROWS()'],$nokey);
   	}
	
	function getActualCollaborator($user)
   	{
   		return $this->getFollowers($user,true);
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
		
		foreach ($datas as $act)
		{
			$return &= $this->saveOne($act);
		}
		
		return $return;
	}
	
	/**
	 * Save a collaboration into database;
	 * 
	 * 
	 * @params mixed array of content
	 * 
	 * @return boolean
	 */
	public function saveOne($input)
	{
		$idgrp = getIdSet($input['ids_grp']);
		if (isset($input['initiator']))
		{			
			$query = 'INSERT INTO histo_collaborator VALUES (		NULL,"' .
														$idgrp  . '","' . 
														$input['initiator']  . '","' . 
														$input['date_begin'] . '",
														NULL)';	
														
			$query2 = 'INSERT INTO grp_usr VALUES ';
			foreach ($input['ids_grp'] as $key => $id)	{
				$query2 .=		'(
														"' .$idgrp  . '","' . 
														$id  . '","' . 
														$input['profils_grp'][$key] . '",
														"M",
														"P",
														NULL'
								.'),';
			}
			$query2=substr($query2,0,-1);//delete the last ','	
			//die($query2);												
			$res = Db::write($query2);
		}
		else {
			$query = '	UPDATE histo_collaborator 
						SET date_end_coll = "'.$input['date_end'].'"
						WHERE id_grpusr_coll = "'.$idgrp.'" AND date_end_coll is NULL';
		}
		$success = Db::write($query);
			
		return $success;
	}
	
	function getLike($_str)
   	{
   		$_str = strtolower ($_str);
		$iduser = $this->session->me()->id;
		
		$res=Db::read('SELECT DISTINCT id_usr,fullname_usr,privacy_usr,url_usr FROM histo_collaborator hc
						INNER JOIN grp_usr gp_u ON (hc.id_grpusr_coll = gp_u.id_grpusr )
						INNER JOIN grp_usr gp_g ON (hc.id_grpusr_coll = gp_g.id_grpusr )
						INNER JOIN user U ON (U.id_usr = gp_g.id_usr_grpusr)
						WHERE  gp_u.id_usr_grpusr = \''.$iduser.'\' 
							AND gp_g.id_usr_grpusr <> gp_u.id_usr_grpusr
							AND ( 1 OR date_end_coll IS NOT NULL)
							AND ( ( fullname_usr LIKE(\'%'.$_str.'%\') OR ('.$this->aproximate.' AND SOUNDEX(fullname_usr) = SOUNDEX(\''.$_str.'\') ) 
										AND privacy_usr=\'P\') OR
								( url_usr LIKE(\'%'.$_str.'%\') OR ('.$this->aproximate.' AND SOUNDEX(url_usr) = SOUNDEX(\''.$_str.'\') )) )
						GROUP BY gp_u.id_usr_grpusr
						ORDER BY hc.date_begin_coll DESC 
						LIMIT 0,5');
						
		$arr=array(); 
		if(count($res)>=1)
		{	
			foreach($res as $r)
			{
				$usr = new UserAdapter($r);
				if (!preg_match('/'.$_str.'/i',$usr->name)) {
					$usr->name = ($usr->privacy == 'P'? $usr->url." ({$usr->fullname})":$usr->url);
				}
				$arr[]=array($r['id_usr'],$usr->name,$usr->name,$usr->name);
			}
		}
		return json_encode($arr);
   	}
}
?>