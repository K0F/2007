import processing.opengl.*;

ST[] a;


void setup(){
 size (400, 400,OPENGL); 
  background(255);
  a = new ST[1002];
  for (int i = 0;i<1000;i++){
  a[i] = new ST(i);
  }
    
  
  
    
  }


void draw(){
  fill(0);
  fill(255,15);
  rect(0,0,width,height);
 pushMatrix();
 
  for (int i = 0;i<1000;i++){
  a[i].drawMe();
  }
  popMatrix();
}
