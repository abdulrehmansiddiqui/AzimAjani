
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Users</title>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>

  <div id="wrapper">
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="home.php">
        <div class="sidebar-brand-text mx-3">Jazsoft</div>
      </a>
      <hr class="sidebar-divider my-0">
      <li class="nav-item active">
        <a class="nav-link" href="home.php">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

        <?php
        if($_SESSION["role"] === '1'){?>
          <hr class="sidebar-divider">
          <li class="nav-item active"><a class="nav-link" href="add_view_data.php"><i class="fa fa-plus-circle" aria-hidden="true"></i><span>Add / View Data</span></a></li>
          <hr class="sidebar-divider">
          <li class="nav-item active"><a class="nav-link" href="users.php"><i class="fas fa-plus"></i><span>Create Users</span></a></li>
          <hr class="sidebar-divider">
          <li class="nav-item active"><a class="nav-link" href="viewUsers.php"><i class="fas fa-users"></i><span>View Users</span></a></li>
          <hr class="sidebar-divider">
          <li class="nav-item active"><a class="nav-link" href="ListofData.php"><i class="fa fa-file"></i><span>Data Files</span></a></li>
          <hr class="sidebar-divider">
          <li class="nav-item active"><a class="nav-link" href="ListofCsv.php"><i class="fa fa-file"></i><span>CSV Files</span></a></li>
          <hr class="sidebar-divider">
          <li class="nav-item active"><a class="nav-link" href="ListofReport.php"><i class="fa fa-file"></i><span>Report Data File</span></a></li>
          <hr class="sidebar-divider">
          <li class="nav-item active"><a class="nav-link" href="viewReports_extra.php"><i class="fa fa-file"></i><span>Report Extra Items</span></a></li>
        <?php } ?>

      <hr class="sidebar-divider">
      <li class="nav-item active">
        <a class="nav-link" href="settings.php"><i class="fas fa-cog"></i><span>Settings</span></a>
      </li>
      
      <hr class="sidebar-divider">
      <li class="nav-item active">
        <a class="nav-link" href="logout.php">
          <i class="fas fa-sign-out-alt"></i>
          <span>Logout</span></a>
      </li>
      <hr class="sidebar-divider">
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>
    </ul>






