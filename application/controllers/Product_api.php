<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Augmenta Demo Product API Implementation.
 *
 * @category 	Controllers.
 * @author  	Furqan Ahmed <ahmedfurqan88@gmail.com>
 * @license     http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * */

// loading the REST_Controller dependency from the libraries folder.
require(APPPATH.'libraries/REST_Controller.php');

use Restserver\Libraries\REST_Controller;
class Product_api extends REST_Controller {

	public function __construct()
	{
		parent::__construct();
		
		//loading products model.
		$this->load->model('products_model');
	}
	
	/**
	 * @author	furqan
	 * @param	None
	 * @return	None
	 */
	function products_get() {
		
		//get all products from the database.
		$products = array();
		$products['products'] = $this->products_model->get_products();
		
        if($products) {
            $this->response($products, 200);
        }
        else {
            $this->response(NULL, 404);
        }	
	}
}