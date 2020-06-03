<?php  

include 'connect.php';
header("Access-Control-Allow-Origin:*");

$idevent = $_POST['idevent'];


$connect->query("DELETE FROM event WHERE idevent = ".$idevent);

?>