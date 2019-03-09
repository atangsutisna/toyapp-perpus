<section class="content-header">
    <h1>
        Buku
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= site_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Buku</li>
    </ol>
</section>
<div class="content">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-12">
            <?= show_bootstrap_alert() ?>
            <div class="box">
                <div class="box-body">
                    <p><a href="<?= site_url('book/reg_form') ?>" class="btn btn-primary">Buku Baru</a></p>
                    <div class="table-responsive">
                        <table class="table table-striped" id="table_book" cellspacing="0" width="100%">
                            <thead>
                                <th>Tgl Perubahan</th>
                                <th>ISBN</th>
                                <th>Judul</th>
                                <th>Pengarang</th>
                                <th>Penerbit</th>
                                <th>Thn Terbit</th>
                                <th>Jml</th>
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