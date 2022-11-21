<?php 
/**
 * Manifest
 * 
 * application/adapters/commentAdapter
 * 
 * Adapter for comments
 * 
 * @copyright: Eegoes Inc.
 * 
 */
class CommentAdapter extends CommonAdapter
{
	/**
	 * @see commonAdapter::$suffixes 
	 * 
	 */
	var $suffixes = array('_cmt');
	
	public function __construct($array)
	{
		parent::__construct($array);
		//$this->count		= isset($array['count_cmt'])? $array['count_cmt']:'';
		$this->user		= new UserAdapter($array);	
	}
}



?>