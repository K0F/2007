public class DirList {
  public File path;
  public String[] lista;
  boolean filE;
  
  public void gett(String[] args) {
    try {
      path = new File(args[0]);
if(!path.isFile()){
    filE=false;
      if(args.length == 0)
        lista = path.list();
      else 
        lista = path.list(new DirFilter(args[1]));
      for(int i = 0; i < lista.length; i++)

        System.out.println(lista[i]);
}else{
try{

  open(path.getAbsolutePath());
    filE=true;
} catch(Exception e) {
      e.printStackTrace();
    }
    
}
    } 
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  
  public String getUpFolder(){
    File par = path.getParentFile();
    String s = par.getPath();   
    return s;
  }
  
 
}

class DirFilter implements FilenameFilter {
  String afn;
  DirFilter(String afn) { 
    this.afn = afn; 
  }
  public boolean accept(File dir, String name) {
    // Strip path information:
    String f = new File(name).getName();
    return f.indexOf(afn) != -1;
  }
}



///:~                                                                                                                                
