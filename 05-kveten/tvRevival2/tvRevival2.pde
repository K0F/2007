
import processing.opengl.*;
import JMyron.*;

int numero = (240);

JMyron m;
Particle[] par = new Particle[numero+1];

void setup() {

  size(320*2,240,OPENGL);
  background(0);
  frameRate(25);
  frame.setTitle("cas:o:Wasp");
  frame.show();
 //---------------------> video
  m = new JMyron();//obj
  m.start(320,240);//320x240
  m.findGlobs(0);
   for(int i= 0;i<numero;i++){
  par[i]= new Particle(i);
  
}
}


void draw() {

 // falloff(5);
  m.update();
  int[] _img = m.image();
  
  for(int i= 0;i<numero;i++)
  //par[i].vidko(_img);
 par[i].vidko(_img);
}

//---------------------------> voids



void falloff(int e) {
  fill(0,e);
  rect(0,0,width,height);
}

void mousePressed() {
  m.settings();
}

public void stop() {
  // movie.finishMovie(); 
  m.stop();
  super.stop();
}
