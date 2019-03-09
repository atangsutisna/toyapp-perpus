<section class="content-header">
    <h1>
        Anggota
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= site_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Anggota</li>
    </ol>
</section>
<div class="content">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-12">
            <?= show_bootstrap_alert() ?>
            <div class="box">
                <div class="box-body">
                    <p><a href="<?= site_url('member/reg_form') ?>" class="btn btn-primary">Member Baru</a></p>
                    <div class="table-responsive">
                        <table class="table table-striped" id="table_member" cellspacing="0" width="100%">
                            <thead>
                                <th>Tanggal</th>
                                <th>No.</th>
                                <th>Nama</th>
                                <th>JK</th>
                                <th>Tempat/Tanggal Lahir</th>
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