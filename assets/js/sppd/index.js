$('document').ready(function(){  
    var base_uri = window.location.origin;
    var api_uri = window.location.origin+ '/rest';

    var table_sppd = $('#table_sppd').DataTable({  
        "searching": true,
        "order": [[3, 'desc']],
        "processing": true,
        "serverSide": true,
        "ajax" : {
            'url': api_uri + "/sppd"
        },
        "columns"     : [  
            {
                "orderable": false,
                "data": "id",
                "render": function(data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            {
                "orderable": false,
                "data": "nama_pelaksana"
            },
            {
                "orderable": false,
                "data": "no_sppd"
            },
            { 
                "data": "tgl_sppd",
                "render": function(data, type, row, meta) {
                    return moment(data).format('lll');
                }
            },
            {
                "orderable": false,
                "data": "rek_belanja"
            }
            ,
            {
                "orderable": false,
                "data": "nomenklatur"
            },
            {
                "orderable": false,
                "data": "perihal"
            }
            ,
            {
                "orderable": false,
                "data": "tujuan"
            },
            {
                "orderable": false,
                "data": "tgl_pergi"
            }
            ,
            {
                "orderable": false,
                "data": "tgl_kembali"
            },
            {
                "orderable": false,
                "data": "kegiatan"
            }
            ,
            {
                "orderable": false,
                "data": "id_sppd",
                "render": function(data, type, row, meta) {
                    return `[<a href="${app_config.base_uri}/sppd/print_a/${data}" target="_blank" class="btn-print-a" style=\"cursor:pointer\">Print A</a> |
                    <a href="${app_config.base_uri}/sppd/print_b/${data}" target="_blank" class="btn-print-b" style=\"cursor:pointer\">Print B</a>]`;
                }                
            }
            ,
            {
                "orderable": false,
                "data": "id_nota_dinas",
                "render": function(data, type, row, meta) {
                    return `<a data-id=\"${data}\" class="btn-sptjm" style=\"cursor:pointer\">Print</a>`;
                }                
            }
            ,
            {
                "orderable": false,
                "data": "id_sppd",
                "render": function(data, type, row, meta) {
                    return `<a data-id=\"${data}\" 
                    data-spt-id="${row.id_spt}" 
                    class="btn-uang-muka" style=\"cursor:pointer\">Uang Muka</a>`;
                }                
            },
            { 
                "orderable": false,
                "data" : "id_sppd",
                "render": function(data, type, row, meta) {
                    var nameHtml = `[
                        <a  data-id=\"${data}\" 
                            data-id-spt=\"${row.id_spt}\" 
                            data-no-sppd="${row.no_sppd}"
                            data-tgl-sppd="${row.tgl_sppd}"
                            data-rek-belanja="${row.id_rek_belanja}"
                            data-employee-id="${row.id}"
                            data-ttd="${row.id_ttd}"
                            data-transportasi="${row.id_transportasi}"
                            class="btn-edit" style=\"cursor:pointer\">edit</a> |
                        <a data-id=\"${data}\" class="btn-delete" style=\"cursor:pointer\">delete</a>]`;
                    return nameHtml;
                } 
            }
        ]
    }); 

    $('#table_sppd tbody').on('click', '.btn-delete', function(){
        var conf = confirm('Apakah Anda Yakin ?');
        if (conf !== false) {
            var id_sppd = $(this).data('id');
            $.ajax({
                url: api_uri + "/sppd/"+ id_sppd,
                type: "DELETE",
                dataType: "json", // expected format for response              
                jsonp: false,
                success: function(data) {
                    console.info('spt with id '+ id_spt + ' has been deleted');
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    if (jqXHR.status == 400) {
                        var response = JSON.parse(jqXHR.responseText);
                        alert('cannot be delete. Error: '+ response.error_messages);
                    } 

                    if (jqXHR.status == 500) {
                        alert('Internal server error');
                    }
                },
            });
            table_sppd.draw();
        }
    });

    $('#table_sppd tbody').on('click', '.btn-edit', function(){
        var id_sppd = $(this).data('id');
        var id_spt = $(this).data('id-spt');
        var no_sppd = $(this).data('no-sppd');
        var tgl_sppd = $(this).data('tgl-sppd');
        var employee_id = $(this).data('employee-id');
        var id_ttd = $(this).data('ttd');
        var id_transportasi = $(this).data('transportasi');
        console.info('id-spt: '+ id_spt)
        $('input[name=id_sppd]').val(id_sppd);
        $('input[name=id_spt_sppd]').val(id_spt);
        $('input[name=no_sppd]').val(no_sppd);
        $('input[name=no_sppd]').attr('readonly', 'readonly');
        $('input[name=tgl_sppd]').val(tgl_sppd);
        $('select[name=id_ttd_sppd]').val(id_ttd);
        $('select[name=id_transportasi]').val(id_transportasi);

        axios.get(base_uri + '/ajax_executor/show_edit_sppd_executor_choices', {
                params: {
                    'id_spt': id_spt,
                    'id': employee_id
                }
            })
            .then(function(response){
                $('#executor_container').html(response.data);
        });

        axios.get(base_uri + '/ajax_kedudukan/show_edit_kedudukan_choices', {
            params: {
                'id_sppd': id_sppd,
            }
        })
        .then(function(response){
            $('#kedudukan_container').html(response.data);
        });

        $('#form-edit-sppd').modal('show');
    });

    $('#table_sppd tbody').on('click', '.btn-sptjm', function(){
        alert('Not implemented yet');
    });

    $('#table_sppd tbody').on('click', '.btn-uang-muka', function(){
        var id_sppd = $(this).data('id');
        var id_spt = $(this).data('spt-id');
        console.info('id-sppd: '+ id_sppd);
        console.info('id-spt: '+ id_spt);
        $.ajax({
            url: api_uri + "/uang_muka/template/"+ id_sppd,
            type: "GET",
            dataType: "json", // expected format for response              
            jsonp: false,
            success: function(data) {
                console.info(data);
                $('input[name=id_spt_sppd]').val(id_spt);
                $('input[name=id_sppd]').val(id_sppd);
                form_uang_muka.nama_pelaksana = data.nama_pelaksana;
                form_uang_muka.nama_jabatan = data.nama_jabatan;
                form_uang_muka.eselon = data.eselon;
                form_uang_muka.no_sppd = data.no_sppd;
                form_uang_muka.no_spt = data.no_spt;
                form_uang_muka.tgl_spt = data.tgl_spt;
                form_uang_muka.id_rek_belanja = data.id_rek_belanja;
                form_uang_muka.id_kategori_pelaksana = data.id_kategori_pelaksana;
                form_uang_muka.tgl_pergi = data.tgl_pergi;
                form_uang_muka.tgl_kembali = data.tgl_kembali;
                form_uang_muka.tujuan = data.tujuan;
                
                $('input[name=uang_harian]').val('0');
                $('input[name=lama_pelaksanaan]').val('0');
                $('input[name=jumlah_uang_harian]').val('0');

                form_uang_muka.departure_darat_choices = data.departure_darat_choices;
                form_uang_muka.arrival_darat_choices = data.arrival_darat_choices;

                form_uang_muka.departure_laut_choices = data.departure_laut_choices;
                form_uang_muka.arrival_laut_choices = data.arrival_laut_choices;

                form_uang_muka.departure_udara_choices = data.departure_udara_choices;
                form_uang_muka.arrival_udara_choices = data.arrival_udara_choices;

                form_uang_muka.taksi_departure_choices = data.taksi_departure_choices;
                form_uang_muka.taksi_arrival_choices = data.taksi_arrival_choices;
                $('#form-modal-uang-muka').modal('show');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 400) {
                    var response = JSON.parse(jqXHR.responseText);
                    alert('cannot be delete. Error: '+ response.error_messages);
                } 

                if (jqXHR.status == 500) {
                    alert('Internal server error');
                }
            },
        });
    });

    /**
     * handlig for editing sppd
     */
    $('#form-edit-sppd').submit(function(event){
        var form_data = {
            'id_sppd': $('input[name=id_sppd]').val(),
            'id_spt': $('input[name=id_spt_sppd]').val(),
            'no_sppd': $('input[name=no_sppd').val(),
            'tgl_sppd': $('input[name=tgl_sppd]').val(),
            'id': $('select[name=id]').val(),
            'id_transportasi': $('select[name=id_transportasi]').val(),
            'id_tempat_pergi': $('select[name=id_tempat_pergi]').val(),
            'id_ttd': $('select[name=id_ttd_sppd]').val(),
        };

        $.ajax({
            url: api_uri + "/sppd",
            type: "PUT",
            data: form_data,
            dataType: "json", // expected format for response              
            jsonp: false,
            beforeSend: function() {
                $('#btn-save-sppd').val('Please wait..');
            },
            success: function(data) {
                $('#btn-save-sppd').val('Save');
                $('#error_message_sppd').find('span').text('[message here]');
                $('#error_message_sppd').hide();
                //table_executor.draw();
                window.location.replace(base_uri + '/sppd');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 400) {
                    var response = JSON.parse(jqXHR.responseText);
                    //alert(response.message);
                    $('#error_message_sppd').find('span').text(response.message);
                    $('#error_message_sppd').show();
                } 

                if (jqXHR.status == 500) {
                    alert('Internal server error');
                }

                $('#btn-save-sppd').val('Save');
            },
        });
        event.preventDefault();
    });
    /**
     * for submit uang muka
     */
    $('#form-uang-muka').submit(function(event){
        var form_data = {
            'tgl_uang_muka': $('input[name=tgl_uang_muka').val(),
            'id_sppd': $('input[name=id_sppd]').val(),
            'id_spt': $('input[name=id_spt_sppd]').val(),
            
            'lama_pelaksanaan': $('input[name=lama_pelaksanaan').val(),
            'uang_harian': $('input[name=uang_harian').val(),
            'jumlah_uang_harian': $('input[name=jumlah_uang_harian]').val(),
            
            'uang_penginapan': $('input[name=uang_penginapan').val(),
            'penginapan_hari': $('input[name=penginapan_hari').val(),
            'jumlah_uang_penginapan': $('input[name=jumlah_uang_penginapan').val(),

            'uang_representasi': $('input[name=uang_representasi').val(),
            'representasi_hari': $('input[name=representasi_hari').val(),
            'jumlah_uang_representasi': $('input[name=jumlah_uang_representasi').val(),

            'id_departure_darat': $('select[name=id_departure_darat]').val(),
            'id_arrivals_darat': $('select[name=id_arrivals_darat]').val(),
            'transportasi_darat': $('input[name=transportasi_darat').val(),

            'id_departure_udara': $('select[name=id_departure_udara]').val(),
            'id_arrivals_udara': $('select[name=id_arrivals_udara]').val(),
            'transportasi_udara': $('input[name=transportasi_udara').val(),

            'id_departure_laut': $('select[name=id_departure_laut]').val(),
            'id_arrivals_laut': $('select[name=id_arrivals_laut]').val(),
            'transportasi_laut': $('input[name=transportasi_laut').val(),

            'sewa_kendaraan': $('input[name=sewa_kendaraan').val(),

            'id_taksi_kedudukan': $('select[name=id_taksi_kedudukan]').val(),
            'tarif_dasar_taksi_kedudukan': $('input[name=tarif_dasar_taksi_kedudukan]').val(),
            'kali_taksi_kedudukan': $('input[name=kali_taksi_kedudukan').val(),
            'taksi_kedudukan': $('input[name=taksi_kedudukan').val(),

            'id_taksi_lokasi': $('select[name=id_taksi_lokasi]').val(),            
            'tarif_dasar_taksi_lokasi': $('input[name=tarif_dasar_taksi_lokasi]').val(),
            'kali_taksi_lokasi': $('input[name=kali_taksi_lokasi').val(),
            'taksi_lokasi': $('input[name=taksi_lokasi').val(),

            'total_uang_muka': $('input[name=total_uang_muka').val(),
        };
        console.info(form_data);
        
        $.ajax({
            url: app_config.api_uri + "/uang_muka",
            type: "POST",
            data: form_data,
            dataType: "json", // expected format for response              
            jsonp: false,
            beforeSend: function() {
                $('#btn-save-uang-muka').val('Please wait..');
            },
            success: function(data) {
                $('#btn-save-uang-muka').val('Save');
                $('#error_message_uang_muka').find('span').text('[message here]');
                $('#error_message_uang_muka').hide();
                //table_executor.draw();
                window.location.replace(base_uri + '/down_payment');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 400) {
                    var response = JSON.parse(jqXHR.responseText);
                    //alert(response.message);
                    $('#error_message_uang_muka').find('span').text(response.message);
                    $('#error_message_uang_muka').show();
                } 

                if (jqXHR.status == 500) {
                    alert('Internal server error');
                }

                $('#btn-save-uang-muka').val('Save');
            },
        });
        
        event.preventDefault();
    });   
    
    $('#form-modal-uang-muka').on('hidden.bs.modal', function () {
        console.info('modal form-uang-muka is close');
        $('#form-uang-muka').trigger('reset');
        form_uang_muka.trans_darat_from= null;
        form_uang_muka.departure_darat_choices= [];
        form_uang_muka.trans_darat_to= null;
        form_uang_muka.arrival_darat_choices= [];

        form_uang_muka.trans_laut_from= null;
        form_uang_muka.departure_laut_choices= [];
        form_uang_muka.trans_laut_to= null;
        form_uang_muka.arrival_laut_choices= [];
        
        form_uang_muka.trans_udara_from= null;
        form_uang_muka.departure_udara_choices= [];
        form_uang_muka.trans_udara_to= null;
        form_uang_muka.arrival_udara_choices= [];

        form_uang_muka.taksi_departure_choices= [];
        form_uang_muka.taksi_arrival_choices= []

        $('#error_message_uang_muka').find('span').text('[message here]');
        $('#error_message_uang_muka').hide();
    });  
    
});