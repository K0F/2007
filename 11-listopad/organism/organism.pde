//----------------------- >

import processing.opengl.*;

//----------------------- >

int num = 200;
Organism[] o = new Organism[num];
PImage[] bank = new PImage[5];
String name[] = {"steady.png","steady3.png"};
//----------------------- >

void setup(){
  size(800,400,OPENGL);  
  background(0);
  
  for(int i = 0;i<name.length;i++){
  bank[i] = loadImage(name[i]);
  }
  
  for(int i = 0;i<num;i++){
    o[i] = new Organism(i); 
  }
   

}

//----------------------- >

void draw(){
  background(0);

  for(int i = 0;i<num;i++){
    o[i].run();
  } 

}

//----------------------- >

class Organism{
  float x,y,tx,ty;
  float speed;
  float vel;
  PImage img;
  int id,which;
  float theta;
  float distance;

  Organism(int _id){
    id=_id;
    
    x=tx=random(width);
    y=ty=random(height);
    speed=2.0;
    img = bank[1];
    vel=img.width/2.0;
  }

  void run(){
    
    compute();
    
    pushMatrix();
    translate(x,y);
    rotate(theta-HALF_PI);
    tint(255,55);
    image(img,0-vel/2.0,0-vel/2.0,vel,vel);
    popMatrix();
  }

  void compute(){
      
    for(int i =0;i<num;i++){
     which = constrain(id-1,0,num);
     if((i==which)&&(id!=0)){
     
      tx+=(o[which].x-tx)/speed;
      ty+=(o[which].y-ty)/speed;      
     }//end if 
     else if(id==0){
      tx+=(mouseX-tx)/speed;
      ty+=(mouseY-ty)/speed;
     }
    }//end for
    
    x+=(tx-x)/speed;
    y+=(ty-y)/speed;
    
    theta = atan2(ty-y,tx-x);
    
  }//end void
  
  
}
