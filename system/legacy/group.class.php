<?php
/*
Name: Class User
Desc: Page Generator
Last modification: 01/26/2010 by Guillaume 
*/

class Group
	{
	//Vars
	private $id;
	private $title;
	private $desc;
	private $privacy;
	private $id_spt;
	private $verified;
	private $id_img;
	private $featured;
	private $networks;
	private $tags;
	private $url;
	private $date_crea;
	private $id_own;

	///Constructor we can specify wether or not to load the tags and the networks
	public function __construct($_id=NULL,$_tag=true,$_net=true)
		{	
		if(!is_null($_id))
			{
				if (isId($_id)) {
					$res=Db::read("SELECT id_grp,title_grp,desc_grp,privacy_grp,id_spt_grp,verified_grp,id_img_grp,featured_grp,url_grp,date_crea_grp,id_usr_grpusr FROM `group`,grp_usr WHERE id_grp_grpusr=id_grp AND type_grpusr='O' AND id_grp='{$_id}'");
				}
				else 
				{
			
					$res=Db::read('	SELECT id_grp,title_grp,desc_grp,privacy_grp,id_spt_grp,verified_grp,id_img_grp,featured_grp,url_grp,date_crea_grp,id_usr_grpusr 
									FROM `group`
									INNER JOIN grp_usr ON ( id_grp_grpusr=id_grp AND type_grpusr="O" )
									WHERE url_grp="' . $_id . '"');
				}
			if(count($res)!=1)	return false;
			else
				{
					
				// stripslashes for all content before showing it
   					/*foreach ($res[0] as $k=>$v)
   					{
   						$res[0][$k] = stripslashes($v);
   					}
   					*/
				$this->id=$res[0]['id_grp'];
				$this->title=$res[0]['title_grp'];
				$this->desc=$res[0]['desc_grp'];
				$this->privacy=$res[0]['privacy_grp'];
				$this->id_spt=$res[0]['id_spt_grp'];
				$this->verified=$res[0]['verified_grp'];
				$this->id_img=$res[0]['id_img_grp'];
				$this->featured=$res[0]['featured_grp'];
				$this->date_crea=$res[0]['date_crea_grp'];
				$this->id_own=$res[0]['id_usr_grpusr'];
				if(!is_null($res[0]['url_grp']) && $res[0]['url_grp']!="")
					$this->url=$res[0]['url_grp'];
				else $this->url=$this->id;
				//Find the tags of this group
				if($_tag)
					$this->tags=self::getTags();
				if($_net)
					$this->networks=self::getNetworks();
				}
			}
			
		}
	
	//access to attributes by $group->key
	public function __get($_key) 
    	{
        switch($_key)
		  {
		  case "id":
		   	return $this->id;
		  case "title":
		   	return $this->title;
		  case "desc":
		   	return $this->desc;
		 case "privacy":
		   	return $this->privacy;
		  case "id_spt":
		   	return $this->id_spt;
		  case "verified":
		   	return $this->verified;
		  case "id_img":
		   	return $this->id_img;
		  case "featured":
		   	return $this->featured;
		  case "networks":
		   	return $this->networks;
		  case "tags":
		   	return $this->tags;
		  case "url":
		   	return $this->url;
		  case "date_crea":
		  	return $this->date_crea;
		  case "id_own":
		  	return $this->id_own;
		  }
        throw new Exception("Unknow'$_key' in '".get_class($this)."'") ;
   		}

	
	public static function getPic($_id,$_id_img,$_size)
		{
		if(file_exists($_SERVER['DOCUMENT_ROOT'].'/g/'.$_id.'/'.$_id_img.$_size.'.jpg'))
			return '/g/'.$_id.'/'.$_id_img.$_size.'.jpg';
		else
			return '/g/default/dg'.$_size.'.jpg';					
		}
	///Returns an array with the groups near a certain distance 
	public static function getGroupsNear($_distance)
		{}   		
   	///creates a group	Warning: the tags and the networks are an array of Ids 
   	public static function createGroup($_title,$_desc,$_priv,$_id_img_grp,$_tags="",$_url=null,$_id_spt='99999999999999999999999999999999',$_verified="N",$_featured="0")
   		{
   		$res=Db::read("SELECT id_grp FROM `group` WHERE title_grp='{$_title}'");
   		if(count($res)>0)
   			//group already exist
   			return jsonRet('302',false);
   		else
   			{
   			//create the id of the group
   			$id=md5($_title.time());
   			//url rewritting
   			if(is_null($_url) || $_url=="")
   				$_url=changeUrlMap("group",array($_title),$id);
   			else 
   				$_url=changeUrlMap("group",array($_url),$id);
   				
   			if($_id_img_grp=='default')
   				$_id_img_grp='99999999999999999999999999999999';
   	
   			$res2=Db::write("INSERT INTO `group`(id_grp,title_grp,desc_grp,privacy_grp,id_img_grp,id_spt_grp,verified_grp,featured_grp,date_crea_grp,url_grp) VALUES('{$id}','{$_title}','{$_desc}','{$_priv}','{$_id_img_grp}','{$_id_spt}','{$_verified}','{$_featured}','".date("Y-m-d H:i:s")."','{$_url}')");
   			if($res2!=1) return jsonRet('104',false,'group');
   			else
   				{// we add the links between the tags and the group
   				$_tags=Tag::addFromRaw($_tags);
   				if(is_array($_tags) && sizeof($_tags)>0)
   					{
	   				$query="INSERT INTO tag_grp(id_tag_taggrp,id_grp_taggrp) VALUES";
	   				$queryNet="REPLACE INTO grp_net(id_grp_grpnet,id_net_grpnet) 
SELECT '".$id."',id_net_tagnet FROM tag_net WHERE id_tag_tagnet IN(";
	   				foreach($_tags as $t=>$tit)
	   					{
	   					$query.="'$t','$id'),";
	   					$queryNet.="'".$t."',";
						}
	   				$query=substr($query,0,-1);
	   				$queryNet=substr($queryNet,0,-1);
	   				
					$queryNet.=")  GROUP BY id_net_tagnet HAVING COUNT(id_tag_tagnet)>=2";
	   				$res3=Db::write($query);
	   				$res4=Db::write($queryNet);
	   				if($res3<1) return jsonRet('104',false,'tags');	
   					}
   					//we add the creator as the owner of the group
   					$quer="INSERT INTO grp_usr(id_grp_grpusr,id_usr_grpusr,type_grpusr) VALUES('{$id}','{$_SESSION['user']->id}','O')";
   					$res5=Db::write($quer);
    					
    				if($res5!=1) return jsonRet('104',false,'owner');
    		
    			//we create the group directory	
    			if(is_writable($_SERVER['DOCUMENT_ROOT']."/g"))
				{
					$tabact = array('id_vac' 		=> null, 
		   								'id_usr_vac' 	=> $_SESSION['user']->id,
		   								'date_vac'		=> date("Y-m-d H:i:s"),
		   								'id_spt_usr_vac'=> '99999999999999999999999999999999',
		   								'type_vac'		=> 'CG',
		   								'related_vac'	=> $id
		   								);
		   								
		   			$tabact = new ActivityAdapter($tabact);
		   			$tabact->groups = array(0=>$id);
		   								
					mkdir($_SERVER['DOCUMENT_ROOT']."/g/".$id, 0755);
					if($_id_img_grp!='99999999999999999999999999999999')
					{
						if(rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'150.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$id.'/'.$_id_img_grp.'150.jpg') && rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'120.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$id.'/'.$_id_img_grp.'120.jpg') && rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'100.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$id.'/'.$_id_img_grp.'100.jpg') && rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'80.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$id.'/'.$_id_img_grp.'80.jpg') && rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'50.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$id.'/'.$_id_img_grp.'50.jpg') && rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'40.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$id.'/'.$_id_img_grp.'40.jpg') && rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'24.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$id.'/'.$_id_img_grp.'24.jpg'))
						{
							
		   					$actModel = new ActivitiesModel();
		   					$actModel->saveOne($tabact);		
							   					
							return jsonRet(false,true,"/group/".$_url);
						}
						else
							return jsonRet('105',false,'photo');
					}
					else
						{
						$actModel = new ActivitiesModel();
		   				$actModel->saveOne($tabact);
		   					
						return jsonRet(false,true,'/group/'.$_url);
						}
						
						
				}
				else return jsonRet('105',false);
   				
   				}
   			}
   			return jsonRet('102',false);
   		} 
   	///update groups's datas in DB
   	public function updateInfosGroup($_desc,$_id_img_grp,$_id_spt,$_tags,$_url_grp)
   		{	$upd=$u=$img=false;
   			$this->desc = escape($this->desc);
   			//we look at each parameters to see if some are different
   			if(strcmp($_desc,$this->desc))
   				{
   				$this->desc=$_desc;
   				$upd=true;
   				}
   			if(strcmp($_id_img_grp,$this->id_img))
   				{
				$this->id_img=$_id_img_grp;
				if($this->id_img!='99999999999999999999999999999999')
					$img=true;
				$upd=true;
				}
   			if(strcmp($_url_grp,$this->url))
   				{
   					if($_url_grp!='')
						$this->url=changeUrlMap("group",array($_url_grp),$this->id);
					else
						$this->url=$this->url;
					$upd=true;
					
				}
   			if( strcmp($_id_spt,$this->id_spt) || is_null($_id_spt))
   				{
   				if(isId($_id_spt))
   					$this->id_spt=$_id_spt;
   				else
   					$this->id_spt='99999999999999999999999999999999';	
   				$upd=true;
   				}
   			if($upd)
	   			{
	   			$query="UPDATE `group` SET desc_grp='{$this->desc}',id_img_grp='{$this->id_img}',id_spt_grp='{$this->id_spt}' ,url_grp='{$this->url}' WHERE id_grp='{$this->id}'";
	   			$res=Db::write($query);
	   			if($res<1) return jsonRet('104',false,'text data');
	   			/*if($u)//this is for the file rewriting of the Url rewriting map
	   				{
	   				if(!changeUrlMap("groups.map",$this->url,$this->id))
	   					return jsonRet('105',false,'group map');
	   				}*/
	   			if($img)
	   				{
	   				if(!(rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'150.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$this->id.'/'.$_id_img_grp.'150.jpg') && rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'120.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$this->id.'/'.$_id_img_grp.'120.jpg') && rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'100.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$this->id.'/'.$_id_img_grp.'100.jpg') && rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'80.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$this->id.'/'.$_id_img_grp.'80.jpg') && rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'50.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$this->id.'/'.$_id_img_grp.'50.jpg') && rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'40.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$this->id.'/'.$_id_img_grp.'40.jpg') && rename($_SERVER['DOCUMENT_ROOT'].'/cache/'.$_id_img_grp.'24.jpg',$_SERVER['DOCUMENT_ROOT'].'/g/'.$this->id.'/'.$_id_img_grp.'24.jpg')))
	   					return jsonRet('105',false,'photo');
	   				}
	   			}
   			$_tags=Tag::addFromRaw($_tags);//this is our function that looks wether or not to add a tag and does it in case
   			//this is simply exactly the same thing as with the networks

	   		if(is_array($_tags) && sizeof($_tags)>0)
	   			{			
   				$_tags=array_keys($_tags);
	   			//we find the links between the tags and the group to add
	   			if(is_array($this->tags) && sizeof($this->tags)>0)
		   			{
		   			$tagsAdd=array();
		   			foreach($_tags as $t)
		   				{
		   				if(!array_key_exists($t,$this->tags))
		   					$tagsAdd[]=$t;
		   				}
	   			//we find the links between the tags and the group to delete
		   			$tagsDel=array();
		   			foreach($this->tags as $k=>$t)
		   				{
		   				if(array_search($k,$_tags)==NULL && !in_array($k,$_tags)) 
		   					$tagsDel[]=$k;
		   				}
		   			if(sizeof($tagsDel)>0)
		   				{ 	
		   			   	$query="DELETE FROM `tag_grp` WHERE id_grp_taggrp='{$this->id}' AND id_tag_taggrp IN(";
		   				foreach($tagsDel as $del)
		   					{
		   					$query.="'{$del}'";
			   				if($del!=$tagsDel[sizeof($tagsDel)-1])
			   					$query.=" , ";
			   				else
			   					$query.=")";
		   					}
		   				$res=Db::write($query);
		   				if($res<1) return jsonRet('104',false,'delete tags');
		   				}
	   				}
	   			else
		   			$tagsAdd=$_tags;
	   			if(sizeof($tagsAdd)>0)
	   				{
	   				$query="INSERT INTO `tag_grp`(id_grp_taggrp,id_tag_taggrp) VALUES";
	   				foreach($tagsAdd as $k=>$add)
	   					{
	   					$query.="('{$this->id}','{$add}'),";
	   					}
	   				if(substr($query,-1)==',')
	   					$query=substr($query,0,strlen($query)-1);
	   				$res=Db::write($query);
	   				if($res<1) return jsonRet('104',false,'add tags');
	   				}  
   				}
   			else
   				{
   				$res=Db::write("DELETE FROM `tag_grp` WHERE id_grp_taggrp='{$this->id}'");
   				}
   				//we update the tags and netwroks in our object
   			$oldTags=$this->tags;	
   			$this->tags=$this->getTags();
   			if($this->tags!=$oldTags)
   			{
   				if($this->updateNets())	
   					$this->networks=$this->getNetworks();
   			}
   			echo jsonRet(false,true);
   		}
   	///This simply checks if the url is available for this group
   	public static function urlAvail($_url)
   		{
   		$res=Db::read("SELECT id_grp FROM `group` WHERE url_grp='".$_url."'");
   		if(count($res)>0)
   			return false;
   		return true;
   		}
   	
	///says if I'm owner or not of this group
    public function amIowner()
    	{
    		if(isSession() && $_SESSION['user']->id==$this->id_own)
    			return true;
    		return false;
    	}
    ///return true if loged-in user is following this group 	
    public function amIfollowing()
    	{
    	$query='SELECT user.id_usr FROM grp_usr,user WHERE user.id_usr=grp_usr.id_usr_grpusr AND id_grp_grpusr=\''.$this->id.'\' AND type_grpusr IN(\'O\',\'A\',\'F\') AND id_usr=\''.$_SESSION['user']->id.'\'';
    	$arr=Db::read($query);
    	if(count($arr)==1)
    		return true;
    	else
    		return false;
    	}
    	
    ///return true if logged in user is waiting for following approval (only if the group is private)
    public function amIwaiting()
    	{
    	    	$query='SELECT user.id_usr FROM grp_usr,user WHERE user.id_usr=grp_usr.id_usr_grpusr AND id_grp_grpusr=\''.$this->id.'\' AND type_grpusr=\'W\' AND id_usr=\''.$_SESSION['user']->id.'\'';
    	$arr=Db::read($query);
    	if(count($arr)==1)
    		return true;
    	else
    		return false;
    	}
    ///$id start following $this works also to update the type of following	
    public function followedBy($_id,$_type="F")
    	{
    		die('followedBy: function substituted by GroupsModel::addFollower()');

    	}
   
    ///$id start following this group	
    public function acceptFollowRequest($idusr)
    	{
    		die('acceptFollowRequest: function moved to GroupsModel');
    	}
    ///$SESSION refuse $idusr to follow the group	
    public function rejectFollowRequest($idusr)
    	{
    		die('rejectFollowRequest: function moved to GroupsModel');
    	} 	
    ///$id stop following the group 	
    public function unfollowedBy($id)
    	{
    		die('function moved and substituted by GroupsModel::removeFollower()');
    	} 
    ///return the pretty box with numger of posts and followers
	function getStatsPanel()
		{
		$quer=<<<SQL
		SELECT G.`id_grp`, IFNULL( FW.count, 0 ) count_fw , IFNULL( A.count, 0 ) count_a
FROM `group` G 
	LEFT JOIN 	( 
				SELECT id_grp_grpusr, COUNT(id_usr_grpusr) count FROM `grp_usr` WHERE type_grpusr IN('O','F') GROUP BY id_grp_grpusr
				) FW ON G.id_grp= FW.id_grp_grpusr
	LEFT JOIN 	( 
				SELECT id_grp_grpact, COUNT(id_act_grpact) count FROM `grp_act` GROUP BY id_grp_grpact
				) A ON G.id_grp= A.id_grp_grpact
				 
WHERE G.`id_grp`='{$this->id}'
LIMIT 0 , 1;
SQL;
		$res=Db::read($quer);
    	if(count($res)==1)
    		{
    		$box='<div class="statsBox"><p>'.$res[0]["count_a"].'<span>Posts</span></p><p>'.$res[0]["count_fw"].'<span>Followers</span></p><span class="clear"></span></div>';
    		}
    	
    	return $box;
		}
	
	///return the networks which this group is in
	function getNetworks($limit=NULL,$beg="0",$_sort="0")
		{
		$query="SELECT id_net,title_net FROM grp_net,network WHERE id_net=id_net_grpnet AND id_grp_grpnet='{$this->id}'";
    	if($limit!=NULL || $beg!="0")
			$query.=" LIMIT ".$beg.",".$limit;
		$res=Db::read($query);
		if(count($res)>0)
			{
			$nets=array();
			foreach($res as $t)
				$nets["{$t['id_net']}"]=$t['title_net']; 
				//$nets["{$t['id_net']}"]=constant($t['title_net']); 
			}
			else $nets=false;
			return $nets;
		}
	///return the tags which this group is in
	public function getTags($limit=NULL,$beg="0",$_sort="0")
		{
		$query="SELECT id_tag,title_tag FROM tag_grp,tag WHERE id_tag=id_tag_taggrp AND id_grp_taggrp='{$this->id}'";
		if($limit!=NULL || $beg!="0")
			$query.=" LIMIT ".$beg.",".$limit;
		$res=Db::read($query);
		if(count($res)>0)
			{
			$tgs=array();
			foreach($res as $t)
				$tgs["{$t['id_tag']}"]=$t['title_tag']; 
			}
			else $tgs=false;
			return $tgs;
		}
	///returns the number of groups that has this network or simply the number of networks...
	public static function getNbr($_net=null)
		{
			if($_net!=null)
				$res=Db::read('SELECT id_net,title_net,COUNT( DISTINCT id_grp_grpnet) as nb FROM grp_net,network WHERE id_net=id_net_grpnet AND (id_net=\''.$_net.'\' OR id_prt_net=\''.$_net.'\'');
			else
				$res=Db::read("SELECT COUNT(id_grp) as nb FROM `group` ");
			if($res!=1)
				return $res[0]['nb'];
			else return false;
		}
	///Return an array with all the groups you can have it as raw data or as html formatted data
	public static function getAll($_beg="0", $_network=NULL, $_sorting="0",$lim=16,$_privacy="",$_name="")
		{
			$model	= new GroupsModel();
			$res = $model->getAll(array('beg'=>$_beg,'sorting'=>$_sorting,'limit'=>$lim,'network'=>$_network,'privacy'=>$_privacy,'search'=>$_name));
			if (count($res[1])>0) return $res;
			else return false;
		}
	function getActivity($beg=0,$type="0")
		{
			die('Group::getActivity(): doesn t exist anymore');
		}		
	public static function displayList($_tab,$_type='expand')
		{
		die('Group::displayList(): doesn t exist anymore');
		}
    
    public function updateNets()
		{
		$res=Db::write("DELETE FROM grp_net WHERE id_grp_grpnet='".$this->id."'");
		if(is_array($this->tags) && count($this->tags)>0)
			{
			$queryNet="REPLACE INTO grp_net(id_grp_grpnet,id_net_grpnet) SELECT '".$this->id."',id_net_tagnet FROM tag_net WHERE id_tag_tagnet IN(";
			foreach($this->tags as $t=>$tit)
				$queryNet.="'".$t."',";
			$queryNet=substr($queryNet,0,-1);
			$queryNet.=")  GROUP BY id_net_tagnet HAVING COUNT(id_tag_tagnet)>=2";
			$resNet=Db::write($queryNet);
			}
		return ((!isset($resNet) || $resNet!=-1) && $res!=-1) ? true : false;
		}

	}
?>