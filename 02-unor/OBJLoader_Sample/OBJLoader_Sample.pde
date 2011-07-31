import processing.opengl.*;

//import processing.opengl.*;

// .OBJ Loader
// by SAITO <http://users.design.ucla.edu/~tatsuyas>
// Placing a virtual structure represented as mathematically
// three-dimensional object.
// SModel.load() reads structure data of the object stored
// as numerical data.
// SModel.draw() gives a visual form to the structure data.
// processing standard drawing functions can be used to manipulate
// the visual form to create deep visual experiences.
// Created 20 April 2005

import saito.objloader.*;
PImage t = loadImage("Box01DiffuseMap.jpg");
OBJModel model;
float rotX;
float rotY;

void setup()
{
  size(600, 600, OPENGL);
  frameRate(30);
  model = new OBJModel(this);
  model.debugMode();
  model.load("test.obj");
  
}
void draw()
{
  background(255);
  lights();
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(rotY);
  rotateY(rotX);
  scale(2.0);
  texture(t);
  //model.enableTexture();
  model.draw();
  popMatrix();
}

boolean bTexture = true;
boolean bStroke = true;

void keyPressed(){
  if(key == 't'){
    if(!bTexture){
      model.enableTexture();
      bTexture = true;
    } else {
      model.disableTexture();
      bTexture = false;
    }
  }
  if(key == 's'){
    if(!bStroke){
      stroke(10, 10, 10, 100);
      bStroke = true;
    } else {
      noStroke();
      bStroke = false;
    }
  }
  /*else if(key=='1')
  model.drawMode(POINTS);
  else if(key=='2')
  model.drawMode(LINE_LOOP);
  else if(key=='3')
  model.drawMode(TRIANGLES);
  else if(key=='4')
  model.drawMode(POLYGON);*/
}

void mouseDragged()
{
  rotX += (mouseX - pmouseX) * 0.01;
  rotY -= (mouseY - pmouseY) * 0.01;
}
