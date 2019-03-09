<?php

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

use Restserver\Libraries\REST_Controller;

class User extends REST_Controller 
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('User_model', 'user');
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

        $users = $this->user->find_all($term['value'], $first, $count, $order, $direction);
        $total_rows = $this->user->count_all($term['value']);

        $current_uid = $this->session->userdata('uid');
        $response = array(
            'draw' => isset($draw) ? $draw : 1,
            'recordsTotal' => $total_rows,
            'recordsFiltered' =>  $total_rows,            
            'data' => $users
        );
        
        $this->response($response, REST_Controller::HTTP_OK);
    }

    public function index_delete()
    {
        $uid = $this->delete('uid');
        if (!isset($uid)) {
            $this->response(['message' => 'Cannot find customer with uid '. $uid], 
                REST_Controller::HTTP_NOT_FOUND);            
        }

        $user = $this->user->find_by_uniqueid($uid);
        if (is_null($user)) {
            $this->response(['message' => 'Cannot find user with uid '. $uid], 
                REST_Controller::HTTP_NOT_FOUND);            
        }

        $curr_uid = $this->session->userdata('uid');
        if ($curr_uid == $user->uid) {
            $this->response(['message' => 'Forbidden..!'], 
                REST_Controller::HTTP_BAD_REQUEST);
        }

        if ($user->role == 'administrator') {
            $this->response(['message' => 'Forbidden..!'], 
                REST_Controller::HTTP_BAD_REQUEST);
        }

        $data = [
            'status' => 'inactive',
            'modification_time' => date('Y-m-d H:i:s')
        ];
        $this->user->modify(['uid' => $user->uid], $data);
        $this->response(REST_Controller::HTTP_OK);
    }

}