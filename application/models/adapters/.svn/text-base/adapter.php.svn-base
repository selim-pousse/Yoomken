<?php 
/**
 * Manifest
 * 
 * application/adapters/commonAdapter
 * 
 * Defines common methods, attributes and tools for all types of adapter
 * 
 */
class Adapter
{
	/**
	 * @see commonAdapter::$suffixes 
	 * 
	 */
	
	//protected $object	= null;
	
	/**
	 * Main constructor, accepts an array and stores it into attributes
	 * 
	 * @param mixed $array
	 * 
	 * @access public
	 */
	public function __construct($array = array())
	{
		// if the input is already an adapter object, no need to convert it
		if (is_object($array))
		{
			if ($array instanceof Adapter)
			{
				//$this->object =  $array;
			}
		}
		
		// do not allow other than associative arrays
		if (!is_array($array))
		{
			return;
		}
		
		// then process array 
		foreach ($array as $key=>$value)
		{
			
			$this->$key = $value;			
		}
 
		//$this->object = $this;
		
	}
	
	/**
	 * Common getter, allows to retrieve attributes even if they do not exist
	 * 
	 * @param mixed the attribute's index
	 * 
	 * @return mixed the attribute's value
	 * 
	 * @access public
	 */
	public function __get($var)
	{
		if (isset($this->$var))
		{
			return $this->$var;
		}
		
		return null;
	}
	
	/**
	 * Common setter, used to avoid creating attributes different than the ones used in database
	 * 
	 * @param mixed attribute $key
	 * @param mixed attribute $value
	 * 
	 * @access private
	 */
	public function __set($key,$value)
	{
		//echo "$key <br>";
		$this->$key = $value;
	}
	
	/**
	 * Specific setter, it allows creating new attributes (for linking purposes)
	 * 
	 * @param mixed attribute $key
	 * @param mixed attribute $value
	 * 
	 * @access public 
	 */
	public function set($key,$value)
	{
		$this->$key = $value;
	}
	
	
}