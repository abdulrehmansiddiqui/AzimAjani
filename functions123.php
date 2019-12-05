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


    $file_DATA = $_FILES["file_DATA"]["tmp_name"];
    $file_CSV = $_FILES["file_CSV"]["tmp_name"];
    // $branch_id   = $_POST["file_DATA"];
    if($file_DATA){
        echo "fffffffffile_DATAffffffff";
    }
    else{
        echo "eeeeeeeeefile_DATAeeeeeeeeee";
    }
    if($file_CSV){
        echo "ffffffffffile_CSVfffffff";
    }
    else{
        echo "eeeeeeeeeefile_CSVeeeeeeeee";
    }


    // $sql2 = "DELETE FROM `table_data_csv_report`";
    // if ($con->query($sql2) === TRUE){}
    // else { echo "Error DELETE record: " . $con->error; die(); }

    $work = 0;
    $user_id = $_SESSION['id'];



}   
?>
