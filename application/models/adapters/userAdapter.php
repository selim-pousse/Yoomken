<?php 
/**
 * Manifest
 * 
 * application/adapters/userAdapter
 * 
 * Adapter for users
 * 
 */
class UserAdapter extends CommonAdapter
{
	/**
	 * @see commonAdapter::$suffixes 
	 * 
	 */
	var $suffixes = array('_usr','_usr_act','_usr_vac','_usr_grpusr','_usr_usrusr','_usr_tagusr','_grpusr','_tagusr','_usrusr','_usr_msg');
	
	public function __construct($array,$suffixs = false, $you = false)
	{
		parent::__construct($array,$suffixs);
		
		/*$this->reason		= isset($array['reason'])? $array['reason']:'';
		$this->num_aff		= isset($array['num_aff'])? $array['num_aff']:'';
		$this->affinity		= isset($array['affinity'])? $array['affinity']:'';
		$this->followed		= isset($array['followed'])? $array['followed']:'';
		$this->activity		= isset($array['activity'])? $array['activity']:'';*/
		
		$this->nearby = new Adapter();
		$this->nearby->activ = isset($array['activ_nby'])? $array['activ_nby']:'';
		$this->nearby->mode = isset($array['mode_nby'])? $array['mode_nby']:'';
		$this->nearby->id = isset($array['id_spt_nby'])? $array['id_spt_nby']:'';
		$this->nearby->radius = isset($array['radius_nby'])? $array['radius_nby']:'';
		
		$this->spot			= new SpotAdapter($array);
		$this->presta		= new PrestaAdapter($array);
		$this->presta->calendar = !empty($this->presta->calendar)? $this->presta->calendar:'0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000,0000000000000000';
		$this->presta->datedispo = !empty($this->presta->datedispo)? $this->presta->datedispo: date('d/m/Y',time());
		$this->custo		= new CustoAdapter($array);
		
		
		if (isset($array['id_usr_mor'])) {
			$this->option	= new MoreAdapter($array);
		}

		// adding my logic attributs
		$this->job			= ($this->profil == 'C'? $this->custo->job: $this->presta->job);
		$this->name 		= getNameObj($this).( $you && me()->id==$this->id  ? ' ('._('YOU').') ':'');
		$this->shortname 	= getNameObj($this,'min');
		$this->url 			= ucfirst(strtolower($this->url));
	}
}



?>