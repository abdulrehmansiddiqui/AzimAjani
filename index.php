<?php
session_start();
if (isset($_SESSION['email'])) { header('Location: home.php'); }
?>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Jazsoft - Login</title>
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">

  <div class="container">
    <div class="row justify-content-center" style="margin-top:20%">
      <div class="col-xl-8 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome to Login</h1>
                  </div>


<div class="form-group">
<input type="email" class="form-control form-control-user" id="email" aria-describedby="emailHelp" placeholder="Enter Email">
</div>
<div class="form-group">
<input type="password" class="form-control form-control-user" id="password" placeholder="Password">
</div>
<p id="error_msg_login" style="maring-top:50px; margin-bottom:20px; text-align:center; color:red"></p>
<button id="login_Button" class="btn btn-success btn-user btn-block">LOGIN</button>


                </div>
              </div>
            </div>
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
    $(document).on("click", "#login_Button", function() {
        
        var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var email = $("#email").val(); 
        var password = $("#password").val(); 
        if(!regex.test(email)) { $("#error_msg_login").html("Please enter a vlaid email address."); } 
        else 
        { 
            $("#error_msg_login").html(""); 
            if(password.length < 1)  {  $("#error_msg_login").html("Please enter password"); } 
            else 
            { 
                $("#error_msg_login").html(""); 
                var dataString = "login_email="+email+"&login_password="+password;
                $.ajax(
                {
                    type:"post",
                    url:"db.php",
                    data:dataString,
                    success:function(data) {
                        if(data.length < 2){ window.location='https://jazsoft.com/AzimAjani/home.php'; }
                        else { $("#error_msg_login").html(data); }
                    }
                });
            }
        }                
    });
});
</script>
</body>
</html>
