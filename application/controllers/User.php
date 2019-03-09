<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends Admin_Controller {

    //TODO: move to config
    const DIR_VIEW = 'user';

    private $permissions = [
        'root' => ['create', 'read', 'update', 'delete'],
        'admin' => ['create', 'read', 'update', 'delete'],
        'staff' => []
    ];
    
    public function __construct()
    {
        parent::__construct();
        $this->load->model('User_model', 'user');
    }

	public function index()
	{
        $params = array(
            'js_resources' => ['assets/js/user/index.js']
        );
        $this->load->template(self::DIR_VIEW.'/index', $params);
    }
    
    public function view($id)
    {
        $user = $this->user->find_one($id);
        if ($user == NULL) {
            show_404();
        }
        
        $params = array(
            'user' => $user,
            'js_resources' => ['assets/js/user/reg_form.js']
        );
        $this->load->template(self::DIR_VIEW. '/view', $params);
    }

    public function do_update()
    {
        $id = $this->input->post('id');
        if (!isset($id)) {
            $this->session->set_flashdata('danger', 'Please select one user for processing update data');
            redirect('user');
        }
        
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');

        $this->form_validation->set_rules('fullname', 'Fullname', 'required');
        $this->form_validation->set_rules('email', 'Email', 'required');
        $this->form_validation->set_rules('mobile_phone', 'Mobile Phone', 'required');

        
        if ($this->form_validation->run() == FALSE) {
            $user = $this->user->find_one($id);
            $params = array(
                'user' => $user,
            );
            $this->load->template('user/view', $params);
        } else {
            $user = [
                'nama' => $this->input->post('fullname'),
                'email' => $this->input->post('email'),
                'mobile_phone' => $this->input->post('mobile_phone'),
                'level' => $this->input->post('level'),
            ];
            $this->user->modify(['id' => $id], $user);
            $this->session->set_flashdata('info', '1 data user telah diperbaharui');
            redirect('user/view/'.$id);
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
            $user = $this->user->find_by_id($id);
            $params = array(
                'user' => $user,
            );
            $this->load->template('user/view', $params);
        } else {
            $raw_password = $this->input->post('password');
            $hashed_password = password_hash($raw_password, PASSWORD_DEFAULT);
            $user = [
                'password' => $hashed_password
            ];
            $this->user->modify(['id' => $id], $user);
            $this->session->set_flashdata('info', '1 user data has been updated');
            redirect('user/view/id='.$id);
        }   
    }

    public function reg_form()
    {
        $params = array(
            'js_resources' => ['assets/js/user/reg_form.js']
        );
        $this->load->template(self::DIR_VIEW. '/_form', $params);
    }

    public function do_reg()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');

        $this->form_validation->set_rules('username', 'Userame', 'required|callback_check_username');
        $this->form_validation->set_rules('fullname', 'Fullname', 'required');
        $this->form_validation->set_rules('email', 'Email', 'required|callback_check_email');
        $this->form_validation->set_rules('mobile_phone', 'Mobile Phone', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required');
        $this->form_validation->set_rules('retype_password', 'Retype password', 'required|matches[password]');                

        if ($this->form_validation->run() == FALSE) {
            $this->reg_form();
        } else {
            $raw_password = $this->input->post('password');
            $hashed_password = password_hash($raw_password, PASSWORD_DEFAULT);
            $tenant_id = $this->input->post('tenant_id');
            if (!isset($tenant_id)) {
                $tenant_id = $this->session->userdata('tenant_id');
            }
            $user = [
                'id' => uniqid(),
                'username' => $this->input->post('username'),
                'password' => $hashed_password,
                'nama' => $this->input->post('fullname'),
                'email' => $this->input->post('email'),
                'mobile_phone' => $this->input->post('mobile_phone'),
                'level' => $this->input->post('level'),
            ];

            $this->user->insert($user);            
            $this->session->set_flashdata('info', '1 user telah berhasil ditambahkan');
            redirect('user');
        }
    }

    public function check_username($username)
    {
        $this->load->model('User_model', 'user');
        $user = $this->user->find_by_username($username);
        if ($user != NULL) {
            $this->form_validation->set_message('check_username', 'Username already exist');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    public function check_email($email)
    {
        $this->load->model('User_model', 'user');
        $user = $this->user->find_by_email($email);
        if ($user != NULL) {
            $this->form_validation->set_message('check_email', 'Email already exist');
            return FALSE;
        } else {
            return TRUE;
        }
    }


}
