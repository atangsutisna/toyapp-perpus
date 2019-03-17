<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Buku Baru
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= site_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= site_url('book') ?>">Members</a></li>
        <li class="active">Buku Baru</li>
    </ol>
</section>
<div class="content">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Buku</h3>
                </div>
                <form role="form" method="post" action="<?= site_url($form_action) ?>" class="form-horizontal">   
                    <div class="box-body">
                        <?= show_bootstrap_alert() ?>
                        <?= form_hidden('id', isset($book) ? $book->id : NULL) ?>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Judul</label>
                            <div class="col-lg-3 col-sm-3">
                                <input type="text" name="judul" 
                                    class="form-control" value="<?= set_value('judul', isset($book) ? $book->judul : '') ?>"/>
                                <?= form_error('judul') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Pengarang</label>
                            <div class="col-4 col-lg-4 col-sm-4">
                                <input type="text" name="pengarang" 
                                    class="form-control" value="<?= set_value('pengarang', isset($book) ? $book->pengarang : '') ?>"/>
                                <?= form_error('pengarang') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Penerbit/Tahun Terbit</label>
                            <div class="col-4 col-lg-4 col-sm-4">
                                <input type="text" name="penerbit" 
                                    class="form-control" value="<?= set_value('penerbit', isset($book) ? $book->penerbit : '') ?>"/>
                                <?= form_error('penerbit') ?>
                            </div>
                            <div class="col-3 col-lg-3 col-sm-3">
                                <input type="number" name="thn_terbit" 
                                    class="form-control" value="<?= set_value('thn_terbit', isset($book) ? $book->thn_terbit : '') ?>"/>
                                <?= form_error('thn_terbit') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">ISBN</label>
                            <div class="col-4 col-lg-4 col-sm-4">
                                <input type="text" name="isbn" 
                                    class="form-control" value="<?= set_value('isbn', isset($book) ? $book->isbn : '') ?>"/>
                                <?= form_error('isbn') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Jumlah Buku</label>
                            <div class="col-2 col-lg-2 col-sm-2">
                                <input type="number" name="jumlah_buku" 
                                    class="form-control" value="<?= set_value('jumlah_buku', isset($book) ? $book->jumlah_buku : '') ?>"/>
                                <?= form_error('jumlah_buku') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Tahun Masuk</label>
                            <div class="col-4 col-lg-4 col-sm-4">
                                <?= form_dropdown('lokasi', [
                                    'rak1' => 'Rak 1',
                                    'rak2' => 'Rak 2',
                                    'rak3' => 'Rak 3',
                                ], isset($book->lokasi) ? $book->lokasi : NULL, 'class="form-control"') ?>
                                <?= form_error('lokasi') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-3 col-sm-offset-3" style="margin-left: 26.5%;">
                                <button type="submit" class="btn btn-primary">Simpan</button>
                                <?= anchor('book', 'Kembali', ['class' => 'btn btn-default']) ?>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>