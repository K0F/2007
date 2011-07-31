 FTPClient ftp; 
  String[] files;
 
  void setup ()
{
 
  try
  {
 
    // set up a new ftp client
    ftp = new FTPClient();
    ftp.setRemoteHost("ftp://wierdstorage.xf.cz"); // ie. ftp.site.com
 
    // set up listener
    FTPMessageCollector listener = new FTPMessageCollector();
    ftp.setMessageListener(listener);
 
    // connect to the ftp client
    println ("Connecting");
    ftp.connect();
 
    // login to the ftp client
    println ("Logging in");
    ftp.login("wierdstorage.xf.cz", "cigareta");
 
    // set up in passive mode
    println ("Setting up passive, ASCII transfers");
    ftp.setConnectMode(FTPConnectMode.PASV);
 
    // set up for ASCII transfers
    ftp.setType(FTPTransferType.ASCII);
 
    // get the directory contents and print it to console
    println ("Directory before put:");
    files = ftp.dir(".", true);
    for (int i = 0; i < files.length; i++)
    {
 println (i+" "+files[i]);
    }
 
    // copy ASCII file to server and overwrite the existing file
    println ("Putting file");
    ftp.put(sketchPath+"\\test.txt", "test.txt", false);
 
    // get directory and print it to console
    println ("Directory after put");
    files = ftp.dir(".", true);
    for (int i = 0; i < files.length; i++)
    {
 println (i+" "+files[i]);
    }
 
    // copy ASCII file from server
    println ("Getting file");
    ftp.get(sketchPath+"\\test.txt" + ".copy", "test.txt");
 
    // delete file from server
    println ("Deleting file");
    ftp.delete("test.txt");
 
    // get directory and print it to console
    println ("Directory after delete");
    files = ftp.dir("", false);
    for (int i = 0; i < files.length; i++)
    {
 println (i+" "+files[i]);
    }
 
    // change directory
    println("Moving up a directory");
    ftp.cdup();
 
    // change directory in a different way
    println("Moving up a directory");
    ftp.cdup();
     
    // change directory in a different way
    println("Moving up a directory");
    ftp.chdir("..");
 
    // get directory and print it to console
    println ("Directory listing after move");
    files = ftp.dir("", true);
    for (int i = 0; i < files.length; i++)
    {
 println (i+" "+files[i]);
    }
 
    println("Moving into a directory");
    ftp.chdir(files[2].substring(55));
 
    try
    {
 // try to make a directory
 println("Make a new directory");
 ftp.mkdir("tempDir");
    }
    catch (Exception e)
    {
 //Print out the type of error
 println("Error "+e);
    }    
 
    //println("Delete a directory");
    //ftp.rmdir("tempDir");
 
    println("Moving into a directory");
    ftp.chdir("tempDir");
     
    // change directory in a different way
    println("The current directory");
    println(ftp.pwd());
 
    // get a directory listing and print it to console
    println ("Directory listing after making a new directory");
    files = ftp.dir("", true);
    for (int i = 0; i < files.length; i++)
    {
 println (i+" "+files[i]);
    }
 
    // set up for ASCII transfers
    ftp.setType(FTPTransferType.BINARY);
 
    // copy BINARY file to server  and overwrite the existing file
    println ("Putting file");
    ftp.put("C:\\Desktop\\bath-time.jpg", "bath-time.jpg", false);
 
    // run a raw FTP command on the server
    try
    {
 println("Run a FTP command");
 // add some commands if required
 String[] ftpParams = { "" };
 // send the FTP command followed by params
 ftp.quote( "SITE CHMOD 755 /web/tempDir/bath-time.jpg", ftpParams);
    }
    catch (Exception e)
    {
 
 //Print out the type of error
 println("Message "+e);
 
    }
 
    // Shut down client
    println ("Quitting client");
    ftp.quit();
 
    // Print out the listener messages
    String messages = listener.getLog();
    println ("Listener log:");
 
    // End message - if you get to here it must have worked
    println(messages);
    println ("Test complete");
 
  }
  catch (Exception e)
  {
 
    //Print out the type of error
    println("Error "+e);
 
  }
 
}   
