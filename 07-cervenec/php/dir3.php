
<?php
//Open images directory
$d = $_GET['path'];

$dir = opendir($d);

//List files in images directory
while (($file = readdir($dir)) !== false)
  {
  echo "$file";
  }

closedir($dir);
?> 