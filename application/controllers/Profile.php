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

    public function do_update()
    {
        $id = $this->input->post('id');
        if (!isset($id)) {
            $this->session->set_flashdata('danger', 'Missing ID, Cannot update your profile');
            redirect('user');
        }
        
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');

        $this->form_validation->set_rules('nama', 'Nama', 'required');
        $this->form_validation->set_rules('email', 'Email', 'required');
        
        if ($this->form_validation->run() == FALSE) {
            $user = $this->user->find_one($id);
            $params = array(
                'user' => $user,
            );
            $this->load->template(self::DIR_VIEW.'/index', $params);
        } else {
            $user = [
                'nama' => $this->input->post('nama'),
                'email' => $this->input->post('email'),
                'mobile_phone' => $this->input->post('mobile_phone'),
                'level' => $this->input->post('level'),
                'modification_time' => date('Y-m-d H:i:s')
            ];

            $this->user->modify(['id' => $id], $user);
            $this->session->set_flashdata('info', 'Data anda telah diperbaharui');
            redirect('profile');
        }
    }    

    public function do_update_sec()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');

        $this->form_validation->set_rules('password', 'Password', 'required');
        $this->form_validation->set_rules('retype_password', 'Retype password', 'required|matches[password]'); 
        $id = $this->input->post('id');               
        if ($this->form_validation->run() == FALSE) {
            $user = $this->user->find_one($id);
            $params = array(
                'user' => $user,
            );
            $this->load->template(self::DIR_VIEW.'/index', $params);
        } else {
            $raw_password = $this->input->post('password');
            $hashed_password = password_hash($raw_password, PASSWORD_DEFAULT);
            $user = [
                'password' => $hashed_password
            ];
            $this->user->modify(['id' => $id], $user);
            $this->session->set_flashdata('info', 'Password anda telah berhail diperbaharui');
            redirect('profile');
        }   
    }


}