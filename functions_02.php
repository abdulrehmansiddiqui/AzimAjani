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
            }
        }
    }
    


    $totalValue_global = 0;
    $depreciationValue_global = 0;
    $count_global = 0;
    $missing_global = 0;
    if($work === 3)
    {
        $work = 4;
        $branch_id = $_POST["branch_id"];
        // New Code (Start)
        $Sql_2 = "SELECT * FROM `table_data_csv` WHERE `branchId`=$branch_id";
        $result_2 = mysqli_query($con, $Sql_2);
        while($row = mysqli_fetch_assoc($result_2))
        {
            $assetID = $row['assetID'];
            $assetName = $row['assetName'];
            $totalValue = (int)$row['totalValue'];
            $last_netValue = (int)$row['last_netValue'];
            $depreciationValue = (int)$row['depreciation'];
            $netValue = (int)$row['netValue'];
            $count_global = $count_global + 1;
            $totalValue_global = $totalValue_global + $last_netValue;
            $depreciationValue_global = $depreciationValue_global + $depreciationValue; 
            $netValue_global = $netValue_global + $netValue; 
            $arr = explode("(Missing",$assetID);
            if(strlen($arr[1]) > 0){ $missing_global = $missing_global + 1; }
            $Total_lifeInYear = (int)$row['lifeInYear'];
            $Total_remaningLifeInYear = (int)$row['lifeInYear_update'];
            $remaningYear = $Total_lifeInYear - $Total_remaningLifeInYear;
            $life = $Total_lifeInYear.' / '.$remaningYear;
            
                $sql3 = "INSERT INTO `table_data_csv_report`(`Asset_ID`, `Asset_Name`, `Total_Value`, `Current_Value`, `Depreciation`, `NET_Value`, `Life_In_Year`) VALUES('$assetID','$assetName','$totalValue','$last_netValue','$depreciationValue','$netValue','$life')";
                $result3 = mysqli_query($con, $sql3);
                if(!isset($result3)) { echo "Invalid File:Please Upload Data File"; }
        }
    }

    if($work === 4){
        $work = 5;
        $branch_id = $_POST["branch_id"];
        // ---------------------------------------------------------------------
        require('fpdf_protection.php');
        $pdf=new FPDF_Protection('P','mm',array(500,500));
        $pdf->SetProtection(array('print'),'123123');
        $pdf->AddPage();
        $pdf->SetFont('Arial');
        $display_heading = array('Asset_ID'=>'Asset ID', 'Asset_Name'=> 'Asset Name', 'Total_Value'=> 'Total Value','Current_Value'=> 'Current Value','Depreciation'=> 'Depreciation','NET_Value'=> 'NET Value','Life_In_Year'=> 'Life In Year'); 
        $result = mysqli_query($con, "SELECT * FROM table_data_csv_report") or die("database error:". mysqli_error($con));
        $header = mysqli_query($con, "SHOW columns FROM table_data_csv_report");
        $pdf->Write(10,'Name : '.$_SESSION["table_name"]);
        $pdf->Ln();
        $pdf->Write(10,'Address : '.$_SESSION["table_address"]);
        $pdf->Ln();
        $pdf->Write(10,'Phone Number : '.$_SESSION["table_phoneNum"]);
        $pdf->Ln();
        $pdf->Write(10,'Report Date Time : '.date("Y-m-d h:i:sa"));
        $pdf->Ln();
        $pdf->Write(10,'Report ID : '.$_SESSION["table_name"].'_'.date("Y-m-d h:i"));
        $pdf->Ln();
        $pdf->Ln();
        foreach($header as $heading) { $pdf->Cell(63,12,$display_heading[$heading['Field']],1); }
        foreach($result as $row) {
        	$pdf->Ln();
        	foreach($row as $column) $pdf->Cell(63,12,$column,1);
        }
        $pdf->Ln();
        $pdf->Ln();
        $pdf->Write(10,'Current Total       : '.$totalValue_global);
        $pdf->Ln();
        $pdf->Write(10,'Total Depreciation  : '.$depreciationValue_global);
        $pdf->Ln();
        $pdf->Write(10,'Total NET Value     : '.$netValue_global);
        $pdf->Ln();
        $pdf->Write(10,'Total Items         : '.$count_global);
        $pdf->Ln();
        $pdf->Write(10,'Total Missing Items : '.$missing_global);
        $pdf->Ln();

        


        // send email code (start)
        $sql = "SELECT * FROM branch_table WHERE branch_id=".(int)$branch_id;
        $result = $con->query($sql);
        while($row = $result->fetch_assoc()) 
        {
            $email_array = (explode(",", $row["email"]));
            foreach($email_array as $i =>$to)
            {
                
                // email stuff (change data below)
                // $to = "codehafeez@gmail.com"; 
                $from = "codehafeez@gmail.com"; 
                $subject = "send email with pdf attachment"; 
                $message = "<p>Please see the attachment.</p>";
                // a random hash will be necessary to send mixed content
                $separator = md5(time());
                // carriage return type (we use a PHP end of line constant)
                $eol = PHP_EOL;
                // attachment name
                $filename = "Report.pdf";
                // encode data (puts attachment in proper format)
                $pdfdoc = $pdf->Output("", "S");
                $attachment = chunk_split(base64_encode($pdfdoc));
                // main header
                $headers  = "From: ".$from.$eol;
                $headers .= "MIME-Version: 1.0".$eol; 
                $headers .= "Content-Type: multipart/mixed; boundary=\"".$separator."\"";
                // message
                $body .= "--".$separator.$eol;
                $body .= "Content-Type: text/html; charset=\"iso-8859-1\"".$eol;
                $body .= "Content-Transfer-Encoding: 8bit".$eol.$eol;
                $body .= $message.$eol;
                // attachment
                $body .= "--".$separator.$eol;
                $body .= "Content-Type: application/octet-stream; name=\"".$filename."\"".$eol; 
                $body .= "Content-Transfer-Encoding: base64".$eol;
                $body .= "Content-Disposition: attachment".$eol.$eol;
                $body .= $attachment.$eol;
                $body .= "--".$separator."--";
                // send message
                mail($to, $subject, $body, $headers);
            }
        }
        // send email code (end)


    
        
        // // email stuff (change data below)
        // $to = "codehafeez@gmail.com"; 
        // $from = "codehafeez@gmail.com"; 
        // $subject = "send email with pdf attachment"; 
        // $message = "<p>Please see the attachment.</p>";
        // // a random hash will be necessary to send mixed content
        // $separator = md5(time());
        // // carriage return type (we use a PHP end of line constant)
        // $eol = PHP_EOL;
        // // attachment name
        // $filename = "Report.pdf";
        // // encode data (puts attachment in proper format)
        // $pdfdoc = $pdf->Output("", "S");
        // $attachment = chunk_split(base64_encode($pdfdoc));
        // // main header
        // $headers  = "From: ".$from.$eol;
        // $headers .= "MIME-Version: 1.0".$eol; 
        // $headers .= "Content-Type: multipart/mixed; boundary=\"".$separator."\"";
        // // message
        // $body .= "--".$separator.$eol;
        // $body .= "Content-Type: text/html; charset=\"iso-8859-1\"".$eol;
        // $body .= "Content-Transfer-Encoding: 8bit".$eol.$eol;
        // $body .= $message.$eol;
        // // attachment
        // $body .= "--".$separator.$eol;
        // $body .= "Content-Type: application/octet-stream; name=\"".$filename."\"".$eol; 
        // $body .= "Content-Transfer-Encoding: base64".$eol;
        // $body .= "Content-Disposition: attachment".$eol.$eol;
        // $body .= $attachment.$eol;
        // $body .= "--".$separator."--";
        // // send message
        // mail($to, $subject, $body, $headers);
    }
    
    if($work === 5){ 
        // header('Location: Report.php'); 
        header('Location: home.php'); 
    }
}   
?>
