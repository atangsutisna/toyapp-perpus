<section class="sidebar">
    <!-- Sidebar user panel (optional) -->
    <div class="user-panel">
        <div class="pull-left image">
            <img src="<?= base_url("assets/img/avatar5.png") ?>" class="user-image" alt="User Image"><br/>
        </div>
        <div class="pull-left info">
          <p><?= get_logged_fullname() ?></p>
        </div>
    </div>
      
    <!-- Sidebar Menu -->
    <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <!-- Optionally, you can add icons to the links -->
        <li>
          <a href="<?= site_url('home') ?>">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
          </a>
        </li>
        <li>
            <a href="<?= site_url('user') ?>">
                <i class="fa fa-user"></i><span>User</span>
            </a>
        </li>
        <li>
            <a href="<?= site_url('member') ?>">
                <i class="fa fa-user"></i><span>Anggota</span>
            </a>
        </li>
        <li>
            <a href="<?= site_url('book') ?>">
                <i class="fa fa-sticky-note-o"></i><span>Buku</span>
            </a>
        </li>
        <li>
            <a href="<?= site_url('transaction') ?>">
                <i class="fa fa-sticky-note-o"></i><span>Transaksi</span>
            </a>
        </li>
    </ul>
    <!-- /.sidebar-menu -->
</section>