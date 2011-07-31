import processing.opengl.*;

ST[] a;


void setup(){
 size (400, 400,OPENGL); 
  background(255);
  a = new ST[10002];
  for (int i = 0;i<10000;i++){
  a[i] = new ST(i);
  }
    
  
  
    
  }


void draw(){
  fill(0);
  fill(255,5);
  rect(0,0,width,height);
 
 fill(0,50);
 
 beginShape();
  for (int i = 0;i<10000;i++){
  noStroke();
  a[i].drawMe();
  stroke(0,50);
  vertex(a[i].x,a[i].y);
  }
  
  
  endShape();
}
