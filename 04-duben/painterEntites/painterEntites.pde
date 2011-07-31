import processing.opengl.*;

BOID[] boid;

int num = 40;

void setup(){
 size (400, 400,OPENGL); 
  background(0);
 
  boid = new BOID[num];
  for (int i = 0;i<num;i++){
  boid[i] = new BOID(i);
  }
    
  
  
    
  }


void draw(){
 // falloff(3);
 
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
