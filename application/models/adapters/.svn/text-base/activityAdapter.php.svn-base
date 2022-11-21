<?php 
/**
 * Manifest
 * 
 * application/adapters/activitiesAdapter
 * 
 * Adapter for activities
 */
class ActivityAdapter extends CommonAdapter
{
	/**
	 * @see commonAdapter::$suffixes 
	 * 
	 */
	var $suffixes = array('_vac','_cnt','_evt','_act');
	
	/**
	 * Extends commonAdapter constructor with some specific cases to consider
	 * 
	 * @param mixed input $array
	 * 
	 * @see commonAdapter::__construct()
	 * 
	 */
	public function __construct($array)
	{
		// basic fields
		parent::__construct($array);
		
		// do not allow other than associative arrays
		if (!is_array($array))
		{
			return;
		}
		
		// specific (manual) fields
		$this->count_pop 	= isset($array['count_pop'])? $array['count_pop']:'';
		$this->count_spd	= isset($array['count_spd'])? $array['count_spd']:'';
		
		// relationships with other entities
		$this->user		= new UserAdapter($array,null,$you = true);
		if ($this->type=='AV')
		{
			$this->related = new UserAdapter ($array,array('_rel'),$you = true);
		}
		else if ($this->type=='RB' || $this->type=='GB')
		{
			$this->related = json_decode($this->related);
		}
		
		if($this->currency=='EUR') 	$this->currency == '€';
	}
	
	/**
	 * Returns the title if exists, a generic one otherwise
	 * 
	 * @return mixed the title
	 * 
	 * @access public
	 */
	public function getTitle()
   	{
   		return $this->title;
   	}
	
}



?>