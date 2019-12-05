<?php
session_start();
if (!isset($_SESSION['email'])) { header('Location: index.php'); }
else { include("config.php"); }



$display_heading = array('Asset_ID'=>'Asset ID', 'Asset_Name'=> 'Asset Name', 'Total_Value'=> 'Total Value','Depreciation'=> 'Depreciation','NET_Value'=> 'NET Value'); 
$result = mysqli_query($con, "SELECT * FROM table_data_csv_report") or die("database error:". mysqli_error($con));
$header = mysqli_query($con, "SHOW columns FROM table_data_csv_report");



require('fpdf_protection.php');
$pdf=new FPDF_Protection('P','mm',array(400,400));
$pdf->SetProtection(array('print'),'123123');
$pdf->AddPage();
$pdf->SetFont('Arial');


$pdf->Write(10,'Name : '.$_SESSION["table_name"]);
$pdf->Ln();
$pdf->Write(10,'Address : '.$_SESSION["table_address"]);
$pdf->Ln();
$pdf->Write(10,'Phone Number : '.$_SESSION["table_phoneNum"]);
$pdf->Ln();
$pdf->Write(10,'Report Number : '.$_SESSION["branch_id"]);
$pdf->Ln();
$pdf->Write(10,'Report Date Time : '.date("Y-m-d h:i:sa"));
$pdf->Ln();
$pdf->Ln();



foreach($header as $heading) { $pdf->Cell(63,12,$display_heading[$heading['Field']],1); }
foreach($result as $row) {
	$pdf->Ln();
	foreach($row as $column) $pdf->Cell(63,12,$column,1);
}
// $pdf->Ln();
// $pdf->Write(10,'Total Value : '.$_SESSION["total_1"].'                        '.'Total Depreciation : '.$_SESSION["total_2"].'                        '.'Total NET Value : '.$_SESSION["total_3"]);
$pdf->Output();
?>
