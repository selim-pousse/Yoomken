<?php

/**
 * Manifest
 * 
 * application/models/FilterModel
 * 
 * Model for people used in people section
 * 
 * @copyright: Yoomken Li
 * 
 */

class YOO_FilterModel extends AppModel 
{
	
	protected $allowed = array(	
								'type'=>'','sorting'=>'newest','beg'=>0,'limit'=>16, 
								'date_up'=>'','date_down'=>'','withPic'=>true
								);
	
	
	function getByIdSmart($idfilter,$type = '...')
   	{
   		if (empty($type)) $type = '...';  
   		//if ( $idfilter!='' || !isId($idfilter)) return new Adapter(); 		
   		$query 	= 'SELECT * FROM `filter_smart` 
   					WHERE type_filsma REGEXP "^'.$type.'$"  AND id_filsma = "'.$idfilter.'" 
   						AND id_user_filsma ="'.$this->session->me()->id.'"  
   				   	LIMIT 1';
   		$res = Db::read($query);
   		if(count($res)==1)
   		{
			return new FilterAdapter($res[0]);
   		}
   		else return null;
   	}
   	
	function getStaticSmart($type = '...')
   	{
   		//if (!is_array($type)) $type = array($type);  	
   		$query 	= 'SELECT * FROM `filter_smart` 
   							WHERE  id_user_filsma ="'.$this->session->me()->id.'"  AND '. 
   									'access_filsma < 0 AND type_filsma REGEXP "^'.$type.'$"  
   							ORDER BY order_filsma';
		//die($query);
   		$res = Db::read($query);
   		$filters = array();
   		if(count($res)>0)
   		{
   			foreach ($res as $fil) 
   			{
   				$fil = new FilterAdapter($fil);
   				$filters[$fil->id] 	= $fil; 
   			}  
   			
   		}
   		return $filters;
   	}
	
	function initStaticSmart($mustcount = 9)
   	{	
   		$filters = $this->getStaticSmart();
		if (!count($filters) || count($filters)!= $mustcount)
		{
			$idusr = $this->session->me()->id;
			
   			$query = '	REPLACE INTO `filter_smart` 
	    				(`id_filsma`,`id_user_filsma`,`alias_filsma`,`sequence_filsma`,`access_filsma`,`type_filsma`,`active_filsma`,order_filsma) 
	    				VALUES ( "'.md5('AL'.$idusr).'",	"'.$idusr.'","AL=ALL","",-1,"111",1,1),
	    					   ( "'.md5('FF'.$idusr).'",  	"'.$idusr.'","FF=MY_PISTS","#1",-1,"111",0,2),
	    					   ( "'.md5('SS'.$idusr).'",  	"'.$idusr.'","SS=MY_SUIVEURS","#1",-1,"111",0,3),'
	    					  // ( "'.md5('PP'.$idusr).'",  	"'.$idusr.'","PP=MY_POSTS","#1",-1,"000",0,4),
	    					  .' ( "'.md5('CC'.$idusr).'",  "'.$idusr.'","CC=MY_COLLS","#1",-1,"111",0,4),
	    					   ( "'.md5('XXX'.$idusr).'",   "'.$idusr.'","XXX=NEARBY","#1",-2,"111",0,1),
	    					   ( "'.md5('SRV'.$idusr).'", 	"'.$idusr.'","SRV=MY_SERVICES","#1",-2,"111",0,2),
	    					   ( "'.md5('PRO'.$idusr).'", 	"'.$idusr.'","PRO=PROVIDERS","#1",-2,"111",0,3),
	    					   ( "'.md5('ASK'.$idusr).'", 	"'.$idusr.'","ASK=ASKERS","#1",-2,"111",0,4),
	    					   ( "'.md5('LIS'.$idusr).'", 	"'.$idusr.'","LIS=LISTENING","#1",-2,"111",0,5)';
			$res = Db::write($query);
			$query = 'REPLACE INTO `filter` 
	    				(`id_fil`,`id_filsma_fil`,`id_fildef_fil`,`id_op_fil`,`id_in_fil`,`value_fil`,`label_fil`,`attach_fil`,`type_fil`) 
	    				VALUES 	(1,"'.md5('CC'.$idusr).'","p",10,5,"ME>>","en collaboration","OR","111"),'
	    						//(1,"'.md5('PP'.$idusr).'","p",10,5,"ME","mes posts","OR","111"),
								.'(1,"'.md5('FF'.$idusr).'","p",10,5,"ME>","mes pistes/mes pistés","OR","111"),
								(1,"'.md5('SS'.$idusr).'","p",10,5,">ME","mes suiveurs","OR","111"),
								(1,"'.md5('SRV'.$idusr).'","p",10,5,"MYS","mes services","OR","110"),
								(1,"'.md5('SRV'.$idusr).'","t",10,5,"MYS","mes services","OR","001"),
								(1,"'.md5('PRO'.$idusr).'","p",10,5,"PRO","provider seul","OR","100"),
								(1,"'.md5('ASK'.$idusr).'","p",10,5,"ASK","asker seul","OR","100"),
								(1,"'.md5('PRO'.$idusr).'","p",10,5,"PRO","provider seul","OR","011"),
								(1,"'.md5('ASK'.$idusr).'","p",10,5,"ASK","asker seul","OR","011"),
								(1,"'.md5('LIS'.$idusr).'","p",10,5,"LIS","listening only","OR","111"),
								(1,"'.md5('XXX'.$idusr).'","l",10,5,">ME<","à proximité","OR","111")';
			$res = Db::write($query);
		}
   		
   	}
   	
	function getActiveSmart($type,$access = null)
   	{
   		if ($access) $access = ' access_filsma = '.$access ;
		else $access = ' 1 '; 	
   		$query 	= 'SELECT * FROM `filter_smart` 
   							WHERE active_filsma=1 AND '.$access.' AND
   								  type_filsma REGEXP "^'.$type.'$" AND 
   								  id_user_filsma="'.$this->session->getUserVar('id').'"
   					';
   		
   		$res = Db::read($query);
   		$filters = array();
   		if(count($res)>0)
   		{
   			foreach ($res as $fil) 
   			{
   				$fil = new FilterAdapter($fil);
   				$filters[$fil->id] 	= $fil; 
   			}  
   		}
   		return $filters;
   	}
	
	function getAllSmart( $type,$access = null)
   	{
   		$iduser = $this->session->getUserVar('id');
   		
   		if ($access) $access = ' access_filsma = '.$access ;
		else $access = ' 1 '; 	
		
   		//if (empty($iduser)) 
   		//	$usr = ' id_user_filsma IS NOT NULL ';
		//else 
			$usr = ' id_user_filsma="'.$iduser.'"';
   		
   		$query 	= 'SELECT * FROM `filter_smart` 
   					WHERE '.$usr.' AND '.$access.'
   						AND type_filsma REGEXP "^'.$type.'$" 
   					ORDER BY order_filsma';
   		
   		//die($query);
   		$res = Db::read($query);
   		$filters = array();
   		if(count($res)>0)
   		{
   			foreach ($res as $fil) 
   			{
   				$fil = new FilterAdapter($fil);
   				$filters[$fil->id] 	= $fil; 
   			}  
   			
   		}
   		return $filters;
   	}
	
	function getAll($idsma = '',$type='...')
   	{
   		//if ($idsma!='' || !isId($idsma)) return false;
   		
   		$query 	= 'SELECT * FROM `filter` WHERE id_filsma_fil="'.$idsma.'" AND type_fil REGEXP "^'.$type.'$" ';
   		$res = Db::read($query);
   		$filters = array();
   		if(count($res)>0)
   		{
   			foreach ($res as $fil) 
   			{
   				$fil = new FilterAdapter($fil);
   				$filters['#'.$fil->id] 	= $fil; 
   			} 
   		}
   		return $filters;
   	}
   	
	function getAllDef($type = 'ACT')
   	{
   		
   		$query 	= 'SELECT * FROM `filter_def` WHERE type_fildef IS NULL OR type_fildef = "'.$type.'"';
   		$res = Db::read($query);
   		$filters = array();
   		if(count($res)>0)
   		{
   			foreach ($res as $fil) 
   			{
   				$fil = new FilterAdapter($fil);
   				if ($fil->id == 'd') continue; // hack beacause date is a feature not implemented yet
   				$filters[$fil->id][] 	= $fil; 
   			}  
   			return $filters;
   		}
   		else return false;
   	}
   	
   	function getAllOperator()
   	{
   		$query 	 = 'SELECT * FROM operator  ';
   		$res = Db::read($query);
   		$ops = array();
   		if(count($res)>0)
   		{
   			foreach ($res as $op) 
   			{
   				$op = new OpAdapter($op);
   				$ops[$op->id] = $op;
   			}  
   			return $ops;
   		}
   		else return false;	
   	}
   	
	function getAllInput()
   	{
   		$query 	 = 'SELECT * FROM input';
   		$res = Db::read($query);
   		$ins = array();
   		if(count($res)>0)
   		{
   			foreach ($res as $in) 
   			{
   				$in = new InputAdapter($in);
   				$ins[$in->id] = $in;
   			}  
   			return $ins;
   		}
   		else return false;	
   	}
   	
   	function saveSub($subfilters)
   	{
   		$query = 'REPLACE INTO `filter` 
	    				(`id_fil`,`id_filsma_fil`,`id_fildef_fil`,`id_op_fil`,`id_in_fil`,`value_fil`,`label_fil`,`attach_fil`) 
	    				VALUES ';
   		foreach ($subfilters as $data)
   		{
   			$data = new FilterAdapter($data);
   			$query .= '( "'.$data->id.'",  "'.$data->id_filsma.'","'.$data->id_fildef.'","'.$data->id_op.'","'.$data->id_in.'","'.$data->value.'","'.$data->label.'","'.$data->attach.'"),';
   		}
   		$query=substr($query,0,-1);//delete the last ','
   		$res=Db::write($query);
   	}
   	
	function save($mainfilter,$subfilters)
   	{
   		$mainfilter = new FilterAdapter($mainfilter);
   		  
   		$query = '	REPLACE INTO `filter_smart` 
	    				(`id_filsma`,`id_user_filsma`,`alias_filsma`,`sequence_filsma`,`type_filsma`,`active_filsma`) 
	    				VALUES ( 	"'.$mainfilter->id.'",  "'.$mainfilter->id_user.'",
	    							"'.$mainfilter->alias.'","'.$mainfilter->sequence.'",
	    							"'.$mainfilter->type.'","'.$mainfilter->active.'");';
   		
   		$res=Db::write($query);
		$this->saveSub($subfilters); 
   	}
   	
	function isOwner($idsmart,$uid)
   	{  
   		$query = 'SELECT * FROM filter_smart WHERE id_filsma="'.$idsmart.'" AND id_user_filsma="'.$uid.'"' ;
   		$res=Db::read($query);

   		if(count($res)) return true;
   		else return false;
   	}
   	
	/*
	 * Attach the filter
	 */
    public function attach($idsmart, $idact,$type)
    { 	
    	$type = strtolower($type);
    	if ($this->session->isLogged()  && $this->isOwner($idsmart,$this->session->getUserVar('id')) ) 
    	{	 	    	
	    	$query = '	REPLACE INTO `filter_'.$type.'` 
	    				(`id_filsma_fil'.$type.'`,`id_'.$type.'_fil'.$type.'`) 
	    				VALUES ( "'.$idsmart.'",  "'.$idact.'");';
	    				
	    	$res=Db::write($query);
	    	//echo $query;
	    	
	      	if($res==1 || $res==2)
	      	{
   				return array('message'=>_('ATTACHED'),'success'=>true);
	    	}
	    	else
	    		return array('message'=>'Sommething wrong durring attaching filter!','success'=>false);
    	}
    	else return array('message'=>_('ERR_NOT_LOGED'),'success'=>false);
    }
    
 	
	/*
	 * dettach the filter
	 * 
	 */ 	
    public function dettach($idsmart,$idact,$type)
    {
    	if ($this->session->isLogged()  && $this->isOwner($idsmart,$this->session->getUserVar('id')) ) 
    	{
    		$res=Db::write('
    						DELETE FROM `filter_'.$type.'` 
    						WHERE id_filsma_fil'.$type.'="' . $idsmart . '" AND id_'.$type.'_fil'.$type.'="' . $idact . '"
    					  ');
    		if($res==1)
    		{
    			return array('message'=> _('DETTACHED'),'success'=>true);
    		}
    		else
    		{
    			return array('message'=> 'you\'re not at the beginning attached','success'=>false);
    		}
    	}
    	else
    	{
    		return array('mesaage'=>_('ERR_NOT_LOGED'),'success'=>false);
    	}
    }
    
	public function remove($idsmart)
    {
    	if ($this->session->isLogged()  && $this->isOwner($idsmart,$this->session->getUserVar('id')) ) 
    	{
    		$res=Db::write('
    						DELETE FROM `filter_smart` 
    						WHERE id_filsma = "' . $idsmart . '"
    					  ');
    		if($res==1)
    		{
    			return array('message'=> 'DELETED','success'=>true);
    		}
    		else
    		{
    			return array('message'=> 'doesn\'t exist','success'=>false);
    		}
    	}
    	else
    	{
    		return array('mesaage'=>_('ERR_NOT_LOGED'),'success'=>false);
    	}
    }
    
	public function setActive($idsmart,$opposite = true, $check = 1)
    { 	
    	if ($this->session->isLogged()  && $this->isOwner($idsmart,$this->session->getUserVar('id')) ) 
    	{
    		if ($opposite) $active = '!active_filsma';
			else $active = $check;
				    	
	    	$query = '	UPDATE `filter_smart` SET  `active_filsma` = '.$active.' WHERE id_filsma = "'.$idsmart.'";';
	    				
	    	$res=Db::write($query);
	    	//echo $query;
	    	
	      	if($res==1 || $res==2)
	      	{
   				return array('message'=>'sucessfully checked','success'=>true);
	    	}
	    	else
	    		return array('message'=>'Sommething wrong during activing filter!','success'=>false);
    	}
    	else return array('message'=>_('ERR_NOT_LOGED'),'success'=>false);
    }
	
	public function setMultiActive($access,$opposite = true, $check = 1)
    { 	
    	if ($this->session->isLogged()) 
    	{
    		$uid = $this->session->getUserVar('id'); 
			
    		if ($opposite) $active = '!active_filsma';
			else $active = $check;
			
			if ($access) $access = ' access_filsma = '.$access;
			else $access =  ' 1 ';
				    	
	    	$query = '	UPDATE `filter_smart` SET  `active_filsma` = '.$active.' 
	    					WHERE '.$access.'  AND id_user_filsma="'.$uid.'" ';
	    			
	    	$res=Db::write($query);
	    	//echo $query;
	    	
	      	if($res==1 || $res==2)
	      	{
   				return array('message'=>'sucessfully checked','success'=>true);
	    	}
	    	else
	    		return array('message'=>'Sommething wrong during activing filter!','success'=>false);
    	}
    	else return array('message'=>_('ERR_NOT_LOGED'),'success'=>false);
    }
	
	/* 
	 *  initialize the the static filters to zero 
	 */
	public function initActive($active = 0)
    {
    	$uid = $this->session->getUserVar('id'); 	
    	if ($this->session->isLogged()) 
    	{	 	    	
	    	$query = '	UPDATE `filter_smart` SET  `active_filsma` = '.$active.' 
	    					WHERE access_filsma = -1 
	    						AND id_user_filsma="'.$uid.'" 
					;';
	    				
	    	$res=Db::write($query);
	    	//echo $query;
	    	
	      	if($res==3)
	      	{
   				return array('message'=>'sucessfully init','success'=>true);
	    	}
	    	else
	    		return array('message'=>'Sommething wrong during desabling filter!','success'=>false);
    	}
    	else return array('message'=>_('ERR_NOT_LOGED'),'success'=>false);
    }
	
}