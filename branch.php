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
        <th>Data File</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody id="load_users">
<?php
$sql = "SELECT * FROM branch_table LEFT JOIN company_table ON company_table.company_id = branch_table.company_id_fk";
$result = $con->query($sql);
while($row = $result->fetch_assoc()) {
      $id = $row["branch_id"];

	    $get_user = "SELECT * FROM table_data_01 WHERE data_branchId='$id'";
      $run_user = mysqli_query($con,$get_user);
      $check = mysqli_num_rows($run_user);
      if($check==0){$check = 'No Record <Br>Found';}
      // else{$datafile = 'NOT UPLOADED';}
    echo "<tr>
           <td>".$row["branch_title"]."</td>
           <td>".$row["branch_info_title"]."</td>
           <td>".$row["branch_info_phone"]."</td>
           <td>".$row["branch_info_address"]."</td>
           <td>".$row["email"]."</td>
           <td>".$row["company_title"]."</td>
           <td class='text-center'>$check</td>
           <td>
            <a href='branch_edit.php?id=$id' class='btn btn-primary a-btn-slide-text' style='margin-left:10px; color:#fff'>
              <span class='fa fa-edit' aria-hidden='true'></span></a>
           </td>
           </tr>";
}
?>
    </tbody>
  </table>

      
</div>

    </div>
  </div>


