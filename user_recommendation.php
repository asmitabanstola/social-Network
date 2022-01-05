 <link rel="stylesheet" type="text/css" href="assets/CSS/style.css">
<style type="text/css">
	 .profile_recommend{
		width:200px;
		float: left;
}
 .profile_recommend .profile_recommend_left_right{
	display: inline-block;
	position: relative;
}
 .profile_recommend img{
	height: 60px;
	border-radius: 100%;
	margin-right: 5px;

}
 input[type="submit"]{
	width: 100px;
}
input[type="submit"]:active{
	padding:5px 4px 4px 5px ;
	color:#ff2;
}
.tooltip {
  position: relative;
  display: inline-block;
 
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
  z-index: 1;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}
</style>
<?php
// session_start();
// 	include("config/config.php");
	include("recommend.php");
	// include("includes/classes/User.php");
	$userLoggedId=$_SESSION['id'];
	$userLoggedIn=$_SESSION['username'];
	$recommendation=array();
	$peoples=mysqli_query($con,"SELECT * FROM ratings");
	$matrix=array();
	while($people=mysqli_fetch_array($peoples)){
		$users=mysqli_query($con,"SELECT username FROM users WHERE id={$people['user_id']}");
		$username=mysqli_fetch_array($users);
		$profilename=mysqli_query($con,"SELECT first_name FROM users WHERE id={$people['profile_id']}");
		$profile_name=mysqli_fetch_array($profilename);
		$matrix[$username['username']][$profile_name['first_name']]=$people['rating'];
	}
	// echo"<pre>";
	// print_r($matrix);
	// echo "</pre>";
	$users=mysqli_query($con,"SELECT username FROM users WHERE id=$userLoggedId");
	$username=mysqli_fetch_array($users);
	$recommenation=getRecommendation($matrix,$username['username']);
	foreach ($recommenation as $people=>$rating) {
		?>
		<table>
		<tr>
			<td>
				<?php
				if(isset($_POST['add_friend'])){
					$user= new User($con,$userLoggedIn);
					$user->sendRequest($id);
				}
				 $name=mysqli_query($con,"SELECT * FROM users WHERE first_name='$people'");
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
					<div class="profile_recommend_left_right">
						<a href="" >
						<?php 
						echo $pname['first_name'] . " " . $pname['last_name'];
			 			?>
						</a>
					<?php
						echo'<input  type="submit" name="add_friend" class="success" value="Add Friend"></br>';
				}
				?>
					</div>
				</div>
					
			 </td>
		</tr>
		</table>
		<hr>
		<?php
	}
}
?>
