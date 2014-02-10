<?php

class Pages extends CI_Controller {

	public function view($page = 'home')
	{ 
	
			
		if ( ! file_exists('application/views/pages/'.$page.'.php'))
		{
			// Whoops, we don't have a page for that!
			show_404();
		}
		
		//Initialize the common associate array		
		$data['title'] = ucfirst($page); // Capitalize the first letter
		$data['path'] = ucfirst($page);
		$this->load->view('templates/header');
		$this->load->view('pages/'.$page);
		$this->load->view('templates/footer');		
		

	}
	
}
