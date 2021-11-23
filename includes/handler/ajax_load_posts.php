 <?php
include ("../../config/config.php");
include("../classes/User.php");
include("../classes/Post.php");
$limit=5;//number of post to load per call
$posts=new Post($con,$_REQUEST['userLoggedIn']);
$posts->loadPostsFriends($_REQUEST,$limit);
?>