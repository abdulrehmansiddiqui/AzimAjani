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
<span style="font-size:22px;">Report File</span>
</nav>
<?php
if(isset($_GET['rid']))
$rid = $_GET['rid'];

if(isset($_GET['uid']))
$user_id = $_GET['uid'];


$sel = "select * from table_data_csv where report_id='$rid'";
$run = mysqli_query($con,$sel);
$row = mysqli_fetch_array($run);
$branch = $row['branchId'];
$date = $row['dateTime_split_UpdateTable'];

// $date = $row['data_timeStamp'];

        /////////////////////////////////User Detail
        $sel = "select * from users_table where id='$user_id'";
        $runu = mysqli_query($con,$sel);
        $rowu = mysqli_fetch_array($runu);
        // $user_name = $rowu['fname'];
        $user_email = $rowu['email'];
        $user_name = $rowu['name'];
        /////////////////////////////////Branch Detail
        $selb = "select * from branch_table where branch_id='$branch'";
        $runb = mysqli_query($con,$selb);
        $rowb = mysqli_fetch_array($runb);
        $branch_title = $rowb['branch_title'];
        $branch_name = $rowb['branch_info_title'];
        $branch_address = $rowb['branch_info_address'];
        $branch_phone = $rowb['branch_info_phone'];
        $branch_email = $rowb['email'];
        $company = $rowb['company_id_fk'];
        /////////////////////////////////Company Detail
        $selc = "select * from company_table where company_id='$company'";
        $runc = mysqli_query($con,$selc);
        $rowc = mysqli_fetch_array($runc);
        $company_name = $rowc['company_title'];
?>

<div class="container-fluid">
<div class="container">
<div class="row">

<div class='col-md-12 text-center' style="margin-bottom:30px;">
    <h3><strong>HORIZON RFID BUSSINEES VENTURES</strong></h3>
    <strong>Address: </strong>40k Block 2 PECHS karachi<br>
    <strong>Phone: </strong>0333 1234567<br>
</div>


<?php
    $uniqueid = str_pad($rid + 1, 5, 0, STR_PAD_LEFT);
    $year = new DateTime($date);
echo"
    <div class='col-md-6'>
        <h3><strong>$branch_title</strong></h3>
        <strong>Address: </strong>$branch_address<br>
        <strong>Phone: </strong>$branch_phone<br>
        <strong>Code: </strong>$branch_name<br>
        <strong>Email: </strong>$branch_email<br>
    </div>
    <div class='col-md-6'>
        <strong>Date: </strong>$date<br>
        <strong>Report ID: </strong>$company_name - ".$year->format('Y')." / $branch_name / $uniqueid<br>
        <strong>Name: </strong>$user_name<br>
        <strong>Email: </strong>$user_email<br>
    </div>
";
?>
    <table class="table table-bordered" style="margin-top:20px;">
    <thead>
        <tr>
            <th>S.NO</th>
            <th>Asset ID</th>
            <th>Asset Name</th>
            <th>Total Value</th>
            <th>Current Value</th>
            <th>Depreciation</th>
            <th>NET Value</th>
            <th>Life In Year</th>
            <th>Date</th>
        </tr>
    </thead>
    <tbody >

<?php

  $get_report = "SELECT * FROM table_data_01 WHERE data_reportid='$rid' ORDER BY data_id_auto ASC";

  $sql = "SELECT * FROM table_data_csv INNER JOIN branch_table ON table_data_csv.branchId = branch_table.branch_id WHERE branch_table.branch_id='$branch' AND report_id='$rid'";
  $result = $con->query($sql);
  $count = 0;
  while($row = $result->fetch_assoc()) {
        $Total_lifeInYear = (int)$row['lifeInYear'];
        $Total_remaningLifeInYear = (int)$row['lifeInYear_update'];
        $remaningYear = $Total_lifeInYear - $Total_remaningLifeInYear;
        $count++;
        echo "<tr>
        <td>".$count."</td>
        <td>".$row["assetID"]."</td>
        <td>".$row["assetName"]."</td>
        <td>".$row["totalValue"]."</td>
        <td>".$row["last_netValue"]."</td>
        <td>".$row["depreciation"]."</td>
        <td>".$row["netValue"]."</td>
        <th>".$Total_lifeInYear.' / '.$remaningYear."</th>
        <td>".$row["lastReport_dateTime"]."</td>
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
