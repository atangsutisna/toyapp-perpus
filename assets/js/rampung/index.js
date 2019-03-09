$('document').ready(function(){  
    var table_rampung = $('#table_rampung').DataTable({  
        "searching": true,
        "order": [[2, 'desc']],
        "processing": true,
        "serverSide": true,
        "ajax" : {
            'url': app_config.api_uri + "/rampung"
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
                "data": "tgl_uang_rampung",
                "render": function(data, type, row, meta) {
                    return moment(data).format('lll');
                }
            },
            {
                "orderable": false,
                "data": "kode_kegiatan"
            },
            {
                "orderable": false,
                "data": "rek_belanja"
            },
            {
                "orderable": false,
                "data": "perihal"
            },
            {
                "orderable": false,
                "data": "instansi_tujuan"
            },
            {
                "orderable": false,
                "data": "tujuan"
            },
            { 
                "data": "tgl_pergi",
                "render": function(data, type, row, meta) {
                    return moment(data).format('lll');
                }
            },
            { 
                "data": "tgl_kembali",
                "render": function(data, type, row, meta) {
                    return moment(data).format('lll');
                }
            },
            {
                "orderable": false,
                "data": "total_uang_muka",
                "render": function(data) {
                    var total_uang_muka = accounting.formatMoney(data);
                    return `<span class="pull-right">${total_uang_muka}</span>`;
                }
            },
            {
                "orderable": false,
                "data": "total_uang_rampung",
                "render": function(data) {
                    var total_rampung = accounting.formatMoney(data);
                    return `<span class="pull-right">${total_rampung}</span>`;
                }
            },
            {
                "orderable": false,
                "data": "id_uang_rampung",
                "render": function(data, type, row, meta) {
                    return `[
                        <a data-id=\"${data}\" class="btn-detail" style=\"cursor:pointer\">Detail</a> |
                        <a href="${app_config.base_uri}/rampung/print/${data}" target="_blank" class="btn-print" style=\"cursor:pointer\">Print</a>]`;
                }                
            },
            { 
                "orderable": false,
                "data" : "id_uang_rampung",
                "render": function(data, type, row, meta) {
                    var nameHtml = `[
                        <a  data-id=\"${data}\" 
                            data-id-spt=\"${row.id_spt}\" 
                            data-id-sppd="${row.id_sppd}"
                            class="btn-edit" style=\"cursor:pointer\">edit</a> |
                        <a data-id=\"${data}\" class="btn-delete" style=\"cursor:pointer\">delete</a>]`;
                    return nameHtml;
                } 
            }            


        ]
    });        

    $('#table_rampung tbody').on('click', '.btn-delete', function(){
        var conf = confirm('Apakah Anda Yakin ?');
        if (conf !== false) {
            var id_rampung = $(this).data('id');
            $.ajax({
                url: app_config.api_uri + "/rampung/"+ id_rampung,
                type: "DELETE",
                dataType: "json", // expected format for response              
                jsonp: false,
                success: function(data) {
                    table_rampung.draw();
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

    $('#table_rampung tbody').on('click', '.btn-edit', function(){
        var id = $(this).data('id');
        $(this).text('wait..');
        $.ajax({
            url: app_config.api_uri + "/rampung/find/"+ id,
            type: "GET",
            dataType: "json", // expected format for response              
            jsonp: false,
            success: function(data) {
                $('input[name=id_uang_muka').val(data.id_uang_muka);
                $('input[name=id_spt_rampung').val(data.id_spt);
                $('input[name=id_sppd_rampung').val(data.id_sppd);
                form_pembayaran_rampung.id_uang_rampung = data.id_uang_rampung;
                form_pembayaran_rampung.id_uang_muka = data.id_uang_muka;
                console.info('id_uang_muka: '+ form_pembayaran_rampung.id_uang_muka);
                console.info('id_uang_rampung: '+ form_pembayaran_rampung.id_uang_rampung);
                form_pembayaran_rampung.tgl_uang_rampung = moment().format('YYYY-MM-DD');
                console.info('tgl_uang_rampung: '+ form_pembayaran_rampung.tgl_uang_rampung);
                form_pembayaran_rampung.nama_pelaksana = data.nama_pelaksana;
                form_pembayaran_rampung.nama_jabatan = data.nama_jabatan;
                
                form_pembayaran_rampung.eselon = data.eselon;
                form_pembayaran_rampung.no_sppd = data.no_sppd;
                form_pembayaran_rampung.no_spt = data.no_spt;
                form_pembayaran_rampung.tgl_spt = data.tgl_spt;
                form_pembayaran_rampung.id_rek_belanja = data.id_rek_belanja;
                form_pembayaran_rampung.id_kategori_pelaksana = data.id_kategori_pelaksana;
                form_pembayaran_rampung.tgl_pergi = data.tgl_pergi;
                form_pembayaran_rampung.tgl_kembali = data.tgl_kembali;
                form_pembayaran_rampung.tujuan = data.tujuan;

                form_pembayaran_rampung.uang_harian = data.uang_harian;
                form_pembayaran_rampung.lama_pelaksanaan = data.lama_pelaksanaan;
                form_pembayaran_rampung.jumlah_uang_harian = data.jumlah_uang_harian;

                form_pembayaran_rampung.uang_penginapan = data.uang_penginapan;
                form_pembayaran_rampung.penginapan_hari = data.penginapan_hari;
                form_pembayaran_rampung.jumlah_uang_penginapan = data.jumlah_uang_penginapan;

                form_pembayaran_rampung.uang_representasi = data.uang_representasi;
                form_pembayaran_rampung.representasi_hari = data.representasi_hari;
                form_pembayaran_rampung.jumlah_uang_representasi = data.jumlah_uang_representasi;

                
                form_pembayaran_rampung.uang_trans_darat = parseFloat(data.transportasi_darat);
                form_pembayaran_rampung.uang_trans_laut = parseFloat(data.transportasi_laut);
                form_pembayaran_rampung.uang_sewa_kendaraan = parseFloat(data.sewa_kendaraan);
                form_pembayaran_rampung.taksi_kedudukan = parseFloat(data.taksi_kedudukan);
                form_pembayaran_rampung.taksi_lokasi = parseFloat(data.taksi_lokasi);
                
                form_pembayaran_rampung.trans_darat_from = data.id_departure_darat;
                form_pembayaran_rampung.trans_darat_to = data.id_arrivals_darat;
                form_pembayaran_rampung.departure_darat_choices = data.departure_darat_choices;
                form_pembayaran_rampung.arrival_darat_choices = data.arrival_darat_choices;
                form_pembayaran_rampung.uang_trans_udara = data.transportasi_udara;

                form_pembayaran_rampung.trans_laut_from = data.id_departure_laut;
                form_pembayaran_rampung.trans_laut_to = data.id_arrivals_laut;
                form_pembayaran_rampung.departure_laut_choices = data.departure_laut_choices;
                form_pembayaran_rampung.arrival_laut_choices = data.arrival_laut_choices;
                
                form_pembayaran_rampung.trans_udara_from = data.id_departure_udara;
                form_pembayaran_rampung.trans_udara_to = data.id_arrivals_udara;
                form_pembayaran_rampung.uang_trans_udara = data.transportasi_udara;
                form_pembayaran_rampung.departure_udara_choices = data.departure_udara_choices;
                form_pembayaran_rampung.arrival_udara_choices = data.arrival_udara_choices;
                
                form_pembayaran_rampung.id_taksi_kedudukan = data.id_taksi_kedudukan;
                form_pembayaran_rampung.tarif_dasar_taksi_kedudukan = data.tarif_dasar_taksi_kedudukan;
                form_pembayaran_rampung.kali_taksi_kedudukan = data.kali_taksi_kedudukan;
                form_pembayaran_rampung.taksi_departure_choices = data.taksi_departure_choices;
                form_pembayaran_rampung.taksi_kedudukan = data.taksi_kedudukan;

                //form_pembayaran_rampung.id_taksi_lokasi = data.id_taksi_lokasi;
                form_pembayaran_rampung.id_taksi_lokasi = data.id_taksi_lokasi;
                form_pembayaran_rampung.tarif_dasar_taksi_lokasi = data.tarif_dasar_taksi_lokasi;
                form_pembayaran_rampung.kali_taksi_lokasi = data.kali_taksi_lokasi;
                form_pembayaran_rampung.taksi_arrival_choices = data.taksi_arrival_choices;
                form_pembayaran_rampung.taksi_lokasi = data.taksi_lokasi;

                form_pembayaran_rampung.total_uang_rampung = data.total_uang_muka;
                form_pembayaran_rampung.total_uang_muka = data.total_uang_muka;

                console.info('uang_harian: '+ form_pembayaran_rampung.uang_harian);                
                console.info('Tgl uang muka: '+ data.tgl_uang_muka);
                $('#form-modal-pembayaran-rampung').modal('show');
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

    $('#form-modal-pembayaran-rampung').on('hidden.bs.modal', function () {
        table_rampung.draw();
    });  

    $('#form-pembayaran-rampung-1').submit(function(event){
        var form_data = {
            'id_uang_rampung': form_pembayaran_rampung.id_uang_rampung,
            'id_uang_muka': form_pembayaran_rampung.id_uang_muka,
            'tgl_uang_rampung': $('input[name=tgl_uang_rampung').val(),
            
            'lama_pelaksanaan': form_pembayaran_rampung.lama_pelaksanaan,
            'uang_harian': form_pembayaran_rampung.uang_harian,
            'jumlah_uang_harian': form_pembayaran_rampung.jumlah_uang_harian,
            
            'uang_penginapan': form_pembayaran_rampung.uang_penginapan,
            'penginapan_hari': form_pembayaran_rampung.penginapan_hari,
            'jumlah_uang_penginapan': form_pembayaran_rampung.jumlah_uang_penginapan,

            'uang_representasi': form_pembayaran_rampung.uang_representasi,
            'representasi_hari': form_pembayaran_rampung.representasi_hari,
            'jumlah_uang_representasi': form_pembayaran_rampung.jumlah_uang_representasi,

            'id_departure_darat': form_pembayaran_rampung.trans_darat_from,
            'id_arrivals_darat': form_pembayaran_rampung.trans_darat_to,
            'transportasi_darat': form_pembayaran_rampung.uang_trans_darat,

            'id_departure_udara': form_pembayaran_rampung.trans_udara_from,
            'id_arrivals_udara': form_pembayaran_rampung.trans_udara_to,
            'transportasi_udara': form_pembayaran_rampung.uang_trans_udara,

            'id_departure_laut': form_pembayaran_rampung.trans_laut_from,
            'id_arrivals_laut': form_pembayaran_rampung.trans_laut_to,
            'transportasi_laut': form_pembayaran_rampung.uang_trans_laut,

            'sewa_kendaraan': form_pembayaran_rampung.uang_sewa_kendaraan,

            'id_taksi_kedudukan': form_pembayaran_rampung.id_taksi_kedudukan,
            'tarif_dasar_taksi_kedudukan': form_pembayaran_rampung.tarif_dasar_taksi_kedudukan,
            'kali_taksi_kedudukan': form_pembayaran_rampung.kali_taksi_kedudukan,
            'taksi_kedudukan': form_pembayaran_rampung.taksi_kedudukan,

            'id_taksi_lokasi': form_pembayaran_rampung.id_taksi_lokasi,            
            'tarif_dasar_taksi_lokasi': form_pembayaran_rampung.tarif_dasar_taksi_lokasi,
            'kali_taksi_lokasi': form_pembayaran_rampung.kali_taksi_lokasi,
            'taksi_lokasi': form_pembayaran_rampung.taksi_lokasi,

            'total_uang_rampung': form_pembayaran_rampung.total_uang_rampung,
            'total_uang_muka': form_pembayaran_rampung.total_uang_muka,
            'kurang_lebih': form_pembayaran_rampung.kurang_lebih,
        };
        
        $.ajax({
            url: app_config.api_uri + "/rampung",
            type: "PUT",
            data: form_data,
            dataType: "json", // expected format for response              
            jsonp: false,
            beforeSend: function() {
                $('#btn-save-pembayaran-rampung').val('Please wait..');
            },
            success: function(data) {
                $('#btn-save-pembayaran-rampung').val('Save');
                $('#error_message_pembayaran_rampung').find('span').text('[message here]');
                $('#error_message_pembayaran_rampung').hide();
                //table_executor.draw();
                window.location.replace(app_config.base_uri + '/rampung');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.status == 400) {
                    var response = JSON.parse(jqXHR.responseText);
                    //alert(response.message);
                    $('#error_message_pembayaran_rampung').find('span').text(response.message);
                    $('#error_message_pembayaran_rampung').show();
                } 

                if (jqXHR.status == 500) {
                    $('#error_message_pembayaran_rampung').find('span').text("Internal server error");
                    $('#error_message_pembayaran_rampung').show();
                }

                $('#btn-save-pembayaran-rampung').val('Save');
            },
        }); 
        
        //console.info(form_data);
        event.preventDefault();
    }); 
    
    
    $('#table_rampung tbody').on('click', '.btn-detail', function(){
        var id = $(this).data('id');
        $(this).text('wait..');
        $.ajax({
            url: app_config.api_uri + "/rampung/find/"+ id,
            type: "GET",
            dataType: "json", // expected format for response              
            jsonp: false,
            success: function(data) {
                $('#tgl_uang_rampung').text(moment(data.tgl_uang_rampung).format('l'));
                $('#nama_pelaksana').text(data.nama_pelaksana);
                $('#jabatan').text(data.nama_jabatan);
                $('#eselon').text(data.eselon);
                $('#no_spt').text(data.no_spt);
                $('#tgl_spt').text(moment(data.tgl_spt).format('l'));
                $('#no_sppd').text(data.no_sppd);
                $('#tgl_pergi').text(moment(data.tgl_pergi).format('l'));
                $('#tgl_kembali').text(moment(data.tgl_kembali).format('l'));
                $('#tujuan').text(data.tujuan);
                $('#uang_harian').text(accounting.formatMoney(data.uang_harian));
                $('#lama_pelaksanaan').text(data.lama_pelaksanaan);
                $('#jumlah_uang_harian').text(accounting.formatMoney(data.jumlah_uang_harian));

                $('#uang_penginapan').text(accounting.formatMoney(data.uang_penginapan));
                $('#penginapan_hari').text(data.penginapan_hari);
                $('#jumlah_uang_penginapan').text(accounting.formatMoney(data.jumlah_uang_penginapan));

                $('#uang_representasi').text(accounting.formatMoney(data.uang_representasi));
                $('#representasi_hari').text(data.representasi_hari);
                $('#jumlah_uang_representasi').text(accounting.formatMoney(data.jumlah_uang_representasi));

                
                $('#transportasi_darat').text(accounting.formatMoney(data.transportasi_darat));
                $('#transportasi_laut').text(accounting.formatMoney(data.transportasi_laut));
                $('#transportasi_udara').text(accounting.formatMoney(data.transportasi_udara));
                $('#sewa_kendaraan').text(accounting.formatMoney(data.sewa_kendaraan));
                $('#taksi_kedudukan').text(accounting.formatMoney(data.taksi_kedudukan));
                $('#taksi_lokasi').text(accounting.formatMoney(data.taksi_lokasi));

                $('#total_uang_rampung').text(accounting.formatMoney(data.total_uang_rampung));
                $('#total_uang_muka').text(accounting.formatMoney(data.total_uang_muka));
                $('#kurang_lebih').text(accounting.formatMoney(data.kurang_lebih));
                $('#form-modal-detail-uang-rampung').modal('show');
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

});