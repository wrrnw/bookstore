<?php
  echo "hi";
?>

<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>

<body>


<form action="includes/submit.inc.php" method="POST">
  <input type="text" name="subject" placeholder="subject">
  <br>
  <input type="text" name="content" placeholder="content">
  <br>
  <input type="text" name="date" placeholder="date">
  <br>
  <textarea id="input_query" name="input_query" rows="4" cols="50" placeholder="Put SQL query here">
    
  </textarea>
  <button type="submit" name="submit">Submit</button>
</form>




</body>
</html>