<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Profil
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= site_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Profil</li>
    </ol>
</section>
<div class="content">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Profil</h3>
                </div>
                <form role="form" method="post" action="<?= site_url('user/do_update') ?>" class="form-horizontal">   
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Username</label>
                            <div class="col-7 col-lg-7 col-sm-7">
                                <?= form_hidden('id', $user->id) ?>
                                <p class="form-control-static"><?= $user->username ?></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Nama Lengkap</label>
                            <div class="col-5 col-lg-5 col-sm-5">
                                <input type="text" name="fullname" 
                                    class="form-control" value="<?= set_value('fullname', isset($user->nama) ? $user->nama : '') ?>"/>
                                <?= form_error('fullname') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Email</label>
                            <div class="col-5 col-lg-5 col-sm-5">
                                <input type="email" name="email" 
                                    class="form-control" value="<?= set_value('email', isset($user->email) ? $user->email : '') ?>"/>
                                <?= form_error('email') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">No. Telepon</label>
                            <div class="col-lg-3 col-sm-3">
                                <input type="text" name="mobile_phone" 
                                    class="form-control" value="<?= set_value('mobile_phone', isset($user->mobile_phone) ? $user->mobile_phone : '') ?>"/>
                                <?= form_error('mobile_phone') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Level</label>
                            <div class="col-4 col-lg-4 col-sm-4">
                                <?= ucfirst($user->level) ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-3 col-sm-offset-3" style="margin-left: 26.5%;">
                                <button type="submit" class="btn btn-primary">Simpan</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>