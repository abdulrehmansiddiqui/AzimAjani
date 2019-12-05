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
<span style="font-size:22px;">Report Extra Items</span>
</nav>


<div class="container-fluid">
<div class="container">
<div class="row">


        <div class="col-6" style="padding-left:0px;">
        <select class="form-control"  id="search_by">
        <option value="1">Report View By Company & Branch</option>
        <option value="2">Report View By Date</option>
        </select>
        </div>
        <div class="col-6" id="search_date_area" style="padding-right:0px;">
        <div class="input-group mb-3">
        <input id="input_search_date" type="date" class="form-control"><div class="input-group-append"><button id="search_btn" class="btn btn-success" type="submit">Submit</button></div>
        </div>
        </div>
        <div class="col-6" id="search_branch_area" style="margin-bottom:15px; padding-right:0px;">
        <div class="row">
            <div class="col-6">
            <select class="form-control" id="load_companies_information"></select>
            </div>
            <div class="col-6">
            <select class="form-control" id="load_branches_information"></select>
            </div>
        </div>
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
    <tbody id="result_report_csv"></tbody>
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
    $("#search_by").change(function(){
        $("#result_report_csv").html("");
        var search_by = $("#search_by option:selected").val();
        if(search_by == "1"){ $("#search_date_area").css("display", "none"); $("#search_branch_area").css("display", "block"); }
        else { $("#search_date_area").css("display", "block"); $("#search_branch_area").css("display", "none"); }
    });

    $.ajax({
      type:"post",
      url:"db.php",
      data: 'load_companies_information_reportData',
      success:function(data) { $("#load_companies_information").html(data); }
    });
    
    $("#load_companies_information").change(function(){
        var compnay_id = $("#load_companies_information option:selected").val();
        var dataString = "change_companies_information_reportData="+compnay_id;
        $.ajax({
          type:"post",
          url:"db.php",
          data: dataString,
          success:function(data) { 
              $("#result_report_csv").html("");
              $("#load_branches_information").html(data); }
        });
    });
    
    
    
    
    // db return date in table    
    $("#search_btn").click(function(){
        var search_date = $("#input_search_date").val();
        var dataString = "reportExtraItems_input_search_date="+search_date;
        $.ajax({
          type:"post",
          url:"db.php",
          data: dataString,
          success:function(data) {
              $("#result_report_csv").html(data);
        }});
    });

    $("#load_branches_information").change(function(){
        var search_branchId = $("#load_branches_information option:selected").val();
        var dataString = "reportExtraItems_input_search_branchId="+search_branchId;
        $.ajax({
          type:"post",
          url:"db.php",
          data: dataString,
          success:function(data) {
              $("#result_report_csv").html(data);
        }});
    });
    

});
</script>
</body>
</html>
