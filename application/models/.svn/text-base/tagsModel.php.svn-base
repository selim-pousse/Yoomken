<?php
/**
 * Manifest
 * 
 * application/models/tagsModel.php
 * 
 * Model for tags
 * 
 * @copyright: Yoomken Li
 * 
 */
class YOO_TagsModel extends AppModel
{
	/**
	 * Adds an array of tags into database
	 * 
	 * @param mixed array of $tags
	 * 
	 * @return mixed array of tags if success, false otherwise
	 * 
	 * @access public
	 */
	public function add($grptags = array())
	{	
		$query	= 'INSERT INTO tag(id_tag,title_tag,type_tag, lang_tag) VALUES';
		$arr	= array();
		$nb=0;
		foreach ($grptags as $type => $tags)
		{
			foreach($tags as $t)
			{	
				if(empty($t)) continue;
				$id			= isId($t)?$t:md5(strtolower(trim($t)));
				$objTag = null;
				if (isId($t) || $objTag = $this->getById($id)) {
					$objTag = isId($t)? $this->getById($id):$objTag;
					//print_r($objTag);//die($type);
					$arr[$id] = $objTag->title;
					if ($type!=$objTag->type && $type!='other' )
					{
						$sql = 'UPDATE tag SET type_tag="'.$type.'" WHERE id_tag="'.$id.'"';
						$res = Db::write($sql);
					}
				}
				else {
					$t = strtolower(trim($t));
					//$sql = 'SELECT id_tag from tag WHERE id_tag="'.$id.'" ';
					//$retour = Db::read($sql);
					//if (count($retour)==0){
						$nb++;
						$arr[$id]	= $t;
						$query	   .= '("'.$id.'","'.$t.'","'.$type.'","'.me()->lang.'"),';
					//}
					//else $arr[$id] = $this->getTitle($id);
					
				}
			}
		}  	
		if ($nb) {
			// last colon
			$query	= substr($query,0,-1);
			// and write
			$res	= Db::write($query);
		}
		return $arr;
		
	}
	
	
	/**
	 * clean the tags from a string like "tag1,tag2,tag3..." to an array
	 * 
	 * @param mixed array of $_str
	 * 
	 * @return mixed array if success, false otherwise
	 * 
	 * @access public
	 */
	public static function clean($_str)
	{	
		return  ($_str!='') ? array_unique(array_filter(array_map('cleanTag',explode('!+!',$_str)))) : false;
	}
		

	/**
	 * Adds the tags from a string like "tag1,tag2,tag3..."
	 * 
	 * @param mixed array of $tags
	 * 
	 * @return mixed array of tags if success, false otherwise
	 * 
	 * @access public
	 */
	public static function addFromRaw($tags)
	{	
		$tab=$this->clean($tags);
		
		return $tab ?  ($this->add($tab)) :  false;
	}
	
 	/**
     * Internal updateTags function, which actually writes the tags into database
     * 
     * @param mixed array $_tags
     * @param string $_type
     * 
     * @return boolean
     * 
     * @access public
     */
	public function updateTags($id,&$tags,$isnew=false,$suffix = 'act',$profil='B')
	{
			$idtags = array_keys($tags);
			//print_r($tags);
			$updated = false;
			if (!$isnew) 
			{
				$queryread = 'SELECT 1 as present,id_tag_tag'.$suffix.' FROM tag_'.$suffix.' WHERE profil_tag'.$suffix.'="'.$profil.'" AND id_'.$suffix.'_tag'.$suffix.' = "'.$id.'" AND id_tag_tag'.$suffix.' IN ("'.join('","',$idtags).'")
								UNION
							  SELECT 0 as present,id_tag_tag'.$suffix.' FROM tag_'.$suffix.' WHERE profil_tag'.$suffix.'="'.$profil.'" AND id_'.$suffix.'_tag'.$suffix.' = "'.$id.'" AND id_tag_tag'.$suffix.' NOT IN ("'.join('","',$idtags).'")';
				$res = Db::read($queryread);
				//echo $queryread;
				$todel = false;
				if (count($res)>0)
				{
					foreach ($res as $val)
					{
						if ($val['present']) {
							unset($tags[$val['id_tag_tag'.$suffix]]);
						}
						else $todel = true;
					}
				}
				if ($todel){
					$queryDel 	=   'DELETE FROM tag_'.$suffix.' WHERE profil_tag'.$suffix.'="'.$profil.'" AND id_'.$suffix.'_tag'.$suffix.' = "'.$id.'" AND id_tag_tag'.$suffix.' NOT IN ("'.join('","',$idtags).'")';
					Db::write($queryDel);
					//echo $queryDel;
					$updated = true;
				}
				
			}
				
			if(is_array($tags) &&  count($tags)>0)//link the tags and the activity
			{	
				$query2		=	'INSERT INTO `tag_'.$suffix.'` (`id_'.$suffix.'_tag'.$suffix.'`,`id_tag_tag'.$suffix.'`,`profil_tag'.$suffix.'`) VALUES ';
				foreach($tags as $k => $v)
				{
					$query2	.=	'("'.$id.'","'.$k.'","'.$profil.'"),';
				}
				//print_r($query2);
				$query2=substr($query2,0,-1);
				$res2=Db::write($query2);
				$updated = true;
			}
			return $updated;		
	}
	
 	/**
     * Gets all tags for a provided user
     * 
     * @param string $user ID
     * 
     * @return mixed array of tags
     * 
     * @access public
     */
    public function getByUser($user = '')
    {
    	// only a valid user
    	if (!isId($user))
    	{
    		return array();
    	}
    	
    	// vars
    	$return = array( 'others' => array(), 'shows' => array(), 'bands' => array(), 'books' => array(), 'brands' => array() );
    	
    	$tags 	= Db::read('SELECT id_tag, title_tag, type_tagusr FROM tag, tag_usr WHERE id_tag = id_tag_tagusr AND id_usr_tagusr="' . $user . '"');
		
    	// build return array
    	if(sizeof($tags)>0)
   		{
   			foreach($tags as $t)
   			{   						
   				$return[$t['type_tagusr']][$t['id_tag']] = $t['title_tag'];
   			}
   		}
   		return $return;    	
    	
    }
    
	public function getTagsLike($_str , $mode='ui',$type = '')
	{
		$_str = strtolower ($_str);
		if (empty($type)) $type = '1';
		else $type = ' type_tag = "'.$type.'"';
		$res=Db::read('
						SELECT title_tag,id_tag FROM tag 
						WHERE '.$type.' AND lang_tag = "'.me()->lang.'" AND 
							( 
								LOWER(title_tag) LIKE(\'%'.$_str.'%\') OR 
								('.$this->aproximate.' AND SOUNDEX(title_tag) = SOUNDEX("'.$_str.'"))
							) 
						LIMIT 0,5
					');
		if(count($res)<1) {return json_encode(array(array(""))); }
		else
		{
			$arr=array();
			foreach($res as $r){
				if ($mode=='ui') $arr[]=array('label'=> $r['title_tag'],'value'=>$r['id_tag'],'id'=>$r['id_tag'],'html'=>$r['title_tag'],'plain'=>$r['title_tag']);
				else $arr[]=array($r['id_tag'],$r['title_tag'],$r['title_tag'],$r['title_tag']);
			}
			return json_encode($arr);
		}		
	}
	
	public function getTitle($idtag)
	{
		$res=Db::read('SELECT title_tag FROM tag WHERE id_tag="'.$idtag.'"');
		if (count($res)==1) return $res[0]['title_tag'];
		else return false;
	}
	
	public function getById($idtag)
	{
		$res=Db::read('SELECT * FROM tag WHERE id_tag="'.$idtag.'" AND ( type_tag<>"service" OR ( type_tag="service" AND lang_tag="'.me()->lang.'") ) LIMIT 1');
		if (count($res)==1) return new tagAdapter($res[0]);
		else return false;
	}
	
}
?>