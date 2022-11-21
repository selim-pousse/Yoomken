<?php 
/**
 * Manifest
 * 
 * application/helpers/input.php
 * 
 * Contains some functions used to process input
 * 
 * @copyright: Yoomken Li
 * 
 */

/**
 * Alias for Input::escape
 * This function has been added for backwards compatibility
 * 
 * @param $string
 * 
 * @return string escaped string
 */
if (!function_exists('escape'))
{
	function escape($string = '',$type = false)
	{
		$input =& Input::getInstance();
		
		return $input->escape($string,$type);
	}
}

/**
 * Alias for Input::cleanTag
 * Cleans a tag / interest for insertion into database
 * This function has been added for code simplicity
 * 
 * @param string input $str
 * 
 * @return string clean tag
 */
if (!function_exists('cleanTag'))
{
	function cleanTag($str = '')
	{	
		$input =& Input::getInstance();
		
		return $input->cleanTag($str);
	}
}

?>