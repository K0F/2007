/*try
  {ftp = new FTPClient();
    ftp.setRemoteHost("ftp://weirdplace.wz.cz"); 
     // set up listener
    FTPMessageCollector listener = new FTPMessageCollector();
    ftp.setMessageListener(listener);
 
    // connect to the ftp client
    println ("Connecting");
    ftp.connect();
 
    // login to the ftp client
    println ("Logging in");
    ftp.login("weirdplace.wz.cz", "cigareta");
 
    // set up in passive mode
    println ("Setting up passive, ASCII transfers");
    ftp.setConnectMode(FTPConnectMode.PASV);
 
    // set up for ASCII transfers
    ftp.setType(FTPTransferType.ASCII);
    
    ftp.get(sketchPath+"\\text.txt" + ".copy", "text.txt");
  }
    catch (Exception e)
    {
 //Print out the type of error
 println("Error "+e);
    }    
   try{
   // Shut down client
    println ("Quitting client");
    ftp.quit();
   }catch (Exception e)
    {
 //Print out the type of error
 println("Error "+e);
    }*/ 
