<?php

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

use Restserver\Libraries\REST_Controller;

class Transaction extends REST_Controller 
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Transaction_model', 'transaction');
    }

    public function index_get()
    {
        $draw = $this->input->get('draw');
        $term = $this->input->get('search');
        $first = $this->input->get('start');
        $count = $this->input->get('length');
        $columns = $this->input->get('columns');
        $order_idx = $this->input->get('order')[0]['column'];
        $order = $columns[$order_idx]['data'];
        $direction = $this->input->get('order')[0]['dir'];

        $members = $this->transaction->find_all($term['value'], $first, $count, $order, $direction);
        $total_rows = $this->transaction->count_all($term['value']);

        $response = array(
            'draw' => isset($draw) ? $draw : 1,
            'recordsTotal' => $total_rows,
            'recordsFiltered' =>  $total_rows,            
            'data' => $members
        );
        
        $this->response($response, REST_Controller::HTTP_OK);
    }

}