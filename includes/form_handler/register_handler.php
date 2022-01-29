<?php
// session_start();
//declaring variables to prevent errors
$fname = "";
$lname = "";
$em = "";//email
$em2 = "";
$password = "";
$password2 = "";
$date = "";
$error_array = array();//holds error message

if (isset($_POST['register_button'])) {
	//registration form value
	//firstname
	$fname = strip_tags($_POST['reg_fname']); //remove html tags
	$fname = str_replace('', '', $fname); //remove spaces
	$fname = ucfirst(strtolower($fname)); //uppercase first letter
	$_SESSION['reg_fname'] = $fname; //stores first name in session

	//lastname
	$lname = strip_tags($_POST['reg_lname']); //remove html tags
	$lname = str_replace('', '', $lname); //remove spaces
	$lname = ucfirst(strtolower($lname)); //uppercase first letter
	$_SESSION['reg_lname'] = $lname;

	//email
	$em = strip_tags($_POST['reg_email']); //remove html tags
	$em = str_replace('', '', $em); //remove spaces
	$em  = ucfirst(strtolower($em)); //uppercase first letter
	$_SESSION['reg_email'] = $em;

	//email2
	$em2 = strip_tags($_POST['reg_email2']); //remove html tags
	$em2 = str_replace('', '', $em2); //remove spaces
	$em2 = ucfirst(strtolower($em2)); //uppercase first letter
	$_SESSION['reg_email2'] = $em2;

	//password
	$password = strip_tags($_POST['reg_password']); //remove html tags
	$password2 = strip_tags($_POST['reg_password2']); //remove html tags

	$date = date("Y-m-d");//current date

	if($em == $em2){
		//check if email is in valid format
		if(filter_var($em, FILTER_VALIDATE_EMAIL)){

			$em = filter_var($em, FILTER_VALIDATE_EMAIL);
			
			//check if email already exist
			$e_check = mysqli_query($con, "SELECT email FROM users WHERE email='$em'");

			//count the number of rows returned
			$num_rows = mysqli_num_rows($e_check);

			if ($num_rows > 0) {
				array_push($error_array, "Email already in use<br>");
			}

		}
else{
			array_push($error_array, "Invalid format<br>");
		}
	}

	
	else{
		array_push($error_array, "Emails don't match<br>");
	}

	if(strlen($fname) > 25 || strlen($fname) < 2) {
		array_push($error_array, "Your firstname should in between 2 to 25 characters<br>");
	}

	if(strlen($lname) > 25 || strlen($lname) < 2) {
		array_push($error_array, "Your lastname should in between 2 to 25 characters<br>");
	}
	 if($password != $password2) {
	 	array_push($error_array, "Your password donot match<br>");
	 }
	 else{
	 	if(preg_match('/[^A-Za-z0-9]/', $password)){
	 		array_push($error_array, "Your password can only contain english character or number<br>");
	 	}
	 }
	 /*if(strlen($password > 30 || strlen($password) < 5)) {
	 	echo "Your password should be between 5 to 30 characters<br>";
	 }*/

	 if (empty($error_array)) {
	 	$password = md5($password); //encrypyt pass before sending to db

	 	//generate username by concate first and last name
	 	$username = strtolower($fname . "_" . $lname);
	 	$check_username_query = mysqli_query($con, "SELECT username FROM users WHERE username = '$username'");

	 	$i=0;
	 	//if username exist add number to username
	 	while (mysqli_num_rows($check_username_query) != 0) {
	 		$i++; //add i to 1
	 		$username = $username . "_" . $i;
	 		$check_username_query = mysqli_query($con, "SELECT username FROM users WHERE username = '$username'");
	 	}

	 	//profile pic 
	 	$rand = rand(1,2); //random number between 1 and 2
if($rand == 1)
	 	$profile_pic = "assets/images/profile_pics/defaults/a.jpg";
	 else if($rand == 2)
	 	$profile_pic = "assets/images/profile_pics/defaults/b.png";
	 
	 $query = mysqli_query($con, "INSERT INTO users VALUES ('', '$fname', '$lname', '$username', '$em', '$password', '$date', '$profile_pic', '0', '0', 'no', ',')");
	 $id = mysqli_insert_id($con); //number
	$_SESSION['id'] =$id;
	$result=mysqli_query($con,"INSERT INTO ratings VALUES ('',$id,'27',3)");
	 array_push($error_array, "You are all set!Go ahead and Login!");

	 //clear session
	 $_SESSION['reg_fname'] = "";
	  $_SESSION['reg_lname'] = "";
	   $_SESSION['reg_email'] = "";
	    $_SESSION['reg_email2'] = "";


	 }

	}
?>