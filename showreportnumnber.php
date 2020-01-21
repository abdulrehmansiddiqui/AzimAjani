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
<span style="font-size:22px;">Genrated Report Number</span>
</nav>
<style>table.table.table-bordered { font-size: 12px; }</style>


<div class="container-fluid text-center">

<?php
  if(isset($_GET['Rid'])){
    $get_id = $_GET['Rid'];
    
    $sql = "SELECT * FROM report_list WHERE id='$get_id'";
    $runu = mysqli_query($con,$sql);
    $rowu = mysqli_fetch_array($runu);
    $zone_id = $rowu['zone_id'];
    $company_id = $rowu['company_id'];
    $branch_id = $rowu['branch_id'];
    $date = $rowu['date'];


          /////////////////////////////////Company Detail
          $selc = "select * from company_table where company_id='$company_id'";
          $runc = mysqli_query($con,$selc);
          $rowc = mysqli_fetch_array($runc);
          $company_name = $rowc['company_title'];
          /////////////////////////////////Branch Detail
          $selb = "select * from branch_table where branch_id='$branch_id'";
          $runb = mysqli_query($con,$selb);
          $rowb = mysqli_fetch_array($runb);
          $branch_name = $rowb['branch_info_title'];
          /////////////////////////////////
          $datetime = new DateTime($date);

          $uniqueid = str_pad($get_id , 5, 0, STR_PAD_LEFT);

          echo "<h1>$company_name - ".$datetime->format('Y')." / $branch_name / $uniqueid</h1>";


  }
?>
      
</div>
</div>
</div>


</body>
</html>
