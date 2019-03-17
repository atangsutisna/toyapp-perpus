<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profile extends Admin_Controller {
    const DIR_VIEW = 'profile';

    public function __construct()
    {
        parent::__construct();
        $this->load->model('User_model', 'user');
    }

	public function index()
	{
        $id = $this->session->userdata('id');
        $user = $this->user->find_one($id);
        if ($user == NULL) {
            show_404();
        }

        $params = [
            'user' => $user
        ];
        $this->load->template(self::DIR_VIEW.'/index', $params);
    }

}