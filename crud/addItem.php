<?php

	include 'conn.php';

	
	$itemName = $_POST['itemName'];
	$itemDescription = $_POST['itemDescription'];
	$itemPrice = $_POST['itemPrice'];
	$itemType = $_POST['itemType'];

	$connect->query("INSERT INTO tbl_items (itemName,itemDescription,itemPrice,itemType) VALUES ('".$itemName."','".$itemDescription."','".$itemPrice."','".$itemType."')")
	
?>
