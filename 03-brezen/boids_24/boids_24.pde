import processing.opengl.*;

BOID[] a;

int num = 230;

void setup(){
 size (400, 400,OPENGL); 
  background(255);
 
  a = new BOID[num];
  for (int i = 0;i<num;i++){
  a[i] = new BOID(i);
  }
    
  
  
    
  }


void draw(){
  noStroke();
  fill(255,5);
  rect(width/2,height/2,width,height);
 
  for (int i = 0;i<num;i++){
  a[i].drawMe();
  }
  
  
  
}
