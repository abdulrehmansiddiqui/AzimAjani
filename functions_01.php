<?php
session_start();
if (!isset($_SESSION['email'])) { header('Location: index.php'); }
else { include("config.php"); }

    
    date_default_timezone_set("Asia/Karachi");
    $workFirstTime = 'false';


if(isset($_POST["Import"]))
{   
    $_SESSION["table_name"] = $_POST["table_name"];
    $_SESSION["table_address"] = $_POST["table_address"];
    $_SESSION["table_phoneNum"] = $_POST["table_phoneNum"];
    $_SESSION["branch_id"] = $_POST["branch_id"];


            $sql2 = "DELETE FROM `table_data_csv_report`";
            if ($con->query($sql2) === TRUE){}
            else { echo "Error DELETE record: " . $con->error; die(); }
            
                
    $work = 0;
    if($_FILES["file_CSV"]["size"] > 0)
    {
        $work = $work+1;
        $branch_id = $_POST["branch_id"];
        $checkForm = $_POST["checkForm"];
        {
            // New Code (Start) -->
            $count = 0;
            $filename = $_FILES["file_CSV"]["tmp_name"];    
            $file = fopen($filename, "r");
            while (($getData = fgetcsv($file, ",")) !== FALSE)
            {
                if($count == 0) { $count = 1; } // header not read
                else 
                {
                    
                        $getData[1] = str_replace(' ','',$getData[1]);
                        $sql = "SELECT * FROM table_csv_01 WHERE csv_branchId='$branch_id' AND csv_epc='$getData[1]' "; 
                        $res = mysqli_query($con, $sql);                
                        if(mysqli_num_rows($res) > 0){}
                        else 
                        {
                            $workFirstTime = 'true';
                            $sql3 = "INSERT INTO `table_csv_01`(`csv_id`, `csv_epc`, `csv_pc`, `csv_count`, `csv_rssi`, `csv_riss`, `csv_timeStamp`, `csv_branchId`) VALUES ('$getData[0]','$getData[1]','$getData[2]','$getData[3]','$getData[4]','$getData[5]','".date("Y-m-d")."','$branch_id')";
                            $result3 = mysqli_query($con, $sql3);
                            if(!isset($result3)) { echo "Invalid File Please Upload CSV File"; }
                        }
                }
            }
            fclose($file);
            // New Code (End) -->
        }
    }




    if($_FILES["file_CSV_02"]["size"] > 0)
    {
        $branch_id = $_POST["branch_id"];
        $checkForm = $_POST["checkForm"];
        {
            // New Code (Start) -->
            $count = 0;
            $filename = $_FILES["file_CSV_02"]["tmp_name"];    
            $file = fopen($filename, "r");
            while (($getData = fgetcsv($file, ",")) !== FALSE)
            {
                if($count == 0) { $count = 1; } // header not read
                else 
                {
                    $getData[1] = str_replace(' ','',$getData[1]);
                    $sql = "SELECT * FROM table_csv_01 WHERE csv_branchId='$branch_id' AND csv_epc='$getData[1]' "; 
                    $res = mysqli_query($con, $sql);                
                    if(mysqli_num_rows($res) > 0){}
                    else 
                    {
                        $workFirstTime = 'true';
                        $sql3 = "INSERT INTO `table_csv_01`(`csv_id`, `csv_epc`, `csv_pc`, `csv_count`, `csv_rssi`, `csv_riss`, `csv_timeStamp`, `csv_branchId`) VALUES ('$getData[0]','$getData[1]','$getData[2]','$getData[3]','$getData[4]','$getData[5]','".date("Y-m-d")."','$branch_id')";
                        $result3 = mysqli_query($con, $sql3);
                        if(!isset($result3)) { echo "Invalid File Please Upload CSV File"; }
                    }
                }
            }
            fclose($file);
            // New Code (End) -->
        }
    }
    if($_FILES["file_CSV_03"]["size"] > 0)
    {
        $branch_id = $_POST["branch_id"];
        $checkForm = $_POST["checkForm"];
        {
            // New Code (Start) -->
            $count = 0;
            $filename = $_FILES["file_CSV_03"]["tmp_name"];    
            $file = fopen($filename, "r");
            while (($getData = fgetcsv($file, ",")) !== FALSE)
            {
                if($count == 0) { $count = 1; } // header not read
                else 
                {
                    $getData[1] = str_replace(' ','',$getData[1]);
                    $sql = "SELECT * FROM table_csv_01 WHERE csv_branchId='$branch_id' AND csv_epc='$getData[1]' "; 
                    $res = mysqli_query($con, $sql);                
                    if(mysqli_num_rows($res) > 0){}
                    else 
                    {
                        $workFirstTime = 'true';
                        $sql3 = "INSERT INTO `table_csv_01`(`csv_id`, `csv_epc`, `csv_pc`, `csv_count`, `csv_rssi`, `csv_riss`, `csv_timeStamp`, `csv_branchId`) VALUES ('$getData[0]','$getData[1]','$getData[2]','$getData[3]','$getData[4]','$getData[5]','".date("Y-m-d")."','$branch_id')";
                        $result3 = mysqli_query($con, $sql3);
                        if(!isset($result3)) { echo "Invalid File Please Upload CSV File"; }
                    }
                }
            }
            fclose($file);
            // New Code (End) -->
        }
    }





    
    if($_FILES["file_DATA"]["size"] > 0)
    {
        $work = $work+1;
        $branch_id = $_POST["branch_id"];
        $checkForm = $_POST["checkForm"];
        {
            // New Data (Start)
            $count = 0;
            $filename = $_FILES["file_DATA"]["tmp_name"];    
            $file = fopen($filename, "r");
            while (($getData = fgetcsv($file, ",")) !== FALSE)
            {
                if($count == 0) { $count = 1; } // header not read
                else 
                {
                    $getData[1] = str_replace(' ','',$getData[1]);
                    $sql = "SELECT * FROM table_data_01 WHERE data_branchId='$branch_id' AND data_tagId='$getData[1]'"; 
                    $res = mysqli_query($con, $sql);                
                    if(mysqli_num_rows($res) > 0){}
                    else
                    {
                        $workFirstTime = 'true';
                        $sql = "INSERT INTO `table_data_01`(`data_sNo`, `data_tagId`, `data_assetId`, `data_assetName`, `data_innoiceCost`, `data_totalCost`, `data_dateInUse`, `data_vendor`, `data_lifeInYear`, `data_depType`, `data_netValue`, `data_timeStamp`, `data_branchId`, `remaning_years`) VALUES ('$getData[0]','$getData[1]','$getData[2]','$getData[3]','$getData[4]','$getData[5]','$getData[6]','$getData[7]','$getData[8]','$getData[9]','$getData[10]','".date("Y-m-d")."','$branch_id','$getData[8]')";
                        $result = mysqli_query($con, $sql);                
                        if(!isset($result)) { echo "Invalid File:Please Upload Data File"; }
                    }
                }
            }
            fclose($file);  
            // New Data (End)
        }
    }
    else { $work = $work+1; }



    


    if($work === 2)
    {
        $work = 3;
        $branch_id = $_POST["branch_id"];


        // New Code (Start)
        if($workFirstTime == 'true')
        {
            $sql = "SELECT * FROM table_data_01 LEFT JOIN table_csv_01 ON table_csv_01.csv_epc = table_data_01.data_tagId WHERE data_branchId=$branch_id";
            $result = mysqli_query($con, $sql);
            while($row = mysqli_fetch_assoc($result))
            {
                if(strlen($row['csv_epc']) < 1)
                {
                    if($row['data_depType'] == 'STRAIGHT')
                    {
                        $depType = $row['data_depType'];
                        $assetID = $row['data_assetId']."(Missing)";
                        $assetName = $row['data_assetName'];
                        $netValue = (int)$row['data_netValue'];
                        $lifeInYear = (int)$row['data_lifeInYear'];
                        $totalCost = (int)$row['data_totalCost'];
                        $depreciation = round($netValue / $lifeInYear);
                        $netValue = round($totalCost - $depreciation);
                        $lifeInYear_update = 1;
                        $dateTime_split_UpdateTable = date("Y-m-d h:i:sa");
                        $reportLast_dateTime = date("Y-m-d");

                        
                        // ------------------------ check item not enter than enter ------------------------
                            $sql2 = "INSERT INTO table_data_csv (`assetID`, `assetName`, `totalValue`, `depreciation`, `netValue`, `lifeInYear`, `lifeInYear_update`, `dateTime_split_UpdateTable`, `depType`, `branchId`, `last_netValue`, `lastReport_dateTime`) VALUES ('$assetID','$assetName','$totalCost','$depreciation','$netValue','$lifeInYear','$lifeInYear_update','$dateTime_split_UpdateTable','$depType','$branch_id', '$netValue', '$reportLast_dateTime')";
                            $result2 = mysqli_query($con, $sql2);
                            if(!isset($result2)) { echo "Invalid File:Please Upload Data File"; }

                        // $sql = "SELECT * FROM table_data_csv WHERE assetID='$assetID' assetID='$assetID.'(Missing)' OR AND branchId='$branch_id' "; 
                        // $res = mysqli_query($con, $sql);                
                        // if(mysqli_num_rows($res) > 0){}
                        // else
                        // {
                        // }
                        // ---------------------------------------------------------------------------------


                        $sql3 = "INSERT INTO `table_data_csv_report`(`Asset_ID`, `Asset_Name`, `Total_Value`, `Depreciation`, `NET_Value`) VALUES ('$assetID','$assetName','$totalCost','$depreciation','$netValue')";
                        $result3 = mysqli_query($con, $sql3);
                        if(!isset($result3)) { echo "Invalid File:Please Upload Data File"; }
                    }
                    else 
                    {
                        $depType = $row['data_depType'];
                        $totalValue = (int)$row['data_totalCost'];
                        $lifeInYear = (int)$row['data_lifeInYear'];
                        $depreciation =  round($totalValue / $lifeInYear);
                        $netValue = round($totalValue - $depreciation);
                        $assetID = $row['data_assetId'].'(Missing)';
                        $assetName = $row['data_assetName'];
                        $lifeInYear_update = 1;
                        $dateTime_split_UpdateTable = date("Y-m-d h:i:sa");
                        $reportLast_dateTime = date("Y-m-d");



                        // ------------------------ check item not enter than enter ------------------------
                            $sql2 = "INSERT INTO `table_data_csv`(`assetID`, `assetName`, `totalValue`, `depreciation`, `netValue`, `lifeInYear`, `lifeInYear_update`, `dateTime_split_UpdateTable`, `depType`, `branchId`, `last_netValue`, `lastReport_dateTime`) VALUES ('$assetID','$assetName','$totalValue','$depreciation','$netValue','$lifeInYear','$lifeInYear_update','$dateTime_split_UpdateTable','$depType','$branch_id', '$netValue', '$reportLast_dateTime')";
                            $result2 = mysqli_query($con, $sql2);
                            if(!isset($result2)) { echo "Invalid File:Please Upload Data File"; }
                        // $sql = "SELECT * FROM table_data_csv WHERE assetID='$assetID' assetID='$assetID.'(Missing)' OR AND branchId='$branch_id' "; 
                        // $res = mysqli_query($con, $sql);                
                        // if(mysqli_num_rows($res) > 0){}
                        // else
                        // {
                        // }
                        // ---------------------------------------------------------------------------------




                        $sql3 = "INSERT INTO `table_data_csv_report`(`Asset_ID`, `Asset_Name`, `Total_Value`, `Depreciation`, `NET_Value`) VALUES ('$assetID','$assetName','$totalValue','$depreciation','$netValue')";
                        $result3 = mysqli_query($con, $sql3);
                        if(!isset($result3)) { echo "Invalid File:Please Upload Data File"; }
                    }
                }
                else
                {
                    if($row['data_depType'] == 'STRAIGHT')
                    {
                        $depType = $row['data_depType'];
                        $assetID = $row['data_assetId'];
                        $assetName = $row['data_assetName'];
                        $netValue = (int)$row['data_netValue'];
                        $lifeInYear = (int)$row['data_lifeInYear'];
                        $totalCost = (int)$row['data_totalCost'];
                        $depreciation = round($netValue / $lifeInYear);
                        $netValue = round($totalCost - $depreciation);
                        $lifeInYear_update = 1;
                        $dateTime_split_UpdateTable = date("Y-m-d h:i:sa");
                        $reportLast_dateTime = date("Y-m-d");




                        // ------------------------ check item not enter than enter ------------------------
                            $sql2 = "INSERT INTO `table_data_csv`(`assetID`, `assetName`, `totalValue`, `depreciation`, `netValue`, `lifeInYear`, `lifeInYear_update`, `dateTime_split_UpdateTable`, `depType`, `branchId`, `last_netValue`, `lastReport_dateTime`) VALUES ('$assetID','$assetName','$totalCost','$depreciation','$netValue','$lifeInYear','$lifeInYear_update','$dateTime_split_UpdateTable','$depType','$branch_id', '$netValue', '$reportLast_dateTime')";
                            $result2 = mysqli_query($con, $sql2);
                            if(!isset($result2)) { echo "Invalid File:Please Upload Data File"; }
                        // $sql = "SELECT * FROM table_data_csv WHERE assetID='$assetID' assetID='$assetID.'(Missing)' OR AND branchId='$branch_id' "; 
                        // $res = mysqli_query($con, $sql);                
                        // if(mysqli_num_rows($res) > 0){}
                        // else
                        // {
                        // }
                        // ---------------------------------------------------------------------------------




                        $sql3 = "INSERT INTO `table_data_csv_report`(`Asset_ID`, `Asset_Name`, `Total_Value`, `Depreciation`, `NET_Value`) VALUES ('$assetID','$assetName','$totalCost','$depreciation','$netValue')";
                        $result3 = mysqli_query($con, $sql3);
                        if(!isset($result3)) { echo "Invalid File:Please Upload Data File"; }
                    }
                    else 
                    {
                        $depType = $row['data_depType'];
                        $totalValue = (int)$row['data_totalCost'];
                        $lifeInYear = (int)$row['data_lifeInYear'];
                        $depreciation =  round($totalValue / $lifeInYear);
                        $netValue = round($totalValue - $depreciation);
                        $assetID = $row['data_assetId'];
                        $assetName = $row['data_assetName'];
                        $lifeInYear_update = 1;
                        $dateTime_split_UpdateTable = date("Y-m-d h:i:sa");
                        $reportLast_dateTime = date("Y-m-d");




                        // ------------------------ check item not enter than enter ------------------------
                            $sql2 = "INSERT INTO `table_data_csv`(`assetID`, `assetName`, `totalValue`, `depreciation`, `netValue`, `lifeInYear`, `lifeInYear_update`, `dateTime_split_UpdateTable`, `depType`, `branchId`, `last_netValue`, `lastReport_dateTime`) VALUES ('$assetID','$assetName','$totalValue','$depreciation','$netValue','$lifeInYear','$lifeInYear_update','$dateTime_split_UpdateTable','$depType','$branch_id', '$netValue', '$reportLast_dateTime')";
                            $result2 = mysqli_query($con, $sql2);
                            if(!isset($result2)) { echo "Invalid File:Please Upload Data File"; }
                        // $sql = "SELECT * FROM table_data_csv WHERE assetID='$assetID' assetID='$assetID.'(Missing)' OR AND branchId='$branch_id' "; 
                        // $res = mysqli_query($con, $sql);                
                        // if(mysqli_num_rows($res) > 0){}
                        // else
                        // {
                        // }
                        // ----------------------------------------------------------------------------------

                        
                        

                        $sql3 = "INSERT INTO `table_data_csv_report`(`Asset_ID`, `Asset_Name`, `Total_Value`, `Depreciation`, `NET_Value`) VALUES ('$assetID','$assetName','$totalValue','$depreciation','$netValue')";
                        $result3 = mysqli_query($con, $sql3);
                        if(!isset($result3)) { echo "Invalid File:Please Upload Data File"; }
                    }
                }
            }
        }
        else
        {
            $sql = "SELECT * FROM `table_data_csv` WHERE branchId=$branch_id";
            $result = mysqli_query($con, $sql);
            while($row = mysqli_fetch_assoc($result))
            {
                $assetID = $row['assetID'];
                $assetName = $row['assetName'];
                $dateTime_old = $row['dateTime_split_UpdateTable'];
                $dateTime_new = date("Y-m-d h:i:sa");
                $reportLast_dateTime = date("Y-m-d");
                $DATE_NEW = $dateTime_old.';'.$dateTime_new;
                
                $id = (int)$row['id'];
                $totalCost = (int)$row['totalValue'];
                $netValue = (int)$row['netValue'];
                $lifeInYear = (int)$row['lifeInYear'];
                $lifeInYear_update = (int)$row['lifeInYear_update']+1;
                $depreciation = "";
                $new_netValue = "";

                if($row['depType'] == 'STRAIGHT'){
                   $depreciation = round($totalCost / $lifeInYear);
                   $new_netValue = round($netValue - $depreciation);
                }
                else {
                   $depreciation = round($netValue / $lifeInYear);
                   $new_netValue = round($netValue - $depreciation);
                }
                $sql2 = "UPDATE `table_data_csv` SET `depreciation`='$depreciation',`netValue`='$new_netValue',`last_netValue`='$netValue',`lifeInYear_update`='$lifeInYear_update',`dateTime_split_UpdateTable`='$DATE_NEW',`lastReport_dateTime`='$reportLast_dateTime' WHERE `id`=$id";
                if ($con->query($sql2) === TRUE) {}
                else { echo "Error updating record: " . $con->error; }                


                $sql3 = "INSERT INTO `table_data_csv_report`(`Asset_ID`, `Asset_Name`, `Total_Value`, `Depreciation`, `NET_Value`) VALUES ('$assetID','$assetName','$totalCost','$depreciation','$new_netValue')";
                $result3 = mysqli_query($con, $sql3);
                if(!isset($result3)) { echo "Invalid File:Please Upload Data File"; }
            }
        }
        // New Code (End)
    }
    

    if($work === 3)
    {
        $work = 4;
        $branch_id = $_POST["branch_id"];
        $totalValue_global = 0;
        $depreciationValue_global = 0;
        $count_global = 0;
        $missing_global = 0;


        date_default_timezone_set("Asia/Karachi");



        // New Code (Start)
        $report_data = "";
        $htmlContent_01 = '
        <style>
        table, td, th { border: 1px solid #ddd; text-align: left; }
        table { border-collapse: collapse; width: 100%; }
        th, td { padding: 5px; }
        </style>
        <p>Name : '.$_SESSION["table_name"].'</p>
        <p>Address : '.$_SESSION["table_address"].'</p>
        <p>Phone Number : '.$_SESSION["table_phoneNum"].'</p>
        <p>Report Date Time : '.date("Y-m-d h:i:sa").'</p>
        <p>Report ID : '.$_SESSION["table_name"].'_'.date("Y-m-d h:i").'</p>
        <table>
        <tr>
        <th>Asset ID</th>
        <th>Asset Name</th>
        <th>Total Value</th>
        <th>Current Value</th>
        <th>Depreciation</th>
        <th>NET Value</th>
        <th>Life In Year</th>
        </tr>';
        $bodyLoop = "";

        $Sql_2 = "SELECT * FROM `table_data_csv` WHERE `branchId`=$branch_id";
        $result_2 = mysqli_query($con, $Sql_2);
        while($row = mysqli_fetch_assoc($result_2))
        {
            $Total_lifeInYear = (int)$row['lifeInYear'];
            $Total_remaningLifeInYear = (int)$row['lifeInYear_update'];
            $remaningYear = $Total_lifeInYear - $Total_remaningLifeInYear;
            
            $assetID = $row['assetID'];
            $totalValue = (int)$row['totalValue'];
            $last_netValue = (int)$row['last_netValue'];
            $depreciationValue = (int)$row['depreciation'];
            $netValue = (int)$row['netValue'];
            $count_global = $count_global + 1;
            // $totalValue_global = $totalValue_global + $totalValue;
            $totalValue_global = $totalValue_global + $last_netValue;
            $depreciationValue_global = $depreciationValue_global + $depreciationValue; 
            $netValue_global = $netValue_global + $netValue; 
            $arr = explode("(Missing",$assetID);
            if(strlen($arr[1]) > 0){ $missing_global = $missing_global + 1; }
            
            $bodyLoop = $bodyLoop."<tr>
            <th>".$row['assetID']."</th>
            <th>".$row['assetName']."</th>
            <th>".$totalValue."</th>
            <th>".$last_netValue."</th>
            <th>".$depreciationValue."</th>
            <th>".$netValue."</th>
            <th>".$Total_lifeInYear.' / '.$remaningYear."</th>
            </tr>";
        }
        $htmlContent_02 = '</table>
        <br/><br/>
        <p>Current Total       : '.$totalValue_global.'</p>
        <p>Total Depreciation  : '.$depreciationValue_global.'</p>
        <p>Total NET Value     : '.$netValue_global.'</p>
        <p>Total Items         : '.$count_global.'</p>
        <p>Total Missing Items : '.$missing_global.'</p>';
        $report_data = $htmlContent_01.$bodyLoop.$htmlContent_02;



        // send email code (start)
        $sql = "SELECT * FROM branch_table WHERE branch_id=".(int)$branch_id;
        $result = $con->query($sql);
        while($row = $result->fetch_assoc()) 
        {
            $from = $loginEmail; 
            $fromName = "ReportAzeem Project";
            $subject = "ReportAzeem Project";
            $loginEmail = $_SESSION['email'];
            $email_array = (explode(",", $row["email"]));
            foreach($email_array as $i =>$to)
            {
                $message = $report_data;
                $header = "From: ".$loginEmail;
                if(mail($to, $subject, $message, $header)){}
                else { echo "Can not send mail"; }
                $headers = "MIME-Version: 1.0" . "\r\n"; 
                $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n"; 
                $headers .= 'From: '.$fromName.'<'.$from.'>' . "\r\n"; 
                if(mail($to, $subject, $report_data, $headers)){}
                else{  echo 'Email sending failed.';  }
            }
        }
        // send email code (end)
        // New Code (End)
    }
    
    if($work === 4){ header('Location: Report.php'); }
}   
?>
