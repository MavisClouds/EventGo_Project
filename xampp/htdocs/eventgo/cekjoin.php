<?php  

	include 'connect.php';
	header("Access-Control-Allow-Origin: *");

	$queryres = $connect->query("SELECT * FROM participant WHERE idacc = ".$idacc." AND idevent = ".$idevent);

	$result = array();

	while ($fetchdata = $queryres->fetch_assoc()) {
		
		$result[] = $fetchdata;

	}

	echo json_encode($result);

?>