<?php  

include 'connect.php';
header("Access-Control-Allow-Origin: *");

$kategori = $_POST['kategori'];

$queryres = $connect->query("SELECT * FROM event WHERE kategori = '".$kategori."' ");

$result = array();

while ($fetchdata = $queryres->fetch_assoc()) {
	
	$result[] = $fetchdata;

}

echo json_encode($result);

?>