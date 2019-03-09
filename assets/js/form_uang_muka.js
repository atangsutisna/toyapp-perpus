var form_uang_muka = new Vue({
    el: '#form-uang-muka',
    mounted: function() {
        console.info('form pembayaran uang muka is created');
    },
    data: {
        id_uang_muka: null,
        nama_pelaksana: null,
        nama_jabatan: null,
        eselon: null,
        no_spt: null,
        tgl_spt: null,
        id_rek_belanja: null,
        id_kategori_pelaksana: null,
        no_sppd: null,
        tgl_pergi: null,
        tgl_kembali: null,
        tujuan: null,

        lama_pelaksanaan: 0,
        uang_harian: 0,
        jumlah_uang_harian: 0,

        uang_penginapan: 0,
        penginapan_hari: 0,
        jumlah_uang_penginapan: 0,

        uang_representasi: 0,
        representasi_hari: 0,
        jumlah_uang_representasi: 0,

        uang_trans_udara: 0,
        uang_trans_darat: 0,
        uang_trans_laut: 0,
        uang_sewa_kendaraan: 0,

        id_taksi_kedudukan: 0,
        kali_taksi_kedudukan: 0,
        tarif_dasar_taksi_kedudukan: 0,
        taksi_kedudukan: 0,

        id_taksi_lokasi: 0,
        kali_taksi_lokasi: 0,
        tarif_dasar_taksi_lokasi: 0,
        taksi_lokasi: 0,

        total_uang_muka: 0,

        trans_darat_from: null,
        departure_darat_choices: [],
        trans_darat_to: null,
        arrival_darat_choices: [],

        trans_laut_from: null,
        departure_laut_choices: [],
        trans_laut_to: null,
        arrival_laut_choices: [],
        
        trans_udara_from: null,
        departure_udara_choices: [],
        trans_udara_to: null,
        arrival_udara_choices: [],

        taksi_departure_choices: [],
        taksi_arrival_choices: []
    },
    methods: {
        init_jumlah_uang_harian: function() {
            if (!this.jumlah_uang_harian) {
                this.jumlah_uang_harian = 0;
            }
        },
        init_jumlah_uang_penginapan: function() {
            if (!this.jumlah_uang_penginapan) {
                this.jumlah_uang_penginapan = 0;
            }
        },
        init_jumlah_uang_representasi: function() {
            if (!this.jumlah_uang_representasi) {
                this.jumlah_uang_representasi = 0;
            }
        },
        init_uang_sewa_kendaraan: function() {
            if (!this.uang_sewa_kendaraan) {
                this.uang_sewa_kendaraan = 0;
            }
        },
        init_taksi_kedudukan: function() {
            if (!this.taksi_kedudukan) {
                this.taksi_kedudukan = 0;
            }
        },
        init_taksi_lokasi: function() {
            if (!this.taksi_lokasi) {
                this.taksi_lokasi = 0;
            }
        },
        init_uang_trans_udara: function() {
            if (!this.uang_trans_udara) {
                this.uang_trans_udara = 0;
            }
        },
        init_uang_trans_darat: function() {
            if (!this.uang_trans_darat) {
                this.uang_trans_darat = 0;
            }
        },
        init_uang_trans_laut: function() {
            if (!this.uang_trans_laut) {
                this.uang_trans_laut = 0;
            }
        },
        calculate: function() {
            var pengeluaran = [
                this.jumlah_uang_harian, this.jumlah_uang_penginapan, this.jumlah_uang_representasi,
                this.uang_trans_udara, this.uang_trans_darat, this.uang_trans_laut,
                this.uang_sewa_kendaraan, this.taksi_kedudukan, this.taksi_lokasi
            ];

            this.total_uang_muka = 0
            app = this;
            pengeluaran.forEach(function(item, idx){
                item = parseFloat(item);
                console.info("item: "+ item + ", index: "+ idx);
                if (!isNaN(item)) {
                    app.total_uang_muka += item;
                }
            });
            //this.total_uang_muka = pengeluaran.reduce((a, b) => parseFloat(a) + parseFloat(b), 0);
        },
        calculate_taxi_kedudukan: function() {
            app = this;
            app.taksi_kedudukan = app.tarif_dasar_taksi_kedudukan * app.kali_taksi_kedudukan;
            app.calculate();
        },
        calculate_taksi_lokasi: function() {
            app = this;
            app.taksi_lokasi = app.tarif_dasar_taksi_lokasi * app.kali_taksi_lokasi;
            app.calculate();            
        },
        find_cost_taksi_kedudukan: function() {
            app = this;
            axios.get(app_config.api_uri + '/taxi_cost/' + app.id_taksi_kedudukan)
            .then(function (response) {
                console.log(response.status);
                app.tarif_dasar_taksi_kedudukan = parseFloat(response.data.tarif);
                app.kali_taksi_kedudukan = parseFloat(1);
                app.taksi_kedudukan = app.tarif_dasar_taksi_kedudukan * app.kali_taksi_kedudukan;
                app.calculate();
            }).catch(function (error) {
                console.log(error);
                app.tarif_dasar_taksi_kedudukan = 0;
                app.kali_taksi_kedudukan = 0;
                app.taksi_kedudukan = 0;
                app.calculate();
            });            
        },
        find_cost_taksi_lokasi: function() {
            app = this;
            axios.get(app_config.api_uri + '/taxi_cost/' + app.id_taksi_lokasi)
            .then(function (response) {
                console.log(response.data);
                app.tarif_dasar_taksi_lokasi = parseFloat(response.data.tarif);
                app.kali_taksi_lokasi = parseFloat(1);
                app.taksi_lokasi = app.tarif_dasar_taksi_lokasi * app.kali_taksi_lokasi;
                app.calculate();
            }).catch(function (error) {
                console.log(error);
                app.tarif_dasar_taksi_lokasi = 0;
                app.taksi_lokasi = 0;
                app.kali_taksi_lokasi = 0;
                app.calculate();
            });
        },
        find_cost_trans_udara: function() {
            app = this;
            console.info('trans dara to id '+ app.trans_udara_to);
            axios.post(app_config.api_uri + '/trans_cost_udara', {
                id_arrival: app.trans_udara_to,
                id_rek_belanja: app.id_rek_belanja,
                id_kategori_pelaksana: app.id_kategori_pelaksana
            }).then(function (response) {
                console.log(response.data);
                app.uang_trans_udara = response.data.biaya;
                app.calculate();
            }).catch(function (error) {
                console.log(error);
                app.uang_trans_udara = 0;
                app.calculate();
            });            
        },
        find_cost_trans_darat: function() {
            app = this;
            axios.post(app_config.api_uri + '/trans_cost_darat', {
                id_arrival: app.trans_darat_to,
                id_rek_belanja: app.id_rek_belanja,
                id_kategori_pelaksana: app.id_kategori_pelaksana
            }).then(function (response) {
                console.log(response.data);
                app.uang_trans_darat = response.data.biaya;
                app.calculate();
            }).catch(function (error) {
                console.log(error);
                app.uang_trans_darat = parseFloat(0);
                app.calculate();
            });            
        },
        find_cost_trans_laut: function() {
            app = this;
            axios.post(app_config.api_uri + '/trans_cost_laut', {
                id_arrival: app.trans_laut_to,
                id_rek_belanja: app.id_rek_belanja,
                id_kategori_pelaksana: app.id_kategori_pelaksana
            }).then(function (response) {
                console.log(response.data);
                app.uang_trans_laut = response.data.biaya;
                app.calculate();
            }).catch(function (error) {
                console.log(error);
                app.uang_trans_laut = parseFloat(0);
                app.calculate();
            });            
        },

    },
    watch: {
        lama_pelaksanaan: function(val) {
            var id_sppd = $('#id_sppd').val();
            console.info('id_sppd: '+ id_sppd);
            var app = this;
            if (val !== null || val > 0) {
                axios.
                get(app_config.api_uri + '/basic_cost/'+ id_sppd).
                then(function(response){
                    if (app.uang_harian <= 0) {
                        app.uang_harian = parseFloat(response.data.uang_harian);
                    }

                    if (app.uang_penginapan <= 0) {
                        app.uang_penginapan = parseFloat(response.data.uang_penginapan);
                    }

                    if (app.uang_representasi <= 0) {
                        app.uang_representasi = parseFloat(response.data.uang_representasi);
                    }

                    app.penginapan_hari = app.lama_pelaksanaan - 1;
                    if (app.penginapan_hari <= 0) {
                        app.penginapan_hari = 1;
                    }
                    app.jumlah_uang_harian = parseInt(app.lama_pelaksanaan) * app.uang_harian;
                    app.jumlah_uang_penginapan = parseInt(app.penginapan_hari) * app.uang_penginapan;
                    app.jumlah_uang_representasi = parseInt(app.lama_pelaksanaan) * app.uang_representasi;
                });
            }
        },
        penginapan_hari: function(val) {
            if (val) {
                this.jumlah_uang_penginapan = this.uang_penginapan * val;
                this.calculate();
            }
        },
        uang_trans_udara: function(val) {
            if (val) {
                this.calculate();
            }

        },
        uang_trans_darat: function(val) {
            if (val) {
                this.calculate();
            }
        },
        uang_trans_laut: function(val) {
            if (val) {
                this.calculate();
            }
        },
        uang_sewa_kendaraan: function(val) {
            if (val) {
                this.calculate();
            }
        },
        uang_harian: function(val) {
            app = this;
            if (app.uang_harian) {
                app.jumlah_uang_harian = parseInt(app.lama_pelaksanaan) * app.uang_harian;
                app.calculate();
            } 
        },
        uang_penginapan: function(val) {
            app = this;
            if (app.penginapan_hari) {
                app.jumlah_uang_penginapan = parseInt(app.penginapan_hari) * app.uang_penginapan;
                app.calculate();
            }
        },
        uang_representasi: function(val) {
            console.info('recalculate representasi');
            app = this;
            if (app.uang_representasi) {
                app.jumlah_uang_representasi = parseInt(app.lama_pelaksanaan) * app.uang_representasi;
                app.calculate();
            }
        },
        kali_taksi_kedudukan: function(val) {
            this.taksi_kedudukan = val * this.tarif_dasar_taksi_kedudukan;
            this.calculate();        
        },
        kali_taksi_lokasi: function(val) {
            this.taksi_lokasi = val * this.tarif_dasar_taksi_lokasi;
            this.calculate();        
        }

    }
});