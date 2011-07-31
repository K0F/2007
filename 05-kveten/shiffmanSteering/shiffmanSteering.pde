import processing.opengl.*;

// Wander
// Daniel Shiffman <http://www.shiffman.net>

// Demonstration of Craig Reynolds' "Wandering" behavior
// See: http://www.red3d.com/cwr/

// Click mouse to turn on and off rendering of the wander circle

// Created 2 May 2005 (Revised Feb 2007)

import noc.*;

float steerK;

Boid wanderer;


void setup() {
  size(800,600,OPENGL);
  colorMode(ARGB,255,50,255,100);
  wanderer = new Boid(new Vector3D(width/2,height/2),3.0f,0.35f);
  smooth();
}

void draw() {
  background(100);
  wanderer.wander(steerK);
  wanderer.run();

}

void keyPressed(){
 if(keyCode==LEFT){
  steerK-=0.11;
 } 
 
 if(keyCode==RIGHT){
  steerK+=0.11;
 } 
  
}



