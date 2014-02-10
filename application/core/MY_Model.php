<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class MY_Model extends CI_Model{
	protected static $table_name;
	
	public function __construct()
    {
        parent::__construct();	
		$this->load->database();
    }
	
	//-------------------------------------------------------------------------------
	/****
	*Run sql that return results
	*@acess static
	*@param
	*@return record as object 
	****/
	protected function fetch_data($sql="",$return_array=FALSE){	
			$query=$this->db->query($sql);		
		if(!$return_array){	
			if($query->num_rows() > 0){					
				return $query->result();
			}else{
				return NULL;
			}
		}else{
			if($query->num_rows() > 0){				
			  return $query->result_array();			  
			}else{
				return NULL;
			}
		}
	}
	
	
	//-------------------------------------------------------------------------------
	/****
	*Escape Values
	*@acess
	*@param associative array of data 
	*@return escaped data that was passed
	****/
	protected function insert_data($data,$table=''){	
		$data=$this->escape_value($data);		
		if($table != ''){
		 	$tbl_name=$table;	
		}else{
			$tbl_name=static::$table_name;
		}
		if(is_array($data)){
				$sql = "INSERT INTO ".$tbl_name." (";
				$sql .= join(", ", array_keys($data));
				$sql .= ") VALUES ('";
				$sql .= join("', '",array_values($data));
				$sql .= "')";
								
			if($this->db->query($sql)) {
				//$this->user_id= $db_connection->insert_id();//Get the Auto increment Id inserted										
				//return true;				
			  } else {
				//return false;
			  }
		}
		
	}
	//-------------------------------------------------------------------------------
	/****
	*Escape Values
	*@acess protected
	*@param array or a single value 
	*@return boolean 
	****/
	protected function update_data($update_data,$id_name='',$id_value='',$table=''){
		//$update_data=$this->escape_value($update_data);		
		if($table != ''){
		 	$tbl_name=$table;	
		}else{			
			$tbl_name=static::$table_name;
		}
	   
		$sql="UPDATE ".$tbl_name." SET ";				
		foreach($update_data as $key => $value){
			$sql.=$key." = '".$value;
		}
		$sql.="' WHERE ".$id_name." = ".$id_value;
	
		if($this->db->query($sql)) {
				//$this->user_id= $db_connection->insert_id();//Get the Auto increment Id inserted										
				return true;				
		  } else {
				return false;
		 }
		
		
		
		
	}
	
	
	//-------------------------------------------------------------------------------
	/****
	*Escape Values
	*@acess
	*@param array or a signle value 
	*@return escaped data that was passed
	****/
	protected function escape_value($values){
		if(is_array($values)){			
			foreach($values as $key => &$value){
				$this->db->escape($value);	
				
			}
			return $values;
		}else{
		
			return $this->db->escape($values);
			
		}
	}
    
    //---------------------------------------------------------------------
    /*Remove duplicates from a resultset as a result of one to many relationship*/
/*    protected function remove_data_duplicate($resultset){
        $final_data=array();
        $current
        foreach($resultset as $result){
            
            
            
        }
        
        
        
        
    }*/
        
	
}