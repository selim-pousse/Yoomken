<?php 
/**
 * Manifest
 * 
 * application/adapters/MessageAdapter
 * 
 * Adapter for spots
 * 
 */
class MessageAdapter extends CommonAdapter
{
	/**
	 * @see commonAdapter::$suffixes 
	 * 
	 */
	var $suffixes = array('_msg');
	
	public function __construct($array = array())
	{
		// basic fields
		parent::__construct($array);
		
		// do not allow other than associative arrays
		if (!is_array($array))
		{
			return;
		}
		
		// relationships with other entities
		$this->user		= new UserAdapter($array);		
	}
	
}



?>