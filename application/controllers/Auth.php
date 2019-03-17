<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

    const DIR_VIEW = 'auth';

	public function index()
	{
        $params = [];
        $this->load->view(self::DIR_VIEW.'/index', $params);
    }
    
    /**
     * 1. check active user
     * 2. check the password
     * 3. check, is the tenant active ?
     */
    public function new_session()
    {
	    $username = $this->input->post('username');
        $password = $this->input->post('password');
        $this->load->model('User_model', 'user');

        if (!isset($username) || !isset($password)) {
            $this->session->set_flashdata('danger','Silahkan isi username dan password');
            return redirect('auth');            
        }

        $user = $this->user->find_by_uniqueid($username);
        if ($user == NULL) {
            $this->session->set_flashdata('danger','Username tidak ditemukan atau password tidak cocok');
            return redirect('auth');            
        }

        $hashed_pass = trim(preg_replace('/\s+/', ' ', $user->password));
        $password = trim(preg_replace('/\s+/', ' ', $password));
        $password_verified = password_verify($password, $hashed_pass);

        if ($password_verified) {
            $this->session->set_userdata('uid', $user->uid);
            $this->session->set_userdata('fullname', $user->fullname);
            $this->session->set_userdata('role', $user->role);
            $this->session->set_userdata('id_kegiatan', $user->id_kegiatan);
            return redirect('home');                   
        } else {
            $this->session->set_flashdata('danger','Username tidak ditemukan atau password tidak cocok');
            return redirect('auth'); 
        }

    }

    public function end_session()
    {
        $this->session->unset_userdata('uid');
        $this->session->unset_userdata('fullname');
        $this->session->unset_userdata('role');
        $this->session->unset_userdata('id_kegiatan');
        redirect('auth');        
    }


}
