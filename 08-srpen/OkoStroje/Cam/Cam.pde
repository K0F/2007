import moviemaker.*;

import processing.opengl.*;
import JMyron.*;

Camera cam;
MovieMaker movie;

boolean accept = true;

void setup(){
 size(360,288);//(360,288,OPENGL);
 frameRate(25);
 cam = new Camera(width,height,1);  //sirka,vyska,resoluce
 movie = new MovieMaker(this, width, height, "chodba.mov",MovieMaker.JPEG,MovieMaker.BEST,25) ;
 noStroke();
 noSmooth(); 
 background(0);
  
}

void draw(){
  cam.viz();  
   Rec(); 
}

public void stop() {
 
  cam.c.stop();
  super.stop();
}

void Rec(){
if(accept){
   loadPixels();
  
  movie.addFrame(pixels,width,height) ;
  updatePixels();
} 
}

void keyPressed(){
 if(accept){
  movie.finishMovie(); 
  accept=false;
 }
}




