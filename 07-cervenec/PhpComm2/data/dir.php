<?php
$d = opendir(".");
while($f = readdir($d)) {
  if(is_dir($f)) continue;
  echo "$f\n"; // replace with db insert
}
?> 