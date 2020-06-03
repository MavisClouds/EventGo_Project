<?php  

include 'connect.php';
header("Access-Control-Allow-Origin: *");

$idacc = $_POST['idacc'];

$queryres = $connect->query("SELECT * FROM event WHERE idacc = '".$idacc."' ");

$result = array();

while ($fetchdata = $queryres->fetch_assoc()) {
	
	$result[] = $fetchdata;

}

echo json_encode($result);

?>