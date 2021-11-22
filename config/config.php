<?php
ob_start();//turns on output buffering
// session_start();
$con = mysqli_connect("localhost", "root", "", "social"); //connection variables
if (mysqli_connect_errno())
 {
	echo "failed to connect:".mysqli_connect_errno();
}
?>