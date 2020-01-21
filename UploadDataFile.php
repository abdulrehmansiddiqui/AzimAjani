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
<span style="font-size:22px;">Upload Data Detail</span>
</nav>


<div class="container-fluid">
<div class="container">

<form action="functions.php" method="post" enctype="multipart/form-data">

    <div class="form-group">
        <label>ZONE CENTRE</label>
        <select class="form-control" name="zone_id" id="zone_center" required ></select>
    </div>

    <div class="form-group">
        <label>COMPANY</label>
        <select class="form-control" name="company_id" id="compnay" required ></select>
    </div>

	<div class="form-group">
        <label>LOCATION/BRANCH (BY CODE)</label>
        <select class="form-control" name="branch_id" id="branch" required ></select>
	</div>

    <div id="branch_information"></div>
        <p style="color:red; text-align:center;" id="error_msg"></p>

    <div class="form-group">
        <label>SELECT DATA FILE</label>
        <input type="file" name="file_DATA" id="file_DATA" class="form-control" accept=".csv" required />
        <input type="file" name="file_CSV"  id="file_CSV"  class="form-control" accept=".csv" hidden/>
    </div>
    <!-- <div class="form-group">
        <div class="checkbox">
          <label><input type="checkbox"  name="checkForm" value="1">&nbsp;&nbsp;&nbsp;Calculation Depreciation</label>
        </div>
    </div> -->

    <div class="form-group">
        <div class="col-md-3">
            <button style="width: 100%" type="submit" name="DataFileUpload" class="btn btn-primary">CONFIRMATION</button>
        </div>
    </div>

</form>



</div>
</div>


    <br/><br/><br/>


    </div>
  </div>




<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="js/sb-admin-2.min.js"></script>
<script>

$(document).ready(function(){
    
    $("#branch").change(function(){
        $("#error_msg").html("");
        var branch_id = $("#branch option:selected").val();
        var dataString = "branch_get_detail="+branch_id;
        $.ajax({
          type:"post",
          url:"db.php",
          data: dataString,
          success:function(data) { 
              $("#branch_information").html(data); 
            }
        });
    });

    $("#compnay").change(function(){
       $("#error_msg").html("");
       var compnay_id = $(this).children("option:selected").val();
       var dataString = "compnay_id="+compnay_id;
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
              $("#branch_information").html("");
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
