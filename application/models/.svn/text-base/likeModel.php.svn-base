<?php
/*
Name: Class Comment
Desc: Class to manage users comments
Last modification: 03/15/2010 by Guillaume 
*/

class YOO_LikeModel extends AppModel
{
   		
    //Save a new like or update an existing one...
    function saveLike($objlik)
	{
		if(isId($objlik->id))
		{	
			$query='REPLACE INTO `like` 
						SET id_usr_lik="'.$objlik->id_usr.'",
							date_lik="'.$objlik->date.'",
							id_meta_lik="'.$objlik->id.'",
							type_lik="'.$objlik->type.'",
							meta_lik="'.$objlik->suff.'"'
							;
		}
			
	   	$res=Db::write($query);

	   	if($res==1 || $res==2)
	   	{
	   		return true;
	   	}
	   	else
	   	{
	   		return false;
	   	}
    }
     
     function delLike($objlik)
	{
		if(isId($objlik->id_usr) && isId($objlik->id) )
		{
			$query='DELETE FROM `like` 
					WHERE id_usr_lik="'.$objlik->id_usr.'" 
						AND id_meta_lik="'.$objlik->id.'"
						AND meta_lik="'.$objlik->suff.'"';
			$res=Db::write($query);
		}
	   	if($res==1)
	   	{
	   		$typeact = ($objlik->suff=='USR'?'LU':($objlik->suff=='ACT'?'LA':'LC'));
	   		$results=Db::read('
    						SELECT related_act,id_act,id_usr_act FROM `activity` 
    						WHERE  related_act LIKE "%' . $objlik->id . '%" AND type_act="'.$typeact.'" and id_usr_act="'.me()->id.'"
    					  ');
    			if (sizeof($results)>0){
    				foreach ($results as $res) 
    				{
	    				if ($res['related_act'] == $objlik->id) 
	    				{
	    					$res=Db::write('
	    						DELETE FROM `activity` 
	    						WHERE id_act="' . $res['id_act'] . '"
	    					  ');
	    				}
	    				else 
	    				{
	    					$related = explode(';',$res['related_act']);
	    					foreach ($related as $key => $val) 
	    					{
	    						
	    						if ($val==$objlik->id) 
	    						{
	    							unset($related[$key]);					
	    							break;
	    						}
	    					}
	    					$related = implode(';',$related);
	    					$res2=Db::write('UPDATE `activity` SET related_act="'.$related.'",date_act="'.date("Y-m-d H:i:s").'" WHERE id_act = "'.$res['id_act'].'"');
	    				}
    				}
    			 	
    			}
	   		return true;
	   	}
	   	else
	   	{
	   		return false;
	   	}
    }   
 }
?>