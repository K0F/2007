import processing.opengl.*;

import noc.*;
/*
  
*/





Boid wanderer;
 
  float timer;
  

PImage a;
int shift = 75;
int rot;
float steerK,speedX,speedY,XX,YY,theta;

void setup(){
  size(400,400,OPENGL);
  frameRate(25);
  a= loadImage("auticko360.png");
 
background(207);
 wanderer = new Boid(new Vector3D(width/2,height/2),3.0f,0.35f);

}

void draw(){
background(207);
  
  wanderer.wander(steerK);
  wanderer.run();
   
 

}




void rotat(float rota){
 rot=(int)map(rota,-PI/2,PI/2,1,7);
  rot=constrain(rot,0,8);
  
}

void drawVector(Vector3D v, Vector3D loc, float scayl) {
  pushMatrix();
  float arrowsize = 4;
  // Translate to location to render vector
  translate(loc.x,loc.y);
  stroke(255);
  // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
  rotate(v.heading2D());
  // Calculate length of vector & scale it to be bigger or smaller if necessary
  float len = v.magnitude()*scayl;
  // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
  line(0,0,len,0);
  line(len,0,len-arrowsize,+arrowsize/2);
  line(len,0,len-arrowsize,-arrowsize/2);
  popMatrix();
}

void keyPressed(){
 if(keyCode==LEFT){
  steerK-=0.11;
 } 
 
 if(keyCode==RIGHT){
  steerK+=0.11;
 } 
  
}
