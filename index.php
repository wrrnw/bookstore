<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- CSS Stylesheets -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    
    <title>COMP6120 Project</title>
  </head>

  <body> 
    <div id="header" class="jumbotron">
      <div class="container">
        <h1>COMP6120 Database System I Project</h1>
        <p>Graduate Group 6</p>
        <p>Group member: Qing Chang, Yukun Song, Beijia Zhang</p>
      </div>
    </div>

    <div class="container database-tables">
      <h2>Database Tables</h2>
      <ul class="nav nav-pills justify-content-center">
        <li class="nav-item">
          <a class="nav-link" href="#db_book">db_book</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#db_customer">db_customer</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#db_employee">db_employee</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#db_order">db_order</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#db_orderdetail">db_orderdetail</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#db_shipper">db_shipper</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#db_subject">db_subject</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#db_supplier">db_supplier</a>
        </li>
      </ul> 
    </div>
    
    <div class="tables db_book">
      <?php include('includes/db_book.php') ?>
    </div>
    <div class="tables db_customer">
      <?php include('includes/db_customer.php') ?>
    </div>
    <div class="tables db_employee">
      <?php include('includes/db_employee.php') ?>
    </div>    
    <div class="tables db_order">
      <?php include('includes/db_order.php') ?>
    </div>    
    <div class="tables db_orderdetail">
      <?php include('includes/db_orderdetail.php') ?>
    </div>    
    <div class="tables db_shipper">
      <?php include('includes/db_shipper.php') ?>
    </div>    
    <div class="tables db_subject">
      <?php include('includes/db_subject.php') ?>
    </div>    
    <div class="tables db_supplier">
      <?php include('includes/db_supplier.php') ?>
    </div>    

    <div class="container">
      <form class="form-group" action="" method="POST">
        <h2>SQL Query Input</h2>
        <textarea id="query-input" name="input_query" row="10" placeholder="Put your SQL query here"></textarea>
        <br>
        <button type="submit" class="btn btn-primary btn-lg" name="submit">Submit</button>
      </form>
    </div>
    
    <?php
      if(isset($_POST['input_query'])) {
        include_once 'includes/dbh.inc.php';
        $query = $_POST['input_query']; 
        $sql = "$query";
        if (strpos(strtolower($sql), 'drop') !== false) {
          echo '<div class="container">
                    <div class="alert alert-danger" role="alert">
                      Error: DROP Operation is not supported yet!
                    </div>
                  </div>';
        } else {
          $result = mysqli_query($conn, $sql);
          if ($result == True) {
            //header("Location: ../index.php?query_selection=success");
            //echo "QUERY EXECUTED SUCCESSFULLY! <br>";
          } else {
            //header("Location: ../index.php?query_selection=fail");
            echo '<div class="container">
                    <div class="alert alert-danger" role="alert">
                      Error:' . mysqli_errno($conn) . '! ' . mysqli_error($conn) . 
                    '</div>
                  </div>';
          };
          $resultCheck = mysqli_num_rows($result);
          if ($resultCheck > 0) {
            $column_name_printed = false;
            echo '<div class="container">
                    <div class="alert alert-success" role="alert">
                      Query executed successful! <br>The result of the query "<strong>' . $query . '</strong>" is:
                    </div>
                    <table class="table table-striped">';
            while ($row = mysqli_fetch_assoc($result)) {
              if (!$column_name_printed) {
                echo '<thead><tr>';
                foreach ($row as $column_name => $value) {
                  echo '<th scope="col">' . $column_name . '</th>';
                } 
                echo '</tr></thead><tbody>';
              } 
              $column_name_printed = true;
              echo '<tr>';
              foreach ($row as $column_name => $value) {
                echo '<td>' . $value . '</td>';
              }
              echo '</tr>';
            }
            echo '</tbody></table></div>';
          }
        }
      }
    ?>

    <footer class="jumbotron" id="footer">

      <i class="fab footer-icon fa-1x fa-twitter"></i>
      <i class="fab footer-icon fa-1x fa-facebook-f"></i>
      <i class="fab footer-icon fa-1x fa-instagram"></i>
      <i class="fas footer-icon fa-1x fa-envelope"></i>

      <p class="copyright">© Copyright 2020 Auburn University</p>

    </footer>

    <!-- jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/4873202998.js"></script>

    <!-- My Javascript -->
    <script src="javascript/script.js"></script>
  </body>
</html>