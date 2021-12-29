<?php 
session_start();
include("includes/header.php");
?>
<div class="main_column column" id="main_column">
	<h4>Friend Requests</h4>
	<?php
		$userLoggedId = $_SESSION['id'];
		$query=mysqli_query($con,"SELECT * FROM friend_requests WHERE user_to='$userLoggedId'");
		if(mysqli_num_rows($query)==0)
			echo "You have no friend requests at this time!";
		else{
			while($row = mysqli_fetch_array($query)){
				$user_from=$row['user_from'];
				$uname=mysqli_query($con,"SELECT username FROM users WHERE id='$user_from'");
				$user_from_name=implode("",mysqli_fetch_assoc($uname));
				$user_from_obj=new User($con,$user_from_name);
				echo '<a href="'. $user_from_name .' ">'.$user_from_obj->getFirstAndLastName() .'</a>'.' sent you a friend request!';
				$user_from_friend_array=$user_from_obj->getFriendArray();
				if(isset($_POST['accept_request'.$user_from])){
					$add_friend_query=mysqli_query($con,"UPDATE users SET friend_array=CONCAT(friend_array,'$user_from_name,')WHERE username='$userLoggedIn'");
					$add_friend_query=mysqli_query($con,"UPDATE users SET friend_array=CONCAT(friend_array,'$userLoggedIn,')WHERE username='$user_from_name'");
					$delete_friend_query=mysqli_query($con,"DELETE from friend_requests WHERE user_to='$userLoggedId' AND user_from='$user_from'");
					echo "You are now friends";
					header("Location:requests.php");

				}
				if(isset($_POST['ignore_request'.$user_from])){
					$delete_query=mysqli_query($con,"DELETE from friend_requests WHERE user_to='$userLoggedId' AND user_from='$user_from'");
					echo "Request Ignored";
					header("Location:requests.php");
				}
				?>
				<form action="requests.php" method="POST">
			<input type="submit" name="accept_request<?php echo $user_from;?>" id="accept_button" value="Accept">
			<input type="submit" name="ignore_request<?php echo $user_from;?>" id="ignore_button" value="Ignore">

			
		</form>
		<?php
			}
		}
		?>

	</div>