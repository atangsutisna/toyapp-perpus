<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Book extends Admin_Controller 
{
    const DIR_VIEW = 'book';

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Book_model', 'book');
    }

	public function index()
	{
        $params = array(
            'js_resources' => ['assets/js/book/index.js']
        );
        $this->load->template(self::DIR_VIEW.'/index', $params);
    }

    public function reg_form()
    {
        $params = [
            'form_action' => 'book/do_reg'
        ];
        $this->load->template(self::DIR_VIEW. '/_form', $params);
    }

    public function do_reg()
    {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');

        $this->form_validation->set_rules('judul', 'Judul', 'required');
        $this->form_validation->set_rules('pengarang', 'Pengarang', 'required');
        $this->form_validation->set_rules('penerbit', 'Penerbit', 'required');
        $this->form_validation->set_rules('thn_terbit', 'Tahun Terbit', 'required');
        $this->form_validation->set_rules('isbn', 'ISBN', 'required');
        $this->form_validation->set_rules('jumlah_buku', 'Jumlah Buku', 'required');
        $this->form_validation->set_rules('lokasi', 'Lokasi', 'required');

        if ($this->form_validation->run() == FALSE) {
            $this->reg_form();
        } else {
            $book = [
                'judul' => $this->input->post('judul'),
                'pengarang' => $this->input->post('pengarang'),
                'penerbit' => $this->input->post('penerbit'),
                'thn_terbit' => $this->input->post('thn_terbit'),
                'isbn' => $this->input->post('isbn'),
                'jumlah_buku' => $this->input->post('jumlah_buku'),
                'lokasi' => $this->input->post('lokasi'),
                'creation_time' => date('Y-m-d H:i:s'),
                'modification_time' => date('Y-m-d H:i:s')
            ];

            $this->book->insert($book);            
            $this->session->set_flashdata('info', '1 book telah berhasil ditambahkan');
            redirect('book');
        }
    }

    public function view($id)
    {
        $book = $this->book->find_one($id);
        if ($book == NULL) {
            show_404();
        }
        
        $params = array(
            'form_action' => 'book/do_update',
            'book' => $book,
        );
        $this->load->template(self::DIR_VIEW. '/_form', $params);
    }

    public function do_update()
    {
        $id = $this->input->post('id');
        if (!isset($id)) {
            $this->session->set_flashdata('danger', 'Please select one data for update processing');
            redirect('book');
        }
        
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<p class="text-danger">', '</p>');

        $this->form_validation->set_rules('judul', 'Judul', 'required');
        $this->form_validation->set_rules('pengarang', 'Pengarang', 'required');
        $this->form_validation->set_rules('penerbit', 'Penerbit', 'required');
        $this->form_validation->set_rules('thn_terbit', 'Tahun Terbit', 'required');
        $this->form_validation->set_rules('isbn', 'ISBN', 'required');
        $this->form_validation->set_rules('jumlah_buku', 'Jumlah Buku', 'required');
        $this->form_validation->set_rules('lokasi', 'Lokasi', 'required');
        
        if ($this->form_validation->run() == FALSE) {
            $this->view($id);
        } else {
            $book = [
                'judul' => $this->input->post('judul'),
                'pengarang' => $this->input->post('pengarang'),
                'penerbit' => $this->input->post('penerbit'),
                'thn_terbit' => $this->input->post('thn_terbit'),
                'isbn' => $this->input->post('isbn'),
                'jumlah_buku' => $this->input->post('jumlah_buku'),
                'lokasi' => $this->input->post('lokasi'),
                'modification_time' => date('Y-m-d H:i:s')
            ];

            $this->book->modify($id, $book);
            $this->session->set_flashdata('info', '1 data book telah diperbaharui');
            redirect('book/view/'.$id);
        }
    }    
}