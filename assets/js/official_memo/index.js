$('document').ready(function(){  
    var base_uri = window.location.origin;
    var api_uri = window.location.origin+ '/rest';
    console.info(api_uri);
    var table_nota_dinas = $('#table_nota_dinas').DataTable({  
        "searching": true,
        "order": [[2, 'desc']],
        "processing": true,
        "serverSide": true,
        "ajax" : {
            'url': api_uri + "/official_memo"
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
                "data": "no_nota_dinas"
            },
            { 
                "data": "tgl_nota_dinas",
                "render": function(data, type, row, meta) {
                    return moment(data).format('lll');
                }
            },
            {
                "orderable": false,
                "data": "rek_belanja"
            },
            {
                "orderable": false,
                "data": "nomenklatur"
            },
            {
                "orderable": false,
                "data": "perihal"
            },
            {
                "orderable": false,
                "data": "tujuan"
            },
            {
                "orderable": false,
                "data": "tgl_pergi"
            },
            {
                "orderable": false,
                "data": "tgl_kembali"
            },
            {
                "orderable": false,
                "data": "id_nota_dinas",
                "render": function(data, type, row, meta) {
                    return `<a data-id=\"${data}\" 
                    data-kategori-pelaksana="${row.id_kategori_pelaksana}"
                    class="btn-detail" style=\"cursor:pointer\">Detail</a>`;
                }                
            },
            {
                "orderable": false,
                "data": "id_nota_dinas",
                "render": function(data, type, row, meta) {
                    return `<a href="${base_uri}/official_memo/print/${data}" 
                        target="_blank" class="btn-print" style=\"cursor:pointer\">Print</a>`;
                }                
            },
            {
                "orderable": false,
                "data": "id_nota_dinas",
                "render": function(data, type, row, meta) {
                    return `<a data-id=\"${data}\" class="btn-spt" style=\"cursor:pointer\">SPT</a>`;
                }                
            },
            { 
                "orderable": false,
                "data" : "id_nota_dinas",
                "render": function(data, type, row, meta) {
                    var nameHtml = `[
                        <a data-id=\"${data}\" href="${base_uri}/official_memo/view/${data}" style=\"cursor:pointer\">edit</a> |
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
            },
            { 
                "orderable": false,
                "data" : "id_detail_nd",
                "render": function(data, type, row, meta) {
                    var nameHtml = `[
                        <a data-id=\"${data}\" class="btn-delete-dtl" style=\"cursor:pointer\">x</a>]`;
                    return nameHtml;
                } 
            }
        ]
    }); 

    $('#employee_choices').select2({
        dropdownParent: $("#form-nota-dinas-detail"),
        ajax: {
            url: api_uri + '/employee',
            dataType: 'json',
            data: function(params) {
                return {
                    search: {
                        value: params.term
                    },
                    page: params.page || 1,
                    length: 10,
                    draw: 1,
                    id_kategori_pelaksana: $('#id_kategori_pelaksana').val()
                }
            },
            processResults: function(response) {
                var data = response.data.map(function(raw) {
                    return {
                        id: raw.id,
                        text: raw.nama                   
                    }
                });

                return {
                    results: data,
                    pagination: {
                        more: true
                    }
                }
            }
        }
    });

    $('#btn-insert').click(function(e){
        e.preventDefault();
        var val = $("#employee_choices").val();
        console.info(val);
        $.ajax({
            type: "POST",
            url: api_uri + "/executor",
            data: {
                'id_nota_dinas': $('#id_nota_dinas').val(),
                'employee_id': val
            },
            success: function(){
                $('#response_message').hide();
                table_executor.draw();
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 400) {
                  var response = JSON.parse(jqXHR.responseText);
                  console.info(response);
                  $('#response_message').text(response.message);
                  $('#response_message').show();
                } 

                if (jqXHR.status == 500) {
                    alert('Internal server error');
                }
                //TODO: showing error message to user
            },
        });     

        $('#employee_choices').val(null).trigger('change');

        return false;
    });

    $('#table_nota_dinas tbody').on('click', '.btn-detail', function(){
        var id_nota_dinas = $(this).data('id');
        var id_kategori_pelaksana = $(this).data('kategori-pelaksana');
        $('#id_nota_dinas').val(id_nota_dinas);
        $('#id_kategori_pelaksana').val(id_kategori_pelaksana);
        $('#response_message').hide();
        $('#form-nota-dinas-detail').modal('show');
        table_executor.draw();
    });

    $('#table_nota_dinas tbody').on('click', '.btn-spt', function(){
        var id_nota_dinas = $(this).data('id');
        var id_kategori_pelaksana = $(this).data('catpelaksana');
        $('#id_nota_dinas_spt').val(id_nota_dinas);
        $('#form-spt').modal('show');
    });

    $('#table_nota_dinas tbody').on('click', '.btn-delete', function(){
        var conf = confirm('Apakah Anda Yakin ?');
        if (conf !== false) {
            var val = $(this).data('id');
            $.ajax({
                url: api_uri + "/official_memo/"+ val ,
                type: "DELETE",
                dataType: "json", // expected format for response              
                jsonp: false,
                success: function(data) {
                    table_nota_dinas.draw();
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
        }
    });

    $('#table_executor tbody').on('click', '.btn-delete-dtl', function(){
        var conf = confirm('Apakah Anda Yakin ?');

        if (conf !== false) {
            var id_nota_dinas = $(this).data('id');
            $.ajax({
                url: api_uri + "/executor/"+ id_nota_dinas,
                type: "DELETE",
                dataType: "json", // expected format for response              
                jsonp: false,
                success: function(data) {
                    table_executor.draw();
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
        }
    });

    $('#form-add-spt').submit(function(event){
        console.info('form submitted');
        var form_data = {
            'id_nota_dinas': $('input[name=id_nota_dinas_spt').val(),
            'no_spt': $('input[name=no_spt]').val(),
            'tgl_spt': $('input[name=tgl_spt]').val(),
            'id_ttd': $('select[name=id_ttd]').val(),
        };

        $.ajax({
            url: api_uri + "/nspt",
            type: "POST",
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
                //table_executor.draw();
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

    $('#form-spt').on('hidden.bs.modal', function () {
        console.info('modal form-spt is close');
        $('input[name=id_nota_dinas_spt').val('');
        $('input[name=no_spt]').val('');
        $('input[name=tgl_spt]').val('');
        $('select[name=id_ttd]').val('');

        $('#response_message').find('span').text('[message here]');
        $('#error_message_spt').hide();
    });  
});