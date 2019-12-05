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
<span style="font-size:22px;">View Users</span>
</nav>


<div class="container-fluid">
  <div class="container">
      
      
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody id="load_users">
    </tbody>
  </table>

      
  </div>
</div>

    </div>
  </div>




  <!--  ( Model ) -->
  <div class="modal fade" id="edit_model" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Edit User</h4>
        </div>
        <div class="modal-body">



            <input type="hidden" value="" id="update_input_id"/>
      <div class="row">
        <div class="col form-group">
          <label>Name</label>
          <input type="text" class="form-control" id="update_input_name" placeholder="Name">
        </div>
      </div>
      <div class="row">
        <div class="col form-group">
          <label>Email</label>
          <input type="email" class="form-control" id="update_input_email" placeholder="Email">
        </div>
      </div>
      <div class="row">
        <div class="col form-group">
          <label>Role</label>
          <select class="form-control" id="update_input_role">
              <option value='0'>User</option>
              <option value='1'>Admin</option>
          </select>
        </div>
      </div>
            
            
        </div>
        <div class="modal-footer">
        <button class="btn btn-primary a-btn-slide-text" data-dismiss="modal"><span><strong>&nbsp;&nbsp;Cancel</strong></span></button>
        <button onclick="yes_update()" class="btn btn-success a-btn-slide-text" style="margin-left:10px;"><span class="fa fa-edit" aria-hidden="true"></span><span><strong>&nbsp;&nbsp;Yes Update</strong></span></button>
        </div>
      </div>
    </div>
  </div>


  <div class="modal fade" id="delete_model" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">Do you want to delete (<span id="delete_name_id"></span>) user?</h4>
            <input type="hidden" value="" id="delete_input_id"/>
        </div>
        <div class="modal-footer">
        <button class="btn btn-primary a-btn-slide-text" data-dismiss="modal"><span><strong>&nbsp;&nbsp;Cancel</strong></span></button>
        <button onclick="yes_delete()" class="btn btn-danger a-btn-slide-text" style="margin-left:10px;"><span class="fa fa-trash" aria-hidden="true"></span><span><strong>&nbsp;&nbsp;Yes Delete</strong></span></button>
        </div>
      </div>
    </div>
  </div>



<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="js/sb-admin-2.min.js"></script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/demo/chart-area-demo.js"></script>
<script src="js/demo/chart-pie-demo.js"></script>
<script>
$(document).ready(function(){
    var dataString = "load_users="+'load_users';
    $.ajax({
      type:"post",
      url:"db.php",
      data: dataString,
      success:function(data) { $("#load_users").html(data); }
    });
});

function edit_showModal(id) {
    var name = $("#name_"+id).val();
    var email = $("#email_"+id).val();
    var role = $("#role_"+id).val();
    $("#update_input_id").val(id);
    $("#update_input_name").val(name);
    $("#update_input_email").val(email);
    if(role !== 'Admin'){ $("#update_input_role").val('0'); }
    else{ $("#update_input_role").val('1'); }
   $('#edit_model').modal('show');
}

function delete_showModal(id) {
    var name = $("#name_"+id).val();
    $("#delete_input_id").val(id);
    $("#delete_name_id").html(name);
    $('#delete_model').modal('show');
}

function yes_delete() {
    var id = $("#delete_input_id").val();
    var dataString = "delete_user_id="+id;
    $.ajax({
      type:"post",
      url:"db.php",
      data: dataString,
      success:function(data) {
          alert(data);
          location.reload();
    }});
}
function yes_update() {
    var id = $("#update_input_id").val();
    var name = $("#update_input_name").val();
    var email = $("#update_input_email").val();
    var role = $("#update_input_role").val();
    var dataString = "update_user_id="+id+"&update_user_name="+name+"&update_user_email="+email+"&update_user_role="+role;
    $.ajax({
      type:"post",
      url:"db.php",
      data: dataString,
      success:function(data) {
          alert(data);
          location.reload();
    }});
}
</script>

</body>
</html>
