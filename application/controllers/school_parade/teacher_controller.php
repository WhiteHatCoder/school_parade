<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once('./application/libraries/REST_Controller.php');

/**
 *
 * Validation is missing
 */
class Teacher_controller extends REST_Controller {

	public function __construct()
	{
	    parent::__construct();

	    $this->load->model('teacher_model');
	}
    /*******************************************************
    *
    *           General user Functionalities
    *
    ********************************************************/
	public function get_all()
	{
		$this->response($this->class_report_model->get_all());
	}
    
    public function get_teacher_data()
    {
        echo($this->response($this->teacher_model->get_teacher_data()));
        $this->response($this->teacher_model->get_teacher_data());
    }
    
    public function get_all_class_taught()
    {
        echo($this->response($this->teacher_model->get_all_class_taught()));
        $this->response($this->teacher_model->get_all_class_taught());
    }
    
    public function get_class_result($class_id,$exam_id)
    {
        $this->response($this->teacher_model->get_class_result($class_id,$exam_id));
    }
    /**
    *Return the content of the set id
    ***/

    /*******************************************************
    *
    *           Admin Functionalities
    *
    ********************************************************/
    
/*    public function edit_get($id = NULL)
	{
		if ( ! $id)
		{
			$this->response(array('status' => false, 'error_message' => 'No ID was provided.'), 400);
		}

		$this->response($this->article_model->get($id));
	}

	
	public function remove_delete($id = NULL)
	{
		if ($this->article_model->delete($id))
		{
			$this->response(array('status' => true, 'message' => sprintf('Project #%d has been deleted.', $id)), 200);
		}
		else
		{
			$this->response(array('status' => false, 'error_message' => 'This project does not exist!'), 404);
		}
	}
*/
}

/* End of file projects.php */
/* Location: ./application/controllers/api/projects.php */