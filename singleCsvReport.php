<?php
session_start();
if (!isset($_SESSION['email'])) { header('Location: index.php'); }
else { include("config.php"); }

include("header/header.php");
?>











    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">

<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3"><i class="fa fa-bars"></i></button>
<span style="font-size:22px;">Report - CSV File</span>
</nav>
<?php
if(isset($_GET['rid']))
$rid = $_GET['rid'];

if(isset($_GET['uid']))
$user_id = $_GET['uid'];

$sel = "SELECT * FROM table_csv_01 WHERE csv_reportid='$rid' ORDER BY csv_id_auto ASC";
$run = mysqli_query($con,$sel);
$row=mysqli_fetch_array($run);

$zone = $row['csv_zoneid'];
$company = $row['csv_companyid'];
$branch = $row['csv_branchId'];
$date = $row['csv_timeStamp'];

        /////////////////////////////////User Detail
        $sel = "select * from users_table where id='$user_id'";
        $runu = mysqli_query($con,$sel);
        $rowu = mysqli_fetch_array($runu);
        // $user_name = $rowu['fname'];
        $user_email = $rowu['email'];
        $user_name = $rowu['name'];
        /////////////////////////////////Company Detail
        $selc = "select * from company_table where company_id='$company'";
        $runc = mysqli_query($con,$selc);
        $rowc = mysqli_fetch_array($runc);
        $company_name = $rowc['company_title'];
        /////////////////////////////////Branch Detail
        $selb = "select * from branch_table where branch_id='$branch'";
        $runb = mysqli_query($con,$selb);
        $rowb = mysqli_fetch_array($runb);
        $branch_name = $rowb['branch_info_title'];
?>

<div class="container-fluid">
<div class="container">
<div class="row">

<div class="col-md-4">
    NAME: <strong><?php echo $user_name;?></strong>
    </div>

    <div class="col-md-4">
    EMAIL: <strong><?php echo $user_email;?></strong>
    </div>

    <div class="col-md-4">
    DATE: <strong><?php echo $date;?></strong>
    </div>

    <div class="col-md-4">
    COMPANY: <strong><?php echo $company_name;?></strong>
    </div>
    <div class="col-md-4">
    BRANCH <strong><?php echo $branch_name;?></strong>
    </div>


    <table class="table table-bordered">
    <thead>
        <tr>
            <th>S.NO</th>
            <th>ID</th>
            <th>EPC</th>
            <th>PC</th>
            <th>COUNT</th>
            <th>RSSI</th>
            <th>RISS</th>
        </tr>
    </thead>
    <tbody >

    <?php

	$get_report = "SELECT * FROM table_csv_01 WHERE csv_reportid='$rid' ORDER BY csv_id_auto ASC";
	$run_report = mysqli_query($con,$get_report);
		
        $count = 0;
		while($row=mysqli_fetch_array($run_report)){
            $count++;
            echo "<tr>
            <td>".$count."</td>
            <td>".$row["csv_id"]."</td>
            <td>".$row["csv_epc"]."</td>
            <td>".$row["csv_pc"]."</td>
            <td>".$row["csv_count"]."</td>
            <td>".$row["csv_rssi"]."</td>
            <td>".$row["csv_riss"]."</td>
            </tr>";
		}
    
    ?>




    </tbody>
    </table>

</div>
</div>
</div>
</div>
</div>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="js/sb-admin-2.min.js"></script>

</body>
</html>
