<?php
/**
 * Manifest
 * 
 * system/lib/db.class.php
 * 
 * The database class, used in singleton mode
 * 
 * @copyright: Yoomken Li
 * 
 */
class db
{
	/**
	 * StdClass $this reference
	 * 
	 * @access private 
	 */
	private static $singleton = null;	

	/**
	 * Database connection link
	 * 
	 * @access private
	 */
	private static $link = null;
	
	/**
	 * Database user
	 * 
	 * @access private
	 */
	private static $user = null;
	
	/**
	 * Database password
	 * 
	 * @access private
	 */
	private static $pass = null;
	
	/**
	 * Database to use
	 * 
	 * @access private
	 */
	private static $base = null;
	
	/**
	 * Database host
	 * 
	 * @access private
	 */
	private static $host = null;
	
	/**
	 * Reference to the registry object
	 * 
	 * @access unknown_type
	 */
	private static $registry = null;
	
	/**
	 * Allows easy switching between mysql and pdo modes, for
	 * 	backwards compatiiblity's sake
	 * 
	 * @access private
	 */
	private static $pdo  = false;
	
	/**
	 * Shows or hides SQL errors (for production environments)
	 * 	This setting is got from the database config file
	 * 
	 * @access private
	 */
	private static $errors = false;
	
	/**
	 * Register to keep the last executed query
	 * 
	 * @access private
	 */
	private static $lastQuery = '';
	
	/**
	 * Constructor, initializes the connection and sets the singleton pattern
	 * 
	 * @return void
	 */
	private function __construct()
	{
		Db::$registry = Registry::getInstance();
		
		$conf 		= Db::$registry->get('db');

		Db::$user	= $conf['user'];
		Db::$pass	= $conf['pass'];
		Db::$base	= $conf['base'];
		Db::$host	= $conf['host'];
		Db::$errors = $conf['errors'];
				
		if (Db::$pdo)
		{
			Db::connectPdo();
		}
		else
		{
			Db::connectMysql();
		}
	}
	
	/**
	 * The main destructor closes database connection
	 * 	and initializes the DB singleton object
	 * 
	 * @return void
	 */
	public function __destruct() 
	{
  		if (!is_null(Db::$link)) 
  		{
  			if (!Db::$pdo)
  			{
      			mysqli_close(Db::$link) ;
  			}
  			
      		Db::$link      = null ;
      		Db::$singleton = null ;
    	}
  	}
  	
	/**
	 *
	 * Like the constructor, we make __clone private
	 * so nobody can clone the instance
	 *
	 * @access private
	 *
	 */
	private function __clone(){}	
	
	/**
	 * Creates a Mysql connection with old driver (faster)
	 * 
	 * @return void
	 */
	private function connectMysql()
	{
		if (! ($tmp = mysqli_connect(Db::$host,Db::$user, Db::$pass,Db::$base)))
		{
    		throw new Exception('Connexion impossible : ' . mysql_error()) ;
		}
  		Db::$link = &$tmp ;
		
		mysqli_query(Db::$link,'SET NAMES utf8');
		
  		/* Vérification de la connexion */
		if (mysqli_connect_errno()) {
		    printf("Échec de la connexion : %s\n", mysqli_connect_error());
		    exit();
		}
	}
	
	/**
	 * Creates a PDO Mysql connection (slower but more powerful)
	 * 
	 * @return void
	 * 
	 * @access private
	 */
	private function connectPdo()
	{
		Db::$link = new PDO('mysql:host=' . Db::$host . ';dbname=' . Db::$base, Db::$user, Db::$pass,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
	    Db::$link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}
	
	/**
	 * Sets PDO mode
	 * 
	 * @return void
	 * 
	 * @access public
	 */
	public static function setPdo()
	{
		Db::$pdo 	= true;
		
		Db::connectPdo();
	}
	
	/**
	 * Unsets PDO mode
	 * 
	 * @return void
	 * 
	 * @access public
	 */
	public static function unsetPdo()
	{
		Db::$pdo  	= false;
		
		Db::connectMysql();
	}

	/**
	 *
	 * Return DB instance or create intitial connection
	 * 
	 * @return Db object
	 *
	 * @access public
	 */
	public static function getInstance() 
	{
		if (!Db::$singleton) 
		{
	   		Db::$singleton = new Db();
		}
		
		return Db::$singleton;
	}
		
	/**
	 * Select Queries, return an array with all results
	 * 
	 * @param string $req
	 * 
	 * @return mixed array with results
	 * 
	 * @access public
	 */
    public static function read($req = '')
    {
    	// vars
    	$start 	= microtime(true);
    	$return = null;
    	
    	//is there already a singleton?
    	if(is_null(Db::$singleton))
    	{  
    		Db::$singleton=new Db();
    	}
    	
    	Db::$lastQuery = $req;
    	
     	if (Db::$pdo)
    	{
    		$out 	= Db::$link->query($req);
    		$return = $out->fetchAll();
    		
    		if (! Db::$registry->get('production_server'))
    		{
    			if (Db::$registry->get('enable_profiler'))
	    		{
		    		Profiler::query($req, $start);	
		    	}	
		    	else
			    {
			    	throw new Exception('Invalid query: ' . $req);
			    }	
    		}	    	
    		
    		return $out->fetchAll();
    	}
    	else
    	{	
    		$rows	= mysqli_query(Db::$link,$req);	
			echo mysql_error();
    		if (!$rows && Db::$errors)
    		{
    			if (!Db::$registry->get('production_server'))
    			{
    				if (Db::$registry->get('enable_profiler'))
			    	{
			    		Profiler::sqlError($req);	
			    	}
			    	else
			    	{
			    		echo ' Invalid query: ' . $req;
			    		throw new Exception('Error mysql : '.mysql_error());
			    	}			    	
    			}
    		}
			if ($rows)
				if ($rows && mysqli_num_rows($rows))
				{
					while( $row = mysqli_fetch_assoc($rows) )
			   		{
			   			//foreach ($row as &$val) $val = utf8_encode($val);
			        	$out[] = $row;
			    	}
					 /* Libération du jeu de résultats */
	    			mysqli_free_result($rows);
	    		}
				else $out = array();
			else $out = $rows; 
    		
    		if (!Db::$registry->get('production_server'))
    		{
    			if (Db::$registry->get('enable_profiler'))
    		   	{
	    			Profiler::query($req, $start);	
	    		}
    		}
	    	return $out;	    	
    	}
	}
 
    /**
     * Insert and Update queries, return numbers of affected rows
     * 
     * @param string $req
     * 
     * @return int number of affected rows
     * 
     * @access public 
     */
    public static function write($req = '')
    {
    	$start 	= microtime(true);
    	
    	if(is_null(Db::$singleton))
    	{
    		Db::$singleton=new Db();
    	}
    	
    	Db::$lastQuery = $req;
    	
    	if (Db::$pdo)
    	{
    		$out = Db::$link->query($req);
    		
    		if (!Db::$registry->get('production_server'))
    		{
    			if (Db::$registry->get('enable_profiler'))
	    		{
		    		Profiler::query($req, $start);	
		    	}	
		    	else
			    {
			    	throw new Exception('Invalid query: ' . $req);
			    }	
    		}	
    		
    		return $out->rowCount();
    	}
    	else
    	{
    		$rows = mysqli_query(Db::$link,$req);
    		if (!$rows && Db::$errors) 
    		{
    			if (!Db::$registry->get('production_server'))
    			{
    				if (Db::$registry->get('enable_profiler'))
			    	{
			    		Profiler::sqlError($req);	
			    	}
			    	else
			    	{
			    		throw new Exception('Error mysql : '.mysql_error().' Invalid query: ' . $req);
			    	}			    	
    			}
    		}
    		
    		if (!Db::$registry->get('production_server'))
    		{
    			if (Db::$registry->get('enable_profiler'))
    		   	{
	    			Profiler::query($req, $start);	
	    		}
    		}
    	
    		return mysqli_affected_rows(Db::$link);
    	}
    }	
    
    /**
     * Gets the last inserted ID
     * 
     * @return mixed the last inserted ID
     */
    public static function lastInsertId()
    {
    	if (Db::$pdo)
    	{
    		return Db::$link->lastInsertId();
    	}
    	else
    	{
    		return Db::$link->insert_id; 	
    	}
    }
    
    /**
     * Returns the last executed query
     * 
     * @return string
     * 
     * @access public
     */
    public static function lastQuery()
    {
    	return Db::$lastQuery;
    }
   
} /*** end of class ***/

?>
