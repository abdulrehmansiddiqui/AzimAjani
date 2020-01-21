<?php
// $servername = "localhost";
// $username = "jazsofta_1232";
// $password = "jazsofta_123";
// $dbname = "jazsofta_zewana";

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "azimajani";

$con = new mysqli($servername, $username, $password, $dbname);
if (!$con) { die("Connection failed: " . mysqli_connect_error()); }

?>