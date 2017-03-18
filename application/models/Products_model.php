<?php
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );

/**
 * Augmenta Demo Application Implementation.
 *
 * @category 	models.
 * @author  	Furqan Ahmed <ahmedfurqan88@gmail.com>
 * @license     http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * */
class Products_model extends CI_Model {
	public function __construct() {
		$this->load->database ();
	}
	
	/**
	 * @author	furqan
	 * @param	String $id
	 * @return	Array
	 */
	public function get_products($id = FALSE) {
		if ($id === FALSE) {
			$query = $this->db->get ( 'products' );
			return $query->result_array ();
		}
		
		$query = $this->db->get_where ( 'products', array (
				'id' => $id 
		) );
		return $query->row_array ();
	}
	
	/**
	 * @author	furqan
	 * @param	String $id
	 * @return	Array
	 */
	public function get_products_by_id($id = 0)
	{
		if ($id === 0)
		{
			$query = $this->db->get('products');
			return $query->result_array();
		}
	
		$query = $this->db->get_where('products', array('id' => $id));
		return $query->row_array();
	}
	
	/**
	 * @author	furqan
	 * @param	String $id
	 * @return	Boolean
	 */
	public function set_products($id = 0)
	{
		$this->load->helper('url');
	
		
		$data = array(
				'name' => $this->input->post('name'),
				'description' => $this->input->post('description')
		);
	
		if ($id == 0) {
			return $this->db->insert('products', $data);
		} else {
			$this->db->where('id', $id);
			return $this->db->update('products', $data);
		}
	}
	
	/**
	 * @author	furqan
	 * @param	String $id
	 * @return	Boolean
	 */
	public function delete_products($id)
	{
		$this->db->where('id', $id);
		return $this->db->delete('products');
	}
	
}