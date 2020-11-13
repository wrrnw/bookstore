<?php
include_once 'dbh.inc.php';

$query = "SELECT * FROM db_orderdetail";
$result = mysqli_query($conn, $query);

$resultCheck = mysqli_num_rows($result);
if ($resultCheck > 0) {
  $column_name_printed = false;
  echo '<div class="container">  
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
?>