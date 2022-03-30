<!--  <link rel="stylesheet" type="text/css" href="assets/CSS/style.css"> -->

<style type="text/css">
	 .profile_recommend{
		width:200px;
		float: right;
		position: relative;
}
 .profile_recommend .profile_right{
	display: inline-block;
	position: relative;
}
 input[type="submit"]{
	width: 100px;
}
input[type="submit"]:active{
	padding:5px 4px 4px 5px ;
	color:#ff2;
}
.tooltip img{
	height: 50px; 
	width: 50px;
	border-radius: 100%;
	 float: left;
}
.tooltip {
  position: relative;
  display: inline-block;
  opacity: 1;
   z-index: 0;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: #fff;
  color: #000;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  left: 80%;
  margin-left: -60px;
  /* Position the tooltip */
  position: absolute;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}
</style>
<?php
// session_start();
	include("config/config.php");
	include("recommend.php");
	// include("includes/classes/User.php");
	$userLoggedId=$_SESSION['id'];
	$userLoggedIn=$_SESSION['username'];
	$recommendation=array();
	$result=mysqli_query($con,"SELECT * FROM ratings");
	$rating_matrix=array();
	//Sent Request if add friend is clicked
		if(isset($_POST['add_friend'])){
					$user= new User($con,$userLoggedIn);
					$id=$_GET['id'];
					$user->sendRequest($id);
				}
	while($a=mysqli_fetch_array($result)){
		$users=mysqli_query($con,"SELECT username FROM users WHERE id={$a['user_id']}");
		$username=mysqli_fetch_array($users);
		$profilename=mysqli_query($con,"SELECT first_name FROM users WHERE id={$a['profile_id']}");
		$profile_name=mysqli_fetch_array($profilename);
		//Rating matrix
		$rating_matrix[$username['username']][$profile_name['first_name']]=$a['rating'];
	}
	?>
	<table>
	<?php
	$users=mysqli_query($con,"SELECT username FROM users WHERE id=$userLoggedId");
	$username=mysqli_fetch_array($users);
	$recommenation=getRecommendation($rating_matrix,$username['username']);
	foreach ($recommenation as $a=>$rating) {
		?>
		<tr>
			<td>
				<?php
				 $name=mysqli_query($con,"SELECT * FROM users WHERE first_name='$a'");
				 $pname=mysqli_fetch_array($name);
				 $uname=$pname['username'];
				 $id=$pname['id'];
				 $profile_user_obj=new User($con,$uname);
				 	if($profile_user_obj->isClosed()){
					continue;
				}
				$logged_in_user_obj=new User($con,$userLoggedIn);
				if($userLoggedIn != $uname){
					if($logged_in_user_obj->isFriend($uname)){
							continue;
				}elseif ($logged_in_user_obj->didReceiveRequest($id)) {
					continue;
				}
				elseif ($logged_in_user_obj->didSendRequest($id)) {
					continue;
				}
				else{
				 ?>
				 <div class="profile_recommend">
				 	<div class="tooltip">
				<img src="<?php echo $pname['profile_pic']; ?>">
				<span class="tooltiptext"><?php echo $rating; ?></span>
			</div>
					<div class="profile_right">
						<a href="<?php echo $pname['username']; ?>" >
						<?php 
						echo $pname['first_name'] . " " . $pname['last_name'];
			 			?>
						</a>
						<br/>
						<form action="index.php?id=<?php echo $id; ?>" method="POST">
					<?php
						echo'<input  type="submit" name="add_friend" id="addfriend" class="success" value="Add Friend"></br>';
				}
				?>
			</form>
					</div>
				</div>
					
			 </td>
		</tr>
		<?php
	}
}
?>
</table>
