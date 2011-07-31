import processing.opengl.*;
import hipstersinc.sunflow.*;
import hipstersinc.sunflow.shader.*;
import hipstersinc.*;

boolean render = true;
int w =  800;
int h = 600;

void setup() {
  if(!render){
    size(w, h, OPENGL);//"hipstersinc.P5Sunflow");
  }
  else{
    size(w, h, "hipstersinc.P5Sunflow");
  }
  noLoop();
  stroke(0);
  noStroke();
}



void draw() {
  int num =200;
  float yStep = width/4;
  float y = 40;

  background(50); 

  beginShape();

  for(int i=0; i<num; i++) {
    fill( 255 );
    vertex(random(width), random(height),-random(width));
  }
  endShape(CLOSE);

  save("rendOut.png");
}
