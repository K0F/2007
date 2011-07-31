<?
$filename = 'data.txt';

$arrPar = "";
for($i = 0; $i < $_GET['nump']+1; $i++){
  $var = "p".$i;
  if(isset($_GET[$var])){
	$arrPar[] = $_GET[$var];
  }
 	
}
for($i = 0; $i < count($arrPar); $i++){
  if(isset($_POST[$arrPar[$i]])){
    echo $arrPar[$i]." = ".$_POST[$arrPar[$i]]."<br>";
    $output = $arrPar[$i]." = ".$_POST[$arrPar[$i]]."\n";
    if (is_writable($filename)) {

         //////////////////
        //WRITE TO FILE///
       //////////////////

       if($slot != -1){
         if (!$handle = fopen($filename, 'a')) {
             echo "Cannot open file ($filename)";
             exit;
         }
   
         // Write $somecontent to our opened file.
         if (fwrite($handle, $output) === FALSE) {
             echo "Cannot write to file ($filename)<br>";
             exit;
         }
   
         //echo "Success, wrote ($output) to file ($filename)<br>";
         fclose($handle);
       }

    } else {
       echo "The file $filename is not writable";
    }

	
  }
}
?>