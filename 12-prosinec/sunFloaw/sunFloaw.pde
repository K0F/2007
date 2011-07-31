import processing.opengl.*;
import hipstersinc.sunflow.*;
import hipstersinc.sunflow.shader.*;
import hipstersinc.*;



void setup() {
//  size(350, 200, OPENGL);//"hipstersinc.P5Sunflow");
  size(800, 400, "hipstersinc.P5Sunflow");
  noLoop();
  noStroke();
}

 

void draw() {
    int numSpheres = 800;
 float yStep = width/4;
 float y = 40;
  
  background(50); 

  for(int i=0; i<numSpheres; i++) {
    
    pushMatrix();
    translate(random(width), random(height),-random(width));

    fill( 255 );
    sphere(10);
    popMatrix();

   // y += yStep;
  }
  
  save("rendOut.png");
}
