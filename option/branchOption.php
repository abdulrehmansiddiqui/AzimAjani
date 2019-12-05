
<Label>Select Branch</Label>

<select class="form-control" name="branch">
  <?php

session_start();
include("../config.php"); 

  if(isset($_GET['comapny'])){
    $get_id = $_GET['comapny'];

    $sql = "SELECT * FROM branch_table WHERE company_id_fk='$get_id'";
    $result = $con->query($sql);
    echo '<option value="0">Select Brach</option>';
    while($row = $result->fetch_assoc()) {
      echo '<option value="'.$row["branch_id"].'">'.$row["branch_info_title"].'</option>';	    	
    }


    }
  

  ?>
</select>