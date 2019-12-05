<?php
session_start();
include("config.php"); 

	// login
    if (isset($_POST['login_email'])&&isset($_POST['login_password'])) {
    	$email = $_POST['login_email'];
    	$password = md5($_POST['login_password']);
        $sql = "SELECT * FROM users_table WHERE email='$email' AND password='$password'";
        $result = $con->query($sql);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
    	    	$_SESSION["email"] = $email;
    	    	$_SESSION["name"] = $row["name"];
    	    	$_SESSION["role"] = $row["role"];
    	    	$_SESSION["id"]   = $row["id"];
    	    	echo "";
            }
        }
        else { echo "Sorry!, Invlaid Password"; }
    }    

    elseif (isset($_POST['load_zone'])){
	    $sql = "SELECT * FROM zone_table";
	    $result = $con->query($sql);
		echo "<option value='' style='display:none' >Select Zone</option>";
	    while($row = $result->fetch_assoc()) {
	    	echo '<option value="'.$row["zone_id"].'">'.$row["zone_title"].'</option>';	    	
	    }
    }

    elseif (isset($_POST['zone_id'])) {
		echo "<option value='' style='display:none' >Select Company</option>";
    	$zone_id = $_POST['zone_id'];
	    $sql = "SELECT * FROM company_table WHERE zone_id_fk='$zone_id'";
	    $result = $con->query($sql);
	    while($row = $result->fetch_assoc()) {
	    	echo '<option value="'.$row["company_id"].'">'.$row["company_title"].'</option>';	    	
	    }
    }

    elseif (isset($_POST['compnay_id'])) {
    	$compnay_id = $_POST['compnay_id'];
	    $sql = "SELECT * FROM branch_table WHERE company_id_fk='$compnay_id'";
	    $result = $con->query($sql);
		echo "<option value='0' style='display:none' >Select Brach</option>";
	    while($row = $result->fetch_assoc()) {
	    	echo '<option value="'.$row["branch_id"].'">'.$row["branch_info_title"].'</option>';	    	
	    }
    }
    
    elseif (isset($_POST['compnay_id_by_search'])) {
    	$compnay_id = $_POST['compnay_id_by_search'];
	    $sql = "SELECT * FROM branch_table WHERE company_id_fk='$compnay_id'";
	    $result = $con->query($sql);
		echo "<option value='0' style='display:none' >Select Brach</option>";
		echo "<option value='0' >All</option>";
	    while($row = $result->fetch_assoc()) {
	    	echo '<option value="'.$row["branch_id"].'">'.$row["branch_info_title"].'</option>';	    	
	    }
    }

    elseif (isset($_POST['branch_get_detail'])) {
        $branch_id = "";
		echo '<table class="table table-bordered">
              <thead><tr><th>Name</th><th>Phone Number</th><th>Address</th></tr></thead><tbody>';
    	$company_id  = $_POST['branch_get_detail'];
	    $sql = "SELECT * FROM branch_table WHERE company_id_fk='$company_id'";
	    $result = $con->query($sql);
	    if($row = $result->fetch_assoc()) {
	        echo "<input type='hidden' value='".$row["branch_info_title"]."' name='table_name' />";
	        echo "<input type='hidden' value='".$row["branch_info_address"]."' name='table_address' />";
	        echo "<input type='hidden' value='".$row["branch_info_phone"]."' name='table_phoneNum' />";
	        echo "<tr>
           <td>".$row["branch_info_title"]."</td>
           <td>".$row["branch_info_phone"]."</td>
           <td>".$row["branch_info_address"]."</td>
           </tr>";
           
           $branch_id = $row["branch_id"];
	    }
	    echo "</tbody></table>";

	    $sql = "SELECT * FROM data_list WHERE branch_id='$branch_id'";
	    $result = $con->query($sql);
	    if($row = $result->fetch_assoc()) { echo "The Data File Is already Upload"; }
	    else { echo "Now You Have to upload data file"; }

	    $sql = "SELECT * FROM table_data_01 WHERE data_branchId='$branch_id'";
	    $result = $con->query($sql);
	    if($row = $result->fetch_assoc()) { echo "<input type='hidden' value='true' id='dataFileWork_usingBranchId'/>"; }
	    else { echo "<input type='hidden' value='false' id='dataFileWork_usingBranchId'/>"; }
    }
    
    
    elseif (isset($_POST['branchId_DataCSV_FILE'])) {
        echo $company_id  = $_POST['branchId_DataCSV_FILE'];
    }
    
    
    
    
    
    
    
    // ------------------------------------------------------------------    
    // ------------------------------------------------------------------    
    // ------------------------------------------------------------------    
    





    elseif (isset($_POST['zone_name'])) {
    	$zone_name = $_POST['zone_name'];
       	$sql2 = "INSERT INTO zone_table (zone_title) VALUES ('$zone_name');";
		if ($con->query($sql2) === TRUE) { echo "Zone Successfully Add."; }
		else { echo "Error: " . $sql2 . "<br>" . $con->error; }
    }
    
    elseif (isset($_POST['zone_type'])&&isset($_POST['company_name'])) {
    	$zone_type = $_POST['zone_type'];
    	$company_name = $_POST['company_name'];
       	$sql2 = "INSERT INTO company_table (company_title, zone_id_fk) VALUES ('$company_name', '$zone_type');";
		if ($con->query($sql2) === TRUE) { echo "Company Successfully Add."; }
		else { echo "Error: " . $sql2 . "<br>" . $con->error; }
    }
    
    elseif (isset($_POST['zone'])&&isset($_POST['company'])&&isset($_POST['branch_code'])&&isset($_POST['branch_name'])&&isset($_POST['branch_address'])&&isset($_POST['branch_phoneNum'])&&isset($_POST['branch_email'])) {
    	$zone = $_POST['zone'];
    	$company = $_POST['company'];
    	$branch_code = $_POST['branch_code'];
    	$branch_name = $_POST['branch_name'];
    	$branch_address = $_POST['branch_address'];
    	$branch_phoneNum = $_POST['branch_phoneNum'];
    	$branch_email = $_POST['branch_email'];
    	
	    $get_data = "select * from branch_table where branch_info_title='$branch_code'";
		$run_data = mysqli_query($con,$get_data);
		$check = mysqli_num_rows($run_data);
		
		if($check==1){
			echo "Already Registered";
			exit();
		}
		else{
          	$sql2 = "INSERT INTO `branch_table`( `branch_title`, `branch_info_title`, `branch_info_phone`, `branch_info_address`, `email`, `company_id_fk`)
            VALUES ( '$branch_name',  '$branch_code',     '$branch_phoneNum',   '$branch_address',   '$branch_email','$company')";
    		if ($con->query($sql2) === TRUE) { echo "Branch Successfully Add."; }
    		else { echo "Error: " . $sql2 . "<br>" . $con->error; }
		}
    }
  
  

  
  
    // Settings    
    elseif (isset($_POST['settings_username'])&&isset($_POST['settings_password'])) {
    	$name = $_POST['settings_username'];
    	$email = $_SESSION["email"];
    	$password = md5($_POST['settings_password']);
        $sql = "SELECT * FROM users_table WHERE email='$email' AND password='$password'";
        $result = $con->query($sql);
        if ($result->num_rows > 0) {
            $sql2 = "UPDATE users_table SET name='$name' WHERE email='$email'";
            if ($con->query($sql2) === TRUE) { $_SESSION["name"] = $name; echo ""; }
            else { echo "Error updating record: " . $con->error; }                
        }
        else { echo "Sorry!, Invlaid Password"; }
    }



    // change password
    elseif (isset($_POST['settings_oldPassword'])&&isset($_POST['settings_newPassword'])) {
    	$old_password = md5($_POST['settings_oldPassword']);
    	$new_password = md5($_POST['settings_newPassword']);
    	$email = $_SESSION["email"];
        $sql = "SELECT * FROM users_table WHERE email='$email' AND password='$old_password'";
        $result = $con->query($sql);
        if ($result->num_rows > 0) {
            $sql2 = "UPDATE users_table SET password='$new_password' WHERE email='$email'";
            if ($con->query($sql2) === TRUE) { echo ""; }
            else { echo "Error updating record: " . $con->error; }                
        }
        else { echo "Sorry!, Invlaid Password"; }
    }





    // load users
    elseif (isset($_POST['load_users'])) {
	    $sql = "SELECT * FROM users_table";
	    $result = $con->query($sql);
	    while($row = $result->fetch_assoc()) 
	    {
            if($_SESSION["email"] !== $row["email"])
            {
                $id = $row["id"];
                $name = $row["name"];
                $email = $row["email"];
                $name_id = "name_".$id;
                $email_id = "email_".$id;
                $role_id = "role_".$id;
                $role = "User";
                if($row["role"] == '1'){ $role = "Admin"; }
                echo '<input type="hidden" value="'.$name.'" id="'.$name_id.'"/> ';
                echo '<input type="hidden" value="'.$email.'" id="'.$email_id.'"/> ';
                echo '<input type="hidden" value="'.$role.'" id="'.$role_id.'"/> ';
                echo '<tr>
                <td>'.$name.'</td>
                <td>'.$email.'</td>
                <td>'.$role.'</td>
                <td>
                    <button onclick="edit_showModal('.$id.')" class="btn btn-primary a-btn-slide-text"><span class="fa fa-edit" aria-hidden="true"></span><span><strong>&nbsp;&nbsp;Edit</strong></span></button>
                    <button onclick="delete_showModal('.$id.')" class="btn btn-danger a-btn-slide-text" style="margin-left:10px;"><span class="fa fa-trash" aria-hidden="true"></span><span><strong>&nbsp;&nbsp;Delete</strong></span></button>
                </td>
              </tr>';
            }
	    }
    }

    
    // delete user    
    elseif (isset($_POST['delete_user_id'])) {
    	$id = $_POST['delete_user_id'];
        $sql = "DELETE FROM users_table WHERE id=$id";
        if ($con->query($sql) === TRUE) { echo "Record deleted successfully"; }
        else { echo "Error deleting record: " . $con->error; }
    }
    
    // update user
    elseif (isset($_POST['update_user_id'])&&isset($_POST['update_user_name'])&&isset($_POST['update_user_email'])&&isset($_POST['update_user_role'])) {
    	$id = $_POST['update_user_id'];
    	$name = $_POST['update_user_name'];
    	$email = $_POST['update_user_email'];
    	$role = $_POST['update_user_role'];

        $sql = "UPDATE users_table SET name='$name', email='$email', role='$role' WHERE id='$id'";
        if ($con->query($sql) === TRUE) { echo "Record updated successfully"; }
        else { echo "Error updating record: " . $con->error; }
    }

    elseif (isset($_POST['start_date'])){
        $start_date = $_POST['start_date'];
        $end_date = $_POST['end_date'];

        $sql = "SELECT * FROM table_data_csv WHERE lastReport_dateTime BETWEEN '$start_date' AND '$end_date'";
        // $sql = "SELECT * FROM table_data_csv WHERE lastReport_dateTime='$end_date'";
        
	    $result = $con->query($sql);
	    $count = 0;
        if ($result->num_rows > 0) {
    	    while($row = $result->fetch_assoc()) {
                $Total_lifeInYear = (int)$row['lifeInYear'];
                $Total_remaningLifeInYear = (int)$row['lifeInYear_update'];
                $remaningYear = $Total_lifeInYear - $Total_remaningLifeInYear;
                $count++;
                echo "<tr>
                <td>".$count."</td>
                <td>".$row["assetID"]."</td>
                <td>".$row["assetName"]."</td>
                <td>".$row["totalValue"]."</td>
                <td>".$row["last_netValue"]."</td>
                <td>".$row["depreciation"]."</td>
                <td>".$row["netValue"]."</td>
                <th>".$Total_lifeInYear.' / '.$remaningYear."</th>
                <td>".$row["lastReport_dateTime"]."</td>
                </tr>";
    	    }
        }
        else { echo "Sorry!, Record not found"; }
    }


    elseif (isset($_POST['report_input_search_branchId'])){
        $search_branchId = $_POST['report_input_search_branchId'];
        
        $sel = "SELECT * FROM report_list WHERE branch_id='$search_branchId' ORDER BY id DESC";
        $run = mysqli_query($con,$sel);
        $row=mysqli_fetch_array($run);
        $repordid = $row['id'];

	    $sql = "SELECT * FROM table_data_csv INNER JOIN branch_table ON table_data_csv.branchId = branch_table.branch_id WHERE branch_table.branch_id='$search_branchId' AND report_id='$repordid'";
	    $result = $con->query($sql);
	    $count = 0;
	    while($row = $result->fetch_assoc()) {
            $Total_lifeInYear = (int)$row['lifeInYear'];
            $Total_remaningLifeInYear = (int)$row['lifeInYear_update'];
            $remaningYear = $Total_lifeInYear - $Total_remaningLifeInYear;
            $count++;
            echo "<tr>
            <td>".$count."</td>
            <td>".$row["assetID"]."</td>
            <td>".$row["assetName"]."</td>
            <td>".$row["totalValue"]."</td>
            <td>".$row["last_netValue"]."</td>
            <td>".$row["depreciation"]."</td>
            <td>".$row["netValue"]."</td>
            <th>".$Total_lifeInYear.' / '.$remaningYear."</th>
            <td>".$row["lastReport_dateTime"]."</td>
            </tr>";
	    }
    }










    // -------------------------------------------------------------------------
    // ---------------------------- Add / View Data ---------------------------- 
    // -------------------------------------------------------------------------
    elseif (isset($_POST['load_data_enterByUser'])) {
	    $sql = "SELECT id_table_userDataInput, S_NO, branch_id, branch_info_title, ASSET_ID, ASSET_NAME, INVOICE_COST, TOTAL_COST, DATE_IN_USE, VENDOR, LIFE_IN_YR, DEP_TYPE, NET_VALUE FROM table_userDataInput INNER JOIN branch_table ON table_userDataInput.Branch_Code = branch_table.branch_id";
	    $result = $con->query($sql);
	    while($row = $result->fetch_assoc()) 
	    {
	        $id = $row["id_table_userDataInput"];
	        $name_id = 'VIEW_'.$id;
            echo '<input type="hidden" value="'.$row["ASSET_ID"].'" id="'.$name_id.'"/> ';
            echo '<tr>
            <td>'.$row["S_NO"].'</td>
            <td>'.$row["branch_info_title"].'</td>
            <td>'.$row["ASSET_ID"].'</td>
            <td>'.$row["ASSET_NAME"].'</td>
            <td>'.$row["INVOICE_COST"].'</td>
            <td>'.$row["TOTAL_COST"].'</td>
            <td>'.$row["DATE_IN_USE"].'</td>
            <td>'.$row["VENDOR"].'</td>
            <td>'.$row["LIFE_IN_YR"].'</td>
            <td>'.$row["DEP_TYPE"].'</td>
            <td>'.$row["NET_VALUE"].'</td>
            <td>
                <button onclick="delete_showModal('.$id.')" class="btn btn-danger a-btn-slide-text" style="margin-left:10px;"><span class="fa fa-trash" aria-hidden="true"></span><span><strong>&nbsp;&nbsp;Delete</strong></span></button>
            </td>
            </tr>';
	    }
    }
    
    elseif (isset($_POST['load_company_branches'])) {
		echo "<option value='' style='display:none'>Select Brach</option>";
	    $sql = "SELECT * FROM branch_table";
	    $result = $con->query($sql);
	    while($row = $result->fetch_assoc()) {
	    	echo '<option value="'.$row["branch_id"].'">'.$row["branch_info_title"].'</option>';	    	
	    }
    }

    elseif (isset($_POST['add_S_NO'])&&isset($_POST['add_Branch_Code'])&&isset($_POST['add_ASSET_ID'])&&isset($_POST['add_ASSET_NAME'])&&isset($_POST['add_INVOICE_COST'])&&isset($_POST['add_TOTAL_COST'])&&isset($_POST['add_DATE_IN_USE'])&&isset($_POST['add_VENDOR'])&&isset($_POST['add_LIFE_IN_YR'])&&isset($_POST['add_DEP_TYPE'])&&isset($_POST['add_NET_VALUE'])) {
    	$add_S_NO = $_POST['add_S_NO'];
    	$add_Branch_Code = $_POST['add_Branch_Code'];
    	$add_ASSET_ID = $_POST['add_ASSET_ID'];
    	$add_ASSET_NAME = $_POST['add_ASSET_NAME'];
    	$add_INVOICE_COST = $_POST['add_INVOICE_COST'];
    	$add_TOTAL_COST = $_POST['add_TOTAL_COST'];
    	$add_DATE_IN_USE = $_POST['add_DATE_IN_USE'];
    	$add_VENDOR = $_POST['add_VENDOR'];
    	$add_LIFE_IN_YR = $_POST['add_LIFE_IN_YR'];
    	$add_DEP_TYPE = $_POST['add_DEP_TYPE'];
    	$add_NET_VALUE = $_POST['add_NET_VALUE'];
        $sql = "SELECT * FROM table_userDataInput WHERE ASSET_ID='$add_ASSET_ID'";
        $result = $con->query($sql);
        if ($result->num_rows > 0) { echo "Sorry this Aseet ID is already exist."; }
        else
        {
            date_default_timezone_set("Asia/Karachi");
            $insertDate = date("Y-m-d");
            $loginEmail = $_POST['login_email'];
          	$sql2 = "INSERT INTO table_userDataInput (S_NO, Branch_Code, ASSET_ID, ASSET_NAME, INVOICE_COST, TOTAL_COST, DATE_IN_USE, VENDOR, LIFE_IN_YR, DEP_TYPE, NET_VALUE, insertDate, loginEmail) VALUES ('$add_S_NO', '$add_Branch_Code', '$add_ASSET_ID', '$add_ASSET_NAME', '$add_INVOICE_COST', '$add_TOTAL_COST', '$add_DATE_IN_USE', '$add_VENDOR', '$add_LIFE_IN_YR', '$add_DEP_TYPE', '$add_NET_VALUE', '$insertDate', '$loginEmail')";
    		if ($con->query($sql2) === TRUE) { echo "Successfully Add."; }
    		else { echo "Error: " . $sql2 . "<br>" . $con->error; }
        }
    }

      
    elseif (isset($_POST['DELETE_Add_View_Data'])) {
    	$id = $_POST['DELETE_Add_View_Data'];
        $sql = "DELETE FROM table_userDataInput WHERE id_table_userDataInput=$id";
        if ($con->query($sql) === TRUE) { echo "Record deleted successfully"; }
        else { echo "Error deleting record: " . $con->error; }
    }

    elseif (isset($_POST['load_companies_information_reportData'])) {
	    $sql = "SELECT * FROM company_table";
	    $result = $con->query($sql);
		echo "<option value='' style='display:none'>Select Company</option>";
	    while($row = $result->fetch_assoc()) {
	    	echo '<option value="'.$row["company_id"].'">'.$row["company_title"].'</option>';	    	
	    }
    }

    elseif (isset($_POST['change_companies_information_reportData'])) {
    	$compnay_id = $_POST['change_companies_information_reportData'];
	    $sql = "SELECT * FROM branch_table WHERE company_id_fk='$compnay_id'";
	    $result = $con->query($sql);
		echo "<option value='' style='display:none'>Select Brach</option>";
	    while($row = $result->fetch_assoc()) {
	    	echo '<option value="'.$row["branch_id"].'">'.$row["branch_info_title"].'</option>';	    	
	    }
    }










    elseif (isset($_POST['reportCSV_input_search_date'])){
    	$search_date = $_POST['reportCSV_input_search_date'];
	    $sql = "SELECT * FROM table_csv_01 WHERE csv_timeStamp='$search_date'";
	    $result = $con->query($sql);
	    $count = 0;
        if ($result->num_rows > 0) {
    	    while($row = $result->fetch_assoc()) {
                $count++;
                echo "<tr>
                <td>".$count."</td>
                <td>".$row["csv_id"]."</td>
                <td>".$row["csv_epc"]."</td>
                <td>".$row["csv_pc"]."</td>
                <td>".$row["csv_count"]."</td>
                <td>".$row["csv_rssi"]."</td>
                <td>".$row["csv_riss"]."</td>
                </tr>";
    	    }
        }
        else { echo "Sorry!, Record not found"; }
    }

    elseif (isset($_POST['reportCSV_input_search_branchId'])){
    	$search_branchId = $_POST['reportCSV_input_search_branchId'];
	    $sql = "SELECT * FROM table_csv_01 WHERE csv_branchId='$search_branchId'";
	    $result = $con->query($sql);
	    $count = 0;
	    while($row = $result->fetch_assoc()) {
            $count++;
            echo "<tr>
            <td>".$count."</td>
            <td>".$row["csv_id"]."</td>
            <td>".$row["csv_epc"]."</td>
            <td>".$row["csv_pc"]."</td>
            <td>".$row["csv_count"]."</td>
            <td>".$row["csv_rssi"]."</td>
            <td>".$row["csv_riss"]."</td>
            </tr>";
	    }
    }

    elseif (isset($_POST['reportExtraItems_input_search_date'])){
    	$search_date = $_POST['reportExtraItems_input_search_date'];
	    $sql = "SELECT * FROM table_csv_01 WHERE csv_timeStamp='$search_date' AND table_csv_01.csv_epc NOT IN (SELECT table_data_01.data_tagId FROM table_data_01)";
	    $result = $con->query($sql);
	    $count = 0;
        if ($result->num_rows > 0) {
    	    while($row = $result->fetch_assoc()) {
                $count++;
                echo "<tr>
                <td>".$count."</td>
                <td>".$row["csv_id"]."</td>
                <td>".$row["csv_epc"]."</td>
                <td>".$row["csv_pc"]."</td>
                <td>".$row["csv_count"]."</td>
                <td>".$row["csv_rssi"]."</td>
                <td>".$row["csv_riss"]."</td>
                </tr>";
    	    }
        }
        else { echo "Sorry!, Record not found"; }
    }

    elseif (isset($_POST['reportExtraItems_input_search_branchId'])){
    	$search_branchId = $_POST['reportExtraItems_input_search_branchId'];
	    $sql = "SELECT * FROM table_csv_01 WHERE csv_branchId='$search_branchId' AND table_csv_01.csv_epc NOT IN (SELECT table_data_01.data_tagId FROM table_data_01)";
	    $result = $con->query($sql);
	    $count = 0;
	    while($row = $result->fetch_assoc()) {
            $count++;
            echo "<tr>
            <td>".$count."</td>
            <td>".$row["csv_id"]."</td>
            <td>".$row["csv_epc"]."</td>
            <td>".$row["csv_pc"]."</td>
            <td>".$row["csv_count"]."</td>
            <td>".$row["csv_rssi"]."</td>
            <td>".$row["csv_riss"]."</td>
            </tr>";
	    }
    }
?>
