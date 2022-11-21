<?php
/**
 * Manifest
 * 
 * application/application/appModel.php
 * 
 * This file defines the application's parent class model
 * 
 * @copyright: Yoomken Li
 * 
 */
Class appModel Extends baseModel 
{
	/**
	 * Database object
	 * 
	 * @access protected
	 * 
	 */
	protected $db = null;
	
	protected $fields = null;
	
	/*
	 * prefix model
	 */
	protected $model = 'app';
	
	protected $view = '';
	// fields suffix  for table or view
	protected $sfx = '';
	protected $sfx2 = '';
	protected $pfx_MT = '';
	protected $filter_type = '...';
	
	protected $filters = null;
	
	protected $sql_relatedPerson = '';
	protected $sql_mycollaborators = '';
	protected $sql_myservices = '';	
	protected $sql_countries = '';
	protected $sql_nearby = '';
	
	// condition ajoutée dans chaque fin d'union
	protected $whereSub = ' 1 ';
	
	/* code sql chargé sur demande */
	protected $ondemand = array();
	
	/* 
	 * champ aproximate, precise si la recherche doit précise ou flou
	 * 0 => descative la recherche avec les SOUNDEX
	 * 1 => active la recherche avec les SOUNDEX	
	 */
	protected $aproximate = ' 0 '; 
	
	protected $nb = 0;
	
	protected $sorting = '';
	
	/**
	 * Table name for this model
	 * 
	 * @access protected
	 * 
	 */
	protected $table = '';
	
	/**
	 * Limit for list queries on this table
	 * 
	 * @access protected
	 * 
	 */
	protected $limit = '';
	
	/**
	 * The params to get when accepting arrays for getAll method
	 * 
	 * @access protected
	 */
	protected $allowed = array(	
								'journal'=>'', 'type'=>'','flux'=>'','sorting'=>'newest','beg'=>0,'limit'=>0,'date_up'=>'','date_down'=>''
								);
	
	/**
	 * Keeps a reference of an Input object which allows variables POST and GET filtering
	 * It is not initialized but kept for further reference. Some models need escape() function, 
	 * 	thus, it is better to only get the instance one instead of on each call to escape()
	 * It has to be initialized manually from each method that requires it
	 * 
	 * @access protected
	 */
	protected $input = null;
	
	/**
	 * Loads a database instance
	 * 
	 * @return void
	 * 
	 */
	public function __construct($session = null)
	{
		parent::__construct();
		
		
		// !! pour eviter les lookup lors de la création de session
		if (is_object($session)) {
			$this->session = $session; 
		}
		else {
			$this->session = Session::getInstance();
		}
		
		$this->db = db::getInstance();
		
		if (!$this->table)
		{
			$this->table = str_replace('Model','',get_class($this));
		}
	}
	
	/**
   	 * Filters the input for getAll and other methods depending on AJAX calls
   	 * 
   	 * @param mixed 	array of $params
   	 * @param int		$params['beg']
   	 * @param string	$params['sorting']
   	 * @param string 	$params['type']
   	 * @param int		$params['limit']
   	 * @param string	$params['search']
   	 * @param string 	$params['context']
   	 * 
   	 * @return mixed array of filtered params
   	 * 
   	 */
   	protected function filterSearchParams($params = array())
   	{
   		// return array
   		$return = array();
   		
   		// allowed params
   		$allowed = $this->allowed;
   		
   		foreach ($allowed as $a=>$v)
   		{
   			if (isset($params[$a]))
   			{
   				// force integer values
   				if (is_int($v))
   				{
   					$params[$a] = intval($params[$a]);
   				}
   				$return[] = $params[$a];
   			}
   			else
   			{
   				$return[] = $v;		
   			}
   		}
   		
   		return $return;   		
   		
   	}
   	
   	public function getFilters(&$activities)
   	{
   		$sfx2 = $this->sfx2;
   		if ($this->session->isLogged())
   		{
	   		$acts = array();
	   		foreach ( $activities as $act)
	   		{
	   			if(isId($act->id))
				{
					$acts[] 	= $act->id ;
					$adrFilters[$act->id]	= $act;	// be careful when $act is array not object, must be an adress assignment not a copie
				}
	   		}
	   		//_debug($adrFilters);
	
			if (count($acts)==0) return $activities;
			
			$query = 'SELECT id_filsma, alias_filsma,style_filsma,type_filsma, id_'.$sfx2.'_fil'.$sfx2.' AS id_act_filsma
	   								FROM filter_smart 
	   								INNER JOIN filter_'.$sfx2.' ON ( id_filsma = id_filsma_fil'.$sfx2.' 
	   								      AND id_'.$sfx2.'_fil'.$sfx2.' IN ("'.join ('","',$acts).'") )
	   							 WHERE id_user_filsma="'.$this->session->getUserVar('id').'" AND type_filsma = "'.$this->filter_type.'"';
	   		$resultFilters= Db::read($query);
	   		//Return result
	   		if(count($resultFilters)>0)
	   		{  			
	   			foreach($resultFilters as $filter)
	   			{
	   				$filter = new FilterAdapter($filter);
	   				if (!isset($adrFilters[$filter->id_act]->filters)) $adrFilters[$filter->id_act]->set('filters',array());
	   				$adrFilters[$filter->id_act]->filters[] = $filter;
	   			}
	   		}
   		}
   	}

	public function getLiked(&$adrActs,&$actWhere,$type = 'ACT')
	{
		$counts_pop1 	= Db::read('SELECT id_meta_lik, COUNT(DISTINCT id_usr_lik) AS count_pop_lik 
										FROM `like` 
										WHERE type_lik = "L" 
											AND id_meta_lik IN(' . $actWhere . ') 
											AND meta_lik = "'.$type.'"
										GROUP BY id_meta_lik;');
		
		if ($this->session->me())
		{							
			$counts_isLiker 	= Db::read('SELECT id_meta_lik, COUNT(DISTINCT id_usr_lik) AS isLiker_lik 
										FROM `like` ta
										WHERE type_lik = "L" 
											AND id_meta_lik IN(' . $actWhere . ') 
											AND id_usr_lik = "'.$this->session->me()->id.'"
											AND meta_lik = "'.$type.'"
										GROUP BY id_meta_lik;');
		}
		// pop 1
		foreach ($counts_pop1 as $c=>$cmt)
		{
			$cmt = new LikeAdapter($cmt);
			$adrActs[$cmt->id_meta]->set('count_like',$cmt->count_pop);		 
		}		
		
		
		if ($this->session->me())
		{
			foreach ($counts_isLiker as $c=>$cmt)
			{
				$cmt = new LikeAdapter($cmt);
				$adrActs[$cmt->id_meta]->set('isLiked',$cmt->isLiker);		 
			}
			
		}
	}
   	
   	public function getTags(&$activities,$type)
   	{
   		$sfx2 = $this->sfx2;
   		if (empty($type)) $type = '1';
		else $type = ' type_tag = "'.$type.'"';
   		$acts = array();
   		foreach ( $activities as $act)
   		{
   			if(isId($act->id))
			{
				$acts[] 	= $act->id ;
				$adrTags[$act->id]	= $act;	// be careful when $act is array not object, must be an adress assignment not a copie
			}
   		}
   		//_debug($adrTags);

		if (count($acts)==0) return $activities;
		
		$query = 'SELECT id_tag, title_tag,type_tag, id_'.$sfx2.'_tag'.$sfx2.' AS id_act
   								FROM tag 
   								INNER JOIN tag_'.$sfx2.' ON id_tag = id_tag_tag'.$sfx2.' 
   								WHERE '.$type.' AND lang_tag = "'.me()->lang.'"  
   										AND id_'.$sfx2.'_tag'.$sfx2.' IN ("'.join ('","',$acts).'")
   							 ';
			//WHERE '.$type.' AND (type_tag <> "service" OR (type_tag = "service" AND lang_tag = "'.me()->lang.'") )        AND id_'.$sfx2.'_tag'.$sfx2.' IN ("'.join ('","',$acts).'")
   		$resultTags= Db::read($query);
	
   		//Return result
   		if(count($resultTags)>0)
   		{  			
   			foreach($resultTags as $tag)
   			{
   				$tag = new TagAdapter($tag);
   				$var_tags = $tag->type;
   				if (!isset($adrTags[$tag->id_act]->tags)) {
   					$adrTags[$tag->id_act]->set('tags',array());
					$adrTags[$tag->id_act]->set('idtags',array());
   					$adrTags[$tag->id_act]->set('tagset',array());
   				}
   				$adrTags[$tag->id_act]->tags[$tag->id] = $tag->title;
				$adrTags[$tag->id_act]->idtags[$tag->id] = $tag->id;
   				$adrTags[$tag->id_act]->tagset[$tag->id] = $tag->title.'!#!'.$tag->id.'!#!'.$tag->title;
   				
   				if (!isset($adrTags[$tag->id_act]->$var_tags)) {
	   					$adrTags[$tag->id_act]->set($var_tags,array());
	   			} 
				// check if the service exists in provider or asker before pushing
   				if (!in_array($tag->title, $adrTags[$tag->id_act]->$var_tags, true)) {
   					 //array_push($adrTags[$tag->id_act]->$var_tags,$tag->title);
					 $tmpvar = & $adrTags[$tag->id_act]->$var_tags;
					 $tmpvar[$tag->id] = $tag->title;
				}
   			}
   		}
			
   	}
   	
	public function which_tag($id,$_str, $type,$sfx2 = null)
	{
		if (empty($sfx2)) $sfx2 = $this->sfx2;
		if (empty($type)) $type = '1';
		else $type = ' type_tag = "'.$type.'"';
	
		$sql = 'SELECT t.* from tag_'.$sfx2.' as tt 
								INNER JOIN tag as t ON (t.id_tag=id_tag_tag'.$sfx2.') 
								WHERE '.$type.' AND ( LOWER(title_tag) LIKE(\'%'.$_str.'%\') OR ('.$this->aproximate.' AND SOUNDEX(title_tag) = SOUNDEX("'.$_str.'")) )
									  AND id_'.$sfx2.'_tag'.$sfx2.' = "'.$id.'"  
								LIMIT 1';
		//echo $sql;
		$res=Db::read($sql);
		return new TagAdapter(count($res)?$res[0]:$res);
	}
	
	//filtrer par tag
	public function _6_t(&$query,$filter,$idsmart = null,$sfx = null,$sfx2 = null)
	{
		if ($sfx==null) $sfx = $this->sfx; 
		if ($sfx2==null) $sfx2 = $this->sfx2; 
		$pfx = $this->pfx_MT;
		$terms = $filter->values;
		$op = $filter->op;
		$glues = $filter->glues;
		$attach = $filter->attach;
		$_me_ = ' 1 ';
		$me = $this->session->who();
   		$me = ($me)? $me:$this->session->me();
		
		// gestion du cas particulier du filtre général "my services"
		if (isset($terms[$key = array_search('MYS', $terms)])) {
			$term = $terms[$key];
			if ($term == 'MYS' && count($me->idservice) && $idsmart==md5('SRV'.me()->id)) { // seul mes services
				$this->setSql_myServices();
				$this->ondemand['sql_myservices'] = 'sql_myservices';
				unset($terms[$key]);
   			}
		}
			
   		if(sizeof($terms))
   		{
   			$query .= 	' INNER JOIN (
		   							SELECT id_'.$sfx2.'_tag'.$sfx2.',title_tag 
		   							FROM tag T
		   							INNER JOIN tag_'.$sfx2.' ON (id_tag_tag'.$sfx2.'=id_tag AND lang_tag ="'.me()->lang.'") WHERE ';
   			$i = 0;
			foreach ($terms as $term)
			{	 	
				if ($attach == 'OR')
	   			{
	   				if (empty($term)) $query .= ' 0 ';		   				
	   				if (isId($term))
	   				{
	   					$query .= ' OR id_tag="'.$term.'" ' ;
	   				}
	   				else 
	   				{
	   					$query .= ' OR ( title_tag '.$op.' ("%'.$term.'%") OR ('.$this->aproximate.' AND SOUNDEX(title_tag) = SOUNDEX("'.$term.'")) ) ';
	   				}
		   			$query = (string) substr($query,0,-3);
		   			
	   			}
	   			else // attach == AND
	   			{
	   				$i++;  
   					if (!empty($term))
   					{
   						$query 	.=	'  '.(isId($term)?' id_tag '.$op.' "'.$term.'"' 
   										:' (  ('.$this->aproximate.' AND SOUNDEX(title_tag) = SOUNDEX("'.$term.'")) OR title_tag LIKE("%'.$term.'%")) ');
   					}
	   			}
	   		}
			$query .=	' ) tg'.$this->nb.' 
						ON ( 
							tg'.$this->nb.'.id_'.$sfx2.'_tag'.$sfx2.'= '.$pfx.'.id_'.$sfx.' 
							AND '.$_me_.' 
							)';;
   		}
 	}
 	
 	// filtrer par personne
	public function _6_p(&$query,$filter,$idsmart = null)
	{
		$terms = $filter->values;
		$op = $filter->op;
		$glues = $filter->glues;
		$attach = $filter->attach;
		$_me_ = '';
   		if(sizeof($terms))
   		{  	
   			$people = $names = array();
   			$me = $this->session->who();
   			$me = ($me)? $me:$this->session->me();
   			$this->model('people');		   				
   			foreach($terms as $usr) 
   			{
   				
				/*if ($usr == '>ME' && $idsmart==md5('SS'.me()->id) ) $_me_ .= ' AND u_.status_usrusr IS NOT NULL AND _u.status_usrusr <> 1 ';
   				else if ($usr == 'ME>' && $idsmart==md5('FF'.me()->id))  $_me_ .= ' AND u_.status_usrusr IS NOT NULL AND u_.status_usrusr <> 1 ';
				else if ($usr == 'ME>>' && $idsmart==md5('CC'.me()->id)) {
					$this->setSql_myCollaborators(); // get my old collaborator
					$this->ondemand['sql_mycollaborators'] = 'sql_mycollaborators';
				}*/
				
				
				if ($usr == 'LIS' && $idsmart==md5('LIS'.me()->id))  $_me_ .= ' AND U.status_usr IN (2,3) '; // seul les profils qui sont à l'écoute
				else if ($usr == 'PRO' && $idsmart==md5('PRO'.me()->id))  {
					if ($this->model == 'contents')
						$_me_ .= ' AND (A.flux_vac = "SV" OR A.flux_vac IS NULL) '; // seul les providers
					else
						$_me_ .= ' AND U.profil_usr IN ("B","P") '; // seul les providers
				}
				else if ($usr == 'ASK' && $idsmart==md5('ASK'.me()->id))  {
					if ($this->model == 'contents')
						$_me_ .= ' AND (A.flux_vac = "JB" OR A.flux_vac IS NULL) '; // seul les askers
					else 
						$_me_ .= ' AND U.profil_usr IN ("B","C") '; // seul les askers
				}
				else if ($usr == 'MYS' && count($me->idservice) && $idsmart==md5('SRV'.me()->id))  // seul mes services
				{
						$this->setSql_myServices();
						$this->ondemand['sql_myservices'] = 'sql_myservices';
				}
				/*else if ($usr == 'ME' && $idsmart==md5('PP'.me()->id)) 	{$_me_ .= ' AND (A.id_usr_vac = "'.$me->id.'") ';}// seul mes contenus
				else if ($usr == 'ME') 	$people[] = $me->id;
   				else if ($usr == '>ME') $people = array_merge($people,$this->people->getFollowings($me));
   				else if ($usr == 'ME>') $people = array_merge($people,$this->people->getFollowers($me));*/
   				else if (isId($usr)) 	$people[] = $usr;
   				else {
   					$names[] = $usr;
   				}   			
   			}
			$reluser = '';
			if ($this->model == 'contents') $reluser = ',RU.id_usr';
			$query .=  'INNER JOIN `user` AS U'.$this->nb.' ON ( U'.$this->nb.".id_usr IN (U.id_usr $reluser)"; 
			
   			$people = array_unique($people);
   			if (count($people))
   			{
   				$query .= ' AND U'.$this->nb.'.id_usr '.$op.' '.$glues[0].$glues[2]. join( $glues[3].$glues[4].$glues[2],$people) .$glues[3].$glues[1];
   			}
   			else if (count($names))
   			{
   				//$query .= ' INNER JOIN `user` AS U'.$this->nb.' ON ( ';			   				
	   			foreach($names as $kw) 
	   			{
	   				if ($op == 'IN') $op = 'LIKE';
	   				else $op = 'NOT LIKE';
	   				
	   				if (empty($kw)) $query .= ' 1 ';
	   				else {
	   						$query	.=	' AND 
	   							  (
	   								( 
	   									U'.$this->nb.'.fullname_usr  '.$op.' "%'.$kw.'%" OR ('.$this->aproximate.' AND SOUNDEX(U'.$this->nb.'.fullname_usr) = SOUNDEX("'.$kw.'"))
										AND U'.$this->nb.'.privacy_usr=\'P\'
									 ) 
	   								OR 
	   								( 
	   									U'.$this->nb.'.url_usr '.$op.' "%'.$kw.'%" OR ('.$this->aproximate.' AND SOUNDEX(U'.$this->nb.'.url_usr) = SOUNDEX("'.$kw.'"))
									)
	   							  ) ' ;
	   					}
	   			}
   			}
			$query .= ' AND 1 ) ';
			if (!empty($_me_)) $this->whereSub .= $_me_;
			//if (!empty($_relation_)) $this->whereSub .= ' AND ('.$_relation_.' 0 )';
   		}
	}
	
	// filtrer par géolocalisation
	public function _6_l(&$query,$filter,$idsmart)
	{
		$terms = $filter->values;
		$me = $this->session->me();
		//_debug($terms);die();
		//if (isId(key($terms))
		//if (!is_object($terms[0])) $terms = array($terms); // hack lorsque le filtrage provient de la boite de recherche
		$op = $filter->op;
		$glues = $filter->glues;
		$fields = $filter->fields;
		
		// TODO : miles et maxDistance à remonter à la page Option
		$miles=false;
		$maxDistance= 30;
		$unit = ($miles?'/1.852':'/1');
		
		$distance = ''; //15
		
		// gestion du cas particulier du filtre à proximité
		if (isset($terms[md5('>ME<')])) {
			$term = $terms[md5('>ME<')];
			if ($term->address == '>ME<') {
	   			/*$spt = $me->nearby->mode=='A'?(isset($me->nearby->spot)?$me->nearby->spot:$me->spot):$me->spot;
				if (isId($spt->id)) {
					$term = $spt;
				}*/
				$this->fields .= ', distance_'.$this->sfx.' '; 
				$this->setSql_nearby();
				$this->ondemand['sql_nearby'] = 'sql_nearby';
				// forcer juste ici l'odre d'arrivée des resultats du plus prés au plus loin
				$this->sorting = 'nearest';
				unset($terms[md5('>ME<')]);
   			}
		}

   		if(sizeof($terms))
   		{  
   			$query .= ' INNER JOIN (SELECT spt.* {#distance} FROM spot as spt) 
   							as S'.$this->nb.' ON ';	
   					   				
   			$query	.=	'( (';
   			$inby = 0;
   			foreach ($terms as $term)
   			{
   				if (!empty($term->lat))
   				{
   					$inby++;
   					//recherche précise
   					$query .= '( ';
   					$distance .= ',ACOS(
						COS(lat_spt*pi()/180)*COS('.$term->lat.'*pi()/180)*COS(long_spt*pi()/180)*COS('.$term->long.'*pi()/180)
						+
						COS(lat_spt*pi()/180)*SIN(long_spt*pi()/180)*COS('.$term->lat.'*pi()/180)*SIN('.$term->long.'*pi()/180)
						+
						SIN(lat_spt*pi()/180)*SIN('.$term->lat.'*pi()/180)
						)*6371'.$unit.' as distance'.$inby;
   					
					// seul le filtre nearby n'a pas besoin du maxDistance
   					//if ($term->nearby) $query .= ' 1 ';
					//else 
						$query .= 'S'.$this->nb.'.distance'.$inby.' <='.$maxDistance;
					
					$this->fieldsort .=  ((empty($this->fieldsort)?'':',').'S'.$this->nb.'.distance'.$inby);
					
   					
   					$query .= ') OR ';
   				}
   				else 
   				{
   					// recherche flou
   					// TODO by SEP: remplacer  par "$term->address" LIKE concat('%',city_spt,'%') and city_spt<>''
   					$query .= ' (
   									S'.$this->nb.'.country_spt  LIKE "%'.$term->address.'%" OR 
   									S'.$this->nb.'.city_spt  LIKE "%'.$term->address.'%" OR 
   									('.$this->aproximate.' AND
		   								SOUNDEX(S'.$this->nb.'.country_spt) '.$glues[0].' SOUNDEX("'.$term->address.'")
		   								OR 
		   								SOUNDEX(S'.$this->nb.'.city_spt) '.$glues[0].' SOUNDEX("'.$term->address.'")
	   								)
			   					) OR ';
   				}
   			}
   			$query = (string) substr($query,0,-3);
   			$query = preg_replace('/\{\#distance\}/',($inby?$distance:''),$query);
   			
   			if ($this->model =='contents')
   				$query	.= ') AND S'.$this->nb.'.id_spt =  IFNULL(IF(A.id_spt_vac = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",U.id_spt_usr,A.id_spt_vac ),U.id_spt_usr ) )';
   			else 
   				$query	.= ') AND S'.$this->nb.'.id_spt =  U.id_spt_usr )';
   		};
									
	}
	
	// rajouter les associations manuelles faites par l'user
	public function _6_more(array $idsmarts)
	{
		$pfx = $this->pfx_MT;
		$query = '';
		if (isset($idsmarts[0]) /*&& isId($idsmarts[0])*/)
		{

   			//$query .= $this->_6_init('more');
   			$query = ' INNER JOIN `filter_'.$this->sfx2.'` as F ON  ( 	F.id_filsma_fil'.$this->sfx2.' IN  ("'.join ('","',$idsmarts).'") 
   															AND F.id_'.$this->sfx2.'_fil'.$this->sfx2.' = '.$pfx.'.id_'.$this->sfx.' ) ';
		}
		return $query;
	}
   	
	public function getWhereType($journal, $types = null){ return ' 1 ';}
	public function getWhereFlux($type){ return ' 1 ';}
	public function getOrder(){ return ' 1 ';}
	
	
	public function setSql_relatedPerson()
	{
		$this->sql_relatedPerson  = ' LEFT JOIN `user` AS RU ON A.related_'.$this->sfx.' = RU.id_usr ';
	}
	
	public function setSql_myCollaborators()
	{
		$who = $this->session->who();
		if(!$who) return;
		$this->sql_mycollaborators  =
					'INNER JOIN grp_usr gp_u ON ( gp_u.id_usr_grpusr ="'.$who->id.'" )
   					 INNER JOIN grp_usr gp_g ON (gp_g.id_usr_grpusr = U.id_usr 
   												AND gp_u.id_grpusr = gp_g.id_grpusr 
   												AND U.id_usr <> "'.$who->id.'")
   					 INNER JOIN histo_collaborator hc ON (gp_g.id_grpusr = id_grpusr_coll)';
	}
	
	public function setSql_nearby()
	{
		$who = $this->session->who();
		$me = $this->session->me();
		if(!$who) return;
		
		$miles = false;
		$maxDistance = $me->nearby->radius;
		$unit = ($miles?'1.852':'1');
		
		if( ($me->id == $who->id) && $maxDistance != 'XX') 
			$whereDistance = ' S.distance_'.$this->sfx.' <='.$maxDistance;
		else 
			$whereDistance = '1';
		
		$latLong = getPositionUser($who);
		$this->sql_nearby = 
						' INNER JOIN (SELECT spt.* ,ACOS(
						COS(lat_spt*pi()/180)*COS('.$latLong[0].'*pi()/180)*COS(long_spt*pi()/180)*COS('.$latLong[1].'*pi()/180)
						+
						COS(lat_spt*pi()/180)*SIN(long_spt*pi()/180)*COS('.$latLong[0].'*pi()/180)*SIN('.$latLong[1].'*pi()/180)
						+
						SIN(lat_spt*pi()/180)*SIN('.$latLong[0].'*pi()/180)
						) *6371/'.$unit.' as distance_'.$this->sfx.' FROM spot as spt) 
	    				as S ON ( S.id_spt =  U.id_spt_usr AND '.$whereDistance.') ';
	}
	
	public function setSql_countries()
	{
		if (isset($this->filters[md5('PP'.who()->id)]))
			return; // descative le filtre  des pays d'origine
			
		// ici c'est seulement les contenus de mon pays qui m'interessent => donc c bien $me et non $who qu'il faut
		$state = strtoupper(getCountryUser($this->session->me(),true));
		//if ($state=='TN') $case = ' = "TN" ';
		//else $case = ' <> "TN" ';
		if ($state) $case = ' = "'.$state.'" ';
		
		if ($this->model == 'contents')
			$cond = ' pays.id_spt =  IFNULL(IF(A.id_spt_vac = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",U.id_spt_usr,A.id_spt_vac ),U.id_spt_usr ) ';
		else 
			$cond = ' pays.id_spt =  U.id_spt_usr ';
		
		$this->sql_countries = ' INNER JOIN spot pays 
									ON ( '. $cond. ' AND pays.state_spt '.$case.' ) ';
	}
	
	
	/**
	* Generic Function  for searching
    * if ($model = activities) => Get all Contents by filtering 
    * if ($model = people) => Get all people by filtering 	 	
    * @return array() of Activity Object
    */
	public function processSearch(array $filters,$params,$by='',$join = true)
	{
		//print_r($filters);die();
		$this->filters = $filters;
		$me = $this->session->me();
		// get all the parameters we need for this method
   		list($journal,$type,$flux,$this->sorting, $beg,$limit,$date_up,$date_down) = self::filterSearchParams($params);
		
		$mdl = (in_array($this->model,array('contents','questions')))? 'activities':$this->model;
		
   		//init the limit
   		//$limit = Registry::getInstance()->get('nbresults');
   		
   		// filter by type
   		$where 	= ' AND '.$this->getWhereType($journal,$type);
   		// filter by profil
   		$where .= ' AND '.$this->getWhereFlux($flux);
		
 		
   			   		
   		$first = true;
   		$idsmarts = $query = array();
   		$headsql = 'SELECT SQL_CALC_FOUND_ROWS * '.($mdl=='activities'?', MAX(date_'.$this->sfx.') as redate_'.$this->sfx:'').' FROM ( ';
   		$withUnion = '';
		$_relation_ = null;
   		foreach ($filters as $idsma => &$filter)
   		{
   			if (isset($filter['subfilters']['#1']->values[0]))
			{
	   			if ($filter['subfilters']['#1']->values[0] == '>ME' && $idsma==md5('SS'.me()->id) ) {$_relation_ .= ' _me_usr <> "0" OR ';continue;}
				else if ($filter['subfilters']['#1']->values[0] == 'ME>' && $idsma==md5('FF'.me()->id))  {$_relation_ .= ' me__usr <> "0" OR ';continue;}
				else if ($filter['subfilters']['#1']->values[0] == 'ME>>' && $idsma==md5('CC'.me()->id)) {$_relation_ .= ' (_me_usr = "A" AND me__usr = "A" ) OR '; continue;}
				//else if ($filter['subfilters']['#1']->values[0] == 'ME' && $idsma==md5('PP'.me()->id)) 	{$_relation_ .= ' (id_usr_vac = "'.$me->id.'") OR ';continue;} // seul mes contenus
			}
			 
   			$subfilters = $filter['subfilters'];
   			$sequence = $filter['sequence'];
   			$this->filteringCore($subfilters,$sequence,$idsma,'',$query,$withUnion,$first);
	   		$idsmarts[] = $idsma;
			
   		}
		// filter all the relation if type == FF (the stream relation)
		if ($type == 'FF')  $where .= ' AND ( _me_usr <> "0" OR me__usr <> "0" )';
		// filter by the relations if the user have selected
		if (!empty($_relation_)) $where .= ' AND ('.$_relation_.' 0 )';
		
   		/* if (join=true) => INTERSECTION des FILTRES */
   		if ($join)
   		{
	   		$withJoin = '';
	   		$first = true;
	   		foreach ($query as $unionSql)
	   		{
	   			$withJoin .= $first? 
	   							'' : ' 
	   							UNION ';
	   			$firstInner = true;
	   			foreach ($unionSql as  $innerSql)
	   			{
	   				if ($firstInner) $withJoin .= ' '. $this->_6_init(($by=='' or $by=='a')?$innerSql['reason']:$by);
	   				$withJoin .= $innerSql['inner'];
	   				$first = $firstInner = false;
	   			}
				$withJoin .= ' WHERE '.$this->whereSub; 
	   		}
	   		$mainquery = $withJoin;
   		}
   		/* SINON CAS OU J'AIMERAI UNIFIER L'ENSEMBLE DES FILTERS AU LIEU DE LES COMBINER */
   		else $mainQuery = $withUnion;
   		
   		
   		 // ajout des activités associées manuellement par l'utilisateur au filtre
   		$more =''; 
   		if (isset($idsmarts[0]) /*&& isId($idsmarts[0])*/)
   		{
   			$more = $this->_6_more($idsmarts);
   			if (in_array('SEARCH',$idsmarts)){
   				$this->filteringCore($filters['SEARCH']['subfilters'],$filters['SEARCH']['sequence'],'SEARCH',$more,$noneed,$addresult,$first);	
   				$more = $addresult;	
   			}
   			else{
   				$addresult = $this->_6_init('none').' '.$more;
   				$more = ($first? '' : ' 
   								UNION ')
   						.' ' .$addresult;
   			}
   			$more .= ' WHERE '.$this->whereSub;
   			//die($addresult);
   		}
   		else if ($first) {
   			$more = $this->_6_init('none');
			$more .= ' WHERE '.$this->whereSub;
		}
   		  
		
		// choose the order type
   		$order 		= $this->getOrder();
		
		// status_usr >=2 : tous les profils activés, qui soit à l'écoute ou non du marché	
 		$endquery = ' ) AS totRes WHERE status_usr >=2 '.$where;		
		$endquery .= ' GROUP BY id_'.$this->sfx.'
					ORDER BY ' . $order . '
					LIMIT ' . $beg . ',' . $limit;		

		$sql 		= $headsql.$mainquery.$more.$endquery;
		
		// filter les contenus qui sont hors de mes pays d'intérêts
		$this->setSql_countries();
		$this->ondemand['sql_countries'] = 'sql_countries'; 
		
		$this->ondemand['\w*'] = ''; // raccourci pour supprimer tous les variables qui restent
		// remplacer les variables par leur valeurs
		foreach ($this->ondemand as $key => $val)
		{
			$sql = preg_replace('#\{\#'.$key.'\}#is',$val?$this->$val:'',$sql);
		}
		
		// =====>>>> and RUN! //
		//die($sql);
		$activities = Db::read($sql);	
		$resnb 		= Db::read("SELECT FOUND_ROWS()");
		
					
		// finally, return
		foreach ($activities as &$value)
		{
			if ($this->model=='people'){
				$value = new UserAdapter($value);
			}
			else 
				$value = new ActivityAdapter($value);
		}
		
		$this->{'get'.$mdl.'Spots'}($activities);
		$this->{'get'.$mdl.'Tags'}($activities);
		$this->{'get'.$mdl.'Filters'}($activities);
		$this->{'get'.$mdl.'Count'}($activities);
		$this->{'get'.$mdl.'InfoRelated'}($activities);
		
		return array($resnb[0]['FOUND_ROWS()'],$activities);
	}
	
	public function filteringCore($subfilters,$sequence,$idsma,$moreResult,&$query,&$withUnion,&$first) 
   	{
   		$members = explode('OR',$sequence);
   		foreach ( $members as $i => $member )
   		{
   			$withUnion .= $first? '' : ' UNION ';
   			$elements = explode('AND',$member);
   			if (count($elements)) 
   			{
   				$reason = $subfilters[$elements[0]]->c; // besoin de connaitre de quel critère vient le resultat
   				$withUnion .= $this->_6_init($reason).' '.$moreResult;
	   			foreach ($elements as $elem) 
	   			{
	   				$this->nb = $this->nb + 1;
	   				$filt = $subfilters[$elem];
	   				$query[$i][$this->nb]['reason'] = $filt->c;
	   				$function = '_6_'.$filt->c;
	   				$this->$function($query[$i][$this->nb]['inner'],$filt,$idsma);	
	   				$withUnion .= $query[$i][$this->nb]['inner']; // utile si je veux prendre en compte le mode UNION des ensembles de filtres
	   				$first  = false; ;	
					//_debug($query[$i][$this->nb]['inner']);
					//echo '<br/>';
	   			}
   			}
   		}
   	}
	
	public function prepareFilter_search($_search,&$params)
	{
		//$_search = preg_replace("#(\w{2}\s*),\s*#i", "\\1-a,", $_search);
		//$_search = preg_replace("#(\w{2}\s*)$#i", "\\1-a", $_search);
		//die($_search);
		if ($_search) 
		{
			//if ( preg_match('#a#i',$by) ) $by = 'potc';
			//$this->model('filter');
				
			// then call for data
			$this->model('filter');
			$defs 		=  	$this->filter->getAllDef();
			$operators	= 	$this->filter->getAllOperator();
		
			$filters = $contexts = $terms = array();
			$sequence = '';
			$searchs = explode('/' ,trim($_search));
			//print_r($_search);die();
			
			foreach ($searchs as $term) 
			{
				list($terms[],$contexts[]) = explode('-' , trim($term));;
			} 
			
			$key = cleanDuplicate($contexts,'a',$terms);
			if ($key>=0 && count($contexts)== 1) $contexts[$key] = 'pltc';
			else {unset($contexts[$key]);unset($terms[$key]);}
			
			$id = 0;
			//print_r($contexts);die();
			foreach ($contexts as $key => $by) {
				for ($i=0,$I=strlen($by); $i<$I; $i++,$id++)
				{
					$char = substr($by,$i,1);
					
					if (preg_match('#[pltsc]#',$char))
					{
						$op = $defs[$char][0]->op;
						/** cas particulier des adresses**/
						if ($char=='l') // if localisation
						{
							$locations = explode ('!+!',trim($terms[$key]));
							$this->model('spots');
							$values = $this->spots->add($locations);
						}
						else $values = array($terms[$key]);
							
						$filt = new Adapter(array(
										'id' 		=> '#'.$id,
										'c' 		=> $char,
										'op'		=> $operators[$op]->value,
										'glues'		=> explode('-',$operators[$op]->glues),
										'values'	=> $values,
										'attach'	=> 'AND'
									));
						$filters['SEARCH']['subfilters'][$filt->id] = $filt;
						$sequence .= $filt->id.'OR';
					}
					/*else if ($char == 'd') 
					{
						$params['date_up'] 		= 	$values[0];
						$params['date_down']	= 	$values[1];
					}*/
					if ($i>5) break;	
				}
				if (!empty($sequence)) $sequence = (string) substr($sequence,0,-2);
				$sequence .= 'AND';
			}
			if (!empty($sequence)) $sequence = (string) substr($sequence,0,-3);
			$filters['SEARCH']['sequence'] = $sequence;
			//_debug($sequence);
			return $filters;		
		}
		return false;
	}
	
	public function prepareFilter_smart($smarts,&$params)
	{
		$filters = array();		
		// then call for data
		
		if (count($smarts))
		{
			//$res = Db::read('SELECT * FROM filter_smart WHERE id_filsma="'.$idsma.'"');
			/*$res = Db::read('SELECT * FROM filter_smart WHERE id_filsma IN ("'.join ('","',explode(',',$ids_sma)).'")');
			if (count($res)==0) return $filters;*/
			foreach ($smarts as $filsma)
			{
				$sequence = $filsma->sequence;
				$idsma = $filsma->id;
				$this->model('filter');
				$filts 	=  $this->filter->getAll($idsma,$this->filter_type);
				$operators	= 	$this->filter->getAllOperator();
				if (count($filts))
				{
					foreach ($filts as $filt)
					{
						if (preg_match('#[pltc]#',$filt->id_fildef))
						{
							/** cas particulier des adresses**/
							if ($filt->id_fildef=='l') // if localisation
							{
								$locations = explode ('!+!',trim($filt->value));
								$this->model('spots');
								$values = $this->spots->add($locations);
							}
							else $values = explode('!+!' , trim($filt->value));
						
							$filt = new Adapter(array(
													'id' 		=> '#'.$filt->id,
													'c' 		=> $filt->id_fildef,
													'op'		=> $operators[$filt->id_op]->value,
													'glues'		=> explode('-',$operators[$filt->id_op]->glues),
													'values'	=> $values,
													'attach'	=> $filt->attach
	 												));
							$filters[$idsma]['subfilters'][$filt->id] = $filt;
						}
						else 
						{
							list($params['date_up'],$params['date_down']) = explode('!+!' , trim($filt->value));
						}
						
					}
					$filters[$idsma]['sequence'] = $sequence;
				}
				//else continue; 
			}
		}
		return $filters;
	}
	
	private function checkPeople($people,$fromwho)
	{
		$me = $this->session->getUserVar('id');
		
		$keys = array_keys($people,'ME>');
   		$once = false; 
   		foreach ($keys as $key) 
   		{
	   		if ($fromwho != $me && !$once)
	   		{
	   			$this->model('people');
	   			unset($people[$key]);
	   			$people = array_merge($people,$this->people->getFollowings($fromwho));
	   		}
	   		else if ($once) unset($people[$key]);
	   		$once = true;
   		}
   		
   		
		$keys = array_keys($people,'>ME');
   		$once = false; 
   		foreach ($keys as $key) 
   		{
	   		if (!$once)
	   		{
	   			$this->model('people');
	   			unset($people[$key]);
	   			$people = array_merge($people,$this->people->getFollowers($fromwho));
	   		}
	   		else if ($once) unset($people[$key]);
	   		$once = true;
   		}
   		
		$keys = array_keys($people,'ME');
   		$once = false; 
   		foreach ($keys as $key) 
   		{
	   		if ($fromwho != $me && !$once)
	   		{
	   			$people[$key] = $fromwho;
	   		}
	   		else if ($once) unset($people[$key]);
	   		$once = true;
   		}
   		
		/*$keys = array_keys($people,'MYGRP');
   		$once = false; 
   		foreach ($keys as $key) 
   		{
	   		if ($fromwho != $me && !$once)
	   		{
	   			$this->model('groups');
	   			unset($people[$key]);
	   			$people = array_merge( $people,$this->groups->getGroups($fromwho) );
	   		}
	   		else if ($once) unset($people[$key]);
	   		$once = true;
   		}*/
   		
   		return array_unique($people);
	}

}
?>
