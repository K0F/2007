import processing.opengl.*;

BOID[] boid;

int num = 20;

void setup(){
 size (400, 400,OPENGL); 
  background(255);
 
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
  fill(255,kolik);
  rect(width/2,height/2,width,height); 
}

void mousePressed(){

  if(mouseButton == RIGHT){
     mousePressed=false;
   this.setup(); 
  }
  
}
