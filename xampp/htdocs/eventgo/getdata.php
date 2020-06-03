<?php  

include 'connect.php';
 header("Access-Control-Allow-Origin: *");

$queryres = $connect->query("SELECT * FROM event");

$result = array();

while ($fetchdata = $queryres->fetch_assoc()) {
	
	$result[] = $fetchdata;

}

echo json_encode($result);

?>