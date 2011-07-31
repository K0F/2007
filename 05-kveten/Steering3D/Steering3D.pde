import processing.opengl.*;
import noc.*;
import saito.objloader.*;

float steerK;

Car wanderer;
OBJModel model;
PImage track;
boolean firstMention = true;
void setup() {
  size(640,480,OPENGL);
  setFullScreen( false );               // get fullscreen exclusive mode
  setResolution( 640, 480 );           // change resolution to 640, 480
  createFullScreenKeyBindings();       // let ctrl+f switch to window mode
  //colorMode(RGB,255,50,255,100);
  wanderer = new Car(new Vector3D(width/2,height/2),2.5f,0.051);
  reload();
}

void draw() {


  pushMatrix();
  background(49);

  rotateX(radians(50));
  translate(0,-200,-190.0);
  stroke(0);
  fill(200);
  pushMatrix();
  translate(0,0,-5);
  image(track,0,0,width,height);
  popMatrix();
  wanderer.wander(steerK);
  wanderer.run();
  popMatrix();
  steerK=((mouseX-width/2.0)*0.01);


  checkFs();
}

void keyPressed(){
  if(keyCode==LEFT){
    steerK-=0.11;
  } 

  if(keyCode==RIGHT){
    steerK+=0.11;
  } 
  if(keyCode==ENTER){
    reload();
  } 

}
void modelDraw(float x,float y,float theta){
  pushMatrix();
  //  lights();

  translate(x,y);
  rotate(theta);
  noStroke();
  noFill();
  scale(0.5);
  model.draw();
  popMatrix();
}

void reload(){
  frame.setTitle("weirdCarRace");
  track = loadImage("track.png");
  model = new OBJModel(this);
  //model.debugMode();
  model.load("karka2.obj");
  model.drawMode(TRIANGLES);
  smooth(); 

}

void checkFs(){
  
  
  if(this.isFullScreen()&&firstMention){
    reload();
    println("\n entering fullscreen mode \n data has been reloaded, ok");
    firstMention=false;
  }
  if(!this.isFullScreen()&&!firstMention){
    reload();
    println("\n leaving fullscreen mode \n data has been reloaded, ok");
    firstMention=true;
  }


}
