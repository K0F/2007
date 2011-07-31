import processing.opengl.*;

BOID[] boid;

int num = 230;

void setup(){
 size (176,220,OPENGL); 
  background(0);
 smooth();
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
  fill(0,kolik);
  rect(width/2,height/2,width,height); 
}

void keyPressed(){
 if(keyCode==ENTER){
  save("screen.png");
 } 
  
}
