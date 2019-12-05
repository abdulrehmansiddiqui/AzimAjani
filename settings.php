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
        <span style="font-size:22px;">Settings</span>
        </nav>
        <div class="container-fluid">
            <div class="container">
    
                    


                <div class="row" style="margin-top:60px;">
                    <div class="col-12">
                      <div class="form-horizontal">
                        <div class="form-group">
                          <div class="col-sm-10"><h4>Change Passowrd</h4></div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-10">          
                            <input type="password" class="form-control" id="settings_oldPassword" placeholder="Enter Old password">
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-10">          
                            <input type="password" class="form-control" id="settings_newPassword" placeholder="Enter New password">
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-10">          
                            <input type="password" class="form-control" id="settings_confirmPassword" placeholder="Enter Confirm password">
                          </div>
                        </div>
                        <div class="form-group">        
                          <div class="col-sm-offset-2 col-sm-10">
                            <button id="change_passowrd_submit_btn" style="width:100%;" type="submit" class="btn btn-primary">Submit</button>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>                



                
                
            </div>
        </div>
    </div>
  </div>









<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
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
    $(document).on("click", "#change_username_submit_btn", function() {
        var username = $("#username").val(); 
        var password = $("#password").val(); 
        var dataString = "settings_username="+username+"&settings_password="+password;
        $.ajax({
            type:"post",
            url:"db.php",
            data:dataString,
            success:function(data) { 
                if(data.length < 2){
                    $("#exampleModalLabel").html("Successfully Update");
                    $("#password").val(""); 
                    $('#exampleModal').modal('show');
                }
                else { 
                    $('#exampleModal').modal('show');
                    $("#exampleModalLabel").html(data);
                }
            }
        });
    });
    
    $(document).on("click", "#change_passowrd_submit_btn", function() {
        var oldPassword = $("#settings_oldPassword").val(); 
        var newPassword = $("#settings_newPassword").val(); 
        var confirmPassword = $("#settings_confirmPassword").val(); 
        if(oldPassword.length < 1){
            $('#exampleModal').modal('show');
            $("#exampleModalLabel").html("Please enter a passowrd");
        }
        else if(newPassword.length < 5){
            $('#exampleModal').modal('show');
            $("#exampleModalLabel").html("Sorry password is too short.");
        }
        else {
            if(newPassword !== confirmPassword){
                $('#exampleModal').modal('show');
                $("#exampleModalLabel").html("Sorry both password not match");
            }
            else {
                var dataString = "settings_oldPassword="+oldPassword+"&settings_newPassword="+newPassword;
                $.ajax({
                    type:"post",
                    url:"db.php",
                    data:dataString,
                    success:function(data) { 
                        if(data.length < 2){
                            $("#exampleModalLabel").html("Successfully Update");
                            $("#settings_oldPassword").val(""); 
                            $("#settings_newPassword").val(""); 
                            $("#settings_confirmPassword").val(""); 
                            $('#exampleModal').modal('show');
                        }
                        else { 
                            $('#exampleModal').modal('show');
                            $("#exampleModalLabel").html(data);
                        }
                    }
                });
            }
        }
    });
    
});
</script>
</body>
</html>
