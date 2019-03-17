$('document').ready(function(){  
    var table_book = $('#table_book').DataTable({  
        "searching": true,
        "order": [[0, 'desc']],
        "processing": true,
        "serverSide": true,
        "ajax" : {
            'url': app_config.api_uri + "/book"
        },
        "columns"     : [  
            { 
                "data": "modification_time",
                "render": function(data, type, row, meta) {
                    return moment(data).format('lll');
                }
            },
            { 
                "orderable": false,
                "data": "isbn",
            },
            { 
                "orderable": false,
                "data": "judul",
            },
            { 
                "orderable": false,
                "data": "pengarang"
            },
            { 
                "orderable": false,
                "data": "penerbit",
            },
            { 
                "orderable": false,
                "data": "thn_terbit",
            },
            { 
                "orderable": false,
                "data": "jumlah_buku",
            },
            { 
                "orderable": false,
                "data" : "id",
                "render": function(data, type, row, meta) {
                    var nameHtml = `[
                        <a  href="${app_config.base_uri}/book/view/${data}"
                            class="btn-edit" style=\"cursor:pointer\">Edit</a> ]`;
                    return nameHtml;
                } 
            }

        ]
    }); 

    $('#table_book tbody').on('click', '.btn-delete', function(){
        var conf = confirm('are you sure ?');
        if (conf !== false) {
            var val = $(this).data('id');
            $.ajax({
                url: app_config.api_uri + "/user",
                type: "DELETE",
                dataType: "json", // expected format for response              
                jsonp: false,
                data: {uid: val},
                beforeSend: function() {
                },
                complete: function() {
                },
                success: function(data) {
                    table_book.draw();
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    if (jqXHR.status == 400) {
                        var response = JSON.parse(jqXHR.responseText);
                        alert('Error: '+ response.message);
                    } 

                    if (jqXHR.status == 500) {
                        alert('Internal server error');
                    }
                },
            });
        } 

    });

});