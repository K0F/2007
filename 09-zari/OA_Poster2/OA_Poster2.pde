import processing.dxf.*;

import processing.opengl.*;

import processing.core.*;
import fullscreen.*;

FullScreen fs;

float x,y;
float bright = 50.0;
PImage g;
boolean record = false;

void setup(){   
  g = loadImage("roten.png");//pAK022.png");
  println(g.width+" "+g.height);
  size(g.width,g.height,P3D);

  fs = new FullScreen(this);
  fs.allowKeys();
  fs.setResolution(screen.width,screen.height);
  fs.enter();

  stroke(255,5);
  noFill();
 // smooth();
}

void draw(){
  background(0);
  
   if (record) {
    beginRaw(DXF, "output.dxf");
  }
  
  for(int Y = 0;Y<height;Y+=3){
    
    beginShape();
    
    for(int X = 0;X<width;X+=1){
     // int id = (int)map(Y*g.width+X,0,g.width*g.height+g.width,0,width*height+width);
     int id = Y*width+X;
      //stroke(color(g.pixels[id]),15);
      strokeWeight(map(brightness(color(g.pixels[id])),0,255,0,5.0));
      vertex(X,Y-(map(brightness(color(g.pixels[id])),0,255,0,bright)));

    } 
    endShape();
    
  } 
  
 
  
  
   if (record) {
    endRaw();
    println("saved!");
    record = false;
  }
  bright = mouseY;


}

void keyPressed() {
  // use a key press so that it doesn't make a million files
  if (key == 'r') record = true;
}

void fade(int kolik){
 noStroke();
   fill(0,kolik);
   rect(0,0,width,height);
  noFill();
  stroke(255,5); 
  
}
