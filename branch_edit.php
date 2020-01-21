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
<span style="font-size:22px;">View Branches</span>
</nav>


<div class="container-fluid">
      
      
  <table class="table table-bordered">
    <thead>
      <tr>
        <!-- <th>S.no</th> -->
        <th>Branch Title</th>
        <th>Branch by code</th>
        <th>Phone</th>
        <th>Address</th>
        <th>Email</th>
        <th>Company Name</th>
        <th>Action</th>
      </tr>
    </thead>

  <?php
  if(isset($_GET['id'])){
    $get_id = $_GET['id'];
    $get_posts = "SELECT * FROM branch_table LEFT JOIN company_table ON company_table.company_id = branch_table.company_id_fk where branch_id='$get_id' ";
    // $get_posts = "select * from branch_table ";
    $run_posts = mysqli_query($con,$get_posts);
    $row_posts = mysqli_fetch_array($run_posts);
    
    $id  = $row_posts['branch_id'];
    $title  = $row_posts['branch_title'];
    $info_title  = $row_posts['branch_info_title'];
    $info_phone  = $row_posts['branch_info_phone'];
    $info_address  = $row_posts['branch_info_address'];
    $email  = $row_posts['email'];
    $company_title  = $row_posts['company_title'];
  }
    ?>

    <tbody id="load_users">
      <tr>
<form action="" method="post">
        <td><input type="text" value="<?php echo $title;?>" name="title" /> </td>
        <td><input type="text" value="<?php echo $info_title;?>" name="info_title" /> </td>
        <td><input type="text" value="<?php echo $info_phone;?>" name="info_phone" /> </td>
        <td><input type="text" value="<?php echo $info_address;?>" name="info_address" /> </td>
        <td><input type="text" value="<?php echo $email;?>" name="email" /> </td>
        <td><?php echo $company_title;?></td>
        <td>
					<button name="update" class='btn btn-success a-btn-slide-text'><span class='fa fa-check' aria-hidden='true'></span></button>
        </td>
</form>
      </tr>

    </tbody>
  </table>

  <?php
	if(isset($_POST['update'])){
		$title1 = $_POST['title'];
		$info_title1 = $_POST['info_title'];
		$info_phone1 = $_POST['info_phone'];
		$info_address1 = $_POST['info_address'];
		$email1 = $_POST['email'];
			
    $update = "update branch_table set branch_title='$title1', branch_info_title='$info_title1',branch_info_phone='$info_phone1', branch_info_address='$info_address1', email='$email1' where branch_id='$id' ";
		
    $run = mysqli_query($con,$update);
    // echo $run;
    // print_r($run);
		if($run){
			echo "<script>alert('You Branch is Updated!')</script>";
			echo "<script>window.open('branch.php','_self')</script>";
		}
		else{
			echo "<h3>Error!</h3>";
		}
	}
?>
      
</div>

    </div>
  </div>


