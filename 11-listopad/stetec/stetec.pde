/**
*
* Peresent mode
*
*
*/

import processing.opengl.*;

PImage sim;
float x,y,tx,ty;
float speed = 50.0;
float theta;

void setup(){
 size(screen.width,screen.height,OPENGL);
background(0); 
  sim=loadImage("test.png");
smooth();
}

void draw(){/*
  //background(0);
  fill(0,5);
  rect(0,0,width,height);

*/
  tx+=(mouseX-tx)/speed;
  ty+=(mouseY-ty)/speed;
  x+=(tx-x)/speed;
  y+=(ty-y)/speed;
  theta=atan2(ty-y,tx-x);
  
  tint(255,5);
  pushMatrix();
  translate(x+(sim.width/2),y+(sim.height/2));
  rotate(theta);
  image(sim,0,0);
  stroke(#FFCC00,10);
  for(int i = (-50);i<50;i+=5){
  line(-10,i,10,i);
  }
  popMatrix();
}

void mousePressed(){
 background(0); 
  }

void keyPressed(){
 if(key == ' '){
  save("screen"+frameCount+".png");
 }  
 keyPressed=false;  
}
