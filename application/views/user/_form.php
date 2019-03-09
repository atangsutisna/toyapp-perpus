<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        User Baru
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= site_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?= site_url('user') ?>">Users</a></li>
        <li class="active">User Baru</li>
    </ol>
</section>
<div class="content">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">User Baru</h3>
                </div>
                <form role="form" method="post" action="<?= site_url('user/do_reg') ?>" class="form-horizontal">   
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Username</label>
                            <div class="col-lg-3 col-sm-3">
                                <input type="text" name="username" 
                                    class="form-control" value="<?= set_value('username') ?>"/>
                                <?= form_error('username') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Nama Lengkap</label>
                            <div class="col-4 col-lg-4 col-sm-4">
                                <input type="text" name="fullname" 
                                    class="form-control" value="<?= set_value('fullname') ?>"/>
                                <?= form_error('fullname') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Email</label>
                            <div class="col-4 col-lg-4 col-sm-4">
                                <input type="email" name="email" 
                                    class="form-control" value="<?= set_value('email') ?>"/>
                                <?= form_error('email') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">No. Telepon</label>
                            <div class="col-lg-3 col-sm-3">
                                <input type="text" name="mobile_phone" 
                                    class="form-control" value="<?= set_value('mobile_phone') ?>"/>
                                <?= form_error('mobile_phone') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Level</label>
                            <div class="col-3 col-lg-3 col-sm-3">
                                <?php
                                    $role_opts = [
                                        'admin' => 'Admin',
                                        'user' => 'User',
                                    ];
                                    echo form_dropdown('level', $role_opts, 'user', ['class' => 'form-control']);
                                ?>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Password</label>
                            <div class="col-lg-3 col-sm-3">
                                <input type="password" name="password" class="form-control"/>
                                <?= form_error('password') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 col-sm-3 control-label">Ketik Lagi Password</label>
                            <div class="col-lg-3 col-sm-3">
                                <input type="password" name="retype_password" class="form-control"/>
                                <?= form_error('retype_password') ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-3 col-sm-offset-3" style="margin-left: 26.5%;">
                                <button type="submit" class="btn btn-primary">Simpan</button>
                                <?= anchor('user', 'Cancel', ['class' => 'btn btn-default']) ?>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>