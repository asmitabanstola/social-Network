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
    <nav class="navbar sticky-top bg-dark flex-md-nowrap p-0">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#"><font face="papyrus">Virtually</font></a>
          <a class="navbar-link" href="admin.php">Log Out</a>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link" href="admin_dashboard.php">
                  <span class="fa fa-file"></span>
                  Reported Posts
                </a>
              </li>
             <li class="nav-item">
                <a class="nav-link active" href="admin_dashboard_users.php">
                  <span class="fa fa-file"></span>
                  Users 
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
    <li class="breadcrumb-item"><a href="#">Users</a></li> 
      </ol>
        </nav>
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
          <h1 class="h2">Users</h1>
            <!-- <button class="btn btn-primary">Add company</button> -->
          </div>
          <table border="1px" class="table table-striped">
            <thead>
  <tr>
    <th>SN</th>
    <th>Firstname</th>
     <th>Lastname</th>
    <th>Email</th>
    <th>Profile Picture</th>
    <th>Actions</th>
  </tr>
</thead>
<tbody>
  <?php
      $i=1;
      include('config/config.php');
      $sql = "SELECT * FROM users WHERE user_closed='no'";
      $query=mysqli_query($con,$sql);
      while($row=mysqli_fetch_array($query)){
  ?>
<tr>
  <td><?php echo $i; ?></td>
  <td><?php echo $row['first_name']?></td>
  <td><?php echo $row['last_name']?></td>
  <td><?php echo $row['email']?></td>
  <td><img src="<?php echo $row['profile_pic']; ?>" style="width:60px; height:60px;"></td>
  <td><a href="#"><button class="btn btn-primary">KEEP</button></a>  <a href="includes/form_handler/delete_users.php?delete=<?php echo $row['id'];?>" onclick=" return confirm('Are you sure you want to delete this record?')"><button class="btn btn-danger">DISCARD </button></a></td>
  </tr>
</tr>
<?php 
    $i++;
    } 
 ?>
</tbody>
</table>
          <canvas class="my-4" id="myChart" width="900" height="380"></canvas>
        </main>
      </div>
    </div>
  </body>
</html>