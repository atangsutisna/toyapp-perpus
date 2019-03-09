<?php

/**
 * @author Atang Sutisna <atang.sutisna.87@gmail.com>
 */
defined('BASEPATH') OR exit('No direct script access allowed');

if (! function_exists('show_bootstrap_warn_alert')) 
{
    /**
     * @param string $warn_message
     */
    function show_bootstrap_warn_alert($warn_message)
    {
        echo "<div class=\"alert alert-warning\" role=\"alert\">{$warn_message}</div>";
    }    
}

if (! function_exists('show_bootstrap_info_alert')) 
{
    /**
     * @param string $info_message
     */
    function show_bootstrap_info_alert($info_message)
    {
        echo "<div class=\"alert alert-info\" role=\"alert\">{$info_message}</div>";
    }    
}

if (! function_exists('show_bootstrap_danger_alert')) 
{
    /**
     * @param string $danger_message
     */
    function show_bootstrap_danger_alert($danger_message)
    {
        echo "<div class=\"alert alert-danger\" role=\"alert\">{$danger_message}</div>";
    }
    
}

if (! function_exists('show_boostrap_alert')) 
{
    function show_bootstrap_alert()
    {
        $CI = & get_instance();
        
        $warn_message = $CI->session->flashdata('warn');
        if (isset($warn_message)) {
            show_bootstrap_warn_alert($warn_message);
        }
        
        $info_message = $CI->session->flashdata('info');
        if (isset($info_message)) {
            show_bootstrap_info_alert($info_message);
        }
        
        $danger_message = $CI->session->flashdata('danger');
        if (isset($danger_message)) {
            show_bootstrap_danger_alert($danger_message);
        }
        
    }
    
}

if (! function_exists('to_map')) 
{
    /**
     * @param string $danger_message
     */
    function to_map($raw_array, $key, $val)
    {
        $map = [NULL => '--select one--'];
        foreach ($raw_array as $raw) {
            $map[$raw->$key] = $raw->$val;
        }

        return $map;
    }
    
}

if (! function_exists('format_date')) 
{
    /**
     * @param string $danger_message
     */
    function format_date($date)
    {
        return date("d/m/Y", strtotime($date));
    }
    
}

if (! function_exists('currency_format')) 
{
    function currency_format($number, $currency = 'Rp.')
    {
	   return $currency . number_format($number,2,',','.');       
    }
}

if (! function_exists('to_key_value')) 
{
    /**
     * @param string $danger_message
     */
    function to_key_value($raw_array, $key, $val)
    {
        $arr_map = [];
        foreach ($raw_array as $raw) {
            array_push($arr_map, [
                'id' => $raw->$key,
                'value' => $raw->$val,
            ]);
        }

        return $arr_map;
    }
    
}

if (! function_exists('get_logged_fullname')) 
{
    /**
     * @param string $danger_message
     */
    function get_logged_fullname()
    {
        $CI = & get_instance();
        return $CI->session->userdata('fullname');
    }
    
}

if (! function_exists('get_logged_role_name')) 
{
    /**
     * @param string $danger_message
     */
    function get_logged_role_name()
    {
        $CI = & get_instance();
        return $CI->session->userdata('role');
    }
    
}

if (! function_exists('is_operator')) 
{
    function is_operator()
    {
        $CI = & get_instance();
        return $CI->session->userdata('role') == 'operator';
    }
    
}

if (! function_exists('is_administrator')) 
{
    function is_administrator()
    {
        $CI = & get_instance();
        return $CI->session->userdata('role') == 'administrator';
    }
    
}

/**
 * @author Atang Sutisna <atang.sutisna.87@gmail.com>
*/

if (! function_exists('format_rupiah')) 
{
    /**
     * @param string $warn_message
     */
    function format_rupiah($price)
    {
        $money = number_format($price,'0',',','.');
        return "Rp. {$money}";
    }    
}

if (! function_exists('penyebut')) 
{
    /**
     * 
     * FUNGSI TERBILANG OLEH : MALASNGODING.COM
     * WEBSITE : WWW.MALASNGODING.COM
     * AUTHOR : https://www.malasngoding.com/author/admin    
     */
    function penyebut($nilai) 
    {
        $nilai = abs($nilai);
        $huruf = array("", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
        $temp = "";
        if ($nilai < 12) {
            $temp = " ". $huruf[$nilai];
        } else if ($nilai <20) {
            $temp = penyebut($nilai - 10). " belas";
        } else if ($nilai < 100) {
            $temp = penyebut($nilai/10)." puluh". penyebut($nilai % 10);
        } else if ($nilai < 200) {
            $temp = " seratus" . penyebut($nilai - 100);
        } else if ($nilai < 1000) {
            $temp = penyebut($nilai/100) . " ratus" . penyebut($nilai % 100);
        } else if ($nilai < 2000) {
            $temp = " seribu" . penyebut($nilai - 1000);
        } else if ($nilai < 1000000) {
            $temp = penyebut($nilai/1000) . " ribu" . penyebut($nilai % 1000);
        } else if ($nilai < 1000000000) {
            $temp = penyebut($nilai/1000000) . " juta" . penyebut($nilai % 1000000);
        } else if ($nilai < 1000000000000) {
            $temp = penyebut($nilai/1000000000) . " milyar" . penyebut(fmod($nilai,1000000000));
        } else if ($nilai < 1000000000000000) {
            $temp = penyebut($nilai/1000000000000) . " trilyun" . penyebut(fmod($nilai,1000000000000));
        }     
        return $temp;
    }

}

if (! function_exists('terbilang')) 
{
    /**
     * 
     * FUNGSI TERBILANG OLEH : MALASNGODING.COM
     * WEBSITE : WWW.MALASNGODING.COM
     * AUTHOR : https://www.malasngoding.com/author/admin    
     */
    function terbilang($nilai) 
    {
        if($nilai<0) {
            $hasil = "minus ". trim(penyebut($nilai));
        } else {
            $hasil = trim(penyebut($nilai));
        }     		
        return $hasil;
    }
    
}

if (! function_exists('format_date_to')) 
{
    /**
     * 
     * FUNGSI TERBILANG OLEH : MALASNGODING.COM
     * WEBSITE : WWW.MALASNGODING.COM
     * AUTHOR : https://www.malasngoding.com/author/admin    
     */
    function format_date_to($input_date, $format = "d F Y") 
    {
        $date = date_create($input_date);
        return date_format($date, $format); 
    }
    
}

