<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once('./application/libraries/REST_Controller.php');

/**
 * Projects API controller
 *
 * Validation is missing
 */
class Class_controller extends REST_Controller {

	public function __construct()
	{
	    parent::__construct();

	    $this->load->model('class_model');
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

}*/

/* End of file projects.php */
/* Location: ./application/controllers/api/projects.php */