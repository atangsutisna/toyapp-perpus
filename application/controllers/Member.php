<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Member extends Admin_Controller 
{
    const DIR_VIEW = 'member';

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Member_model', 'member');
    }

	public function index()
	{
        $params = array(
            'js_resources' => ['assets/js/member/index.js']
        );
        $this->load->template(self::DIR_VIEW.'/index', $params);
    }

    public function reg_form()
    {
        $params = [
            'form_action' => 'member/do_reg',
        ];
        $this->load->template(self::DIR_VIEW. '/_form', $params);
    }

    public function do_reg()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');

        $this->form_validation->set_rules('nim', 'NIM', 'required');
        $this->form_validation->set_rules('nama', 'Nama', 'required');
        $this->form_validation->set_rules('tempat_lahir', 'Tempat Lahir', 'required');
        $this->form_validation->set_rules('tgl_lahir', 'Tgl Lahir', 'required');
        $this->form_validation->set_rules('jk', 'Jenis Kelamin', 'required');
        $this->form_validation->set_rules('prodi', 'Prodi', 'required');
        $this->form_validation->set_rules('thn_masuk', 'Tahun Masuk', 'required');

        if ($this->form_validation->run() == FALSE) {
            $this->reg_form();
        } else {
            $member = [
                'nim' => $this->input->post('nim'),
                'nama' => $this->input->post('nama'),
                'tempat_lahir' => $this->input->post('tempat_lahir'),
                'tgl_lahir' => $this->input->post('tgl_lahir'),
                'jk' => $this->input->post('jk'),
                'prodi' => $this->input->post('prodi'),
                'thn_masuk' => $this->input->post('thn_masuk'),
            ];
            $this->member->insert($member);
            $this->session->set_flashdata('info', '1 data member telah ditambahkan');
            redirect('member');
        }
    }

    public function view($id)
    {
        $member = $this->member->find_one($id);
        if ($member == NULL) {
            show_404();
        }
        
        $params = array(
            'member' => $member,
            'form_action' => 'member/do_update',
            'js_resources' => ['assets/js/member/reg_form.js']
        );
        $this->load->template(self::DIR_VIEW. '/_form', $params);
    }

    public function do_update()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');

        $this->form_validation->set_rules('nama', 'Nama', 'required');
        $this->form_validation->set_rules('tempat_lahir', 'Tempat Lahir', 'required');
        $this->form_validation->set_rules('tgl_lahir', 'Tgl Lahir', 'required');
        $this->form_validation->set_rules('jk', 'Jenis Kelamin', 'required');
        $this->form_validation->set_rules('prodi', 'Prodi', 'required');
        $this->form_validation->set_rules('thn_masuk', 'Tahun Masuk', 'required');

        $nim = $this->input->post('nim');
        if ($this->form_validation->run() == FALSE) {
            $member = $this->member->find_one($nim);
            $params = array(
                'form_action' => 'member/do_update',
                'member' => $member,
            );
            $this->load->template('member/_form', $params);
        } else {
            $member = [
                'nama' => $this->input->post('nama'),
                'tempat_lahir' => $this->input->post('tempat_lahir'),
                'tgl_lahir' => $this->input->post('tgl_lahir'),
                'jk' => $this->input->post('jk'),
                'prodi' => $this->input->post('prodi'),
                'thn_masuk' => $this->input->post('thn_masuk'),
            ];
            $this->member->modify($nim, $member);
            $this->session->set_flashdata('info', '1 data member telah diperbaharui');
            redirect('member/view/'.$nim);
        }
    }    
}
