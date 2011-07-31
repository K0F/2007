String root;

void setup(){
size(200,200);
init();

println(sketchPath);
try{
println("getCodeBase() = "+getCodeBase());
root=""+getCodeBase();
println("getLocale() = "+getLocale());
  //url = new URL(weirdplace.wz.cz, "kofEngineActual.txt");

}catch(Exception e){
  println(e);
}
 
}

void draw(){
 background(0); 
}

void mousePressed(){
 relo("test.txt"); 
  mousePressed=false;
}

public void relo(String _filename){
  String[] s;
  
 try{
   s = loadStrings(root+_filename);
  System.out.println(root+_filename+" >> load success! \n\n"+s);
 }catch(Exception e){
  System.out.println(root+_filename+" >> load did not succed! "+e);
 
  return;
  }
 try{
   s[0]=s[0]+"kof";
   saveStrings(root+_filename,s);
 System.out.println(root+_filename+" >> save succed! "+s);
 }catch(Exception e){
    System.out.println(root+_filename+" >> save did not succed! "+e);
    return;
 } 
  
  
  
}


