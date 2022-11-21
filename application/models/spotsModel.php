<?php

/**
 * Manifest
 * 
 * application/models/GroupModel
 * 
 * Model for people used in people section
 * 
 * @copyright: Yoomken Li
 * 
 */

class YOO_SpotsModel extends AppModel 
{
	
	protected $allowed = array('id'=>'');
	
   	/** 
   	 *  it accepts an ID hash to load user's datas from database
	 * 
	 * @param string $id
	 * 
	 * @return array including the User's datas
	 * 
	 */
   	public function getByID($id)
   	{
   		$ret = array();
   		
   		// whether an ID or an array of ID's
   		if ( isId($id) )
		{
			$res=Db::read('SELECT * FROM `spot` WHERE id_spt="'.$id.'"');
			if ( sizeof($res) == 1 )
			{
				$ret = $res[0];
			}
		}
		
		// 
		return new SpotAdapter($ret);			
	}
	
	/*public function add($address)
	{
		if ($address!='' && $address!= LABEL_LOCATION)
		{
			if (isId($address))
			{
				return $address;
			}
			else 
			{
				$composants = explode (';#;',$address);
				$spot = array();
				if (count($composants)==0)
				{
					
				}
				else {
					foreach ($composants as $composant)
					{
						$tmp = explode (';:;',$composant);
						$spot[$tmp[0].'_spt'] = $tmp[1];
					}
				}
				$spot = new SpotAdapter($spot);		
				$this->model('spots');
				$this->spots->saveOne($spot);
				return $spot->id;
			}
		}
		return 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';	
	}*/
	
	// save a location
	public function saveOne(&$spot)
   	{
   		if (is_array($spot)) $spot = new SpotAdapter($spot);
   		if (!isId($spot->id)) 
   		{
   			if (isset($spot->lat) && !empty($spot->lat)) $spot->id = md5($spot->lat.$spot->long);
   			else if(!empty($spot->address) && $spot->address!=_('LABEL_LOCATION')) $spot->id = md5($spot->address);
   			else {
   				$spot->id = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
   			}
   		
   		
			/*$res=Db::read("SELECT * FROM `spot` WHERE id_spt='".$spot->id."'");
			if(count($res)==0)
			{*/
				$res2=Db::write("REPLACE INTO `spot` (`id_spt`, `long_spt`, `lat_spt`, `city_spt`, `country_spt`, `state_spt`, `street_spt`, `address_spt`,`zip_spt`) VALUES ('".$spot->id."', '".$spot->long."', '".$spot->lat."', '".$spot->city."', '".$spot->country."', '".$spot->state."', '".$spot->street."', '".$spot->address."','".$spot->zip."')");
				if($res2==1)
					return true;
				else
					return false;
			//}
   		}
		return true;
   	}
   	
   	public function getCity($loc)
   	{
   		$res=Db::read('SELECT city_spt,state_spt FROM `spot` WHERE id_spt="'.$loc.'"');
		return $labels = $res[0]['city_spt'].' ('.$res[0]['state_spt'].')';
   	}
   	
   	public function add(array $datas)
   	{
   		//print_r($datas);die();
   		$query	= 'REPLACE INTO spot (`id_spt`, `long_spt`, `lat_spt`, `city_spt`, `country_spt`, `state_spt`, `street_spt`, `address_spt`,`zip_spt`) VALUES ';
		$nb=0;
		$spots = array();
		foreach($datas as $loc)
		{
			$spot = array();
			//$id			= isId($t)?$t:md5(strtolower(trim($t)));
			$composants = explode ("!#!",$loc);
			if (count($composants)==1)
			{
				if (isId($loc)){
					//$spots[$loc] = $this->getCity($loc);
					$spots[$loc] = $this->getById($loc);
					continue;
				}
				else {
					if (empty($loc) || $loc==_('LABEL_LOCATION')){
						$spots['XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'] = _('SOMEWHERE');
						continue;
					}
					else {
						$spot['address_spt'] = $loc;
						$spot = new SpotAdapter($spot);
						//$spots[$spot->id = md5($loc)] = $loc;
						$spots[$spot->id = md5($loc)] = $spot;
					}
				}
			}
			else {
				foreach ($composants as $composant)
				{
					$tmp = explode ('!:!',$composant);
					$spot[$tmp[0].'_spt'] = $tmp[1];
				}
				$spot = new SpotAdapter($spot);
				$spot->id = md5($spot->lat.$spot->long);
				//$spots[$spot->id] = trim($spot->city.' ('.$spot->state.')');
				$spots[$spot->id] = $spot;
			}
			$nb++;
			$query	 .= "('".$spot->id."', '".$spot->long."', '".$spot->lat."', '".$spot->city."', '".$spot->country."', '".$spot->state."', '".$spot->street."', \"$spot->address\",'".$spot->zip."'),";
				
		}	
		if ($nb) {
			// last colon
			$query	= substr($query,0,-1);
			// and write
			$res	= Db::write($query);
		}
		
		if(count($spots)>0)
		{
			return $spots;
		}

		return false;
   	}
}

?>