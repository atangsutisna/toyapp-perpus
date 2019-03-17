<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Member Baru
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= site_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= site_url('member') ?>">Members</a></li>
        <li class="active">Member Baru</li>
    </ol>
</section>
<div class="content">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Member</h3>
                </div>
                <form role="form" method="post" action="<?= site_url($form_action) ?>" class="form-horizontal">   
                    <div class="box-body">
                        <?= show_bootstrap_alert() ?>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">NIM</label>
                            <div class="col-lg-3 col-sm-3">
                                <input type="text" name="nim" 
                                    class="form-control" value="<?= set_value('nim', isset($member) ? $member->nim : '') ?>"/>
                                <?= form_error('nim') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Nama Lengkap</label>
                            <div class="col-4 col-lg-4 col-sm-4">
                                <input type="text" name="nama" 
                                    class="form-control" value="<?= set_value('nama', isset($member) ? $member->nama : '') ?>"/>
                                <?= form_error('nama') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Tempat/Tgl Lahir</label>
                            <div class="col-4 col-lg-4 col-sm-4">
                                <input type="text" name="tempat_lahir" 
                                    class="form-control" value="<?= set_value('tempat_lahir', isset($member) ? $member->tempat_lahir : '') ?>"/>
                                <?= form_error('tempat_lahir') ?>
                            </div>
                            <div class="col-3 col-lg-3 col-sm-3">
                                <input type="date" name="tgl_lahir" 
                                    class="form-control" value="<?= set_value('tgl_lahir', isset($member) ? $member->tgl_lahir : '') ?>"/>
                                <?= form_error('tgl_lahir') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Jenis Kelamin</label>
                            <div class="col-3 col-lg-3 col-sm-3">
                                <?= form_radio('jk', 'L', isset($member) ? ($member->jk == 'L') : FALSE) ?> Laki-laki
                                <?= form_radio('jk', 'P', isset($member) ? ($member->jk == 'P') : FALSE) ?> Perempuan
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Prodi</label>
                            <div class="col-4 col-lg-4 col-sm-4">
                                <input type="text" name="prodi" 
                                    class="form-control" value="<?= set_value('prodi', isset($member) ? $member->prodi : '') ?>"/>
                                <?= form_error('prodi') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Tahun Masuk</label>
                            <div class="col-4 col-lg-4 col-sm-4">
                                <input type="text" name="thn_masuk" 
                                    class="form-control" value="<?= set_value('thn_masuk', isset($member) ? $member->thn_masuk : '') ?>"/>
                                <?= form_error('thn_masuk') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-3 col-sm-offset-3" style="margin-left: 26.5%;">
                                <button type="submit" class="btn btn-primary">Simpan</button>
                                <?= anchor('member', 'Kembali', ['class' => 'btn btn-default']) ?>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>