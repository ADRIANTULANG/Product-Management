<?php
include 'conn.php'; 

$itemid = $_POST['itemid'];
$itemName = $_POST['itemName'];
$itemDescription = $_POST['itemDescription'];
$itemPrice = $_POST['itemPrice'];

$queryResult=$connect->query("UPDATE `tbl_items` SET `itemName` = '$itemName',`itemDescription` = '$itemDescription',`itemPrice` = '$itemPrice' WHERE `tbl_items`.`itemid` = $itemid");

$result=array();
while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}
echo json_encode($result);
?>