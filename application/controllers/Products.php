<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Augmenta Demo Application Implementation.
 *
 * @category 	Controllers.
 * @author  	Furqan Ahmed <ahmedfurqan88@gmail.com>
 * @license     http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * */

class Products extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		//loading product model.
		$this->load->model('products_model');
		
		//loading url helper class
		$this->load->helper('url_helper');
	}
	
	/**
	 * @author	furqan
	 * @param	null
	 * @return	null
	 */
	
	public function index()
	{
		//fetch all products from the database
		$data['products'] = $this->products_model->get_products();
		$data['title'] = 'Products';
		
		$this->load->view('templates/header', $data);
		$this->load->view('products/index', $data);
		$this->load->view('templates/footer');
	}
	
	/**
	 * @author	furqan
	 * @param	String $id
	 * @return	null
	 */
	public function view($id = NULL)
	{
		$data['products_item'] = $this->products_model->get_products($id);
	
		if (empty($data['products_item']))
		{
			show_404();
		}
	
		$data['title'] = $data['products_item']['name'];
	
		$this->load->view('templates/header', $data);
		$this->load->view('products/view', $data);
		$this->load->view('templates/footer');
	}
	
	/**
	 * @author	furqan
	 * @param	Null
	 * @return	Null
	 */
	
	public function create()
	{
		$this->load->helper('form');
		$this->load->library('form_validation');
	
		$data['title'] = 'Create a new product item';
	
		$this->form_validation->set_rules('name', 'Name', 'required');
		$this->form_validation->set_rules('description', 'Description', 'required');
	
		if ($this->form_validation->run() === FALSE)
		{
			$this->load->view('templates/header', $data);
			$this->load->view('products/create');
			$this->load->view('templates/footer');
	
		}
		else
		{
			$this->products_model->set_products();
			$this->load->view('templates/header', $data);
			$this->load->view('products/success');
			$this->load->view('templates/footer');
		}
	}
	
	/**
	 * @author	furqan
	 * @param	Null
	 * @return	Null
	 */
	public function edit()
	{
		$id = $this->uri->segment(3);
	
		if (empty($id))
		{
			show_404();
		}
	
		$this->load->helper('form');
		$this->load->library('form_validation');
	
		$data['title'] = 'Edit a product item';
		$data['products_item'] = $this->products_model->get_products_by_id($id);
	
		$this->form_validation->set_rules('name', 'Name', 'required');
		$this->form_validation->set_rules('description', 'Description', 'required');
	
		if ($this->form_validation->run() === FALSE)
		{
			$this->load->view('templates/header', $data);
			$this->load->view('products/edit', $data);
			$this->load->view('templates/footer');
	
		}
		else
		{
			$this->products_model->set_products($id);
			//$this->load->view('news/success');
			redirect( base_url() . 'index.php/products');
		}
	}
	
	/**
	 * @author	furqan
	 * @param	Null
	 * @return	Null
	 */
	public function delete()
	{
		$id = $this->uri->segment(3);
	
		if (empty($id))
		{
			show_404();
		}
	
		$products_item = $this->products_model->get_products_by_id($id);
	
		$this->products_model->delete_products($id);
		redirect( base_url() . 'index.php/products');
	}
	
}