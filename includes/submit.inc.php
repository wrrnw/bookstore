<html>
  <body>
    <?php
      include_once 'dbh.inc.php';
      
      // $subject = $_POST['subject'];
      // echo '<br>' . gettype($subject);
      // $content = $_POST['content'];
      // $date = $_POST['date'];
      $query = $_POST['input_query'];

      $sql = "$query";
      
      
      $result = mysqli_query($conn, $sql);
      if ($result == True) {
        echo "<br> QUERY IMPLEMENTED SUCCESSFULLY";
        //header("Location: ../index.php?submit=success");
      } else {
        echo "<br> QUERY IMPLEMENTED FAILED";
      };
      $resultCheck = mysqli_num_rows($result);

      if ($resultCheck > 0) {
        $column_name_printed = false;
        echo '<table>';
        while ($row = mysqli_fetch_assoc($result)) {
          if (!$column_name_printed) {
            echo '<tr>';
            foreach ($row as $column_name => $value) {
              echo '<th>' . $column_name . '</th>';
            } 
            echo '</tr><br>';
          } 
          $column_name_printed = true;
          echo '<tr>';
          foreach ($row as $column_name => $value) {
            echo '<td>' . $value . '</td>';
          }
          echo '</tr><br>';
        }
        echo '</table>';
      }

    ?>
  </body>
</html>
