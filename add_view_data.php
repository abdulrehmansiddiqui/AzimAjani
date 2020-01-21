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
<span style="font-size:22px;">Add / View Data</span>
</nav>
<style>table.table.table-bordered { font-size: 12px; }</style>


<div class="container-fluid">

    <button data-toggle="modal" data-target="#add_model" style="margin-bottom:20px;" class="btn btn-success a-btn-slide-text"><span class="fa fa-plus"></span><span><strong>&nbsp;&nbsp;Add Data</strong></span></button>
    <!-- <table class="table table-bordered">
    <thead>
    <tr>
    <th>S.NO</th>
    <th>Branch Code</th>
    <th>ASSET ID</th>
    <th>ASSET NAME</th>
    <th>INVOICE COST</th>
    <th>TOTAL COST</th>
    <th>DATE IN USE</th>
    <th>VENDOR</th>
    <th>LIFE IN YR</th>
    <th>DEP. TYPE</th>
    <th>NET VALUE</th>
    <th>ACTION</th>
    </tr>
    </thead>
    <tbody id="load_data_enterByUser"></tbody>
    </table> -->
      
</div>
</div>
</div>




<!--  ( Model ) -->
<div class="modal fade" id="add_model" role="dialog">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header"><h4 class="modal-title">Add Data</h4></div>
<div class="modal-body">

<form action="" method="post">
<div class="row">
<div class="col form-group">
<label>ZONE CENTRE</label>
<select class="form-control" name="zone_id" id="zone_center" required ></select>
</div>
</div>
<div class="row">
<div class="col form-group">
<label>COMPANY</label>
<select class="form-control" name="company" id="compnay" required ></select>
</div>
</div>
<div class="row">
<div class="col form-group">
<label>LOCATION/BRANCH (BY CODE)</label>
<select class="form-control" name="branch" id="branch" required></select>
</div>
</div>
<div class="row">
<div class="col form-group">
<label>S.NO</label>
<input type="text" class="form-control" name="add_S_NO" placeholder="Enter S.NO">
</div>
</div>
<div class="row">
<div class="col form-group">
<label>EPC</label>
<input type="text" class="form-control" name="add_EPC" placeholder="Enter EPC">
</div>
</div>
<div class="row">
<div class="col form-group">
<label>ASSET ID</label>
<input type="text" class="form-control" name="add_ASSET_ID" placeholder="Enter ASSET ID">
</div>
</div>
<div class="row">
<div class="col form-group">
<label>ASSET NAME</label>
<input type="text" class="form-control" name="add_ASSET_NAME" placeholder="Enter ASSET NAME">
</div>
</div>
<div class="row">
<div class="col form-group">
<label>INVOICE COST</label>
<input type="text" class="form-control" name="add_INVOICE_COST" placeholder="Enter INVOICE COST">
</div>
</div>
<div class="row">
<div class="col form-group">
<label>TOTAL COST</label>
<input type="text" class="form-control" name="add_TOTAL_COST" placeholder="Enter TOTAL COST">
</div>
</div>
<div class="row">
<div class="col form-group">
<label>DATE IN USE</label>
<input type="date" class="form-control" name="add_DATE_IN_USE" placeholder="Enter DATE IN USE">
</div>
</div>
<div class="row">
<div class="col form-group">
<label>VENDOR</label>
<input type="text" class="form-control" name="add_VENDOR" placeholder="Enter VENDOR">
</div>
</div>
<div class="row">
<div class="col form-group">
<label>LIFE IN YR</label>
<input type="text" class="form-control" name="add_LIFE_IN_YR" placeholder="Enter LIFE IN YR">
</div>
</div>
<div class="row">
<div class="col form-group">
<label>DEP. TYPE</label>
<select class="form-control" name="add_DEP_TYPE" >
  <option value='DOUBLE DEP'>DOUBLE DEP</option>
  <option value='STRAIGHT'>STRAIGHT</option>
</select>
<!-- <input type="text" class="form-control" name="add_DEP_TYPE" placeholder="Enter DEP. TYPE"> -->
</div>
</div>
<div class="row">
<div class="col form-group">
<label>NET VALUE</label>
<input type="text" class="form-control" name="add_NET_VALUE" placeholder="Enter NET VALUE">
</div>
</div>
<div class="row">
<div class="col form-group">
<label>LOCATION</label>
<input type="text" class="form-control" name="add_LOCATION" placeholder="Enter LOCATION">
</div>
</div>
<div class="row">
<div class="col form-group">
<label>BR CODE</label>
<input type="text" class="form-control" name="add_BR_CODE" placeholder="Enter BR CODE">
</div>
</div>

</div>


<div class="modal-footer">
<button class="btn btn-primary a-btn-slide-text" data-dismiss="modal"><span><strong>&nbsp;&nbsp;Cancel</strong></span></button>
<button name="update" class="btn btn-success a-btn-slide-text" style="margin-left:10px;"><span class="fa fa-plus" aria-hidden="true"></span><span><strong>&nbsp;&nbsp;Yes Add</strong></span></button>
</div>
</form>

</div>
</div>
</div>





  <!-- <div class="modal fade" id="delete_model" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">Do you want to delete (<span id="DELETE_ASSET_ID"></span>) user?</h4>
            <input type="hidden" value="" id="DELETE_INPUT_ASSET_ID"/>
        </div>
        <div class="modal-footer">
        <button class="btn btn-primary a-btn-slide-text" data-dismiss="modal"><span><strong>&nbsp;&nbsp;Cancel</strong></span></button>
        <button onclick="yes_delete()" class="btn btn-danger a-btn-slide-text" style="margin-left:10px;"><span class="fa fa-trash" aria-hidden="true"></span><span><strong>&nbsp;&nbsp;Yes Delete</strong></span></button>
        </div>
      </div>
    </div>
  </div> -->

<?php
if(isset($_POST['update'])){
  $data_sNo = $_POST['add_S_NO'];
  $data_tagId = $_POST['add_EPC'];
  $data_assetId = $_POST['add_ASSET_ID'];
  $data_assetName = $_POST['add_ASSET_NAME'];
  $data_innoiceCost = $_POST['add_INVOICE_COST'];
  $data_totalCost = $_POST['add_TOTAL_COST'];
  $data_dateInUse = $_POST['add_DATE_IN_USE'];
  $data_vendor = $_POST['add_VENDOR'];
  $data_lifeInYear = $_POST['add_LIFE_IN_YR'];
  $data_depType = $_POST['add_DEP_TYPE'];
  $data_netValue = $_POST['add_NET_VALUE'];
  $LOCATION = $_POST['add_LOCATION'];
  $BR_CODE = $_POST['add_BR_CODE'];
  $remaning_years = $_POST['add_LIFE_IN_YR'];
  $data_zoneid = $_POST['zone_id'];
  $data_companyid = $_POST['company'];
  $data_branchId = $_POST['branch'];

  $sel = "select * from data_list where zone_id='$data_zoneid' and company_id='$data_companyid' and branch_id='$data_branchId' ";
  $run = mysqli_query($con,$sel);
  $row=mysqli_fetch_array($run);
  $report_id = $row['id'];

  $sql2 = "INSERT INTO table_data_01 (
   `data_sNo`,
   `data_tagId`,
   `data_assetId`,
   `data_assetName`,
   `data_innoiceCost`,
   `data_totalCost`,
   `data_dateInUse`,
   `data_vendor`,
   `data_lifeInYear`,
   `data_depType`,
   `data_netValue`,
   `LOCATION`,
   `BR_CODE`,
   `remaning_years`,
   `data_zoneid`,
   `data_companyid`,
   `data_branchId`,
   `data_reportid`,
   `data_timeStamp`
   ) VALUES (
  '$data_sNo',
  '$data_tagId',
  '$data_assetId',
  '$data_assetName',
  '$data_innoiceCost',
  '$data_totalCost',
  '$data_dateInUse',
  '$data_vendor',
  '$data_lifeInYear',
  '$data_depType',
  '$data_netValue',
  '$LOCATION',
  '$BR_CODE',
  '$remaning_years',
  '$data_zoneid',
  '$data_companyid',
  '$data_branchId',
  '$report_id',
  '".date("Y-m-d")."'
  )";
  if ($con->query($sql2) === TRUE) { echo"<script>alert('Add Sucessfull In Data File')</script>"; }
  else { echo "Error: " . $sql2 . "<br>" . $con->error; }
}

?>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="js/sb-admin-2.min.js"></script>
<script>
$(document).ready(function(){

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

    $.ajax({
      type:"post",
      url:"db.php",
      data: 'load_data_enterByUser',
      success:function(data) { $("#load_data_enterByUser").html(data); }
    });
});

// function yes_add() {
//     var add_S_NO = $("#add_S_NO").val();
//     var add_Branch_Code = $("#company_branches option:selected").val();
//     var add_ASSET_ID = $("#add_ASSET_ID").val();
//     var add_ASSET_NAME = $("#add_ASSET_NAME").val();
//     var add_INVOICE_COST = $("#add_INVOICE_COST").val();
//     var add_TOTAL_COST = $("#add_TOTAL_COST").val();
//     var add_DATE_IN_USE = $("#add_DATE_IN_USE").val();
//     var add_VENDOR = $("#add_VENDOR").val();
//     var add_LIFE_IN_YR = $("#add_LIFE_IN_YR").val();
//     var add_DEP_TYPE = $("#add_DEP_TYPE").val();
//     var add_NET_VALUE = $("#add_NET_VALUE").val();

//     var dataString = "add_S_NO="+add_S_NO+"&add_Branch_Code="+add_Branch_Code+"&add_ASSET_ID="+add_ASSET_ID+"&add_ASSET_NAME="+add_ASSET_NAME+"&add_INVOICE_COST="+add_INVOICE_COST+"&add_TOTAL_COST="+add_TOTAL_COST+"&add_DATE_IN_USE="+add_DATE_IN_USE+"&add_VENDOR="+add_VENDOR+"&add_LIFE_IN_YR="+add_LIFE_IN_YR+"&add_DEP_TYPE="+add_DEP_TYPE+"&add_NET_VALUE="+add_NET_VALUE;
    
//     $.ajax({
//       type:"post",
//       url:"db.php",
//       data: dataString,
//       success:function(data) {
//           alert(data);
//           location.reload();
//     }});
// }

// function delete_showModal(id) {
//     var name = $("#VIEW_"+id).val();
//     $("#DELETE_ASSET_ID").html(name);
//     $("#DELETE_INPUT_ASSET_ID").val(id);
//     $('#delete_model').modal('show');
// }
// function yes_delete() {
//     var id = $("#DELETE_INPUT_ASSET_ID").val();
//     var dataString = "DELETE_Add_View_Data="+id;
//     $.ajax({
//       type:"post",
//       url:"db.php",
//       data: dataString,
//       success:function(data) {
//           alert(data);
//           location.reload();
//     }});
// }
</script>

</body>
</html>
