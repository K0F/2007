

//import processing.serial.*;
//------------->libs
import processing.opengl.*;
import JMyron.*;

String ver = ("0.3");

JMyron m;
//Serial port;

PFont font;
int recv;
int count,accept = 1,cn = 0;
float ra,ga,ba;

int hold = 30;
float touch1,touch2;
int res = 1;
void setup() {
  
  size(720/2,576/2,OPENGL);
  frameRate(15);
  background(0);
  frame.setTitle("SmoothRecorder");
  //---------------------> video
  m = new JMyron();//obj
  m.start(720/2,576/2);//320x240
  m.findGlobs(0);
  //smooth();
  font = loadFont("04b21-8.vlw"); //Uni0553-8.vlw
  textFont(font, 8);
 
//port = new Serial(this, Serial.list()[2], 9600);
  
    
  
}
float[] r = new float[415000];
float[] rm = new float[415000];

void draw() {

  vidko(1,25);
  
 


}

void falloff(int e) {
  fill(0,e);
  rect(0,0,width,height);
}



void vidko(int resolution,int ff) {

  m.update();
  int[] img = m.image();
  
  
   

  for(int y=0;y<height;y+=resolution){ 
    
    for(int x=0;x<width;x+=1){ 
      
    
     noFill();
      stroke(img[y*width+x]);
     // stroke((brightness(img[y*width+x])-50)*1.5,20);
     
      //rotate(radians(g/50.0));
     
      line(x,y,x+1,y);
     
     
 
  }
  }
  
}

void mousePressed() {
  m.settings();
}





