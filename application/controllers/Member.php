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

}