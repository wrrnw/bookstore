<?php

/* Connect to Auburn server database */
// $dbServername = "acadmysql.duc.auburn.edu";
// $dbUsername = "qzc0010";
// $dbPassword = "cq19941104";
// $dbName = "qzc0010db";

/* Connect to local database */
$dbServername = "localhost";
$dbUsername = "root";
$dbPassword = "";
$dbName = "bookstore";


// Create connection
$conn = mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

