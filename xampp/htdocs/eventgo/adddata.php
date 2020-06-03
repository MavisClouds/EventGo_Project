<?php  

	include 'connect.php';

	$email = $_POST['email'];
	$username = $_POST['username'];
	$password = $_POST['password'];

	$connect->query("INSERT INTO account(email,username,password) VALUES ('".$email."','".$username."','".$password."')");

?>