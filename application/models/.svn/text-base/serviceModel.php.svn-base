<?php 


class YOO_ServiceModel extends AppModel 
{
	
	protected $allowed = array('id'=>'');
	
	
	public function getAll($parent = null)
   	{
   		if ($parent)  $parent = '= "'.$parent.'"';
   		else $parent = 'IS NULL';
   		$res=Db::read('SELECT * FROM `tag` WHERE type_tag = "service" AND lang_tag = "'.me()->lang.'" AND id_parent_tag '.$parent.' ORDER BY order_tag');
   		//Check if a user has this email
   		//print_r($res);
   		if(count($res))
   		{
	   		foreach ($res as &$value)
			{
				$value = new ServiceAdapter($value);
				//_debug($value);
			}
			return $res;	
   		}
   		else return new Adapter();
   	}
}

?>