import controlP5.*;
ControlP5 gui;
PImage bg = new PImage(1024,1024,RGB);
PImage bulb;
PGraphics temp;
boolean loaded = false;
int shiftX,shiftY,nav;
String[] navigator;


void setup(){
  size(200,200);
  frameRate(30);
  
  frame.setTitle("IcoFactory");
  
  
  bulb = loadImage("lib/bulb.png");
  temp =  createGraphics(32,32,P3D);
  temp.colorMode(ARGB);
  gui = new ControlP5(this);
  cursor(CROSS);

} 


void draw(){
  background(50);

  image(bg,shiftX,shiftY);
 image(bulb,mouseX,mouseY);
  
  
  temp.beginDraw();
  temp.background(0);
 
  for(int x = 0;x<33;x++){
     for(int y = 0;y<33;y++){
  temp.stroke((this.get(x+mouseX,y+mouseY)));
       temp.point(x,y);
     }
  }

 // println(get(mouseX,mouseY));
  temp.endDraw();
 

 image(temp,width-32,height-32);
}

void keyPressed(){
  if(keyCode==LEFT){
   shiftX+=5; 
  }
   if(keyCode==RIGHT){
   shiftX-=5; 
  }
   if(keyCode==UP){
   shiftY+=5; 
  }
   if(keyCode==DOWN){
   shiftY-=5; 
  }
  
}

void mousePressed(){
  saveBuff(); 
 mousePressed=false; 
  
}

void saveBuff(){
  navigator = loadStrings("lib/nav.kof");
  nav = Integer.parseInt(navigator[0]);
  println(nav);
  
   nav+=1;
   
  temp.save(sketchPath+"/pngs/icon"+nav+".png");
  
  navigator[0]=""+(nav);
   saveStrings("lib/nav.kof",navigator);
  println("saved");

}

void dropEvent(DropEvent theDropEvent) {
  loaded = false;
  if(theDropEvent.isFile()) {
    File myFile = theDropEvent.file();
  }
  if(theDropEvent.isImage()) {

    bg = new PImage(theDropEvent.image());
    shiftX=0;shiftY=0;
   
    
  }
  println("a dropEvent "+theDropEvent);
  
   loaded = true;
}
