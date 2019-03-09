$('document').ready(function(){  
    var base_uri = window.location.origin;
    var api_uri = window.location.origin+ '/rest';

    var table_spt = $('#table_spt').DataTable({  
        "searching": true,
        "order": [[2, 'desc']],
        "processing": true,
        "serverSide": true,
        "ajax" : {
            'url': api_uri + "/nspt"
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
                "data": "no_spt"
            },
            { 
                "data": "tgl_spt",
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
                "data": "kode_kegiatan"
            }
            ,
            {
                "orderable": false,
                "data": "id_nota_dinas",
                "render": function(data, type, row, meta) {
                    return `<a data-id=\"${data}\" class="btn-detail" style=\"cursor:pointer\">Detail</a>`;
                }                
            }
            ,
            {
                "orderable": false,
                "data": "id_spt",
                "render": function(data, type, row, meta) {
                    return `<a href=\"${base_uri}/nspt/print/${data}\" 
                    target="_blank" class="btn-print" style=\"cursor:pointer\">Print</a>`;
                }                
            }
            ,
            {
                "orderable": false,
                "data": "id_spt",
                "render": function(data, type, row, meta) {
                    return `<a data-id=\"${data}\" 
                    data-nota-dinas="${row.id_nota_dinas}" 
                    data-rek-belanja="${row.id_rek_belanja}"
                    class="btn-sppd" style=\"cursor:pointer\">create</a>`;
                }                
            },
            { 
                "orderable": false,
                "data" : "id_spt",
                "render": function(data, type, row, meta) {
                    var nameHtml = `[
                        <a data-id=\"${data}\" class="btn-edit" style=\"cursor:pointer\">edit</a> |
                        <a data-id=\"${data}\" class="btn-delete" style=\"cursor:pointer\">delete</a>]`;
                    return nameHtml;
                } 
            }
        ]
    }); 

    var table_executor = $('#table_executor').DataTable({  
        "searching": false,
        "processing": true,
        "serverSide": true,
        "bLengthChange": false,
        "ajax" : {
            'url': api_uri + "/executor",
            'data': function(d) {
                d.id_nota_dinas = $('#id_nota_dinas').val();
            }
        },
        "columns"     : [  
            {
                "orderable": false,
                "data": "nama"
            },
            {
                "orderable": false,
                "data": "nama_jabatan",
                "render": function(data, type, row, meta) {
                    if (data == null) {
                        return "not assigned"
                    }

                    return data;
                } 
            }
        ]
    }); 

    $('#table_spt tbody').on('click', '.btn-detail', function(){
        var id_nota_dinas = $(this).data('id');
        $('#id_nota_dinas').val(id_nota_dinas);
        $('#modal-executor').modal('show');
        table_executor.draw();
    });

    $('#table_spt tbody').on('click', '.btn-delete', function(){
        var conf = confirm('Apakah Anda Yakin ?');
        if (conf !== false) {
            var id_spt = $(this).data('id');
            $.ajax({
                url: api_uri + "/nspt/"+ id_spt,
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
            table_spt.draw();
        }
    });

    $('#table_spt tbody').on('click', '.btn-edit', function(){
        var id_spt = $(this).data('id');
        console.info('id spt: '+ id_spt);
        $.ajax({
            url: api_uri + "/nspt/find/"+ id_spt,
            type: "GET",
            dataType: "json", // expected format for response              
            jsonp: false,
            success: function(data) {
                $('input[name=id_spt').val(data.id_spt);
                $('input[name=no_spt]').val(data.no_spt);
                $('input[name=tgl_spt]').val(data.tgl_spt);
                $('select[name=id_ttd]').val(data.id_ttd);        
                $('#form-spt').modal('show');
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

    $('#form-add-spt').submit(function(event){
        console.info('form submitted');
        var form_data = {
            'id_spt': $('input[name=id_spt').val(),
            'no_spt': $('input[name=no_spt]').val(),
            'tgl_spt': $('input[name=tgl_spt]').val(),
            'id_ttd': $('select[name=id_ttd]').val(),
        };

        $.ajax({
            url: api_uri + "/nspt",
            type: "PUT",
            data: form_data,
            dataType: "json", // expected format for response              
            jsonp: false,
            beforeSend: function() {
                $('#btn-save-spt').val('Please wait..');
            },
            success: function(data) {
                $('#btn-save-spt').val('Save');
                $('#response_message').find('span').text('[message here]');
                $('#error_message_spt').hide();
                window.location.replace(base_uri + '/nspt');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 400) {
                    var response = JSON.parse(jqXHR.responseText);
                    //alert(response.message);
                    $('#error_message_spt').find('span').text(response.message);
                    $('#error_message_spt').show();
                } 

                if (jqXHR.status == 500) {
                    alert('Internal server error');
                }
            },
        });
        event.preventDefault();
    });    

    $('#table_spt tbody').on('click', '.btn-sppd', function(){
        var id_spt = $(this).data('id');
        var id_nota_dinas = $(this).data('nota-dinas');
        var id_rek_belanja = $(this).data('rek-belanja');
        console.info('id_spt: '+ id_spt);
        console.info('id_nota_dinas: '+ id_nota_dinas);
        console.info('id_rek_belanja: '+ id_rek_belanja);
        $.ajax({
            url: base_uri + "/ajax_executor/show_executor_choices/"+ id_nota_dinas,
            type: "GET",
            success: function(data) {
                $('#executor_container').html(data);
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

        $('#id_spt_spd').val(id_spt);
        $('#id_rek_belanja').val(id_rek_belanja);
        $('.id_nota_dinas').val(id_nota_dinas);
        $('#form-sppd').modal('show');        

    });

    $('#id_transportasi').change(function(){
        var id_rek_belanja = $('#id_rek_belanja').val();
        $.ajax({
            url: base_uri + "/ajax_kedudukan/show_kedudukan_choices/" + id_rek_belanja,
            type: "GET",
            success: function(data) {
                console.info('success');
                console.info(data);
                $('#kedudukan_container').html(data);
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

    $('#form-add-sppd').submit(function(event){
        console.info('form submitted');
        var form_data = {
            'id_nota_dinas': $('input[name=id_nota_dinas_sppd]').val(),
            'id_spt': $('input[name=id_spt_spd]').val(),
            'no_sppd': $('input[name=no_sppd').val(),
            'tgl_sppd': $('input[name=tgl_sppd]').val(),
            'id': $('select[name=id]').val(),
            'id_transportasi': $('select[name=id_transportasi]').val(),
            'id_tempat_pergi': $('select[name=id_tempat_pergi]').val(),
            'id_ttd': $('select[name=id_ttd_sppd]').val(),
        };

        $.ajax({
            url: api_uri + "/sppd",
            type: "POST",
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
                window.location.replace(base_uri + '/nspt');
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
    $('#form-spt').on('hidden.bs.modal', function () {
        console.info('modal form-spt is close');
    });  
    **/

});