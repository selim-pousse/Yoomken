<?php 

class YOO_ActivitiesModel extends AppModel
{
	
	
	protected $model = 'activities';
	
	/*
	 *  the view to handle
	 */
	protected $view = 'view_activity';
	/*
	 * field's suffix for the view
	 */
	public $sfx = 'vac';
	protected $sfx2 = 'act';
	protected $pfx_MT = 'A';
	protected $filter_type = '.1.';
	
	protected $fields = '	A.*,U.* ';
	/*
	 * Contructor
	 */ 
	public function __construct($act = null)
	{
		
		parent::__construct();
	}
	
	
	/* 
   	 *  it accepts an ID hash to load Activity's datas from database
	 * 
	 * @param string $id
	 * 
	 * @return array including the Activity's datas
	 * 
	 */
	public function getById($id, $details= false)
	{
		if (isId($id)) $whereId = 'a.id_'.$this->sfx.'="'.$id.'""';
		else $whereId = 'a.pid_'.$this->sfx.'='.$id;
 	
		if (is_numeric($id) || isId($id) )
		{
			//$res2=Db::write('UPDATE `content` SET views_cnt = views_cnt+1 WHERE id_act_cnt="'.$id.'"');
			
			$res	=	Db::read('
								SELECT a.*,u.url_usr, u.id_img_usr, u.fullname_usr, u.privacy_usr, u.gender_usr, u.id_spt_usr,
										RU.id_usr as id_rel, RU.fullname_usr as fullname_rel,RU.url_usr as url_rel,RU.email_usr as email_rel,RU.privacy_usr as privacy_rel 
								FROM `'.$this->view.'` AS a
								INNER JOIN `user` AS u ON a.id_usr_'.$this->sfx.' = u.id_usr
								LEFT JOIN `user` AS RU ON a.related_'.$this->sfx.' = RU.id_usr
								WHERE  '.$whereId.' LIMIT 1
								');
	   		if(count($res)==1)
	   		{
	   			$ret[0] = new ActivityAdapter($res[0]);
				$this->getActivityComment($ret[0]);
				
   				$this->getActivitiesSpots($ret);
   				$this->getActivitiesTags($ret);
   				$this->getActivitiesFilters($ret);
				$this->getActivitiesCount($ret);
				$this->getActivitiesInfoRelated($ret);
				
   				//$ret  	= $ret[0];
	   			return $ret[0];
	   			
	  	   	}
	  	   	else return false;
		}	else return false;
		
	}



	/* 
   	 *  it accepts an ID hash to load Activity's datas from database
	 * 
	 * @param string $id
	 * 
	 * @return array including the Activity's datas
	 * 
	 */
	public function getAll( array $types = null, $limit = 50)
	{	
		if ($types) 	$types = '1';
		else $types = 'type_act IN ("'.join('","',$types).'")';
			 	
			
		$res	=	Db::read('
							SELECT a.*,u.url_usr, u.id_img_usr, u.fullname_usr, u.privacy_usr, u.gender_usr, u.id_spt_usr
							FROM `'.$this->view.'` AS a
							INNER JOIN `user` AS u ON a.id_usr_'.$this->sfx.' = u.id_usr
							WHERE  '.$types.'  LIMIT '.$limit.'
							');
   		if(count($res))
   		{
   			foreach ($res as &$act) {
				   $act =  new ActivityAdapter($act);
			 }
			
			$this->getActivitiesSpots($ret);
			$this->getActivitiesCount($ret);
			
			//$ret  	= $ret[0];
   			return $ret;
   			
  	   	}
  	   	else return false;
		
	}

	/**
	* Generic Function  for searching
    * if ($model = activities) => Get all Contents by filtering 
    * if ($model = people) => Get all people by filtering 	 	
    * @return array() of Activity Object
    *
	public function processSearch(array $filters,$params,$by='',$join = true)
	{
		$resnb = parent::processSearch($filters,$params,$by,$join);
		
		return $resnb;
	}*/
	
	public function _6_init($reason)
	{
		$plusfields = '';
		if ($this->model == 'contents'){ // pour prendre en compte les personnes recomandées dans un avis
			$plusfields .= ', RU.id_usr as id_rel,RU.fullname_usr as fullname_rel,RU.url_usr as url_rel,RU.email_usr as email_rel,RU.privacy_usr as privacy_rel ';
			$this->setSql_relatedPerson();
			$this->ondemand['sql_relatedPerson'] = 'sql_relatedPerson';
		}


		$query = 'SELECT  '.$this->fields.$plusfields.',"'.$reason.'" as reason_vac,
				 		IFNULL(u_.status_usrusr,0) as me__usr,
						IFNULL(_u.status_usrusr,0) as _me_usr
				  FROM `'.$this->view.'` as A 
				  INNER JOIN `user` AS U ON A.id_usr_'.$this->sfx.' = U.id_usr 
				  {#sql_relatedPerson}'; 

		$me = $this->session->get('user');
		//if ($me && isId($me->id))
		{
			$query .= 	' LEFT JOIN  user_user AS u_ ON ( u_.id_follower_usrusr="'.$me->id.'" AND u_.id_followed_usrusr = U.id_usr )
						  LEFT JOIN  user_user AS _u ON ( _u.id_followed_usrusr="'.$me->id.'" AND _u.id_follower_usrusr = U.id_usr )
						  {#sql_mycollaborators}
						  {#sql_myservices}
						  {#sql_countries}  
						  {#sql_nearby} 
						  ';
		}
		return $query;
	}
		
	// filtrer par service
	// Attention! les services doivent attaquer tjrs la table tag_usr et non tag_act pour le model 'activities'
	public function _6_s(&$query,$filter,$idsmart = null)
	{
		$this->_6_t($query,$filter/*,$sfx = 'usr_act',$sfx2 = 'usr'*/);	
	}	
	
	public function _6_c(&$query,$filter,$idsmart = null)
	{
		$terms = $filter->values;
		$op = $filter->op;
		$glues = $filter->glues;
		$attach = $filter->attach;
   		if(sizeof($terms))
   		{  
   			$query .= ' INNER JOIN `'.$this->view.'` as A'.$this->nb.' ON '; 
   			$query .= '( (';				   				
   			foreach($terms as $kw) 
   			{
   				$query	.=	' (
   								A'.$this->nb.'.desc_'.$this->sfx.' '.$op.' '.$glues[2].$kw.$glues[3].' 
   							  ) '.$attach.' ' ;
				// OR A'.$this->nb.'.title_'.$this->sfx.' '.$op.' '.$glues[2].$kw.$glues[3].' // title obsollète
   			}
   			$query = (string) substr($query,0,$attach == 'AND'?-4:-3);
   			$query .= ' )';
   			$query	.= ' AND A.id_vac = A'.$this->nb.'.id_vac ) ';
   		}
	}
	
	
	
	public function setSql_myServices()
	{
		$who = $this->session->who();
		if(!$who) return;
		$this->sql_myservices  = 
							'LEFT JOIN  tag_act AS tu ON (tu.id_act_tagact = A.id_' .$this->sfx. ')
						     INNER JOIN tag tmys ON (tu.id_tag_tagact = tmys.id_tag AND lang_tag = "'.me()->lang.'" 
								  	AND ( tmys.id_tag IN ("'.implode('","',$who->idservice).'") 
									OR tmys.id_parent_tag IN ("'.implode('","',$who->idservice).'") ) )';	
	}


	/**
	 * Processes the sorting input to select the order field
	 * 
	 * @param string $sorting type
	 * 
	 * @return string the selected order field
	 */
	public function getOrder()
	{
		switch($this->sorting)
		{
			case 'featured':
				$order = 'RAND()';
			break;
			case 'viewup':
				$order = 'views_'.$this->sfx.' DESC,RAND()';
			break;
			case 'oldest':
				$order = 'date_'.$this->sfx.' ';
			break;
			case 'nearest':
				$order = 'distance_'.$this->sfx.' ';
			break;
			case 'newest':
			default:
				$order = 'date_'.$this->sfx.'  DESC ';	
		}
		
		return $order;
	}
	
	/**
	 * Creates a query bit for the content type parameter
	 * 
	 * @param string $type One of 'AD', 'PU', FU  etc..
	 * @param boolean wall mode, show absolutely all types
	 * 
	 * @return string the query bit
	 */
	public function getWhereType($journal, $types = null)
	{
		//_debug($types);die();	
		$whereType = ' type_'.$this->sfx.' != "WB" ';
		
		
		if ($journal == 'WALL') {
			$whereType .= ' AND wall_usr_'.$this->sfx.' = "'.who()->id.'" ';
			//return $whereType;
		}
		else $whereType .= ' AND inflow_'.$this->sfx.' = 1 ';
		
		if ($journal=='BASE') $whereType .= ' AND type_'.$this->sfx.' != "OF" ';
		
		// force array
		if(is_string($types) && $types!='ALL') $types = array($types);
		
		if ( is_array($types) and count($types)>0  and $types[0])
		{
			$whereType .= ' AND type_'.$this->sfx.' IN ("'.join ('","',$types).'") ';
		}	
		return $whereType;
	}
	
	/**
	 * Creates a query bit for the content destinated for campany or seeker
	 * 
	 * @param string Profil One of P (prestaire) or C (campagny)
	 * @return string the query bit
	 */
	public function getWhereFlux($flux = '')
	{
		$where = ' deleted_'.$this->sfx.' = 0 ';
		/*if ($me = $this->session->get('user'))		
			if (empty($flux))
			{
				$flux = $me->profil=='P'?'JB':($me->profil=='C'?'SV':'');
			}*/

		if ( $flux == 'JB' || $flux == 'SV')
		{
			$where .= ' AND flux_'.$this->sfx.' = "' . $flux . '"';
		}
		else 
		{
			$where .= ' AND flux_'.$this->sfx.' IN ("JB","SV","NE")';
		}
		return $where;
	}

	/**
	 * Creates a query bit to get the recent activities
	 * 
	 * @param string $activity id of the last activity in the linetime displayed
	 * 
	 * @return string the query bit
	 */
	private function getWhereDate($activity)
	{
		$res = Db::read('SELECT date_act FROM `activity` WHERE pid_act='.$activity );

		if (count($res)==1) 
		{
			return ' date_'.$this->sfx.' >= "' .$res[0]['date_act']. '" ';
		}
		else return ' 1 ';
	}
	
	
	
	/**
	 * Check if two user are connected
	 * 
	 * @param string $follower
	 * @param string $followed
	 * 
	 * @return boolean true if $followed is followed by $follower
	 */
	public function amIfollowingUser($followed)
	{
		$follower	=	$this->session->getUserVar('id');
		$res = Db::read('SELECT id_followed_usrusr FROM `user_user` WHERE id_follower_usrusr="'.$follower.'" and id_followed_usrusr="'.$followed.'" AND status_usrusr="A"' );

		if (count($res)>0) return true;
		else return false;
	}
   	
   	
   /**
   	 * Get the tags for each activity
   	 * 
   	 * @param array $activities
   	 * 
   	 **/
   	public function getActivitiesTags(&$activities,$type ='')
   	{
   		$this->getTags($activities,$type);
   	}
   	
/**
   	 * Get the tags for each activity
   	 * 
   	 * @param array $activities
   	 * 
   	 **/
   	public function getActivitiesFilters(&$activities)
   	{
   		parent::getFilters($activities);
   	}
   	
   	/**
   	 * Get all spot for both user and activity 
   	 * 
   	 * @param array $activities
   	 * 
   	 * @return mixed array of group
   	*/  	
    public function getActivitiesSpots(&$activities)
	{
		// set vars
		$spots 		= array();
		$orUsr 		= '';
		$orSpt 		= '';
		$size 		= sizeof($activities);
		$i 			= 0;
		$actIDs		= array();
		$usrIDs		= array();
		$sptIDs		= array();
		
		// create complex query
		foreach ($activities as $act) 
   		{
   			// get activity ID's
   			if(isId($act->id))
			{				
				$actIDs[] 	= $act->id;
		   	}
		   	
		   	// get user ID's
   			if(isId($act->user->id))
			{				
				$usrIDs[] 	= $act->user->id;
		   	}
		   	
			
			switch ($act->type)
			{
				default:
					if (isset($act->id_spt))
					{
						if (isId($act->id_spt))
						{
							$sptIDs[] = $act->id_spt;
							$act->set('spot',null); // becareful when $act is array not object, must be an adress assignment not a copie
						}
					}
					break;
				//default:
			}
			
   			// then spot ID's from activities
   			if(isId($act->user->id_spt))
			{			
				$sptIDs[] 	= $act->user->id_spt;
				$act->user->set('spot',null); // becareful when $act is array not object, must be an adress assignment not a copie
			}
   		}
   		
   		// reduce arrays
   		$sptIDs = array_unique($sptIDs);
   		
   		// reduce again and we have all the spots we need
   		$sptIDs = array_unique($sptIDs);
   		
   		// remove Somewhere spot   		
   		if (in_array('99999999999999999999999999999999',$sptIDs))
   		{
   			$key = array_search('99999999999999999999999999999999',$sptIDs);
   			unset($sptIDs[$key]);
   		}
   		
   		// so, get them all! First, prepare query
   		if (sizeof($sptIDs) > 0)
   		{
   			$orSpt .= 'id_spt IN ("' . join('","',$sptIDs) . '")';
   			
   			// run it
   			$spts = Db::read('SELECT * FROM `spot` as spt WHERE ' . $orSpt . ' GROUP BY id_spt');
	   		// create final associative array:
	   		// for every spot in database (filtered by activity, and users owning the activities)
	   		foreach ($activities as $act)
	   		{
		   		foreach ($spts as $spt) 
		   		{
		   			$spt = new SpotAdapter($spt);
					if($act->id_spt 		== $spt->id) 		$act->set('spot',$spt);
					if($act->user->id_spt 	== $spt->id) 		$act->user->set('spot',$spt);		
		   		} 
	   		} 			
   		}	
	}    

	
	/**
   	 * Get the followed elements information for some special types
   	 * 	FU, CU, LU, LA
   	 * 	Thus, this information has to be retrieved separately from the database
   	 * 
   	 * @param array $activities
   	 * 
   	 * @return mixed array of comments
   	*/  
   	public function getActivitiesInfoRelated(&$activities)
   	{
   		// variables
   		$users = $actliked = $badges = $reshare = array( 'NULL' );
   		
   		if (sizeof($activities))
   		{
	   		// prepare query	   		
			foreach ($activities as &$act)
			{
				if(isId($act->id))
				{
					if ( $act->type == 'LA' )
					{
						$actliked[]	= '"' . $act->related . '"';
					}
					else if ( $act->type == 'LU' || $act->type == 'FU' || $act->type == 'CU')
					{
						$tmp = explode(';',$act->related);					
						foreach ($tmp as $t)
						{
							if ($t && !isset($users[$t]))	$users[$t]	= '"' . $t . '"';	
						}
					}
					else if ($act->user->id != $act->wall_usr) // if the author user is diferent of the user wall
					{
						if (!isset($users[$act->wall_usr])) $users[$act->wall_usr]	= '"' . $act->wall_usr . '"';
					}
					else if ( $act->type == 'RB' || $act->type == 'GB')
					{
						//$tmp = json_decode($act->related);					
						$users[$act->related->towho] = '"' . $act->related->towho. '"';
						$badges[$act->related->badge] = '"' . $act->related->badge. '"';
					}
					else if ( $act->redate && $act->date != $act->redate)
					{
						
						// query to get the real row (in fact the recent one)
				  		$ret_act	= Db::read('SELECT a.*,u.*  FROM `view_activity` a
				  								INNER JOIN `user` u ON (id_usr_vac = id_usr) 
				  								WHERE id_vac = "'.$act->id.'" AND date_vac="'.$act->redate.'"');
						if (count($ret_act) == 1){
							 $actbis = new ActivityAdapter($ret_act[0]);
							 $act->user = $actbis->user;
							 $act->id_usr = $actbis->id_usr;
							 $act->date = $actbis->date;
						}
					}
					
					if ($act->user->id != $act->holder_usr && $act->holder_usr!=null) {
						$this->model('user');
						$act->holder = $this->user->getById($act->holder_usr);
					}
					//_debug($act->holder);die();
				}
			}
			
			$ret_usrs = $ret_acts = $ret_bdgs = array();
			if (count($users)>0)
			{
				// query to get users
		  		$ret_usrs	= Db::read('SELECT id_usr,fullname_usr,url_usr,privacy_usr FROM `user` WHERE id_usr IN (' . join(',', $users)  . ')');
		  		// then process again the input array to detect results and add them
			}
			if (count($badges)>0)
			{
				// query to get badges
		  		$ret_bdgs	= Db::read('SELECT * FROM `badge` WHERE name_bdg IN (' . join(',', $badges)  . ') AND lang_bdg = "'.$this->session->get('lang').'"');
			}	  		
			if (count($actliked)>0)
			{
		  		// query to get groups 
		  		//echo 'SELECT * FROM `group` WHERE id_grp IN (' . join(',', $groups)  . ')';
		  		$ret_acts	= Db::read('SELECT id_act,shortdesc_cnt,id_usr_act,u.*  FROM `activity`
		  								INNER JOIN `content` ON (id_act = id_act_cnt)  
		  								INNER JOIN `user` u ON (id_usr_act = id_usr) 
		  								WHERE id_act IN (' . join(',', $actliked)  . ') GROUP BY id_act');
				
			}	
		  		
		  	foreach ($activities as $act) 
	   		{	
				foreach($ret_usrs as $u)
	   			{
	   				$u = new UserAdapter($u);
	   				if (  ($act->type == 'FU' || $act->type == 'LU' || $act->type == 'CU') && in_array($u->id,explode(';',$act->related)) )
	   				{	
	   					if (!isset($act->userplus)) $act->set('userplus',array());
	   					$act->userplus[$u->id] = $u;
	   				}
					else if ($act->wall_usr != $act->user->id && $u->id==$act->wall_usr ) {
						if (!isset($act->userplus)) $act->set('userplus',array());
	   					$act->userplus[$u->id] = $u;
					}
					else if ( $act->type == 'RB' || $act->type == 'GB')
	   				{	
	   					if (!isset($act->userplus)) $act->set('userplus',array());
	   					$act->userplus[$u->id] = $u;
	   				}
	   			}
				
				// then process again the input array to detect results and add them
	   			foreach($ret_acts as $g)
	   			{
	   				$g = new ActivityAdapter($g);
					//_debug($g);
	   				if ( $act->type == 'LA' && $act->related == $g->id)
	   				{	
	   					if (!isset($act->actplus)) $act->set('actplus',array());
	   					$act->actplus[$g->id] = $g;
	   				}
	   			}


				// then process again the input array to detect results and add them
	   			foreach($ret_bdgs as $g)
	   			{
	   				$g = new BadgeAdapter($g);
					//_debug($g);
	   				if ( $act->type == 'RB' || $act->type == 'GB')
	   				{	
	   					if (!isset($act->bdgplus)) $act->set('bdgplus',array());
	   					$act->bdgplus[$g->name] = $g;
	   				}
	   			}
				//die();
			}	   				   					
   		}
   	}
	
	/**
   	 * Adds count information to an activities array
   	 * 
   	 * @param mixed $activities 
   	 * 
   	 * @return mixed $activities  with count information added
   	 */
   	public function getActivitiesCount(&$activities)
   	{
   		if (!sizeof($activities))
   		{
   			return array();
   		}
   		
   		// get counts
		$actWhere = array();
		foreach ($activities as &$act)
		{
			$actWhere[] = '"' . $act->id . '"';	
			$adrActs[$act->id] = $act;
			$act->set('count_cmt',0);
			$act->set('count_like',0);
			$act->set('count_share',0);
			$act->set('isLiked',false);
		}
		$actWhere = join(',',$actWhere);

		$counts_cmt 	= Db::read('SELECT id_act_cmt, COUNT(DISTINCT id_cmt) AS count_cmt 
										FROM `comment` 
										WHERE id_act_cmt IN(' . $actWhere . ')
										 GROUP BY id_act_cmt
										 HAVING COUNT(*) > 0 ;');
										 
		$counts_share 	= Db::read('SELECT id_act, COUNT(DISTINCT pid_act)-1 AS count_share
										FROM `activity` 
										WHERE id_act IN(' . $actWhere . ') 
										 GROUP BY id_act
										 HAVING COUNT(*) > 1;');
										 
		/*$counts_spd 	= Db::read('SELECT id_act, COUNT(DISTINCT id_act) AS count_spd FROM `activity` WHERE type_act = "R" AND id_act IN(' . $actWhere . ') GROUP BY id_act ORDER BY id_act;');*/
		// parse
		// cmt
   		foreach ($counts_cmt as $c=>$cmt)
		{
			$cmt = new CommentAdapter($cmt);
			$adrActs[$cmt->id_act]->set('count_cmt',$cmt->count); 
   		} 
		
		foreach ($counts_share as $a=>$va)
		{
			$va = new Adapter($va);
			$adrActs[$va->id_act]->set('count_share',$va->count_share); 
   		} 
		//_debug($counts_share);die();
		
		// add cound liked
		$this->getLiked($adrActs,$actWhere,'ACT');
		
					
		return $activities;
   	}
	
	
	/**
   	 * Get All comments for one activity
   	 * 
   	 * @param array $activities
   	 * 
   	 * @return mixed array of comments
   	*/  
   	public function getActivityComment(&$act)
   	{
   		// variables
		$cmtWhere = array('NULL');
		$query	 = 'SELECT SQL_CALC_FOUND_ROWS * FROM (
						SELECT c.*,u.fullname_usr,u.url_usr,u.id_img_usr,u.privacy_usr,u.id_usr ,u.email_usr
						FROM `comment` as c 
						LEFT JOIN `user` AS u ON c.id_usr_cmt = u.id_usr 
						WHERE c.id_act_cmt ="' . $act->id  . '"
					) AS totRes
					ORDER BY date_Cmt DESC LIMIT 5';
   		
		// get
		$res 	 = Db::read($query);
		$nbcount = Db::read("SELECT FOUND_ROWS()");
		//foreach ($activities as $act)
		$act->set('count_cmt',$nbcount[0]['FOUND_ROWS()']);	
		// then process result
   		foreach ($res as $r) 
   		{
   			$r = new CommentAdapter($r);
			if ($act->id == $r->id_act)
			{
	   			if (!isset($act->cmts)) $act->set('cmts',array());
	   			if ($r->id_prt==null)
	   			{
	   				$tmp = array ();
	   				/*if (isset($adrComs[$r->id_act]->comments[$r->id])) 
	   				{
	   					if (isset($adrComs[$r->id_act]->comments[$r->id]->replies)) 
	   					{
	   						$tmp = $adrComs[$r->id_act]->comments[$r->id]->replies;
	   					}
	   				}*/
	   				$act->cmts[$r->id]	=	$r;
					
					$adrCmt[$r->id] = $r;
					$r->set('count_like',0);
					$r->set('isLiked',false);
					$cmtWhere[] = '"' . $r->id . '"';	
	   				//$adrComs[$r->id_act]->comments[$r->id]->replies	= 	$tmp;
	   			}
	   			/*else 
	   			{
	   				if (!isset($adrComs[$r->id_act]->comments[$r->id_prt])) {
	   					$adrComs[$r->id_act]->comments[$r->id_prt] = new CommentAdapter(array());
	   					$adrComs[$r->id_act]->comments[$r->id_prt]->set('replies',array());
	   				}
	   			 	$adrComs[$r->id_act]->comments[$r->id_prt]->replies[]=$r; 
	   			}*/	
			}	
		}
		$cmtWhere = join(',',$cmtWhere);
		$this->getLiked($adrCmt,$cmtWhere,'CMT');
		
			
   		//}
   	}


	/*
	 * Get the tags
	 * 
	 * @param id hash of the Activity's table
	 * 
	 * @return array which includes all tags  linked to an activity
	 */
   	public function getTagsById($id = NULL)
   	{
   		$tags = array();		
   		if ($id == NULL) 
   			return $tags;
   			
   		$resultTags= Db::read('
   								SELECT id_tag, title_tag 
   								FROM tag , tag_act ON id_tag = id_tag_tagact 
   								WHERE id_act_tagact ="'.$id.'"'
   							);
   		//Return result
   		$tags = array();
   		if(count($resultTags)>0)
   		{
   			foreach($resultTags as $res)
   			{
   				$tags["{$res['id_tag']}"] = $res['title_tag'];
   			}
   		}			 
	   	return $tags;
   	}
   	
   	
	/* 
   	 *  Save a new activity or update the activity
	 * 
	 * @param array $act contants all datas of activity
	 * 
	 * @return array including the Activity's datas
	 * 
	 */
    public function saveOne (&$act)
	{
		if (is_array($act)) $act = new CommonAdapter($act,array('_vac'));
		
		//if ($act->type=='AV') $act->related = $act->related->id;
		$act->related = addslashes($act->related);
		
		//check if is there an updating => otherwise go for insertion 
		switch ($act->type)
		{
			case 'FU':
			case 'CU':
			case 'LU':
				if ($act->related!="00" && $act->id_usr!="00")
				{
					$res=Db::read('
	    						SELECT pid_act,related_act FROM `activity` 
	    						WHERE id_usr_act = "'.$act->id_usr.'" AND type_act = "' . $act->type . '" AND date_act LIKE "'.date("Y-m-d").' %" LIMIT 1
	    						');
	    			if(sizeof($res)==1)
	    			{
		    			if ( !in_array($act->related,explode(';',$res[0]['related_act'])) )
		    			{
		    				 $res[0]['related_act']  .= ';' . $act->related;
		    			}
	    				$res2=Db::write('UPDATE `activity` SET related_act="'.$res[0]['related_act'].'",date_act="'.date("Y-m-d H:i:s").'" WHERE pid_act = '.$res[0]['pid_act']);
	    				return true;
	    			}
					
				}
				else return 'team';
				break; 		
		}
		
		 			
		
		$tags =  $groups = array();
		//$act->flux = $this->session->getUserVar('profil')=='P'? 'JB':'SV';
		
		if ( isset($act->tags) )  		$tags 		= $act->tags;
		if ( isset($act->groups) )  	$groups 	= $act->groups;
		
		$new = ($act->pid==0);
		$queryMain 		= 	'';
		
		$act->id=md5("act".time().$act->id_usr);
		
		
		if (!$new) {
			$reshare = $this->getById($act->pid);
			if ($reshare && $reshare->holder_usr!=me()->id) {
				$new = 1;
				$reshare->user->id = $reshare->id_usr = me()->id;
				$reshare->jumpcnt = 1;
				$reshare->date = date("Y-m-d H:i:s");
				$act = $reshare;
			}
		}
		
		
		if($new)
		{
			// which wall ?
			$wall_usr = (ishim() && in_array($act->type,array('NW','AV','OF','QU'))? who()->id:(in_array($act->type,array('PU'))?'':me()->id));
			if ($act->type=='RB')  $wall_usr = $act->id_usr;
			
			// inflow = 1 => in the tmeline base (not in the wall)
			$inflow = ( ($act->type=='LA' || $act->type=='RB' || $act->type=='WB' || (ishim() && in_array($act->type,array('NW','AV','OF','QU') ))) ?'0':'1');
			
			// initialiser la langue utilisée
			if (in_array($act->type,array('NW','AV','OF','QU','WB'))) $lang = $this->session->get('lang');
			else $lang = 'xx';
			
			$queryMain	=	'
							INSERT INTO `activity` 
							SET id_act		=		"' . $act->id . '",
								id_usr_act	=		"' . $act->id_usr . '",
								wall_usr_act=		"' . $wall_usr 	. '",
								inflow_act	=		'  . $inflow	.',
								date_act	=		"' . $act->date . '",
								type_act	=		"' . $act->type . '",
								flux_act	=		"' . $act->flux . '",
								related_act	=		"' . $act->related . '",
								lang_act	=		"' . $lang . '"';
		}
		else $queryMain = 'UPDATE activity SET date_act = "'.date("Y-m-d H:i:s").'" WHERE pid_act = '.$act->pid;
		$success = Db::write($queryMain);
		
		$act->pidold = $act->pid; // useful for the reshare
			
		if($new) {
			$pid = db::read('SELECT MAX(pid_act) as pid_act FROM activity where id_act="'.$act->id.'"');
			$act->pid = $pid[0]['pid_act'];
		}
		
		$success = $new? $success:1;
		
		// Tag's part 
		if ($success && !$act->jumpcnt)
		{
			$this->model('tags');
			$this->tags->updateTags($act->id,$tags,$new);
		}
		
	    //the main query that records the activity
	    if (in_array($act->type,array('NW','AV','CR','OF','QU','WB'))) 
	    {
	    	return array($success,$new);
		}
	    else return $success;
    }
    
    
    
	/**
     * Delete the specified activity and all it's related informations
     * 
     * @param string $id ID
     * 
     * @return boolean
     * 
     * @access public
     */
    public function deleteOne($_idact)
	{
		/*$res=Db::write('
						DELETE FROM `activity` 
						WHERE `activity`.`id_act` = "'.$_idact.'" AND `activity`.`id_usr_act`="'.$this->session->getUserVar('id').'"
					 ');*/
		
		$res=Db::write('
						UPDATE `activity` SET deleted_act = 1
						WHERE `activity`.`pid_act` = '.$_idact.' AND `activity`.`id_usr_act`="'.$this->session->getUserVar('id').'"
					 ');
		if($res==1)
	  	{
   			return true;
   		}
   		return false;
    }
    
	/**
     * Internal function to add a PU('interests') activity into DB
     * 
     * @param string $user ID
     * 
     * @return boolean
     * 
     * @access public
     */
    public function newProfilUpdate($user = '')
    {
    	// need valid user
    	if (!isId($user))
    	{
    		return false;
    	}
    	
    	// vars
    	$update = json_encode(array('profil'=>true));
    	
    	// is there already an activity?
    	$res = Db::read('SELECT id_act, related_act FROM `activity` WHERE id_usr_act = "' . $user . '" AND type_act = "PU" AND date_act LIKE "' . date('Y-m-d') . ' %" LIMIT 1');    				
    	
    	if(sizeof($res)==1)
    	{
    		// $related is incoded in JSON format
    		$oldu				= json_decode($res[0]['related_act'],true);
    		$oldu['interest'] 	= true;
    		$update				= json_encode($oldu);
			
    		// then overwrite with new information
    		$res2 = Db::write('UPDATE `activity` SET related_act=\'' . $update . '\', date_act="' . date('Y-m-d H:i:s') . '" WHERE id_act = "' . $res[0]['id_act'] . '"');
    	}
    	// first profile update of the day, then add a new activity
   		else
   		{
   			$query = 'INSERT INTO `activity` (`id_act`,`id_usr_act`,`date_act`,`type_act`,`related_act`) 
   											VALUES ("' . md5("act".time().$user) . '","' . $user . '","' . date('Y-m-d H:i:s') . '","PU","' . $update . '")';
   			$res2 = Db::write($query);
   		}
   		
   		return $res2;
    }
  
}



?>