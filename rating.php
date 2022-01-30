	<?php
	session_start();
	require 'config/config.php';
	include("includes/classes/User.php");
	include("includes/classes/Post.php");
	$userLoggedId=$_SESSION['id'];
	$profile_id=$_GET['id'];
	if (isset($_SESSION['username'])) {
	 }
	 else{
	 	header('location:register.php');
	}
	//rating button
	if(isset($_POST['rating_button'])){
		$rating = $_POST['rating'];
		$profile_id=$_GET['id'];
		if($rating <=5 && $rating>=0){
		$insert_user=mysqli_query($con,"INSERT INTO ratings VALUES('',$userLoggedId,$profile_id,$rating)");
	}
	else{
		echo'alert("Rate within range 1-5");';
	}
	}
	if($userLoggedId!=$profile_id){
		//check for previous rating
		$check_query=mysqli_query($con,"SELECT rating FROM ratings WHERE user_id=$userLoggedId AND profile_id=$profile_id");
		$num_rows=mysqli_num_rows($check_query);
	if($num_rows>0){
		$rating=implode("",mysqli_fetch_assoc($check_query));
		//reting display in profile
		echo'<form action="rating.php?id='.$profile_id.'" method="POST">'.
		'<div class="rated_value"style="display:contents;color:#fff;">'. $rating .' Rating
		</div>
		</form>';
	}else{
		//if not previously rated
		echo'<form action="rating.php?id='.$profile_id.'" method="POST">
		<input type="number" name="rating" id="rating">
		<input type="submit" class="comment_rate" name="rating_button" value="Rate">
		</div>
		</form>';
	}
}
?>
</body>
</html>