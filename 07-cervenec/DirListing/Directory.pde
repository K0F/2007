public class Directory{
  DirList d;
 
  String[] args;
  boolean opened;
  color[] colors = {#CFCFCF,#FFCF11,#FF1111};
  PApplet PA;
  Directory(PApplet _PA,String[] _args){
  PA=_PA;
  args = _args;
 
  d   = new DirList();
  d.gett(args);
  
  }
  
  void draw(){
    
   background(0);
     if(over()==-1){
       fill(colors[1],25);
      rect(0,1,width,10);
    fill(colors[1]);  
     }
      text("..",10,10);
  for(int i = 0;i<d.lista.length;i++){
  
    if(over()==i){
      
      fill(colors[1],25);
      rect(0,11+(i*10),width,10);  
       fill(colors[1]);
  
     }
     
     else{
      fill(colors[0]);
     }
      text(d.lista[i],10,20+(i*10));
   } 
    
    
  }
  
  String[] getS(){
    String[] a = d.lista;
    return a;
  }
  
  String getName(){
   int y = mouseY;
   int which = (int)(map(y,15,15+(d.lista.length*10),0,d.lista.length)) ;
   which = constrain(which,-1,d.lista.length-1);
   String result;
   if(which==-1){
     result = d.getUpFolder();
   }else{
   result = d.path.getPath()+"/"+d.lista[which];
   }
  return result; 
  }
  
  int over(){
    int which = 0;
    if(!d.filE){
   int y = mouseY;
   which = (int)(map(y,15,15+(d.lista.length*10),0,d.lista.length)) ;
   which = constrain(which,-1,d.lista.length-1);
    }
   return which;
      
  }
  
  boolean isAFile(String _s){
    String find = new File(_s).getName();
    println(find);
   return find.indexOf(".") != -1; 
    
  }
  
 
  
  
}
