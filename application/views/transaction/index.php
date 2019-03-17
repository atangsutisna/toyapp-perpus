<section class="content-header">
    <h1>
        Transaksi
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= site_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Transaksi</li>
    </ol>
</section>
<div class="content">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-12">
            <?= show_bootstrap_alert() ?>
            <div class="box">
                <div class="box-body">
                    <p><a href="<?= site_url('transaction/new_form') ?>" class="btn btn-primary">Transaksi Baru</a></p>
                    <div class="table-responsive">
                        <table class="table table-striped" id="table_transaction" cellspacing="0" width="100%">
                            <thead>
                                <th>Tgl Perubahan</th>
                                <th>Peminjam</th>
                                <th>Buku</th>
                                <th>Tgl Pinjam</th>
                                <th>Tgl Kembali</th>
                                <th>Status</th>
                                <th>#</th>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>