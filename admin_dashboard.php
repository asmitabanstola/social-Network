<?php
session_start();
if(isset($_SESSION['username'])){

}else{
  header('location:admin.php');
}
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Dashboard</title>
    <!-- Bootstrap core CSS -->
    <link  rel="stylesheet" type="text/css"href="assets/CSS/bootstrap.css">
    <script src="assets/JS/jquery.min.js"></script>
  <script src="assets/JS/bootstrap.min.js" ></script>
  <link rel="stylesheet" type="text/css" href="font/font-awesome.css">
    <link type="text/css" rel="stylesheet" href="assets/CSS/dashboard.css">
  </head>
  <body>
  <div class="sidebar">
  <a class="" href="admin_dashboard.php">Dashboard</a>
</div>
   <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Virtually</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="nav navbar-nav navbar-right">
      <li><a href="register.php"><span class="glyphicon glyphicon-log-out"></span>Sign Out</a></li>
    </ul>
</div>
  </div>
</nav>
<style>
  .section {
  border: 1px solid #ccc;
  display: flex;
  flex-direction: row;
  font-family: sans-serif;
 
}
img{
  width:400px;
}
.paragraph {
  color: #555;
  display: flex;
  flex-direction: column;
}

.content {
  padding: 20px;
}

.title {
  font-size: 24px;
  color: #222;
  line-height: 24px;
}
@media screen and (max-width:860px){
.section img.image{
    height:300px;
    width:350px;
  }
  .title {
  font-size: 20px;
  color: #222;
  line-height: 18px;
}
.content{
  padding-top:0px;
}
}
</style>
<div class="main">
<!-- Portfolio Gallery Grid -->
       <table border="1px" class="table">
            <thead>
  <tr>
    <th>SN</th>
    <th>Reported By</th>
    <th>Post</th>
    <th>Posted By</th>
    <th>Report Category</th>
    <th>Actions</th>
  </tr>
</thead>
<tbody>
  <?php
    include('config/config.php');
    $sql = "select * from reports'";
    $query=mysqli_query($con,$sql);
    while($row=mysqli_fetch_array($query)){
      $reported_by=mysqli_query($con,"SELECT first_name FROM users WHERE id=$row['reported_by']");
      $post=mysqli_query($con,"SELECT body FROM posts WHERE id=$row['post_id']");
      $posted_by=mysqli_query($con,"SELECT first_name FROM users WHERE id=$row['post_of']");
      ?>
    <tr>
      <td><?php echo $i; ?></td>
      <td><?php echo $reported_by; ?></td>
      <td><?php echo $post; ?></td>
      <td><?php echo $posted_by; ?></td>
      <td><?php echo $row['report_category']; ?></td>
      <td><a href="#"><button class="btn btn-primary">KEEP</button></a>  <a href="form_handler/delete_post.php?delete=<?php echo $row['post_id'];?>" onclick=" return confirm('Are you sure you want to delete this post?')"><button class="btn btn-primary">DISCARD </button></a></td>
      </tr>
    </tr>
    <?php
      $i++;
     } ?>
</tbody>
</table>
      </div>
     
</body>
</html>
