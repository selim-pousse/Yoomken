<ol id='resume-filter' class="services-tag right" style="margin-top:5px">
	<? foreach ($filters as $static): 
		$idalias = strstr($static->alias,'=',true);
		$alias = substr(strstr($static->alias,'='),1);
		
		if ($idalias=='SRV' || $static->access ==-1 || $static->access ==-3) { $alias .= '_'.$typeFilter;};
		if ($static->access == -2) $alias = 'GN_'.$alias;
		
		if ($static->active):?>
			<li id='filter-tag-<?=$idalias?>' class="type-offer left"><a><?=gettext($alias.(isme()?'':'_OTH'))?></a></li>
	<? endif; endforeach;?>
</ol>