<?php 
/**
 * Manifest
 * 
 * application/helpers/json.php
 * 
 * Contains some functions to work with JSON
 * 
 * @copyright: Yoomken Li
 * 
 */

/**
 * prepares a JSON response 
 * 
 * @param string $_error 
 * @param string $_success
 * @param string $_txt
 * @param string $_meta
 * @param string $_html
 * @param string $_nb
 * @param string $_id
 *  
 * @return JSON encoded string
 *  
 */
if (!function_exists('jsonRet'))
{
	function jsonRet($_error, $_success, $_txt=null, $_meta=null, $_html=null, $_nb=null, $_id=null)
	{
		$input =& Input::getInstance();

		//if ($input->server('SERVER_NAME') != 'localhost')
		//{
			//header('Content-Type: application/json; charset=utf-8', true,200);
		//}		
		
		//$_success = false;
		//$_error = 'dans ton cul';
		
		$ret=array("message"=>$_error,"success"=>$_success);
		
		if(!is_null($_txt) && $_txt!="")
		{
			$ret['txt']=$_txt;
		}
		if(!is_null($_meta) && $_meta!="")
		{
			$ret['meta']=$_meta;
		}
		if(!is_null($_nb) && $_nb!="")
		{
			$ret['nb']=$_nb;
		}
		if(!is_null($_id) && $_id!="")
		{
			$ret['id']=$_id;
		}
		if(!is_null($_html) && $_html!="")
		{
			
			$ret['html']=$_html;
		}
		/*if ($_success && !empty($_html)) {
			header('Content-Type: text/html');
			return $_html;
		}
		else {*/
		$return = json_encode($ret ,JSON_HEX_TAG|JSON_HEX_APOS|JSON_HEX_QUOT|JSON_HEX_AMP );
		
		if (JSON_ERROR_SYNTAX == json_last_error()) return '{"message":"Erreur encodage or syntaxe","success":false"}';
		
		return $return;
		
	}
}

?>