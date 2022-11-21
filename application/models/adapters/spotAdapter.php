<?php 
/**
 * Manifest
 * 
 * application/adapters/spotAdapter
 * 
 * Adapter for spots
 * 
 */
class SpotAdapter extends CommonAdapter
{
	/**
	 * @see commonAdapter::$suffixes 
	 * 
	 */
	var $suffixes = array('_spt','_spt_usr_vac');
	
	public function __toString()
	{
		return getLocation($this,true);
	}
	
}



?>