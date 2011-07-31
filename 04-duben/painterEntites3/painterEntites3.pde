import processing.opengl.*;

BOID[] boid;

int num = 60;

void setup(){
 size (800, 600,OPENGL); 
  background(0);
 noSmooth();
 setFullScreen( true );               // get fullscreen exclusive mode
   setResolution( 800, 600 );           // change resolution to 640, 480
   createFullScreenKeyBindings();       // let ctrl+f switch to window mode
  boid = new BOID[num];
  for (int i = 0;i<num;i++){
  boid[i] = new BOID(i);
  }
    
  
  
    
  }


void draw(){
 falloff(13);
 
  for (int i = 0;i<num;i++){
  boid[i].drawMe();
  }
  
  
  
}

void falloff(int kolik){
 noStroke();
 rectMode(CORNER);
  fill(0,kolik);
  rect(0,0,width,height); 
}
