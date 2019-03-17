<?php

class Admin_Controller extends CI_Controller {
    
    public function __construct()
    {
        parent::__construct();
        $id = $this->session->userdata('id');
        $name = $this->session->userdata('name');
        $level = $this->session->userdata('level');

        if (!isset($id) && !isset($name) && !isset($level)) {
            $this->session->set_flashdata('warn', 'Silahkan login terlebih dahulu');
            return redirect('auth');             
        }
    }

}