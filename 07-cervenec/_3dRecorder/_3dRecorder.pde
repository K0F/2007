import processing.opengl.*;
import processing.dxf.*;

boolean record;

int w= 6;
int h = 6;
int segments = 6;
Objekt[] o = new Objekt[w*h];

void setup(){
  size(200,200,OPENGL);
  background(0); 
  stroke(255,15);
  noFill();
  for(int x = 0;x<w;x++){
    for(int y = 0; y<h;y++){

      o[y*w+x] = new Objekt(x,y,segments);
    } 

  }


}

void keyPressed() {
  // use a key press so that it doesn't make a million files
  if (key == 'r') record = true;
}

void draw(){
background(0);

 if (record) {
    beginRaw(DXF, "output.dxf");
  }
  
    for(int x = 0;x<w;x++){
    for(int y = 0; y<h;y++){

      o[y*w+x].build(mouseX,mouseY);
    } 

  }

 if (record) {
    endRaw();
    record = false;
  }

}

class Objekt{
  int xD,yD,zD;
  int seg = 0;
  float seed = 5.0f; 

  float[] X;
  float[] Y;
  float[] Z;

  Objekt(int _x,int _y,int _seg){

    xD=_x;
    yD=_y;
    seg=_seg;
    zD=seg;
    X = new float[seg];
    Y = new float[seg];
    Z = new float[seg];
    seed();
  } 

  void seed(){

    for(int i = 0;i<seg;i++){
      X[i] = random(-seed,seed);
      Y[i] = random(-seed,seed); 
      Z[i] = i*random(2,13);
    }


  }

  void build(float _x,float _y){
      seed();
    pushMatrix();
    translate(_x,_y);

    for(int x = 0;x<xD;x++){
        beginShape();
      for(int y = 0;y<yD;y++){
      
      
        
          vertex(X[(int)random(xD)],Y[(int)random(yD)],Z[(int)random(zD)]);
        
        
      }
      endShape();
    } 

popMatrix();

  }




}
