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
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

    <title>Dashboard</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/CSS/bootstrap.min.css" rel="stylesheet">
    <script src="assets/JS/jquery-3.3.1.slim.min.js"></script>
  <script src="assets/JS/bootstrap.min.js" ></script>
  <link rel="stylesheet" type="text/css" href="fonts/font-awesome.css">
    <link href="assets/CSS/dashboard.css" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Virtually</a>
      <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="index.php">Sign out</a>
        </li>
      </ul>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span class="fa fa-file"></span>
                  Dashboard
                </a>
              </li>
             
            </ul>

            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
           <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="admin_dashboard.php">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="#">Admin</a></li> 
      </ol>
        </nav>
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
          <h1 class="h2">Reported Posts</h1>
            <!-- <button class="btn btn-primary">Add company</button> -->
          </div>
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
    $i=1;
    $query=mysqli_query($con,"SELECT * FROM reports");
    if(mysqli_num_rows($query)>0){
    while($row=mysqli_fetch_array($query)){
      $reported_by1=mysqli_query($con,"SELECT first_name FROM users WHERE id={$row['reported_by']}");
      $reported_by=implode("", mysqli_fetch_assoc($reported_by1));
      $post1=mysqli_query($con,"SELECT body FROM posts WHERE id={$row['post_id']}");
       $post=implode("", mysqli_fetch_assoc($post1));
      $posted_by1=mysqli_query($con,"SELECT first_name FROM users WHERE id={$row['post_of']}");
       $posted_by=implode("", mysqli_fetch_assoc($posted_by1));
      ?>
    <tr>
      <td><?php echo $i; ?></td>
      <td><?php echo $reported_by; ?></td>
      <td><?php echo $post; ?></td>
      <td><?php echo $posted_by; ?></td>
      <td><?php echo $row['report_category']; ?></td>
      <td><a href="#"><button class="btn btn-primary">KEEP</button></a>  <a href="form_handler/delete_post.php?delete=<?php echo $row['post_id'];?>" onclick=" return confirm('Are you sure you want to delete this post?')"><br><button class="btn btn-danger">DISCARD </button></a></td>
      </tr>
    </tr>
    <?php
      $i++;
     } 
   ?>

</tbody>
</table>
<?php }else{
?>
<h6>No Reported Post yet!!</h6>
<?php } ?>
      </div>
     
</body>
</html>
