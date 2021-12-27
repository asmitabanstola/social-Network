<?php 
session_start();
include("includes/header.php");
include("includes/classes/User.php");
include("includes/classes/Post.php");
if(isset($_POST['post_body'])){
	$post=new Post($con,$_POST['user_from']);
	$post->submitPost($_POST['post_body']));

}
?>