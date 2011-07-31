import processing.opengl.*;

import JMyron.*;

Point[] p=new Point[1+(160*120)];
JMyron m;
int[] img = new int[1+(160*120)];
int[] img2 = new int[1+(160*120)];
int[] img3 = new int[1+(160*120)];
int phase;

void setup(){
  size(320,240,OPENGL);
  background(0);
  for(int x = 0 ; x<160;x++){
    for(int y = 0 ; y<120;y++){
      p[y*160+x]=new Point(x,y);
    }
  } 
  m = new JMyron();//obj
  m.start(160,120);//320x240
  m.findGlobs(0);
  m.adaptivity(1.1);
  m.adapt(); 
}

void draw(){
 // background(0);
  fall(15);
  m.update();
  img =m.image();
  img2 =m.retinaImage()   ;
 img3 =m.differenceImage()   ;
  phase+=1;
    phase=phase%4;
   
  for(int x = 0 ; x<160;x++){
   
    for(int y = 0 ; y<120;y++){
     
 
      p[y*160+x].run(int(red(img2[y*160+x])),(int)blue(img3[y*160+x]),phase);
    }
  } 




}

void fall(int kolik){
  fill(0,kolik);
  rect(0,0,width,height);
  
}

public void stop(){
  m.stop();
  super.stop();



}
