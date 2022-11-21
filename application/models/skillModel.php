<?php 


class YOO_SkillModel extends AppModel 
{
	
	protected $allowed = array('id'=>'');
	
	
	public function getAll($parent = null)
   	{
   		if ($parent)  $op = '=';
   		else $op = 'IS NULL';
   		$res=Db::read('SELECT * FROM `skill` WHERE id_parent_skil '.$op.' '.$parent);
   		//Check if a user has this email
   		//print_r($res);
   		if(count($res))
   		{
	   		foreach ($res as &$value)
			{
				$value = new SkillAdapter($value);
				//_debug($value);
			}
			return $res;	
   		}
   		else return new Adapter();
   	}
}

?>