<?php
/**
 * Provides access to the Google Platform.
 *
 * /* Copyright (c) 2009 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Author: Eric Bidelman <e.bidelman>
*/

// OAuth/OpenID libraries and utility functions.
require_once Google::path() . 'common.inc.php';

// Load the necessary Zend Gdata classes.
require_once 'Zend'.DIRECTORY_SEPARATOR.'Loader.php';

Zend_Loader::loadClass('Zend_Gdata_HttpClient');
Zend_Loader::loadClass('Zend_Gdata_Docs');
Zend_Loader::loadClass('Zend_Gdata_Spreadsheets');


class Google
{
	protected static $path = null;
	
	public $consumer = null;
	public $sig_methods = array();
	
	
	private static $instance = null;
	
	/**
     * Retrieves the default registry instance.
     *
     * @return Google
     * 
     */
    public static function getInstance()
    {
        if (self::$instance === null) 
        {
            self::$instance = new Google(GOO_OAUTH_KEY,GOO_OAUTH_SECRET);
        }

        return self::$instance;
    }
	
	public function __construct($auth_key,$secret) {
		/*$config['appId'];
		$config['secret'];
		$config['cookie'];*/
		// Setup OAuth consumer with our "credentials"
		// Google's accepted signature methods
		$hmac_method = new OAuthSignatureMethod_HMAC_SHA1();
		$rsa_method = new OAuthSignatureMethod_RSA_SHA1();
		
		$SIG_METHODS = array($rsa_method->get_name() => $rsa_method,
		                     $hmac_method->get_name() => $hmac_method);
		$this->sig_methods = $SIG_METHODS['HMAC-SHA1'];
                     
		$CONSUMER_KEY = $auth_key;
		$CONSUMER_SECRET = $secret;
		$this->consumer = new OAuthConsumer($CONSUMER_KEY, $CONSUMER_SECRET);		
  	}
  	
	static function path()
	{
		if (self::$path === null)
			self::$path = dirname(__FILE__) . DIRECTORY_SEPARATOR;
		return self::$path;
	}
	
	/**
	 * Upgrades an OAuth request token to an access token.
	 *
	 * @param string $request_token_str An authorized OAuth request token
	 * @return string The access token
	 */
	function getAccessToken($request_token_str) {
	
	  $token = new OAuthToken($request_token_str, NULL);
	
	  $token_endpoint = 'https://www.google.com/accounts/OAuthGetAccessToken';
	  $request = OAuthRequest::from_consumer_and_token($this->consumer, $token, 'GET',
	                                                   $token_endpoint);
	  $request->sign_request($this->sig_methods, $this->consumer, $token);
	
	  $response = send_signed_request($request->get_normalized_http_method(),
	                                  $token_endpoint, $request->to_header(), NULL,
	                                  false);
	
	  // Parse out oauth_token (access token) and oauth_token_secret
	  preg_match('/oauth_token=(.*)&oauth_token_secret=(.*)/', $response, $matches);
	  if (isset($matches[1]) && isset($matches[2]))
	  {
		  $access_token = new OAuthToken(urldecode($matches[1]),
		                                 urldecode($matches[2]));
		
		  return $access_token;
	  }
	  else return null;
	}
}
