import java.applet.*;

PFont font;
Directory one;
String root;
Applet ap;
 URL url;
 
void setup(){
  size(200,300);
  background(0);
  
  
  ap = (Applet)this;
  init();
 if(online){
  root = param("base");//""+getDocumentBase();//"http://krystof.pesek5.eu/test/" ;//""+getDocumentBase();
 }else{
  root = sketchPath+"/structure"; 
 }
  println(root);
  font = loadFont("ArialMT-9.vlw");
  textFont(font);
  fill(255);
  noStroke();
  frame.setTitle("DirListing 001");
   
  //------------------------- base folder;
 String[] arguments = {root,""};
 one = new Directory(this,arguments);

}


void draw(){
  one.draw();
 
}

  void mousePressed(){
    if(!one.d.filE){
          
      root=one.getName();
    String[] arguments = {root,""};
     // print(arguments[0]);
    one = new Directory(this,arguments);
      
    }

  }



