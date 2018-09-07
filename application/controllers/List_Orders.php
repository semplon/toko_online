<?php

/**
 * 
 */
class List_orders extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		$this->load->model('setting_model');
	}

		public function index ()
	{
		$data = array();
		$q = $this->db->get('orders');
		$data['orders'] = $q->result_array();
		
		$data['site_title'] = $this->setting_model->getName('site_title');

		$this->load->view('back/header', $data);
		$this->load->view('back/List_orders', $data);
		$this->load->view('back/footer', $data);
	}



}


