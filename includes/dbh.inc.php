<?php

$dbServername = "acadmysql.duc.auburn.edu";
$dbUsername = "qzc0010";
$dbPassword = "cq19941104";
$dbName = "qzc0010db";

// $dbServername = "localhost";
// $dbUsername = "root";
// $dbPassword = "";
// $dbName = "bookstore";


// Create connection
$conn = mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully!";
