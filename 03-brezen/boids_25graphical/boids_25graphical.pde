import processing.opengl.*;

BOID[] boid;

int num = 230;

void setup(){
 size (800, 600,OPENGL); 
  background(0);
 
  boid = new BOID[num];
  for (int i = 0;i<num;i++){
  boid[i] = new BOID(i);
  }
    
  
  
    
  }


void draw(){
  falloff(10);
 
  for (int i = 0;i<num;i++){
  boid[i].drawMe();
  }
  
  
  
}

void falloff(int kolik){
 noStroke();
  fill(0,kolik);
  rectMode(CORNERS);
  rect(0,0,width,height); 
}

void mousePressed(){
  mousePressed = false;
  if(mouseButton == RIGHT){
   this.setup();   
    
  }
  
}
