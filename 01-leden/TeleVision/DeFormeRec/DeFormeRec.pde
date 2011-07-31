/*  little experiment ala Vasulka's ocillators from 70's
 *  get better results by lowering your brightness - simple click on the screen
 *  ..its all about calibration
 *  based on JMyron lib, thx!
 *  enjoy! Kof
 */

import moviemaker.*;

//import processing.serial.*;
//------------->libs
import processing.opengl.*;
import JMyron.*;

String ver = ("0.1");

JMyron m;
//Serial port;
MovieMaker movie;
PFont font;
int recv;
int count,accept = 1,cn = 0;
float cnt = 0.0;
float ra,ga,ba;
float[] aa = new float[1001];
float[] ca = new float[1001];
int hold = 30;
float yLim = 40.0;
float[] Y = new float[320*240];
float[] speedY = new float[320*240];
//float touch1,touch2;
void setup() {

  size(320,240,OPENGL);
  background(0);
  frameRate(15);
  //---------------------> video
  m = new JMyron();//obj
  m.start(320,240);//320x240
  m.findGlobs(0);
  //smooth();
  font = loadFont("04b21-8.vlw"); //Uni0553-8.vlw
  textFont(font, 8);
  movie = new MovieMaker(this, width, height, "Ornagutan.mov",MovieMaker.JPEG,MovieMaker.BEST,15) ;
  //movie = new MovieMaker(this, width, height, "temp.mov",0,0) ;
  //port = new Serial(this, Serial.list()[2], 9600);
}


void draw() {
  
  falloff(75);
  vidko();
}

void falloff(int e) {
  fill(0,e);
  rect(0,0,width,height);
}

void vidko() {
  m.update();
  int[] img = m.image();
  float r,g,b;

  for(int y=0;y<height;y+=2){ 
    beginShape();
    for(int x=0;x<width;x+=2){ 
      float av = (red(img[y*width+x])+green(img[y*width+x])+blue(img[y*width+x]))/3.0;
      r= red(img[y*width+x]);
      g= green(img[y*width+x]);
      b= blue(img[y*width+x]);
      //fill(red(img[y*width+x]),green(img[y*width+x]),blue(img[y*width+x]));
      stroke(255,av/2);
      noFill();
      //cnt+=0.00001;
      yLim=av/5;//(sin(cnt)+1)*20;
      speedY[y*width+x] = -((av)-128.0)/20.0;
      Y[y*width+x] += speedY[y*width+x];
      if(Y[y*width+x]>yLim){
        Y[y*width+x]=yLim;
        speedY[y*width+x]=speedY[y*width+x]*(-0.9);
      }
      else if(Y[y*width+x]<-yLim){
        Y[y*width+x]=-yLim;
        speedY[y*width+x]=speedY[y*width+x]*(-0.9);
      }
      //rotate(radians(g/50.0));
      //rect(x,y,4,4);
      vertex(x,y+(Y[y*width+x]));
    }
    endShape();
  }

  //hlavicka();
  
   
 serialRec();
 
}
void hlavicka() {
  fill(45);
  noStroke();
  rect(0, height-14, width, height);
  //ellipse((width/2)-6,width-6,6,6);
  fill(255);
  text("DEFORMER"+"::"+ver, width-80, height-4);
  text("KRYSTOF PESEK", 5, height-4);
  text("FPS x "+floor(frameRate),120,height-4);
  if(accept == 0){
    text("r MOVIE FINISHED" , 3, 10);
  }
}

void mousePressed() {
  m.settings();
}


void serialRec(){
 
 
 loadPixels();
 
 movie.addFrame(pixels,width,height) ;
 updatePixels(); 
 }
 
 void keyPressed(){
 movie.finishMovie(); 
 accept=0;
 }
 */
public void stop() {
  // movie.finishMovie(); 
  m.stop();
  super.stop();
}
