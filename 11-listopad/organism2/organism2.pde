//----------------------- >

import processing.opengl.*;

//----------------------- >

int num = 2000;
Organism[] o = new Organism[num];
PImage[] bank = new PImage[5];
String name[] = {
  "steady.png","steady2.png","steady3.png","steady4.png"};
//----------------------- >

void setup(){
  size(720,576,OPENGL);  
  background(0);

  for(int i = 0;i<name.length;i++){
    bank[i] = loadImage(name[i]);
  }

  for(int i = 0;i<num;i++){
    o[i] = new Organism(i,1.80,3); 
  }

  // smooth();
}

//----------------------- >

void draw(){
  //fade(0,255);
  background(0);
  for(int i = 0;i<num;i++){
    o[i].run();
  } 

}

//----------------------- >

void fade(color q,int o){
  noStroke();
  fill(q,o);
  rect(0,0,width,height); 

}

//----------------------- >


