<?php
session_start();
require 'config/config.php';
require 'includes/form_handler/register_handler.php';
require 'includes/form_handler/login_handler.php';

?>

  <!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>WELCOME TO VIRTUALLY</title>
	
	<link rel="stylesheet" type="text/css" href="assets/CSS/register_style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

	<script src="assets/JS/register.js"></script>

</head>
<body>
	<?php
	if (isset($_POST['register_button'])) {
		echo'
		<script>
		$(document).ready(function(){
			$("#first").hide();
			$("#second").show();
		});
		</script>
	';
	}
	?> 

<div class="wrapper">
	<div class="login_box">
		<div class="login_header">
			<h1>VIRTUALLY</h1>
			Login Or Signup!
		</div>

		<div id="first">


			<form action="register.php" method="POST">
			<input type="email" name="log_email" placeholder="Email Address" value="<?php
		if(isset($_SESSION['log_email'])){
			echo $_SESSION['log_email'];
		}
		?>" required>
		<br>

		<input type="password" name="log_password" placeholder="Password">
		<br>

		<?php if(in_array("Email or password was incorrect<br>", $error_array)) echo "Email or password was incorrect<br>";
		?>
		<input type="submit" name="login_button" value="Login">
		<br>

		<a href="#" id="signup" class="signup">Register to Virtually here!</a>

		</form>
	
		</div>

<div id="second">

	<form action="register.php" method="POST">
		
			
		<input type="text" name="reg_fname" placeholder="First Name" value="<?php
		 if(isset($_SESSION['reg_fname'])) {
			echo $_SESSION['reg_fname'];
		} 
	?>" required>
		<br>
		<?php if (in_array( "Your firstname should in between 2 to 25 characters<br>", $error_array)) echo "Your firstname should in between 2 to 25 characters<br>"; ?>



		<input type="text" name="reg_lname" placeholder="Last Name" value="<?php
		 if(isset($_SESSION['reg_lname'])) {
			echo $_SESSION['reg_lname'];
		} 
	?>" required>
		<br>
		<?php if (in_array( "Your lastname should in between 2 to 25 characters<br>", $error_array)) echo "Your lastname should in between 2 to 25 characters<br>"; ?>
	
		

		<input type="email" name="reg_email" placeholder="Email" value="<?php
		 if(isset($_SESSION['reg_email'])) {
			echo $_SESSION['reg_email'];
		} 
	?>" required>
		<br>
	


			

		<input type="email2" name="reg_email2" placeholder="Confirm Email" value="<?php
		 if(isset($_SESSION['reg_email2'])) {
			echo $_SESSION['reg_email2'];
		} 
	?>" required>
		<br>
			<?php if (in_array("Email already in use<br>", $error_array)) echo "email already in use<br>";
				 else if (in_array("Invalid format<br>", $error_array)) echo "Invalid format<br>"; 
				 else if (in_array("Emails dont match<br>", $error_array)) echo "Emails dont match<br>"; ?>
				
	

		<input type="password" name="reg_password" placeholder="Password" required>
		<br>

		<input type="password" name="reg_password2" placeholder="Confirm Password" required>
		<br>
			<?php if (in_array("Your password donot match<br>", $error_array)) echo "Your password donot match<br>";
				 else if (in_array("Your password can only contain english character or number<br>", $error_array)) echo "Your password can only contain english character or number<br>";
				 ?>

	<input type="submit" name="register_button" value="Register" required>
		<br>
		<?php if(in_array("", $error_array)) echo "Your password donot match<br>"; 
		?>
		<a href="#" id="signin" class="signin">Already have an account? Sign In here!</a>

	
	
	</form>
	</div>
</div>
</div>
</body>
</html>