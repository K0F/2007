import processing.core.*;
import fullscreen.*;

import processing.opengl.*;
import saito.objloader.*;

OBJModel model;
float rotX;
float rotY;
boolean loaded = false;
void setup()
{
  size(1024, 768, OPENGL);
  frameRate(30);
  entrFs();
  this.frame.setTitle("Orchestrion Etapa 1");
  reload();
  noStroke();
  //smooth();
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
  rotateX(rotY);
  rotateY(rotX);
  scale(0.4);
  
  model.draw();
  popMatrix();
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
  model.load("etapa1.obj");
  model.drawMode(TRIANGLES);
  loaded=true;
}

void entrFs(){
  FullScreen fs; 
  fs = new FullScreen(this); 
  fs.setResolution(screen.width,screen.height);
  fs.enter();
  // enter fullscreen mode
  // let ctrl+f switch to window mode
 
  fs.allowKeys();
  
}
