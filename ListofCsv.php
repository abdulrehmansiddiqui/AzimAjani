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
<span style="font-size:22px;">List - CSV File</span>
</nav>


<div class="container-fluid">
<div class="container">
      <form action="" method="post" >
<div class="row">

<div class="col-lg-12 mb-3">
          <select class="form-control" name="sort" id="search_by">
          <option value="1">Report View By Company & Branch</option>
          <option value="2">Report View By Date</option>
          <option value="3">Report View By Email</option>
          </select>
        </div>

        <div class="col-lg-4 mb-3">
              <label>ZONE CENTRE</label>
              <select class="form-control" name="zone_id" id="zone_center" required ></select>
        </div>
        <div class="col-lg-4 mb-3">
              <label>COMPANY</label>
              <select class="form-control" name="company" id="compnay" required ></select>
        </div>
        <div class="col-lg-4 mb-3">
              <label>LOCATION/BRANCH (BY CODE)</label>
              <select class="form-control" name="branch" id="branch"  ></select>
        </div>
        <div class="col-lg-12 mb-3" id="search_date_area">
          <div class="row" >
            <div class="col-lg-4 mb-3" >
                <Label>Start date</Label>
                <input name="startdate"  id="startdater" type="date" class="form-control" >
            </div>
            <div class="col-lg-4 mb-3">
              <Label>End date</Label>
              <input name="enddate"  id="enddater" type="date" class="form-control" >
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-3" id="search_email_area" >
          <Label>Email</Label>
          <input name='email' id="emailr" type='email' class='form-control' />
        </div>
        
        <div class="col-md-12" >
          <button id="search_btn" name="update" class="btn btn-success" type="submit">Submit</button>
        </div>

        </form>

    <table class="table table-bordered">
    <thead>
    <tr>
      <th>S.NO</th>
      <th>Company</th>
      <th>Branch</th>
      <th>User</th>
      <th>Date</th>
      <th>Check</th>
    </tr>
    </thead>
    <tbody>
    
<?php

if(isset($_POST['update'])){
  $sort = $_POST['sort'];
  $company = $_POST['company'];
  $branch = $_POST['branch'];
  $startdate = $_POST['startdate'];
  $enddate = $_POST['enddate'];
  $email = $_POST['email'];

  if($sort == 1){
    if($company != 0){
      if($branch == 0){
        $sql = "SELECT * FROM csv_list WHERE company_id='$company'";
      }
      else{
        $sql = "SELECT * FROM csv_list WHERE company_id='$company' AND branch_id='$branch'";
      }
    }
  }
  if($sort == 2){
    if($company != 0){
      if($branch == 0){
        $sql = "SELECT * FROM csv_list WHERE company_id='$company' AND date BETWEEN '$startdate' AND '$enddate'";
      }
      else{
        $sql = "SELECT * FROM csv_list WHERE company_id='$company' AND branch_id='$branch' AND date BETWEEN '$startdate' AND '$enddate'";
      }
    }
  }
  if($sort == 3){
    if($company != 0){
      if($branch == 0){
        $sel = "select * from users_table where email='$email'";
        $runu = mysqli_query($con,$sel);
        $rowu = mysqli_fetch_array($runu);
        $newid = $rowu['id'];
  
        $sql = "SELECT * FROM csv_list WHERE company_id='$company' AND user_id='$newid'";
      }
      else{
        $sel = "select * from users_table where email='$email'";
        $runu = mysqli_query($con,$sel);
        $rowu = mysqli_fetch_array($runu);
        $newid = $rowu['id'];
  
        $sql = "SELECT * FROM csv_list WHERE company_id='$company' AND branch_id='$branch' AND user_id='$newid'";
      }
    }
  }


      $run_sql = mysqli_query($con,$sql);
	    $count = 0;
      while($row=mysqli_fetch_array($run_sql)){
        $id = $row['id'];
        $company_id = $row['company_id'];
        $branch_id = $row['branch_id'];
        $user_id = $row['user_id'];
        $date = $row['date'];
        /////////////////////////////////User Detail
          $sel = "select * from users_table where id='$user_id'";
          $runu = mysqli_query($con,$sel);
          $rowu = mysqli_fetch_array($runu);
          // $user_name = $rowu['fname'];
          $user_email = $rowu['email'];
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
          $count++;
          echo "<tr>
          <td>".$count."</td>
          <td>$company_name</td>  
          <td>$branch_name</td>
          <td>$user_email</td>
          <td>$date</td>
          <td><a href='singleCsvReport.php?rid=$id&uid=$user_id'>Open</a></td>
          </tr>";
      }
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
<script>
$(document).ready(function(){

    $("#search_date_area").css("display", "none");
    $("#search_email_area").css("display", "none");
    $("#search_by").change(function(){
        $("#result_report_csv").html("");
        var search_by = $("#search_by option:selected").val();
        if(search_by == "1"){ 
          $("#search_branch_area").css("display", "block");
          $("#search_date_area").css("display", "none");
          $("#search_email_area").css("display", "none");
          $('#emailr').removeAttr('required');
          $('#startdater').removeAttr('required');
          $('#enddater').removeAttr('required');

        }
        if(search_by == "2"){
          $("#search_branch_area").css("display", "none");
          $("#search_date_area").css("display", "block");
          $("#search_email_area").css("display", "none");
          $('#emailr').removeAttr('required');
          $('#startdater').attr('required', 'required');
          $('#enddater').attr('required', 'required');
          
        }
        if(search_by == "3"){ 
          $("#search_branch_area").css("display", "none");
          $("#search_date_area").css("display", "none");
          $("#search_email_area").css("display", "block");
          $('#emailr').attr('required', 'required');
          $('#startdater').removeAttr('required');
          $('#enddater').removeAttr('required');

        }
    });

    $("#compnay").change(function(){
       $("#error_msg").html("");
       var compnay_id = $(this).children("option:selected").val();
       var dataString = "compnay_id_by_search="+compnay_id;
       $.ajax({
           type:"post",
           url:"db.php",
           data: dataString,
           success:function(data) { $("#branch").html(data); }
       });
    });

    $("#zone_center").change(function(){
       $("#error_msg").html("");
       var zone_id = $(this).children("option:selected").val();
       var dataString = "zone_id="+zone_id;
       $.ajax({
           type:"post",
           url:"db.php",
           data: dataString,
           success:function(data) {
              $("#compnay").html(data);
              $("#branch").html("");
          }
       });
    });

    // LOAD ZONE -- db
     $.ajax({
         type:"post",
         url:"db.php",
         data: 'load_zone',
         success:function(data) {
             $("#zone_center").html(data);
             $("#model_company_select_zone").html(data);
             $("#model_branch_select_zone").html(data);
         }
     });

    $("#model_branch_select_zone").change(function(){
       var zone_id = $(this).children("option:selected").val();
       var dataString = "zone_id="+zone_id;
       $.ajax({
           type:"post",
           url:"db.php",
           data: dataString,
           success:function(data) { $("#model_branch_select_company").html(data); }
       });
    });


});

</script>
</body>
</html>
