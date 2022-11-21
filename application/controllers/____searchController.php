<?php
/**
 * Manifest
 * 
 * application/controllers/searchController
 * 
 * Implements the Universal Search Engine
 * 
 * @copyright: Yoomken Li
 * 
 */
Class SearchController Extends AppController 
{
	/**
	 * Main index, currently redirects to $this->ajax()
	 * 
	 * @see system/lib/baseController#index()
	 * @see ajax()
	 */
	public function index()
	{
		$this->ajax();
	}
	
	/**
	 * Performs a search with the passed parameters
	 * 
	 * Gets params from post
	 * 
	 * @return echoes a JSON response to the browser
	 * 
	 */
	public function ajax() 
	{
		// get POST parameters			
		$params = $this->getCommonInput();		
		
		// then, echo a JSON response
		echo jsonRet(false, true, null, null, $results);
	}
	
	/**
	 * Process a groups request
	 * 	This is an alias for parent::processGroups, created with the sole purpose of code visibility
	 * 
	 * @param mixed $params
	 * 
	 * @return mixed array with rendered HTML inside
	 * 
	 * @see appController::processGroups();
	 */
	protected function processGroups($params)
	{
		return parent::processGroups($params);
	}
	
	/**
	 * Process a people request
	 *  This is an alias for parent::processPeople, created with the sole purpose of code visibility
	 * 
	 * @param mixed $params
	 * 
	 * @return mixed array with rendered HTML inside
	 * 
	 * @see appController::processPeople();
	 */
	protected function processPeople($params)
	{
		return parent::processPeople($params);
	}
		
	/**
	 * Process a content request
	 * 	This is an alias for parent::processContent, created with the sole purpose of code visibility
	 * 
	 * @param mixed $params
	 * @param string $layout
	 * 
	 * @return mixed array with rendered HTML inside
	 * 
	 * @see appController::processContent();
	 */
	protected function processContent($params)
	{
		return parent::processContent($params);
	}
	
	
	
}
?>
