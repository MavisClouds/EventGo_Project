<?php  

	include 'connect.php';
	 header("Access-Control-Allow-Origin: *");

	
	$username = $_POST['username'];
	$password = $_POST['password'];

	$queryresult = $connect->query("SELECT * FROM account WHERE username = '".$username."' and password = '".$password."'");

	$result = array();

	while ($fetchdata = $queryresult->fetch_assoc())
	{
		$result[] = $fetchdata;
	}

	echo json_encode($result);
?>