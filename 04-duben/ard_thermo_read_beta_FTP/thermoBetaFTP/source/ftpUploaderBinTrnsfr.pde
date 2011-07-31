FTPClient ftp; 
String[] files;


  

//
  
  
  


void putFile (String ftpp, String logn, String pass, String directoryH,String directoryR, String fileNameH,String fileNameR)
{

  try
  {


    ftp = new FTPClient();
    ftp.setRemoteHost("ftp://"+ftpp);

    FTPMessageCollector listener = new FTPMessageCollector();
    ftp.setMessageListener(listener);

    println ("Connecting");
    ftp.connect();

    println ("Logging in");
    ftp.login(logn,pass);

    println ("Setting up passive, ASCII transfers");
    ftp.setConnectMode(FTPConnectMode.PASV);
    ftp.setType(FTPTransferType.BINARY);


    println ("Putting file");
    ftp.put(sketchPath+"/"+directoryH+"/"+fileNameH, "/"+directoryR+"/"+fileNameR, false);

    println ("Directory after put");
    files = ftp.dir(".", true);
    for (int i = 0; i < files.length; i++)
    {
      println (i+" "+files[i]);
    }




    println ("Quitting client");
    ftp.quit();


    String messages = listener.getLog();
    println ("Listener log:");

    println(messages);
    println ("Test complete");

  }
  catch (Exception e)
  {

    println("Error "+e);

  }

}   
