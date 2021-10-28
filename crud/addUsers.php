<?php

	include 'conn.php';

	
	$password = $_POST['password'];
	$username = $_POST['username'];
	$email = $_POST['email'];

	$connect->query("INSERT INTO tbl_users (username,password,email) VALUES ('".$username."','".$password."','".$email."')")
	
?>
