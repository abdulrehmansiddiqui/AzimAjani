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
<span style="font-size:22px;">Users Insertion</span>
</nav>


<div class="container-fluid">
  <div class="container">
      
<?php 
if($_SESSION["role"] === '1'){?>

    <form action="" method="post">
      <div class="row">
        <div class="col form-group">
          <label>Name</label>
          <input type="text" class="form-control" name="fname" placeholder="Name">
        </div>
      </div>
      <div class="row">
        <div class="col form-group">
          <label>Email</label>
          <input type="email" class="form-control" name="email" placeholder="Email">
        </div>
        <div class="col form-group">
          <label>Password</label>
          <input type="password" class="form-control" name="pass" placeholder="Password">
          <small id="emailHelp" class="form-text text-muted">Password must be in 8 characters</small>
        </div>
      </div>
        <div class="form-group">
          <label>Role</label>
          <select class="form-control" name="role">
              <option value='0'>User</option>
              <option value='1'>Admin</option>
          </select>
        </div>
        <div class="form-group">
        <button name="sign_up" style="width: 100%" class="btn btn-primary">Create Account</button>
      </div>
    </form>
<div style="margin:20px">
<?php
include("includes/connection.php");
	if(isset($_POST['sign_up'])){
			$lname = mysqli_real_escape_string($con,$_POST['fname']);
			$email = mysqli_real_escape_string($con,$_POST['email']);
			$pass = mysqli_real_escape_string($con,$_POST['pass']);
			$role = mysqli_real_escape_string($con,$_POST['role']);

            $get_email = "select * from users_table where email='$email'";
			$run_email = mysqli_query($con,$get_email);
			$check = mysqli_num_rows($run_email);
			
			if($check==1){
			    echo "
			    <div class='alert alert-danger'>
			       <p>Email Is Already Registered</p>
                </div>
                ";
				exit();
			}
			if(strlen($pass)<8){
				    echo "
				    <div class='alert alert-warning'>
				        <p>Password Should be 8 char</p>
                    </div>
                    ";
				exit();
			}
			else{
			$insert = "insert into users_table (name, email, password, role) values ('$lname', '$email', MD5('$pass'), '$role')";
			$run_insert = mysqli_query($con,$insert);
				if($run_insert){
				    echo "
				    <div class='alert alert-primary'>
				        <p>$lname email account has been create by $email</p>
                    </div>
                    ";
				}
				else{echo "<script>alert ('Error')</script>";}
			}
  }    
?>
</div>
<?php } ?>
  </div>
</div>

    </div>
  </div>



</body>
</html>
