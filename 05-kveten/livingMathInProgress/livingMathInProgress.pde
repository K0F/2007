//import moviemaker.*;
import processing.opengl.*;

int num = 3000,cntrme;
float[] a = new float[6];
float keep = 0.2;
float range = 2.5;
float speedSim = 0.1;
boolean active = false;

Attr[] attr = new Attr[num];
//MovieMaker movie;

void setup(){
  size(640,480,OPENGL);
  background(0);
  //movie = new MovieMaker(this, width, height, "temp.mov",MovieMaker.JPEG,MovieMaker.HIGH,30) ;
  fill(255,255,255,40);
  noStroke();
  noSmooth();
  frameRate(70);
  newDraw();
active = true;
}

void draw(){
  if(active){
  cntrme+=1;
  for(int i=0;i<num;i++){
    attr[i].update();

    
  }
  
  if(cntrme%3==0){
    //Rec();
   newDraw(); 
   cntrme=0;
  }
  }
}


void newDraw(){
  //background(0);
  //noStroke();
  fill(0,15);
  rect(0,0,width,height);
  speedSim+=0.001;
  initParam(speedSim);
  for(int i=0;i<num;i++){
    attr[i]=new Attr();
  }
}
void initParam(float maxi){
  a[0]=((maxi)*0.33);
  a[1]=((maxi)*1.33);
  a[2]=((maxi)*2.0);
  a[3]=((maxi)*PI);
  }
/*
void Rec(){
   loadPixels();
  
  movie.addFrame(pixels,width,height) ;
  updatePixels(); 
}
void keyPressed(){
active=false;
  movie.finishMovie(); 
  
 keyPressed=false;
}

*/

