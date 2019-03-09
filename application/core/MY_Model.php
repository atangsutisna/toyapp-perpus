<?php
class MY_Model extends CI_Model
{
    protected $primary_key;
    protected $table_name;

    public function __construct($table_name, $primary_key)
    {
        parent::__construct();
        $this->table_name = $table_name;
        $this->primary_key = $primary_key;
    }

    public function insert($entity)
    {
        $this->db->insert($this->table_name, $entity);
        $last_insert_id = $this->db->insert_id();

        return $last_insert_id;
    }

    public function modify($id, $entity)
    {
        $this->db->where($this->primary_key, $id);
        $this->db->update($this->table_name, $entity);
    }

    public function remove($id)
    {
        $this->db->where($primary_key, $id);
        $this->db->delete($this->table_name);
    }

}