<?php

class Admin_Controller extends CI_Controller {
    
    public function __construct()
    {
        parent::__construct();
        /** 
        $uid = $this->session->userdata('uid');
        $fullname = $this->session->userdata('fullname');
        $role = $this->session->userdata('role');
        $id_kegiatan = $this->session->userdata('id_kegiatan');
        if (!isset($uid) && !isset($fullname) && !isset($role) && !isset($id_kegiatan)) {
            $this->session->set_flashdata('warn', 'Silahkan login terlebih dahulu');
            return redirect('auth');             
        }
        **/
    }

}