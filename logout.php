<?php 
ob_start();
session_start();
include 'config.php'; 
unset($_SESSION['user_client']);
header("location: index.php"); 
?>