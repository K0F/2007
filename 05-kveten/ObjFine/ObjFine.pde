import processing.opengl.*;

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

OBJModel model;
float rotX;
float rotY;
float sX,sY;
boolean loaded = false;
void setup()
{
  size(800, 600, OPENGL);
  frameRate(30);
 /* setFullScreen( false );               // get fullscreen exclusive mode
    setResolution( 800, 600 );           // change resolution to 640, 480
    createFullScreenKeyBindings();       // let ctrl+f switch to window mode*/
  //noSmooth();
 reload();
  noStroke();
 // smooth();
  fill(255);
}
float aa;
void draw()
{
  if(loaded){
  aa+=0.01;
  background(0);
 // lights();
  pushMatrix();
  //smooth();
  translate(width/2, height/2, 0);
  rotateX(sX);
  rotateY(sY);
  scale(2.4);
  
  model.draw();
  popMatrix();
  }
  
  sX+=(rotX-sX)/100.0f;
  sY+=(rotY-sY)/100.0f;
  
  if(frameCount%60==0){
   rotX += random(-5,5);
  rotY += random(-5,5); 
  }
}

boolean bTexture = true;
boolean bStroke = false;
void keyPressed(){
   if(keyCode == ENTER){
 
   }
  keyPressed = false;
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
  else if(key=='1')
  model.drawMode(QUADS);
 
 else if(key=='2')
  model.drawMode(LINES);
  else if(key=='3')
  model.drawMode(TRIANGLES);
  else if(key=='4')
  model.drawMode(POLYGON);
}

void mouseDragged()
{
  rotX += (mouseX - pmouseX) * 0.01;
  rotY -= (mouseY - pmouseY) * 0.01;
}

void reload(){
    model = new OBJModel(this);
  //model.debugMode();
  model.load("hand.obj");
  model.drawMode(TRIANGLES);
  loaded=true;
}
