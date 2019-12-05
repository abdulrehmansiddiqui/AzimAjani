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
<span style="font-size:22px;">Information Detail</span>
</nav>


        <div class="container-fluid">
        <div class="container">

<form action="functions.php" method="post" enctype="multipart/form-data">
  <?php 
  if($_SESSION["role"] === '1'){?>
    <button data-toggle="modal" data-target="#add_zone" style="margin-bottom:20px; margin-top:40px;" class="btn btn-success"><i class="fa fa-plus"></i> Add ZONE CENTRE</button>
  <?php } ?>
  

  <div class="form-group">
    <label>ZONE CENTRE</label>
    <select class="form-control" name="zone_id" id="zone_center"></select>
  </div>


  <?php 
  if($_SESSION["role"] === '1'){?>
<button data-toggle="modal" data-target="#add_compnay" style="margin-bottom:20px; margin-top:40px;" class="btn btn-success"><i class="fa fa-plus"></i> Add COMPANY</button>
  <?php } ?>
  
  <div class="form-group">
    <label>COMPANY</label>
    <select class="form-control" name="company_id" id="compnay"></select>
  </div>


  <?php 
  if($_SESSION["role"] === '1'){?>
<button data-toggle="modal" data-target="#add_branch" style="margin-bottom:20px; margin-top:40px;" class="btn btn-success"><i class="fa fa-plus"></i> Add LOCATION/BRANCH (BY CODE)</button>
  <?php } ?>
  
	<div class="form-group">
	<label>LOCATION/BRANCH (BY CODE)</label>
    <select class="form-control" name="branch_id" id="branch"></select>
	</div>


    <div id="branch_information"></div>
    <p style="color:red; text-align:center;" id="error_msg"></p>


  	<div class="row" id="area1">
  	<div class="col-sm-6"><button style="width: 100%" id="CONFIRMATION_btn" class="btn btn-primary">CONFIRMATION</button></div>
  	<div class="col-sm-6"><a href="logout.php"><button style="width: 100%" class="btn btn-danger">CANCEL</button></a></div>
  	</div>

    <div class="row" id="area2" style="display:none">
        <div style="margin-left:15px; margin-bottom:20px;">
            
        <span id="dataFile_area">
          <h3>Upload Data File First Then Upload CSV </h3>
        </span>
        
        <span id="CSVFile_area">
          <div style="margin-top:20px; margin-bottom:20px;" >
            <label>SELECT SCANNED FILE - 01</label>
            <input type="file" name="file_CSV" class="form-control" accept=".csv" required />
          </div>
          <div style="margin-top:20px; margin-bottom:20px;">
          <label>SELECT SCANNED FILE - 02</label>
          <input type="file" name="file_CSV_02" class="form-control" accept=".csv">
          </div>
          <div style="margin-top:20px; margin-bottom:20px;">
          <label>SELECT SCANNED FILE - 03</label>
          <input type="file" name="file_CSV_03" class="form-control" accept=".csv">
          </div>
        </span>

        <div class="row" id="area3">
        <div class="col-sm-6">
        <button style="width: 100%" type="submit" name="Import" id="CONFIRMATION_btn2" class="btn btn-primary">CONFIRMATION</button>
        </div>
        <div class="col-sm-6">
          <button style="width: 100%" id="CANCEL_btn2" class="btn btn-danger">CANCEL</button>
        </div>
        </div>
        </div>
        </div>
        
    </form>

            
            
        </div>
        </div>


    <br/><br/><br/>


    </div>
  </div>








  <!-- (Start) Add Zone ( Model ) -->
  <div class="modal fade" id="add_zone" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add ZONE CENTRE</h4>
        </div>
        <div class="modal-body">
          <div class="form-group"><label>Zone Name:</label><input type="text" class="form-control" id="model_zone_name"></div>
          <p id="add_zone_submit_button_error" style="text-align:center; color:red;"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-success" id="add_zone_submit_button">Submit</button>
        </div>
      </div>
    </div>
  </div>
  <!-- (End) Add Zone ( Model ) -->


  <!-- (Start) Add Compnay ( Model ) -->
  <div class="modal fade" id="add_compnay" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add Compnay</h4>
        </div>
        <div class="modal-body">

             <div class="form-group">
             <label>Select Zone</label>
             <select class="form-control" id="model_company_select_zone"></select>
             </div> 
             <div class="form-group"><label>Compnay Name:</label><input type="text" class="form-control" id="model_company_name"></div>
             <p id="add_compnay_submit_error" style="text-align:center; color:red;"></p>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-success" id="add_compnay_submit_button">Submit</button>
        </div>
      </div>
    </div>
  </div>
  <!-- (End) Add COMPANY ( Model ) -->


  <!-- (Start) Add BRANCH ( Model ) -->
  <div class="modal fade" id="add_branch" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add Location / Branch (BY CODE)</h4>
        </div>
        <div class="modal-body">

             <div class="form-group">
             <label>Select Zone</label>
             <select class="form-control" id="model_branch_select_zone"></select>
             </div> 

             <div class="form-group">
             <label for="sel1">Select Company</label>
             <select class="form-control" id="model_branch_select_company">
             </select>
             </div>

             <div class="form-group">
             <label>Branch Code:</label>
             <input id="model_branch_code" type="text" class="form-control">
             </div>

             <div class="form-group"><label>Name:</label><input id="branch_name" type="text" class="form-control"></div>
             <div class="form-group"><label>Address:</label><input id="branch_address" type="text" class="form-control"></div>
             <div class="form-group"><label>Phone Number:</label><input id="branch_phoneNum" type="number" class="form-control"></div>
             <div class="form-group"><label>Email:</label><input id="branch_email" type="text" class="form-control"></div>
             <p id="add_branch_submit_error" style="text-align:center; color:red;"></p>
             
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-success" id="add_branch_submit_button">Submit</button>
        </div>
      </div>
    </div>
  </div>
  <!-- (End) Add COMPANY ( Model ) -->



<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="js/sb-admin-2.min.js"></script>
<script>
$("#branch").change(function(){
    $("#error_msg").html("");
    var compnay_id = $("#compnay option:selected").val();
    var dataString = "branch_get_detail="+compnay_id;
    $.ajax({
      type:"post",
      url:"db.php",
      data: dataString,
      success:function(data) {
        $("#branch_information").html(data);
      }
    });
});

$(document).ready(function(){
    
    $("#branch").change(function(){
        $("#error_msg").html("");
        var compnay_id = $("#compnay option:selected").val();
        var dataString = "branch_get_detail="+compnay_id;
        $.ajax({
          type:"post",
          url:"db.php",
          data: dataString,
          success:function(data) { $("#branch_information").html(data); }
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

    $("#CONFIRMATION_btn").click(function(){
        var dataFileWork = $("#dataFileWork_usingBranchId").val();
        if(dataFileWork == "true" || dataFileWork == "false")
        {
            if(dataFileWork == "true"){
                $('#file_DATA').removeAttr('required');
                $("#dataFile_area").css("display", "none");
            }
            var selectedVal = $("#branch option:selected").val();
            if(selectedVal > 0){
              $("#error_msg").html("");
              $("#area1").css("display", "none");
              $("#area2").css("display", "block");
            }
            else { $("#error_msg").html("Please select all the fields..."); }
        }
        else {
            var selectedVal = $("#branch option:selected").val();
            if(selectedVal > 0){}
            else { $("#error_msg").html("Please select all the fields..."); }
        }
    });

    $("#CANCEL_btn2").click(function(){
    //   $("#error_msg").html("");
    //   $("#area2").css("display", "none");
    //   $("#area1").css("display", "block");
    });

    $("#add_zone_submit_button").click(function(){
        var zone_name = $("#model_zone_name").val();
        if(zone_name.length < 1){ $("#add_zone_submit_button_error").html("Please enter a zone"); }
        else
        {
            $("#add_zone_submit_button_error").html("");
            var dataString = "zone_name="+zone_name;
            $.ajax({
              type:"post",
              url:"db.php",
              data: dataString,
              success:function(data) {
                  alert(data);
                  location.reload();
            }});
        }
    });
    $("#add_compnay_submit_button").click(function(){
        var zone_type = $("#model_company_select_zone option:selected").val();
        var company_name = $("#model_company_name").val();
        if(zone_type < 1){ $("#add_compnay_submit_error").html("Please select a zone."); }
        else if(company_name.length < 1){ $("#add_compnay_submit_error").html("Please enter a company name."); }
        else
        {
            $("#add_compnay_submit_error").html("");
            var dataString = "zone_type="+zone_type+"&company_name="+company_name;
            $.ajax({
              type:"post",
              url:"db.php",
              data: dataString,
              success:function(data) {
                  alert(data);
                  location.reload();
            }});
        }
    });
    
    $("#add_branch_submit_button").click(function(){
        var zone = $("#model_branch_select_zone option:selected").val();
        var company = $("#model_branch_select_company option:selected").val();
        var branch_code = $("#model_branch_code").val();
        var branch_name = $("#branch_name").val();
        var branch_address = $("#branch_address").val();
        var branch_phoneNum = $("#branch_phoneNum").val();
        var branch_email = $("#branch_email").val();
        if(zone < 1){ $("#add_branch_submit_error").html("Please select a zone."); }
        else if(company < 1){ $("#add_branch_submit_error").html("Please select a company."); }
        else if(branch_code.length < 1){ $("#add_branch_submit_error").html("Please enter a branch code."); }
        else if(branch_name.length < 1){ $("#add_branch_submit_error").html("Please enter a branch name."); }
        else if(branch_address.length < 5){ $("#add_branch_submit_error").html("Please enter a valid branch address."); }
        else if(branch_phoneNum.length < 5){ $("#add_branch_submit_error").html("Please enter a valid branch phone number."); }
        else
        {
            $("#add_branch_submit_error").html("");
            var dataString = "zone="+zone+"&company="+company+"&branch_code="+branch_code+"&branch_name="+branch_name+"&branch_address="+branch_address+"&branch_phoneNum="+branch_phoneNum+"&branch_email="+branch_email;
            $.ajax({
              type:"post",
              url:"db.php",
              data: dataString,
              success:function(data) {
                  alert(data);
                  location.reload();
            }});
        }
    });
});
</script>
</body>
</html>
