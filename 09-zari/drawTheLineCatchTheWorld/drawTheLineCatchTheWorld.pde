import processing.core.*;
import fullscreen.*;

import processing.opengl.*;

FullScreen fs;

float x1,y1,x2,y2;

void setup(){
 size(screen.width,screen.height,OPENGL);

fs = new FullScreen(this);
fs.setResolution(screen.width,screen.height);
fs.enter();
fs.allowKeys();

 
 background(255);
 stroke(0,15);
  x1 = x2 = y1 = y2 = width/2;
  
  cursor(CROSS);
  
  smooth();
}

void draw(){
  
  x2 = x1;
  y2 = y1;
  if(!mousePressed){
  x1 += random(-10,10);
  y1 += random(-10,10);
  }else{
    x1 += random(-3,3);
  y1 += random(-3,3); 
  }
  
  x1+=(mouseX-x1)/10.0;
  y1+=(mouseY-y1)/10.0;
  
  if(x1>width){x1=0;}
  if(x1<0){x1=width;}
  if(y1>height){y1=0;}
  if(y1<0){y1=height;}
  
  
  if((abs(x1-x2)<100)&&(abs(y1-y2)<100)){
  line(x1,y1,x2,y2);
  }
  
  
}

void keyPressed(){
 if(key==' '){
  background(255);
 }else if(key==ENTER){
  save("drawing.png"); 
 }
  
}

void mousePressed(){
 stroke(0,95); 
  
}

void mouseReleased(){
stroke(0,15); 
  
}
