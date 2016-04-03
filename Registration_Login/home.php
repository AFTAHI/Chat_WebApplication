<?php
session_start();
include_once 'dbconnect.php';

if(!isset($_SESSION['user']))
{
	header("Location: index.php");
}
$res=mysql_query("SELECT * FROM user WHERE iduser=".$_SESSION['user']);
$userRow=mysql_fetch_array($res);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome - <?php echo $userRow['email']; ?></title>
<link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body>
<div id="header">
	<div id="left">
    <label>SciENSA</label>
    </div>
    <div id="right">
    	<div id="content">
        	hi <?php echo $userRow['username']; ?>&nbsp;<a href="logout.php?logout">Sign out</a>
        </div>
    </div>
</div>

<div id="body">
	<a href="https://www.facebook.com/ClubScientifiqueAei/" target="_blank">SciENSA - Club Scientifique ENSA Marrakech</a><br /><br />
</div>

</body>
</html>