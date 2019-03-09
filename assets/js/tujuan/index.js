$('document').ready(function(){
    var table_tujuan = $('#table_tujuan').DataTable({  
        "searching": true,
        "order": [[0, 'asc']],
        "processing": true,
        "serverSide": true,
        "ajax" : {
            'url': app_config.api_uri + "/tujuan"
        },
        "columns"     : [  
            {
                "orderable": true,
                "data": "id_tujuan",
            },
            { 
                "orderable": false,
                "data": "rek_belanja",
            },
            { 
                "orderable": false,
                "data": "provinsi_kabupaten"
            },
            { 
                "orderable": false,
                "data": "ibukota",
            },
            { 
                "orderable": false,
                "data" : "id_tujuan",
                "render": function(data, type, row, meta) {
                    var nameHtml = `[
                        <a data-id_rek_belanja="${row.id_rek_belanja}" 
                            data-prov_kab="${row.provinsi_kabupaten}" 
                            data-ibu_kota="${row.ibukota}" 
                            data-id_tujuan="${row.id_tujuan}"
                            class="btn-edit" style=\"cursor:pointer\">Edit</a> |
                        <a data-id=\"${data}\" class="btn-delete" style=\"cursor:pointer\">Delete</a>]`;
                    return nameHtml;
                } 
            }

        ]
    }); 

    $('#btn-tujuan-baru').click(function(){
        $('#form-modal-tujuan').modal('show');
    });

    $('#table_tujuan tbody').on('click', '.btn-delete', function(){
        var id_tujuan = $(this).data('id');
        var conf = confirm('Apakah Anda Yakin ?');
        if (conf !== false) {
            var btn = this;
            $.ajax({
                url: app_config.api_uri + "/tujuan/"+ id_tujuan,
                type: 'DELETE',
                dataType: "json", // expected format for response              
                jsonp: false,
                beforeSend: function() {
                    $(btn).val('wait..');
                },
                success: function(data) {
                    $('#error_message_tujuan').find('span').text('[message here]');
                    $('#error_message_tujuan').hide();
                    
                    table_tujuan.draw();
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    if (jqXHR.status == 400) {
                        var response = JSON.parse(jqXHR.responseText);
                        //alert(response.message);
                        $('#error_message_tujuan').find('span').text(response.message);
                        $('#error_message_tujuan').show();
                    } 
    
                    if (jqXHR.status == 500) {
                        alert('Internal server error');
                    }
    
                    $('#btn-save-tujuan').val('Save');
                }
            }); 
        }      
    });

    $('#table_tujuan tbody').on('click', '.btn-edit', function(){
        var id_rek_belanja = $(this).data('id_rek_belanja');
        var prov_kab = $(this).data('prov_kab');
        var ibu_kota = $(this).data('ibu_kota');
        var id_tujuan = $(this).data('id_tujuan');

        $('input[name=id_tujuan]').val(id_tujuan);
        $('select[name=id_rek_belanja]').val(id_rek_belanja);
        $('input[name=provinsi_kabupaten]').val(prov_kab);
        $('input[name=ibukota]').val(ibu_kota);

        $('#form-modal-tujuan').modal('show');
    });

    $('#form-modal-tujuan').on('hidden.bs.modal', function () {
        $('select[name=id_rek_belanja]').val(null);
        $('input[name=provinsi_kabupaten]').val(null);
        $('input[name=ibukota]').val(null);
    });

    $('#form-tujuan').submit(function(event){
        var id_tujuan = $('input[name=id_tujuan]').val();
        var form_data = {
            'id_rek_belanja': $('select[name=id_rek_belanja]').val(),
            'provinsi_kabupaten': $('input[name=provinsi_kabupaten]').val(),
            'ibu_kota': $('input[name=ibukota]').val()
        }
        var action = 'POST';
        if (id_tujuan.trim() !== "") {
            action = 'PUT';
            form_data.id_tujuan = id_tujuan;
        }
        console.info(form_data);
        
        $.ajax({
            url: app_config.api_uri + "/tujuan",
            type: action,
            data: form_data,
            dataType: "json", // expected format for response              
            jsonp: false,
            beforeSend: function() {
                $('#btn-save-tujuan').val('Please wait..');
            },
            success: function(data) {
                $('#btn-save-tujuan').val('Save');
                $('#error_message_tujuan').find('span').text('[message here]');
                $('#error_message_tujuan').hide();
                
                //table_tujuan.draw();
                window.location.replace(app_config.base_uri + '/tujuan');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 400) {
                    var response = JSON.parse(jqXHR.responseText);
                    //alert(response.message);
                    $('#error_message_tujuan').find('span').text(response.message);
                    $('#error_message_tujuan').show();
                } 

                if (jqXHR.status == 500) {
                    alert('Internal server error');
                }

                $('#btn-save-tujuan').val('Save');
            }
        }); 

        event.preventDefault();        
    });
});