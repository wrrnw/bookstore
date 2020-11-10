<html>
  <body>
    <?php
      include_once 'dbh.inc.php';
      
      $subject = $_POST['subject'];
      // echo '<br>' . gettype($subject);
      $content = $_POST['content'];
      $date = $_POST['date'];
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
        while ($row = mysqli_fetch_assoc($result)) {
          echo '<br>' . $row['Title'];
        }
      }

    ?>
  </body>
</html>
