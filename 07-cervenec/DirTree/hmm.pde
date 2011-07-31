/*
 DirTreee one;
 URL url;
  
 void setup(){
   init();
   if(online){
   try{
   url = new URL(getDocumentBase(),"./");
   }catch(MalformedURLException ex){
     println(ex);
   }
  String[] arguments = {url.toString()+"",""};
  one = new DirTreee();
   one.main(arguments);
   }else{
     String[] arguments = {sketchPath+"",""};
     one = new DirTreee();
   one.main(arguments);
   }
   
   
 }
 
 
public class DirTreee {
 
  public void main(String[] argv) {
    DirTreee dt = new DirTreee();
    if (argv.length == 0)
      dt.doDir(".");
    else for (int i = 0; i<argv.length; i++)
      dt.doDir(argv[i]);
  }


  private void doDir(String s) {
    File f = new File(s);
    if (!f.exists()) {
      System.out.println(s + " does not exist");
      return;
    }
    if (f.isFile())
      doFile(f);
    else if (f.isDirectory()) {
      System.out.println("d " + f.getPath());
      String objects[] = f.list();

      for (int i=0; i<objects.length; i++)
        doDir(s + f.separator + objects[i]);
    } else
      System.err.println("Unknown: " + s);
  }

 
  private void doFile(File f) {
    System.out.println("f " + f.getPath());
  }
}

*/
