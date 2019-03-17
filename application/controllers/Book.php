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
            'form_action' => site_url('book/do_reg')
        ];
        $this->load->template(self::DIR_VIEW. '/_form', $params);
    }


}