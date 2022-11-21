<?php 
/**
 * Manifest
 * 
 * application/adapters/tagAdapter
 * 
 * Adapter for groups
 * 
 * 
 */
class BadgeAdapter extends CommonAdapter
{
	/**
	 * @see commonAdapter::$suffixes 
	 * 
	 */
	var $suffixes = array('_bdg','_t');

	public function __construct($array)
	{
		parent::__construct($array);
		
		$this->title = ucfirst($this->title);
		
		$colors = array('PERS' => 'or', 'SKILL'=>'ma','ACTION'=>'vio');
		
		$this->img160 = '/media/img/badges/badge_'.$this->name.'160_'.$this->lang.'_'.$colors[$this->type].'.png';
		$this->img80 = '/media/img/badges/badge_'.$this->name.'160_'.$this->lang.'_'.$colors[$this->type].'.png';
		$this->imgcolor = $colors[$this->type];
	}
}
?>