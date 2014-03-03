<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Teacher_model extends MY_Model
{
  ///This method should be available to all users_model
   public function sign_in($sign_data)
   {
       //Escape this data
       $sign_data=$this->escape_value($sign_data);
       $returnData=array();
       $sql="SELECT object_type,object_id,count(*) AS counter FROM sys_user WHERE username='{$sign_data['username']}'";
       $sql.=" AND password='{$sign_data['password']}'"; 
       $temp_data=$this->fetch_data($sql); 
      
       foreach($temp_data as $temp){
           $returnData['count']=$temp->counter;
           $returnData['object']=$temp->object_type;
           $returnData['id']=$temp->object_id;
       }
       
       if((int)$returnData['count']===1)
       {  
           if($returnData['object']=='Teacher')
           {
           
               //An end date within the teachers_role table signifies the teacher is current in that school//             
               $sql="SELECT vw_tch_roles.* FROM  vw_tch_roles INNER JOIN {$returnData['object']} ON teacher.id= vw_tch_roles.id";
               $sql.=" WHERE end_date  IS NULL AND vw_tch_roles.id={$returnData['id']}";
                 $tch_data=$this->fetch_data($sql,TRUE);
                 
                $tch_data = $this->create_json_array($tch_data);
              
               if($tch_data)
               {
                   //Return true plus this data
                   $tch_data=array('success'=>'teacher','data'=>$tch_data);
                  
                   return $tch_data;
               }
               else
               {
                   //User exists
                   //But not currently a teacher 
                   return $tch_data=array('success'=>"teacher",'data'=>'undefined');
                   return $tch_data;
               }
               
               
           }
           else if($returnData['object']=='School')
           {
               //School Sign in
           }
           else if($returnData['object']=='Student')
           {
               //A student sign in
           }
           else
           {
             //Non existent object
           }
       }
       else
       {
           //User no found
           
           return "no found";
       }
      
   }
 
    public function get_all()
    {
         
		 $sql="SELECT * FROM vw_exam_result";
		 $results=$this->fetch_data($sql);
		 return $results; 
		                  
    }
    
    public function get_class_list($class_id,$exam_id=2,$date_taken='')
    {
        //Nb this should be used only when creating a new result set for a class
        //Improve in future to cater for all cases
        $sql="SELECT pr_std_id,student_name FROM vw_student_hist INNER JOIN tch_cls_hist ON vw_student_hist.class=tch_cls_hist.class_id ";
        $sql.=" WHERE class_id='{$class_id}'";
        $std_list=$this->fetch_data($sql);
        
        //Before return prepare result table for updates
        /*if($std_list)
        {
            
            $exam['exam_id']=$exam_id;
            $exam['date_taken']=$date_taken;
            
            $this->insert_data($exam,'exam_taken');
            
            foreach($std_list as $std)
            {
                $result['exam_id']=$exam_id;
                 $result['student_id']=$std->pr_std_id;
                $this->insert_data($result,'result');
            }
            
        }*/
        
        return $std_list;
    }
    
    
    
    public function test_excel(){
        $sql="SELECT Mathematics,English FROM vw_exam_result";
		 $results=$this->fetch_data($sql);
		 return $results; 
    }
    
     
    public function get_teacher_data()
    {
         $sql="SELECT * FROM vw_tch_roles WHERE sch_id >0 ";
         $tch_data=$this->fetch_data($sql,TRUE);
         $tch_data = $this->create_json_aray($tch_data);
         return $tch_data;        
    }
    
    public function get_all_class_taught()
    {
        $sql="SELECT DISTINCT exam_id, CONCAT(exam_title,' ', term) AS exam,date_taken,vw_exam_result.class_id";
        $sql.=" ,CONCAT(class_form,' ',stream,',',vw_exam_result.year) AS class FROM vw_exam_result ";
        $sql.=" INNER JOIN tch_cls_hist ON tch_cls_hist.class_id=vw_exam_result.class_id INNER JOIN teacher_history ON";
        $sql.=" teacher_history.id=tch_cls_hist.tch_hst_id WHERE teacher_history.end_date IS NULL ";      
        $tch_data=$this->fetch_data($sql);
        return $tch_data;  
    }
    
    
    public function get_class_result($class_id,$exam_id)
    {
           //Improve this to restrict access to only authorised subject teachers//
           $sql="SELECT student_id,student_name,Mat,Eng,Kis,Che,Bio,Phy,Geo,Hag,Cre,Bst,";
           $sql.=" Fre,Hsc FROM vw_exam_result WHERE class_id='{$class_id}' and exam_id='{$exam_id}'";
		   $class_result=$this->fetch_data($sql);
           return $class_result;   
    }
    
  
    
    public function save_new_class_result($std_result,$exam_id,$student_id){
        //This creates Dynamic sql for std result but not good enough to take more than one key value pair
       $std_result=$this->escape_value($std_result);
        //$sql_start_str="UPDATE result SET(";
        //$sql_end_str=")=() WHERE exam_id={$exam_id} AND student_id={$student_id}";
        $sql="";
        foreach($std_result as $key => $value)
        {
            $sql="UPDATE result SET ".$key."=".$value." WHERE exam_id={$exam_id} AND student_id={$student_id}";
           // $sql=$sql_start_str.$key.")=(".$value.$sql_end_str;
        }
        
        if($this->db->query($sql)) {
				//$this->user_id= $db_connection->insert_id();//Get the Auto increment Id inserted										
				return true;				
		  } else {
				return false;
		 }
		
      //$this->update_data($std_result,);    
        
    }
        
    function create_join_array($rows, $joins)
    {
    /* build associative multidimensional array with joined tables from query rows */

        foreach((array)$rows as $row)
        {
            if (!isset($out[$row['id']]))
            {
                $out[$row['id']] = $row;
              
            }
    
            foreach($joins as $name => $item)
            {
                unset($newitem);
                foreach($item as $field => $newfield){
                    unset($out[$row['id']][$field]);
                    if (!empty($row[$field]))
                        $newitem[$newfield] = $row[$field];
                }
                if (!empty($newitem))
                    $out[$row['id']][$name][$newitem[key($newitem)]] = $newitem;
            }
        }
    
        return $out;
    }



public function create_json_array($rows){
    //This function should be abstract to take any number of tables to be considered in future;
    //Teacher data counte should have a mechanism for incrementing to the next element
    $prevTchId=null;  
    $tchs=array();
    $tch_dat=array();
   
    foreach((array)$rows as $row)
    {
        $cls_sub=array();
        $sub=array();            
        if($prevTchId==$row['id'])
        {
           if($prevClsId==$row['class_id'])
           { 
               //Build a new subject array
               $sub=array('subject_id'=>$row['subject_id'],'name'=>$row['name']); 
                        
               array_push($tch_dat[0]['classes'][0]['subject'],$sub);
           }
           else
           { 
               //Build a new classes array
               $cls_sub=array('class_id'=>$row['class_id'],'class_role'=>$row['class_role']);              
               array_push($tch_dat[0]['classes'],$cls_sub);//Push new class to teacher data  
           }            
            
       }
       else
       {
           if( $prevTchId!=null)
           {
            array_push($tchs[$row['id']],$tch_dat);//Push teacher data into the main array of all teachers
               
           }
            //Build a new teacher data          
            $tch_dat=array();
             array_push($tch_dat,array('id'=>$row['id'],'teacher_name'=>$row['teacher_name'],'sch_id'=>$row['sch_id'],'role'=>$row['role'],      'start_date'=>$row['start_date'],'end_date'=>$row['end_date'],'classes'=>array(array('class_id'=>$row['class_id'],'class_role'=>$row['class_role'],'subject'=>array(array('subject_id'=>$row['subject_id'],'name'=>$row['name']))))));
           
            
       }
        $prevTchId=$row['id'];
        $prevClsId=$row['class_id'];        
    
    }
    return $tch_dat;
}
}