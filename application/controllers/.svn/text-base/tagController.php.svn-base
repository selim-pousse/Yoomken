<?php
/**
 * Manifest
 * 
 * application/controllers/tagController
 * 
 * Manages the tags
 * 
 * @copyright: Yoomken Li
 * 
 */
Class TagController Extends AppController 
{
	/**
	 * Main index, must be implemented
	 * 
	 * @see system/lib/baseController#index()
	 * 
	 */
	public function index(){}
	
	/**
	 * Produces a tag search according to user input, for autocomplete text boxes
	 * AJAX response
	 * 
	 * @access public
	 */
	public function like()
	{
		//sleep(2);
		$value = $this->post('term','string','');
		$mode = $this->post('mode','string','box');
		$type = $this->post('type','string');
		if(isset($value) && $value!='')
		{
			$this->model('tags');
			echo $this->tags->getTagsLike($value,$mode,$type);
		}
	}
}
?>
