<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model 
{
    private $table_name = 'tbl_user';

    public function find_by_username($username, $status = 'active')
    {
        $this->db->where('username', $username);
        $query = $this->db->get($this->table_name);
        
        return $query->row();
    }

    public function find_by_email($email)
    {
        $this->db->where('email', $email);
        $query = $this->db->get($this->table_name);

        return $query->row();
    }

    public function find_all($term = NULL, $first = 0, $count = 20, $order = 'id', $direction = 'DESC')
    {
        if ($term != NULL && $term !== '') {
            $this->db->group_start();
            $this->db->like('username', $term);
            $this->db->or_like('nama', $term); 
            $this->db->group_end();
        }

        $this->db->limit(
            isset($count) ? $count : 20, 
            isset($first) ? $first : 0
        );
        $this->db->order_by($order, $direction);
        $query = $this->db->get($this->table_name);

        return $query->result();
    }

    public function count_all($term = NULL)
    {
        if ($term != NULL && $term !== '') {
            $this->db->group_start();
            $this->db->like('username', $term);
            $this->db->or_like('nama', $term); 
            $this->db->group_end();
        }

        $this->db->from($this->table_name);
        return $this->db->count_all_results();
    }

    public function modify($criterion, $user)
    {
        if (!is_array($criterion)) 
        {
            throw new Exception("Criterion must be an array");
        }

        foreach ($criterion as $key => $val) 
        {
            $this->db->where($key, $val);
        }

        $this->db->update($this->table_name, $user);
    }

    public function insert($user)
    {
        $this->db->insert($this->table_name, $user);
        $last_insert_id = $this->db->insert_id();

        return $last_insert_id;
    }

    /**
     * uid is unique id
     * can be uid, username or email
     */
    public function find_by_uniqueid($uid)
    {
        $this->db->group_start();
        $this->db->where('id', $uid);
        $this->db->or_where('email', $uid);
        $this->db->or_where('username', $uid);
        $this->db->group_end();

        $query = $this->db->get($this->table_name);

        return $query->row();
    }

    public function find_one($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get($this->table_name);

        return $query->row();
    }

}