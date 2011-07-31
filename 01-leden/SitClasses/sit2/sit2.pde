import processing.opengl.*;

ST[] a;


void setup(){
 size (400, 400,OPENGL); 
  frameRate(50);
  background(255);
 a = new ST[10];
  for (int i = 0;i<10;i++){
  a[i] = new ST();
  }
    
  
  
    
  }


void draw(){
  fill(0);
  fill(255);
  rect(0,0,width,height);
 pushMatrix();
 
  
  //a[i].drawMex(int(random(i)));
  a[1].drawMe(123,20,0,120);
  a[2].drawMe(103,18,100,120);
  a[3].drawMe(85,15,200,120);
  a[4].drawMe(64,11,300,100);
  popMatrix();
}
