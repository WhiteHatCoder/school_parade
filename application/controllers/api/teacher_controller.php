<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once('./application/libraries/REST_Controller.php');


class Teacher_controller extends REST_Controller {
    /**
     *
     * Validation is missing to be included in future
     */
	public function __construct()
	{
	    parent::__construct();
        $this->load->library('phpexcel');
        $this->load->library('PHPExcel/iofactory');
	    $this->load->model('teacher_model');
        
	}
    /*******************************************************
    *
    *           General user Functionalities
    *
    ********************************************************/
    public function login(){
       
        $sign_data=array();
        //Set form validation rules
        //Validate data
       
       // echo("Test data".$data->username);
       
        $sign_data['username']=$this->input->post('username');
        //Hash password since data is stored as hash
        $sign_data['password']=$this->input->post('password');
        
       $this->response($this->teacher_model->sign_in($sign_data));        
    }
    
    public function get_teacher_data()
    {
        //Get all teacher role data pertaining to current school
       $this->response($this->teacher_model->get_teacher_data());
    }
    
    
    public function get_class_list($class_id)
    {
         $this->response($this->teacher_model->get_class_list($class_id));
    }
    
    public function get_all_class_taught()
    {
       //Get all 
        //if($this->input->post('id2'))
        $this->response($this->teacher_model->get_all_class_taught());  
        
    }
    
    public function get_class_result($class_id,$exam_id)
    {
        //Should contain teachers data to prevent manipulation
         $this->response($this->teacher_model->get_class_result($class_id,$exam_id));

    }
    public function get_class_result_excel($class_id,$exam_id)
    {
        
        /*****************Make this function abstract*********************
        
        Increment Letters for columns 
        
        
        
        
        
        ***/
        
        
        
        
        //Depends on schools settings for subjects done in that school
        //Should contain teachers data to prevent manipulation           
         $objPHPExcel = new PHPExcel();
        // Set the active Excel worksheet to sheet 0
        $objPHPExcel->setActiveSheetIndex(0); 
        // Initialise the Excel row number
     /*   //Print header
        foreach($data as $key => $value)
        {
             $objPHPExcel->getActiveSheet()->SetCellValue(A++.'1',$key);  
        }
        */
        
        //Set headers here this should be abstract by use of table meta or get variable names from 
        $objPHPExcel->getActiveSheet()->SetCellValue('A1',"Student Name");  
        $objPHPExcel->getActiveSheet()->SetCellValue('B1',"Mathematics");    
        $objPHPExcel->getActiveSheet()->SetCellValue('C1', "English"); 
        $objPHPExcel->getActiveSheet()->SetCellValue('D1',"Kiswahili");    
        $objPHPExcel->getActiveSheet()->SetCellValue('E1', "Chemistry");
         $objPHPExcel->getActiveSheet()->SetCellValue('F1', "Biology"); 
        $objPHPExcel->getActiveSheet()->SetCellValue('G1',"Physics");         
        $objPHPExcel->getActiveSheet()->SetCellValue('H1', "Geography");
         $objPHPExcel->getActiveSheet()->SetCellValue('I1',"History");  
        $objPHPExcel->getActiveSheet()->SetCellValue('J1',"CRE"); 
        $objPHPExcel->getActiveSheet()->SetCellValue('K1', "Business");
        $objPHPExcel->getActiveSheet()->SetCellValue('L1', "French"); 
        $objPHPExcel->getActiveSheet()->SetCellValue('M1',"H/S");       
           
        $data=$this->teacher_model->get_class_result($class_id,$exam_id);        
        $rowCount = 2;        
        //Initialise data here      
        foreach($data as $rs)
        {
            $objPHPExcel->getActiveSheet()->SetCellValue('A'.$rowCount, $rs->student_name);           
            $objPHPExcel->getActiveSheet()->SetCellValue('B'.$rowCount, $rs->Mat); 
            $objPHPExcel->getActiveSheet()->SetCellValue('C'.$rowCount, $rs->Eng);
            $objPHPExcel->getActiveSheet()->SetCellValue('D'.$rowCount, $rs->Kis); 
            $objPHPExcel->getActiveSheet()->SetCellValue('E'.$rowCount, $rs->Che);
            $objPHPExcel->getActiveSheet()->SetCellValue('F'.$rowCount, $rs->Bio); 
            $objPHPExcel->getActiveSheet()->SetCellValue('G'.$rowCount, $rs->Phy);
//            $objPHPExcel->getActiveSheet()->SetCellValue('H'.$rowCount, $rs->Geg); 
            $objPHPExcel->getActiveSheet()->SetCellValue('I'.$rowCount, $rs->Hag);
            $objPHPExcel->getActiveSheet()->SetCellValue('J'.$rowCount, $rs->Cre); 
            $objPHPExcel->getActiveSheet()->SetCellValue('K'.$rowCount, $rs->Bst);
//            $objPHPExcel->getActiveSheet()->SetCellValue('L'.$rowCount, $rs->fre);
            $objPHPExcel->getActiveSheet()->SetCellValue('M'.$rowCount, $rs->Hsc);
            $rowCount++; 
        }
        // Instantiate a Writer to create an OfficeOpenXML Excel .xlsx file
        $objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel); 
        // Write the Excel file to filename some_excel_file.xlsx in the current directory
        //$objWriter->save('some_excel_file.xlsx'); 
        // redirect output to client browser
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="myfile.xlsx"');
        header('Cache-Control: max-age=0');              
        $objWriter = IOFactory::createWriter($objPHPExcel, 'Excel2007');
        $objWriter->save('php://output'); 
        exit();
        

    }
    
    
    
    
    
    
    
    
    function create_pdf()
    {        
        $this->load->helper('pdf_helper');
        $data=$this->teacher_model->test_excel();        
        $this->load->view('templates/pdfreport',$data);
    }

    public function submit_result()
    {
        $data=array();
        
       
        //This function handles all subjects result submissions both new and editing
        if($this->input->post('id') && $this->input->post('exam_id'))
        {
            $id=$this->input->post('id');
            $exam_id=$this->input->post('exam_id');
            if($this->input->post('Eng'))
            {
                $data['Eng']=$this->input->post('Eng');
            }
            else if($this->input->post('Kis'))
            {
                 $data['Kis']=$this->input->post('Kis');
            }
            else if($this->input->post('Mat'))
            {
                 $data['Mat']=$this->input->post('Mat');
            }
            else if($this->input->post('Bio'))
            {
                 $data['Bio']=$this->input->post('Bio');
            }
            else if($this->input->post('Phy'))
            {
                 $data['Phy']=$this->input->post('Phy');
            }
            else if($this->input->post('Che'))
            {
                 $data['Che']=$this->input->post('Che');
            }
            else if($this->input->post('Hag'))
            {
                 $data['Hag']=$this->input->post('Hag');
            }
            else if($this->input->post('Geg'))
            {
                 $data['Cre']=$this->input->post('Cre');
            }
            else if($this->input->post('Ire'))
            {
                 $data['Ire']=$this->input->post('Ire');
            }
            else if($this->input->post('Hre'))
            {
                 $data['Hre']=$this->input->post('Hre');
            }
            else if($this->input->post('Hsc'))
            {
                 $data['Hsc']=$this->input->post('Hsc');
            }
            else if($this->input->post('ard'))
            {
                 $data['ard']=$this->input->post('ard');
            }
            else if($this->input->post('arg'))
            {
                 $data['arg']=$this->input->post('arg');
            }
            else if($this->input->post('wwk'))
            {
                 $data['mwk']=$this->input->post('blg');
            }
            else if($this->input->post('pmc'))
            {
                 $data['elec']=$this->input->post('elec');
            }
            else if($this->input->post('drd'))
            {
                 $data['drd']=$this->input->post('drd');
            }
            else if($this->input->post('avt'))
            {
                 $data['avt']=$this->input->post('avt');
            }
            else if($this->input->post('cmp'))
            {
                 $data['cmp']=$this->input->post('cmp');
            }
            else if($this->input->post('fre'))
            {
                 $data['fre']=$this->input->post('fre');
            }
            else if($this->input->post('ger'))
            {
                 $data['ger']=$this->input->post('ger');
            }
            else if($this->input->post('arb'))
            {
                 $data['arb']=$this->input->post('arb');
            }
            else if($this->input->post('ksl'))
            {
                 $data['ksl']=$this->input->post('ksl');
            }
            else if($this->input->post('mus'))
            {
                 $data['mus']=$this->input->post('mus');
            }
            else if($this->input->post('Bst'))
            {
                 $data['Bst']=$this->input->post('Bst');
            }
            
            $this->response($this->teacher_model->save_new_class_result($data,$exam_id,$id));
        }    
        else
        {
          $this->response("failed");
        }
       
    }
        
    
    public function create_xsl($user_data=null,$table_header=null){
        
        $objPHPExcel = new PHPExcel();
        // Set the active Excel worksheet to sheet 0
        $objPHPExcel->setActiveSheetIndex(0); 
        // Initialise the Excel row number
        
        $data=$this->teacher_model->test_excel();
        // Iterate through each result from the SQL query in turn
        // We fetch each database result row into $row in turn
        $rowCount = 1;   
        
        //Set headers here
        
        
        //Initialise data here      
        foreach($data as $rs){
             // Set cell An to the "name" column from the database (assuming you have a column called name)
            //    where n is the Excel row number (ie cell A1 in the first row)
            $objPHPExcel->getActiveSheet()->SetCellValue('A'.$rowCount, $rs->Mathematics); 
            // Set cell Bn to the "age" column from the database (assuming you have a column called age)
            //    where n is the Excel row number (ie cell A1 in the first row)
            $objPHPExcel->getActiveSheet()->SetCellValue('B'.$rowCount, $rs->English); 
            // Increment the Excel row counter
            $rowCount++; 
        }
        // Instantiate a Writer to create an OfficeOpenXML Excel .xlsx file
        $objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel); 
        // Write the Excel file to filename some_excel_file.xlsx in the current directory
        //$objWriter->save('some_excel_file.xlsx'); 
        // redirect output to client browser
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="myfile.xlsx"');
        header('Cache-Control: max-age=0');              
        $objWriter = IOFactory::createWriter($objPHPExcel, 'Excel2007');
        $objWriter->save('php://output'); 
        exit();
        
    }
    
    public function get_all(){
        echo($this->response($this->teacher_model->get_all()));
        $this->response($this->teacher_model->get_all());
    }

}

