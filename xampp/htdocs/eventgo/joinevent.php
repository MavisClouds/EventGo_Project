<?php  

	include 'connect.php';
	header("Access-Control-Allow-Origin: *");

	$idacc = $_POST['idacc'];
	$idevent = $_POST['idevent'];

    $connect->query("INSERT INTO participant(idacc,idevent) VALUES ('".$idacc."','".$idevent."')");
	

?>