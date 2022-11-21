<?php 
/**
 * Manifest
 * 
 * application/helpers/format.php
 * 
 * Contains some functions for string formatting
 * 
 * @copyright: Yoomken Li
 * 
 */

/**
 * Renders the HTML needed for a user picture
 * 
 * @param string user $_id
 * @param string image $_id_img
 * @param string $_size
 * @param string $default image to show if the file does not exist
 * 
 * @return string picture path
 */
if (!function_exists('getUserPic'))
{
	function getUserPic($_id, $_id_img, $_size, $email = false, $default = '')
	{
		
		if( file_exists( __SITE_PATH . '/u/' . $_id . '/' . $_id_img . $_size . '.png') )
		{
			return'http://'.$_SERVER['SERVER_NAME'].'/u/' . $_id . '/' . $_id_img . $_size . '.png';
		}
		else if( file_exists( __SITE_PATH . '/u/' . $_id . '/' . $_id_img . $_size . '.jpg') )
		{
			return'http://'.$_SERVER['SERVER_NAME'].'/u/' . $_id . '/' . $_id_img . $_size . '.jpg';
		}
		else if (ONLINE && $email) {
				return get_gravatar($email,$_size);
		}
		else if ( isset($_id_img) && strlen($_id_img) && substr_compare($_id_img,'http://',0,7,false)==0  )
   		{					
			return 'http://'.$_SERVER['SERVER_NAME'].'/ajax/awesomize?type=a&url=' . $_id_img;
		}
		else
		{
			
			if ($default)
			{
				return $default;
			}
			else if ($_size)
			{
				if (ONLINE)
					return 'http://www.gravatar.com/avatar/?s='.$_size.'&d=identicon&r=g';
				else 
					return 'http://'.$_SERVER['SERVER_NAME'].'/media/img/nopic' . $_size . '.jpg';
				
			}
			// otherwise
			else 
				if (ONLINE)
					return 'http://www.gravatar.com/avatar/?s=75&d=identicon&r=g';
				else 
					return  'http://'.$_SERVER['SERVER_NAME'].'/media/img/nopic75.jpg';
		}	
	}
}




/**
 * Renders the HTML needed for a video cover picture
 * 
 * @param string video $cover
 * @param string $default image to show if the file does not exist
 * 
 * @return string picture path
 */
if (!function_exists('getVideoPic'))
{
	function getVideoPic($cover, $default = '')
	{
		if( $cover )
		{
			return $cover;
		}
		else
		{
			if ($default)
			{
				return $default;
			}
			// otherwise
			return '/med/img/default.png';	
		}
	}
}

/**
 * Renders the HTML needed for a group picture
 * 
 * @param string group $_id
 * @param string image $_id_img
 * @param string $_size
 * @param string $default image to show if the file does not exist
 * 
 * @return string picture path
 */
if (!function_exists('getGroupPic'))
{
	function getGroupPic($_id,$_id_img,$_size,$default='')
	{
		$file = '/g/' . $_id . '/' . $_id_img . $_size . '.png';
		
		if( file_exists( $_SERVER['DOCUMENT_ROOT'] . $file ) )
		{
			return $file;
		}
		else
		{
			if ($default)
			{
				return $default;
			}
			// otherwise
			return '/g/default/dg' . $_size . '.png';
		}					
	}
}


/**
 * Get either a Gravatar URL or complete image tag for a specified email address.
 *
 * @param string $email The email address
 * @param string $s Size in pixels, defaults to 80px [ 1 - 2048 ]
 * @param string $d Default imageset to use [ 404 | mm | identicon | monsterid | wavatar ]
 * @param string $r Maximum rating (inclusive) [ g | pg | r | x ]
 * @param boole $img True to return a complete IMG tag False for just the URL
 * @param array $atts Optional, additional key/value attributes to include in the IMG tag
 * @return String containing either just a URL or a complete image tag
 * @source http://gravatar.com/site/implement/images/php/
 */
function get_gravatar( $email, $s = 80, $d = 'identicon', $r = 'g', $img = false, $atts = array() ) {
	$url = 'http://www.gravatar.com/avatar/';
	$url .= md5( strtolower( trim( $email ) ) );
	$url .= "?s=$s&d=$d&r=$r";
	if ( $img ) {
		$url = '<img src="' . $url . '"';
		foreach ( $atts as $key => $val )
			$url .= ' ' . $key . '="' . $val . '"';
		$url .= ' />';
	}
	return $url;
}

/**
 * Creates the src attribute for a given content picture
 * 
 * @param string user $id
 * @param string image $img
 * @param int picture $size
 * @param string $type internal or external
 * 
 * @return string formatted src attribute
 */
if (!function_exists('getPictureThumb'))
{
	function getPictureThumb($id, $img, $size = '',$email = false, $default = '',$imgmore = '')
	{
		
		if( file_exists( __SITE_PATH . '/u/' . $id . '/' . $img . $size . '.png') )
		{
			return 'http://'.$_SERVER['SERVER_NAME'].'/u/' . $id . '/' . $img . $size . '.png';
		}
		else if( file_exists( __SITE_PATH . '/u/' . $id . '/' . $img . $size . '.jpg') )
		{
			return 'http://'.$_SERVER['SERVER_NAME'].'/u/' . $id . '/' . $img . $size . '.jpg';
		}
		else if (ONLINE && $email) {
				return get_gravatar($email,$size);
		}
		else if( $imgmore != '' && file_exists( __SITE_PATH . '/u/' . $id . '/' . $imgmore . $size . '.png') )
		{
			return 'http://'.$_SERVER['SERVER_NAME'].'/u/' . $id . '/' . $imgmore . $size . '.png';
		}
		else if ($img!=null && file_exists($_SERVER{'DOCUMENT_ROOT'}.$img))
		{
			return $img;
		}
		else if (  isset($img) && strlen($img) && substr_compare($img,'http://',0,7,false)==0  )
   		{
   			return $img;	
   			if (substr_compare($img,'http://maps.google.com',0,22,false)==0 ) return $img;
   			
   			if ( $size == 480) $type = 'd';	
   			else $type = 't';	
			return '/ajax/awesomize?type='.$type.'&url=' . $img;
		}
		else
		{
			if ($default)
			{
				return $default;
			}
			else if ($size)
			{
				if (ONLINE)
					return 'http://www.gravatar.com/avatar/?s='.$size.'&d=identicon&r=g';
				else 
					return 'http://'.$_SERVER['SERVER_NAME'].'/media/img/nopic' . $size . '.jpg';
				
			}
			// otherwise
			else 
				if (ONLINE)
					return 'http://www.gravatar.com/avatar/?s=75&d=identicon&r=g';
				else 
					return  'http://'.$_SERVER['SERVER_NAME'].'/media/img/nopic75.jpg';
		}
	}
}



if (!function_exists('hasPic'))
{
	function hasPic($id, $img, $size = '', $default = '',$imgmore = '')
	{
		if( file_exists( __SITE_PATH . '/u/' . $id . '/' . $img . $size . '.png') )
		{
			return true;
		}
		else if( file_exists( __SITE_PATH . '/u/' . $id . '/' . $img . $size . '.jpg') )
		{
			return true;
		}
		else return false;
	}
}
/**
 * Creates the src attribute for a given content picture
 * 
 * @param string user $id
 * @param string image $img
 * @param int picture $size
 * @param string $type internal or external
 * 
 * @return string formatted src attribute
 */
if (!function_exists('getThumbnail'))
{
	function getThumbnail($link , $default = '')
	{
		if( isset($link ) && strlen($link ) && 
   							(substr_compare($link,'http://',0,7,false)==0 || file_exists($_SERVER{'DOCUMENT_ROOT'}.$link ) || substr_compare($link ,'/ajax/',0,6,false)==0 ) )
   		{
   			return $link;
   		}
		else if ( isset($link ) && strlen($link ) && substr_compare($link,'http://',0,7,false)==0 )
   		{				
			return '/ajax/awesomize?type=t&url=' . $link;
		}
   		else if ($default) return $default;
   		else return '/med/img/default.png';
	}
}



/**
 * Formats a date according to own rules
 * 
 * @param DateTime $date
 * @param boolean $compact 
 * @param boolean $classique
 * 
 * @return string the formatted date
 * 
 */
if (!function_exists('formatDate'))
{
	function formatDate($date, $compact = false, $classique = false, $compactWithTime = false)
	{
		//date_default_timezone_set("America/Chicago");
		//date_default_timezone_set("Europe/Paris");
		if(!$classique)
		{
			if(date('m-d-Y',strtotime($date))==date('m-d-Y',time()))
			{
				if(strtotime($date)>=strtotime("-1 hour"))
				{
					if((date("i",time()-strtotime($date)))=="00")
					{
						$date=_('FEW_SEC_AGO');
						//$date=chgDate($date);
						//$date = date('H:i',strtotime($date));
					}
					else
					{
						$date=_('ILYA').' '.trim(date("i",time()-strtotime($date)).' '._('MIN_AGO'),'0');
					}
				}
			else
				{
					$date=chgDate($date);
					$tmp=getdate(strtotime($date));
					if(date("d",time())!=$tmp['mday'])
					{
						$date=_('YESTERDAY_AT').' '.date('H:i',strtotime($date));
					}
					else
					{
						$date=/*_('TODAY_AT')." ".*/date('H:i',strtotime($date));
					}
				}
			}
			elseif(date('m-d-Y',strtotime($date))==date('m-d-Y',strtotime('-1 day')))
			{
				$date=chgDate($date);
				$tmp=getdate(strtotime($date));
				if(date("d",time())-1!=$tmp['mday'])
				{
					$date=date('F jS',strtotime($date)).' '._('AT').' '.date('H:i',strtotime($date));
				}
				else
					$date=_('YESTERDAY_AT')." ".date('H:i',strtotime($date));
			}
			else
			{
				
				if($compact==true)
				{
					$date=chgDate($date);
					$date=date('d/m/y ',strtotime($date));
				}
				else if($compactWithTime==true)
					{
						$date=chgDate($date);
						$date=date('d/m/y ',strtotime($date)).' '._('AT').' '.date('H:i',strtotime($date));
					}
				else	
				{
					$date=chgDate($date);
					//$date=date('F jS',strtotime($date)).' '.AT.' '.date('H:i',strtotime($date));
					//$date=date('F jS',strtotime($date));
					$date = _('LE_FOR_TIME').(strftime(" %d %B",strtotime($date)));
				}
			}
		}
		else
		{
			$date=chgDate($date);
			$date=date('F jS',strtotime($date)).' '._('AT').' '.date('H:i',strtotime($date));
		}
		
		//date_default_timezone_set("Paris");
		return $date;
	}
}

/**
 * Formats the date for an event
 * 
 * @param Date $date
 * @param strimg date formated
 * @param boolean short mode
 * 
 * @return string the formatted date
 */
if (!function_exists('formatDateEvent'))
{
	function formatDateEvent($date,$date2="",$short=false)
	{
		$return = '';
		
		if ( $date2 != '')
		{
			// if it is not the same day, avoid time, only date
			if ( date('m/d',strtotime($date)) == date('m/d',strtotime($date2)) )
			{
				if ($short)
				{
					$return = date('m/d @ H:i',strtotime($date)) . ' > ' . date('m/d @ H:i',strtotime($date2));
				}
				else
				{
					$return = 'From ' . date('F jS \a\t H:i',strtotime($date)) . ' to ' . date('F jS \a\t H:i',strtotime($date2));
				}
			}
			else
			{
				if ($short)
				{
					$return = date('m/d',strtotime($date)) . ' > ' . date('m/d',strtotime($date2));
				}
				else
				{
					$return = 'From ' . date('F jS',strtotime($date)) . ' to ' . date('F jS',strtotime($date2));
				}
			}
		}
		else
		{
			$return = formatDateEventAlone($date);
		}
		return $return;
	}
}

/**
 *
 * Formats a date for an event which displays alone
 * 
 * @param Date $date
 * 
 * @return string Date formatted
 */
if (!function_exists('formatDateEventAlone'))
{
	function formatDateEventAlone($date)
	{
		return date('F jS',strtotime($date))." at ".date('H:i',strtotime($date));
	}	
}

/**
 * Formats a date for an even in a minimal format
 * 
 * @param Date $date
 * 
 * @return string Date formatted
 */
if (!function_exists('formatDateEventMini'))
{
	function formatDateEventMini($date)
	{
		return date('j M.',strtotime($date));
	}
}

/**
 *
 * Returns a date according to user's time zone
 * 
 * @param Date $date
 * 
 * @return Date according to user's time zone
 */
if (!function_exists('chgDate'))
{
	function getStandardOffsetUTC($timezone)
	{
	    $timezone = new DateTimeZone($timezone);
	    $transitions = array_slice($timezone->getTransitions(), -3, null, true);
	
	    foreach (array_reverse($transitions, true) as $transition)
	    {
	        if ($transition['isdst'] == 1)
	        {
	            continue;
	        }
	
	        return sprintf('%+03d:%02u', $transition['offset'] / 3600, abs($transition['offset']) % 3600 / 60);
	    }
	
	    return false;
	}
		
	function chgDate($date)
	{
		$tzserver =  (((int)substr(exec('date +%z'),0,3)));// heure de Paris par défaut
		
		if (isset($_SESSION['tzoffset']))
		{
			$dectmp = intVal($_SESSION['tzoffset']);
		}
		else
		{
			$dectmp = $tzserver; 
		}
		//echo(getStandardOffsetUTC('Europe/London'));
		
		// we make a string comprehesible by modify like "+ XX hours + XX minutes" or "-YY hours - YY minutes"
		$dec = ($dectmp-$tzserver). " hours"; // . substr($dectmp,0,1) . substr($dectmp,3,2) . " minutes";
		//echo ($tzserver);die();
		$datetmp = new DateTime($date);
		
		//apply the time change
		$datetmp->modify($dec);
		
		//return a string in the original format 
		return $datetmp->format("Y-m-d H:i:s");
	}
}

    	
/**
 * Return the spot's location (string to display on front end)
 * 
 * @param array $spot 
 * 
 * @return Description of location 
 */    	
if (!function_exists('getLocation'))
{   
    function getLocation($spot,$compact=false)
	{
		if (is_array($spot)) $spot = new SpotAdapter($spot);
		
		if($spot->id=="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
		{
			return _('SOMEWHERE');
		}
		else if ($compact){
			$name="";
	    	if($spot->city!="" )
	    	{
	    		$name.=$spot->city." ";
	    	}
	    	if($spot->state!="" )
	    	{
	    		//$name.= "($spot->state)";
	    	}
	    	if ($spot->city=="" && $spot->state=='')
	    	{
	    		$name = $spot->address;
	    	}
	    	return $name;
		}
		else
		{
			
	    	/*if($spot->country!="" && $compact==null)
	    	{
	    		$name.=$spot->country;
	    	}*/
			if($spot->address!="")
	    	{
	    		return $spot->address;
	    	}
			else {
				return $spot->city.', '.$spot->country;
			}
		}
	}
}


/**
 * Shortens a string
 * 
 * @param string $_string to shorten
 * @param int $_size length in characters
 * @param boolean $_braks use or not brakets
 * 
 * @return string shortened and formatted text
 * 
 */
if (!function_exists('shortenString'))
{
	function shortenString($_string,$_size,$_braks='')
	{
		if(strlen($_string)>$_size)
		{
			$res = "";
			switch ($_braks)
			{
				case 'long':
					$_size -= 6;
					$res 	= " (...)";
					
					break;
				
				case 'short':			
					$_size -= 3;
					$res 	= "...";
					
					break;
					
				default:			
					
			}
			
			$_string = substr($_string,0,$_size) . $res;
			
		}
			
		return ucfirst($_string);
	}
}

/**
 * Prepare strings for sql queries, prevent from code injections
 * 
 * @param string $string
 * 
 * @return string formatted text
 * 
 */
if (!function_exists('toUrl'))
{
	function toUrl($string)
	{
	    return strtolower(str_replace(" ","",str_replace(array('&amp;','/'),'_',$string)));
	}
}

/**
 * Prepares a comment to be shown in the view
 * 
 * @param string $cmt
 * 
 * @return mixed array of $intro and $hide html text
 * 
 */
if (!function_exists('splitFormatComment'))
{
	function splitFormatComment($cmt)
    {
    	$ret = array('','');
    	if (!empty($cmt))
    	{
	    	$intro = shortenString($cmt,300);
	    	
	    	if(strlen($intro) != strlen($cmt))
	    	{
	    		$hide = str_replace($intro,"",$cmt);
	    		$ret = array ($intro,$hide);
	    	}
	    	else $ret =  array($cmt,'');
    	}
    	
    	$ret[0] = addActivePeople(addActiveLinks($ret[0]));
    	$ret[1] = addActivePeople(addActiveLinks($ret[1]));
    	
    	return $ret;
    	
    }
}

/**
 * Checks if one array is different from another (mixes the dimensions) used in the updateUser fucntion for the tags
 * 
 * @param mixed array $_t1
 * @param mixed arrat $_t2
 * 
 * @return boolean
 * 
 */
if (!function_exists('isArrayDiff'))
{
	function isArrayDiff($_t1,$_t2)
	{
		if(is_array($_t1) && is_array($_t2))
		{	
			foreach($_t1 as $k=>$t)
			{
				if((is_array($t) && is_array($_t2[$k])))
				{
					$t1=array_values($t);
					$t2=array_values($_t2[$k]);
					sort($t1);
					sort($t2);
					if( count($t1)!=count($t2) || count(array_diff($t1,$t2))>0)
						return true;
				}
				else if((is_array($t) && count($t)>0) ||  (is_array($_t2[$k]) && count($_t2[$k])>0))
					return true;
			}
			return false;
		}
		else if(is_array($_t1) || is_array($_t2))
			return true;
		else
			return false;
	} 
}

/**
 * @param string $txt
 * 
 * @return string
 */
if (!function_exists('_2nl'))
{
	function _2nl($txt) 
	{ 
		$txt = preg_replace('#\n#', "\r", $txt); 
		return $txt; 
	} 
}

if (!function_exists('_2br'))
{
	function _2br($txt) 
	{ 
		$txt = preg_replace('#\n#', "<br />", $txt); 
		return $txt; 
	} 
}

if (!function_exists('formatName'))
{
	function formatName($txt) 
	{
		$txt = preg_replace('#\s+#', " ", $txt); 
		$fname = explode(' ',$txt);
		$txt = '';
		foreach ($fname as $name) $txt .= ucfirst(strtolower($name)).' ';
		return trim($txt); 
	} 
}




/**
 * add active links to $text
 * 
 * @param string $txt
 * 
 * @return string
 */
if (!function_exists('detectTitle'))
{
	function detectTitle($txt) 
	{ 
		$desc = preg_replace("/(.*(([.!?:]\s)|\n))/",'<b>\\1</b>',$txt,1);
		if (strlen(strstr($desc,'</b>'))<78) $txt = $desc;
		return $txt; 
	} 
}

/**
 * add active links to $text
 * 
 * @param string $txt
 * 
 * @return string
 */
if (!function_exists('addActiveLinks'))
{
	function addActiveLinks($txt,$color = 'null') 
	{
		 
		{
			$txt = preg_replace('#(script|about|applet|activex|chrome):#is', "\\1:", $txt); 
			$txt = ' '.$txt; 
			$txt = preg_replace("#(^|[\n ])([\w]+?://[\w\#$%&~/.\-;:=,?@\[\]+]*)#is", "\\1<a href='\\2\' target='_blank'>\\2</a>", $txt); 
			$txt = preg_replace("#(^|[\n ])((www|ftp)\.[\w\#$%&~/.\-;:=,?@\[\]+]*)#is", "\\1<a href='http://\\2' target='_blank'>\\2</a>", $txt); 
			$txt = preg_replace("#(^|[\n ])([a-z0-9&\-_.]+?)@([\w\-]+\.([\w\-\.]+\.)*[\w]+)#i", "\\1<a href='mailto:\\2@\\3'>\\2@\\3</a>", $txt); 
			$txt = substr($txt, 1); 
			return $txt; 
		}
	} 
}

/**
 * add active links to $text
 * 
 * @param string $txt
 * 
 * @return string
 */
if (!function_exists('addActiveMyLinks'))
{
	function addActiveMyLinks($txt,$color = '') 
	{
		if (preg_match("#\{a\#(.+?)\|(.+?)\#a\}#i",$txt)) 
		{
			$txt = preg_replace("#\{a\#(.+?)\|(.+?)\#a\}#is", "<a href='http://{$_SERVER['HTTP_HOST']}/\\2' style='text-decoration: none;font-weight: bold;$color'>\\1</a>", $txt); 
			return $txt;
		}
		return $txt;
	}
}


if (!function_exists('cleanMyLinks'))
{
	function cleanMyLinks($txt,$color = '') 
	{
		if (preg_match("#\{a\#(.+?)\|(.+?)\#a\}#i",$txt)) 
		{
			$txt = preg_replace("#\{a\#(.+?)\|(.+?)\#a\}#is", "\\1", $txt); 
			return $txt;
		}
		return $txt;
	}
}

/**
 * add active links to a person recognized 
 * 
 * @param string $txt
 * 
 * @return string
 */
if (!function_exists('addActivePeople'))
{
	// target=\"_blank\"
	function addActivePeople($txt,$formail= false) 
	{
		$astyle = null;
		if ($formail) $astyle = '{#astyle}';
		   
		$txt = preg_replace("#\{user\#(.+?)\|(.+?)\#user\}#is", "<a href='http://{$_SERVER['HTTP_HOST']}/\\2' style='$astyle'>\\1</a>", $txt); 
		
		$txt = preg_replace('#\@\[([\s\w@\.]+)\]\((\w+):(\w+)\)#is', "<a href='http://{$_SERVER['HTTP_HOST']}/\\3' style='$astyle'><b>@\\1</b></a>", $txt);		
		return $txt; 
	} 
	
	function addInactivePeople($txt,$formail= false) 
	{
		$astyle = null;
		if ($formail) $astyle = '{#astyle}';
		   
		$txt = preg_replace("#\{user\#(.+?)\|(.+?)\#user\}#is", "\\1", $txt); 
		
		$txt = preg_replace('#\@\[([\s\w@\.]+)\]\((\w+):(\w+)\)#is', "<b>@\\1</b>", $txt);		
		return $txt; 
	} 
	//http://'.$_SERVER['HTTP_HOST'].'/'
}

if (!function_exists('extractNames'))
{

	function extractNames($email)
	{
		if (isEmail($email)) {
			$txt = explode('@',$email);
			$txt = $txt[0];
		}
		else $txt = $email;
		$txt = preg_replace("#([!\#$%&'*+-/=?^_`{|}~. ])+#is", ",", $txt);
		$txts = explode(',',$txt);
		$name = null;
		foreach ($txts as $txt) $name .= ucfirst($txt).' ';
		$name = rtrim($name);
		//$name = preg_replace("#([!\#$%&'*+-/=?^_`{|}~.])+#is", " ", $txt[0]); 
		//$url =  preg_replace("#([!\#$%&'*+-/=?^_`{|}~.])+#is", "", $txt[0]); 
		
		return $name;
	}
}

if (!function_exists('addActiveButton'))
{
	// target=\"_blank\"
	function addActiveButton($txt) 
	{   
		$accept = _('ACCEPT_DEAL');
		$reject = _('REJECT_DEAL');
		$txt = preg_replace("#\{accept\#([a-f0-9]{32})-([A-Z]{3,6})-([a-z0-9]{1,32})\#reject\}#is","
															<br>
															<span class='ask-todeal no-answer'>
																<button href='' 
																		style='background: RGB(125,175,80) none repeat scroll 0px 0px;
																			color: white;border:none;cursor:pointer;
																			padding:4px 4px;
																			width:100px;
																			margin:0 2px'
																		onclick='accept(this,\"Y\",\"\\1\",\"\\2\",\"\\3\")'/>
																  	<span class='fff ui-icon ui-icon-check left' style='margin-top: -3px;'></span>
																	$accept
																</button>
																<button href='' 
																		style='background: RGB(215,67,40) none repeat scroll 0px 0px;
																			color: white;border:none;cursor:pointer;
																			padding:4px 4px;
																			width:100px;
																			margin:0 2px'
																		onclick='accept(this,\"N\",\"\\1\",\"\\2\",\"\\3\")'>
																	<span class='fff ui-icon ui-icon-cancel left' style='margin-top: -3px;'></span>
																	$reject
																</button>
															</span>"
						, $txt);
						
		$txt = preg_replace("#\{\#accepted\}#is","<span class='ask-todeal'>
														<span 	style='display:inline-block;margin-bottom:-3px' 
																class='ui-icon ui-icon-check'></span>
														<b>"._('ACCEPTED')."</b>
												 </span>"
						, $txt);
						
		$txt = preg_replace("#\{\#rejected\}#is","<span class='ask-todeal'>
														<span 	style='display:inline-block;margin-bottom:-3px' 
																class='ui-icon ui-icon-cancel'></span>
														<b>"._('REJECTED')."</b>
												 </span>"
						, $txt);
		return $txt; 
	} 
}

if (!function_exists('getClassDispo'))
{
	function getClassDispo($status)
	{
		$dispo = array(-1=>'caseOut',1=>'caseDispo',2=>'caseDispo',3=>'caseBusy',4=>'caseIndispo');
		return $dispo[$status];
	}
}

if (!function_exists('getClassProfil'))
{
	function getClassProfil($status)
	{
		$dispo = array('P'=>'casePresta','C'=>'caseEmploy','B'=>'caseBothProfil','N'=>'caseNeutral');
		return $dispo[$status];
	}
}

if (!function_exists('getTitleStatus'))
{
	function getTitleStatus($usr)
	{
		$titleName = '';
		if ($usr->profil=='B') $titleName = 'Provider & Asker';
		else if ($usr->profil=='P') $titleName = 'Provider';
		else if ($usr->profil=='C') $titleName = 'Asker';
		return $titleName;
	}
}

if (!function_exists('getTitleActivity'))
{
	function getTitleActivity($act)
	{
		$strTypeAct = ($act->type=='OF'?_('OFFER'):($act->type=='CR'?_('CREATION'):($act->type=='QU'?_('QUESTION'):_('SCOOP')))).' ';
		if ($act->flux=='SV') $strTypeAct .= _('OF_THE').' Provider';
		else if ($act->flux=='JB') $strTypeAct .= _('OF_THE').' Asker';
		else $strTypeAct .= _('OF');
		return $strTypeAct;
	}
}

if (!function_exists('getTitleDispo'))
{
	function getTitleDispo($status)
	{
		$dispo = array(-1=>_('HIDDEN'),1=>_('LISTENING'),2=>_('LISTENING'),3=>_('BUSY'),4=>_('NOT_LISTENING'));
		if(isset($dispo[$status])) return $dispo[$status];
		else return $dispo[-1];
	}
}
if (!function_exists('getTitleProfil'))
{
	function getTitleProfil($status)
	{
		$dispo = array('P'=>'Provider','C'=>'Asker','B'=>'Provider & Asker');
		return $dispo[$status];
	}
}

/**
 * Checks a string for valid url's
 * 
 * @param string $url
 * 
 * @return boolean
 */
if (!function_exists('isUrl'))
{
	function isUrl($url)
	{
		if (preg_match('|^http(s)?://[a-z0-9-]+(.[a-z0-9-]+)*(:[0-9]+)?(/.*)?$|i', $url))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}


if (!function_exists('cleanDuplicate'))
{
	function cleanDuplicate(&$array,$value,&$pair = null)
	{		
		$keys = array_keys($array,$value);
   		$once = -1; 
   		foreach ($keys as $key) 
   		{
	   		if ($once >= 0) {
	   			unset($array[$key]);
	   			if ($pair != null) unset($pair[$key]);
	   		}
	   		else $once = $key;
	   		
   		}
   		return $once;
	}
}

/**
 * Find default language into system
 * 
 * @param string $user_lang
 * 
 * @return string
 */
if (!function_exists('SelectLang'))
{
	
	
	function translation($user_lang) { 
		if ($user_lang == 'en') $isolang = 'en_US';
		else $isolang = $user_lang.'_'.strtoupper($user_lang);
		
        if (GETTEXT_CACHING == 0) { 
            $targetFolder = __APP_PATH."/lang/tmp/".$isolang."/LC_MESSAGES/"; 
            
            $folder = opendir($targetFolder); 
            while (false !== ($file = readdir($folder))) { 
                $pathFiles = $targetFolder."/".$file;  
                if ($file != ".." AND $file != "." AND !is_dir($file) AND strrchr($file,'.') == '.mo' AND $file != 'default.mo') { 
                    unlink($pathFiles); 
                } 
            } 
            closedir($folder); 
            
            $translatefile = 'default'.time(); 
            copy(__APP_PATH.'/lang/'.$isolang.'/LC_MESSAGES/default.mo', 
                 __APP_PATH.'/lang/tmp/'.$isolang.'/LC_MESSAGES/'.$translatefile.'.mo'); 
        } else $translatefile = 'default';  
		
		putenv("LANG=$isolang.utf8");
		putenv("LC_ALL=$isolang.utf8");
		setlocale(LC_ALL, "$isolang.utf8");
		setlocale(LC_TIME, $isolang);
		bindtextdomain($translatefile, GETTEXT_CACHING ? 'application/lang/':'application/lang/tmp/');
		textdomain($translatefile);
		bind_textdomain_codeset('default', 'utf-8');
    }

	function SelectLang($user_lang)
	{
		$lang_accepted = array('en','fr');
		$langs=explode(",",$_SERVER["HTTP_ACCEPT_LANGUAGE"]);
		//echo " langue principale est: $langs[0]";
		if (!in_array($user_lang,$lang_accepted)) {
    		$user_lang=$langs[0];
			$user_lang = preg_replace("#^([a-z]{2})\-[a-z]{2}#is",'\\1',$user_lang);
			if (!in_array($user_lang,$lang_accepted)) $user_lang = 'en';
		}
		//include(__APP_PATH . '/lang/'.strtolower($user_lang).'.php');
		//$locale = 'application/lang/'.strtolower($user_lang);
		
		/*putenv("LANG=$isolang.utf8");
		putenv("LC_ALL=$isolang.utf8");
		setlocale(LC_ALL, "$isolang.utf8");
		bindtextdomain("default", 'application/lang/');
		textdomain('default');
		bind_textdomain_codeset('default', 'utf-8');*/
		translation($user_lang);
				
		return $user_lang;
	} 
}

?>
