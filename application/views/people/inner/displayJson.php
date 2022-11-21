
<?


						 
$resData = array();
foreach($friends as $usr) :
	
	$name = $usr->name;
	if (isset($term))
	{
		if (!preg_match('/'.$term.'/i',$name)) {
			$name = $usr->url;
		}
	}

	$newusr = new Adapter();
	$newusr->name = $name;
	$newusr->id = $usr->url;
	$newusr->type = 'contact';
	$newusr->avatar = getUserPic($usr->id,$usr->id_img,24,$usr->email);
	
	$resData[]=$newusr;
endforeach;

 echo json_encode($resData);
?>