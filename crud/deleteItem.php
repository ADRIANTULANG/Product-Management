<?php
include 'conn.php'; 

$itemid = $_POST['itemid'];


$queryResult=$connect->query("DELETE FROM tbl_items WHERE itemid=$itemid");

$result=array();
while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}
echo json_encode($result);
?>