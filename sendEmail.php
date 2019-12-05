<?php
require('fpdf_protection.php');
$pdf=new FPDF_Protection('P','mm',array(400,400));
$pdf->SetProtection(array('print'),'123123');
$pdf->AddPage();
$pdf->SetFont('Arial');

// $pdf->Write(10,'Name : '.$_SESSION["table_name"]);
// $pdf->Ln();
// $pdf->Write(10,'Address : '.$_SESSION["table_address"]);
// $pdf->Ln();
// $pdf->Write(10,'Phone Number : '.$_SESSION["table_phoneNum"]);
// $pdf->Ln();
// $pdf->Write(10,'Report Number : '.$_SESSION["branch_id"]);
// $pdf->Ln();
// $pdf->Write(10,'Report Date Time : '.date("Y-m-d h:i:sa"));
// $pdf->Ln();
// $pdf->Ln();


$pdf->Write(10,'Name : Abdul Hafee');
$pdf->Ln();
$pdf->Write(10,'Address : Sukkur Pakistan');
$pdf->Ln();
$pdf->Write(10,'Phone Number : 03123349398');
$pdf->Ln();
$pdf->Write(10,'Report Number : 32423423');
$pdf->Ln();
$pdf->Write(10,'Report Date Time : '.date("Y-m-d h:i:sa"));






// email stuff (change data below)
$to = "codehafeez@gmail.com"; 
$from = "codehafeez@gmail.com"; 
$subject = "send email with pdf attachment"; 
$message = "<p>Please see the attachment.</p>";
$filename = "report.pdf";

// a random hash will be necessary to send mixed content
$separator = md5(time());
// carriage return type (we use a PHP end of line constant)
$eol = PHP_EOL;
// encode data (puts attachment in proper format)
$pdfdoc = $pdf->Output("", "S");
$attachment = chunk_split(base64_encode($pdfdoc));
// main header
$headers  = "From: ".$from.$eol;
$headers .= "MIME-Version: 1.0".$eol; 
$headers .= "Content-Type: multipart/mixed; boundary=\"".$separator."\"";
// no more headers after this, we start the body! //
$body = "--".$separator.$eol;
$body .= "Content-Transfer-Encoding: 7bit".$eol.$eol;
$body .= "This is report of azeem ajani project".$eol;
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
// mail($to, $subject, $body, $headers);
if(mail($to, $subject, $body, $headers)){ echo "Successfully send"; }
else { echo "Can not send mail"; }
?>
