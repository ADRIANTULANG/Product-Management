<?php 

include 'conn.php';

$itemType = $_POST['itemType'];


$queryResult=$connect->query("SELECT * FROM tbl_items a Where a.itemType = '$itemType'");

$result=array();
while($fetchData=$queryResult->fetch_assoc()){
$result[]=$fetchData;
}
echo json_encode($result);

?>