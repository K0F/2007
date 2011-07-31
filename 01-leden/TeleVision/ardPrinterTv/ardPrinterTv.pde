import moviemaker.*;

import processing.serial.*;
//------------->libs
import processing.opengl.*;
import JMyron.*;

String ver = ("0.2");

JMyron m;
Serial port;
MovieMaker movie;
PFont font;
int recv;
int count = 0,cn = 0;
float ra,ga,ba;
float[] aa = new float[1001];
float[] ca = new float[1001];
int hold = 30;
void setup() {
  
  size(320,240,OPENGL);
  background(0);
  //---------------------> video
  m = new JMyron();//obj
  m.start(320,240);//320x240
  m.findGlobs(0);
  //smooth();
  font = loadFont("04b21-8.vlw"); //Uni0553-8.vlw
  textFont(font, 8);
  movie = new MovieMaker(this, width, height, "test.mov",0,0) ;
port = new Serial(this, Serial.list()[2], 9600);
  
  
  
}


void draw() {
 recv = port.read()-48;

if ((recv > 0)) {
    //println("received messeage");
    serialRec(); 
     
 }
  falloff(60);
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
  for(int y=0;y<height;y+=5){ 
    for(int x=0;x<width;x+=5){ 
      float av = (red(img[y*width+x])+green(img[y*width+x])+blue(img[y*width+x]))/3.0;
      r= red(img[y*width+x]);
      g= green(img[y*width+x]);
      b= blue(img[y*width+x]);
      //fill(red(img[y*width+x]),green(img[y*width+x]),blue(img[y*width+x]));
      fill(r,g,b,av/2);
      
      pushMatrix();
      //translate(,-20);
      translate(20,5);
      scale(0.8,0.8);
      //rotate(radians(g/50.0));
      rect(x,y,4,4);
      

  popMatrix();
  }
  }
  hlavicka();
  count += 1;
      if (count>1000 || keyPressed) {count=1;cn=0;for(int i =0;i<1001;i++){ca[i]=0;}}
  ra= red(((m.average(0,0,width,height))));
      ga= green(((m.average(0,0,width,height))));
      ba= blue(((m.average(0,0,width,height))));
      aa[count]=ra+ba+ga;
    stroke(255,50);
    line(count/3.0,height-20,count/3.0,height-25);
  stroke(255);
  if (abs(aa[count]-aa[count-1]) > 12){text("STRIH", 3, 10);cn+=1;ca[cn]=count/3.0;}
  for(int i=0;i<count;i++){line(ca[i],height-20,ca[i],height-25);}
  noStroke();
    
  
    stroke(255,0,0);
    line(4,height-ra,8,height-ra);
    stroke(0,255,0);
    line(4,height-ga,8,height-ga);
    stroke(0,0,255);
    line(4,height-ba,8,height-ba);
    noStroke();
 /* //fill(((m.average(0,0,width,height))/30000));
  fill(255-ra,255-ga,255-ba);
  ellipse((width/2)-1.5,height-7.5,9,9);
  fill(ra,ga,ba);
  text("h",(width/2)-4,height-10,6,6);

*/}
void hlavicka() {

  fill(45);
  noStroke();
  rect(0, height-14, width, height);

  ellipse((width/2)-6,width-6,6,6);
  fill(255);
  text("EXPONER"+"::"+ver, width-80, height-4);
  text("KRYSTOF PESEK", 5, height-4);
  
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
}

public void stop() {
  movie.finishMovie(); 
  m.stop();
  super.stop();
}
