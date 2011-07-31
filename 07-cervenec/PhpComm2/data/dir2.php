<?php
$pat = $_GET['path'];
$d = opendir($pat);
while($f = readdir($d)) {
 // if(is_file($f)){ echo "f ";} else {echo "d ";}//continue;
  echo "$f,"; // replace with db insert
}
?> 