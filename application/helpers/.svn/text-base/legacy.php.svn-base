<?php
/**
 * Converts a string for url
 * 
 * TODO remove this function from code 
 * 
 * @return string 
 * 
 */
if (!function_exists('to_url'))
{
	function to_url($string)
	{
    	return toUrl($string);
	}
}

/**
 * Return true if a user is loged in
 *  
 */
if (!function_exists('strip_tags_attributes'))
{
	function strip_tags_attributes($sSource, $aAllowedTags = array(), $aDisabledAttributes = array('onclick', 'ondblclick', 'onkeydown', 'onkeypress', 'onkeyup', 'onload', 'onmousedown', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onunload'))
    {
    	if (empty($aDisabledEvents)) return strip_tags($sSource, implode('', $aAllowedTags));

    	return preg_replace('/<(.*?)>/ie', "'<' . preg_replace(array('/javascript:[^\"\']*/i', '/(" . implode('|', $aDisabledAttributes) . ")=[\"\'][^\"\']*[\"\']/i', '/\s+/'), array('', '', ' '), stripslashes('\\1')) . '>'", $sSource);
    }
}

///for the sorting of arrays
if (!function_exists('sortTab'))
{
	function sortTab($a,$b)
	{
		if($a==$b)
			return 0;
		return ($a < $b) ? -1 : 1;
	}
}

//Return true if a user is loged in
if (!function_exists('cmpTab'))
{
	function cmpTab($a,$b)
	{
		if(!is_null($a) && !is_null($b))
		{
			usort($a,'sortTab');
	   		usort($b,'sortTab');
	   		if(count($a)!=count($b)) return false;
	  	 	for($i=0;$i<sizeof($a);$i++)
	   		{
	   			if($a[$i]!=$b[$i]) return false;
	   		}
	   		return true;
		}
		return false;
	}
}

//Return true if a user is loged in


//used to compare dates with usort
//Return true if a user is loged in
if (!function_exists('compareDates'))
{
	function compareDates($x, $y)
	{
 		if ( strtotime($x[5]) == strtotime($y[5]))
  		return 0;
 		else if ( strtotime($x[5]) < strtotime($y[5]) )
  		return 1;
 		else
  		return -1;
	}
}
	
///Function for the url rewriting we give the name of the map, the id of the thing that has to be changed and the new url of it and it does everything by itself
//Return true if a user is loged in
if (!function_exists('changeUrlMap'))
{
	function changeUrlMap($fullname,$_type = 'user')
	{
		$url ='';
		//cleaning urls
		$fullname = preg_replace('/[^a-zA-Z0-9]/', '', $fullname);
		//check url
		if($_type=="user")
		{
			if (YOO_UserModel::urlAvailable($fullname)) $url=$fullname;
			else 
			{
				for($i=1;$i<15;$i++)
				{
					$sugest = $fullname.$i;
					if (YOO_UserModel::urlAvailable($sugest)) {
						$url = $sugest;
						break;
					}
				}
			}
		}
		if (empty($url)) {
			$sugest =  $fullname.rand(16, 4015);
			if (YOO_UserModel::urlAvailable($sugest)) $url = $sugest;
			else $url = $fullname.time();
		}
		else return $url;
	}
}
	
//Return true if a user is loged in
if (!function_exists('formatEmbed'))
{
	function formatEmbed($_embed)
	{
		if(strpos($_embed,"youtube")!==false)
		{
			$beg=strpos($_embed,"youtube.com/v/")+14;
			$end=strpos($_embed,"?",$beg);
			if($end==false)
				$end=strpos($_embed,"&",$beg);
			$video_id=substr($_embed,$beg,$end-$beg);
			if($video_id!="" && strlen($video_id)<15)
			{
				$beg=strpos($_embed,'width=')+7;
				$end=strpos($_embed,"\"",$beg+1);
				$width=substr($_embed,$beg,$end-$beg);
				$beg=strpos($_embed,'height=')+8;
				$end=strpos($_embed,"\"",$beg+1);
				$height=substr($_embed,$beg,$end-$beg);
				$height=$height*480/$width;
			
				return "<object width=\"480\" height=\"".$height."\"><param name=\"movie\" value=\"http://www.youtube.com/v/".$video_id."&hl=en_US&fs=0&color1=0xff7000&color2=faae3e&autoplay=1\"></param><param name=\"allowFullScreen\" value=\"false\"><param name=\"wmode\" value=\"opaque\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/".$video_id."&hl=en_US&fs=0&color1=0xff7000&color2=0xfaae3e&autoplay=1\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" wmode=\"opaque\" allowfullscreen=\"false\" width=\"480\" height=\"".$height."\"></embed></object>";
			}
			else 
				return false;
			}
		elseif(strpos($_embed,"dailymotion")!==false)
		{
			$beg=strpos($_embed,"/swf/video/")+11;
			$end=strpos($_embed,"?",$beg);
			$video_id=substr($_embed,$beg,$end-$beg);
			if($video_id!="")
			{
				$beg=strpos($_embed,"/video/") + 7;
				$end=strpos($_embed,"?",$beg);
				$width=substr($_embed,$beg,$end-$beg);
				$beg=strpos($_embed,'height=')+8;
				$end=strpos($_embed,'"',$beg+1);
				$height=substr($_embed,$beg,$end-$beg);
				$height=$height*480/$width;			
				
				return "<iframe frameborder=\"0\" width=\"480\" height=\"".$height."\" src=\"http://www.dailymotion.com/embed/video/".$video_id."?background=F2F2F2&foreground=FAAE3E&highlight=FF7000&width=480&theme=none&start=&animatedTitle=&iframe=1&additionalInfos=0&autoPlay=1&hideInfos=0\"></iframe>";
			}
			else 
				return false;
		}
		elseif(strpos($_embed,"vimeo")!==false && strpos($_embed,"object")!==false)
		{
			$beg=strpos($_embed,"clip_id=")+8;
			$end=strpos($_embed,"&",$beg);
			$video_id=substr($_embed,$beg,$end-$beg);
			if($video_id!="" && is_numeric($video_id))
			{
				$beg=strpos($_embed,'width=')+7;
				$end=strpos($_embed,"\"",$beg+1);
				$width=substr($_embed,$beg,$end-$beg);
				$beg=strpos($_embed,'height=')+8;
				$end=strpos($_embed,"\"",$beg+1);
				$height=substr($_embed,$beg,$end-$beg);
				$height=$height*480/$width;
			
				return "<iframe src=\"http://player.vimeo.com/video/".$video_id."?color=FF7000&amp;autoplay=1\" width=\"480\" height=\"".$height."\" frameborder=\"0\"></iframe>";
			}
			else 
				return false;
		}
		elseif(strpos($_embed,"vimeo")!==false && strpos($_embed,"iframe")!==false)
		{
			$beg=strpos($_embed,"player.vimeo.com/video/")+23;
			$end=strpos($_embed,'"',$beg);
			$video_id=substr($_embed,$beg,$end-$beg);
			if($video_id!="" && is_numeric($video_id))
			{
				$beg=strpos($_embed,'width=')+7;
				$end=strpos($_embed,"\"",$beg+1);
				$width=substr($_embed,$beg,$end-$beg);
				$beg=strpos($_embed,'height=')+8;
				$end=strpos($_embed,"\"",$beg+1);
				$height=substr($_embed,$beg,$end-$beg);
				$height=$height*480/$width;
				
				return "<iframe src=\"http://player.vimeo.com/video/".$video_id."?color=FF7000&amp;autoplay=1\" width=\"480\" height=\"".$height."\" frameborder=\"0\"></iframe>";
			}
			else 
				return false;
		}
		else
			return false;
	}
}