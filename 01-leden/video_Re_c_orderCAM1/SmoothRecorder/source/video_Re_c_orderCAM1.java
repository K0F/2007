import processing.core.*; import moviemaker.*; import processing.opengl.*; import JMyron.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class video_Re_c_orderCAM1 extends PApplet {

//import processing.serial.*;
//------------->libs



String ver = ("0.3");

JMyron m;
//Serial port;
MovieMaker movie;
PFont font;
int recv;
int count,accept = 1,cn = 0;
float ra,ga,ba;

int hold = 30;
float touch1,touch2;
int res = 1;
public void setup() {
  
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
  movie = new MovieMaker(this, width, height, "movies/temp.mov",MovieMaker.JPEG,MovieMaker.HIGH,25) ;
//port = new Serial(this, Serial.list()[2], 9600);
  
    
  
}
float[] r = new float[415000];
float[] rm = new float[415000];

public void draw() {
 /*ra= red(((m.average(0,0,width,height))));
  ga= green(((m.average(0,0,width,height))));
   ba= blue(((m.average(0,0,width,height))));
    touch1 = (ra+ga+ba/3.0);  
   if((abs(touch1-touch2)>10)&&(accept==1)){res = 1;}else{res = 3;}
    touch2 = (ra+ga+ba/3.0);*/
  vidko(1,25);
  
  //falloff(60);
  
 


}

public void falloff(int e) {
  fill(0,e);
  rect(0,0,width,height);
}



public void vidko(int resolution,int ff) {

  m.update();
  int[] img = m.image();
  
  
   

  for(int y=0;y<height;y+=resolution){ 
    
    for(int x=0;x<width;x+=1){ 
      
    
     
      noFill();
      stroke((brightness(img[y*width+x])-50)*1.5f,20);
     
      //rotate(radians(g/50.0));
     
      line(x,y,x+1,y);
     
     
 
  }
  }
  serialRec();
  
}

public void mousePressed() {
  m.settings();
}


public void serialRec(){
   loadPixels();
  
  movie.addFrame(pixels,width,height) ;
  updatePixels(); 
}
public void keyPressed(){
  if(accept==1){
 movie.finishMovie(); 
 // saveFrame("smooted-######.png");
  accept=0;
  }
}

public void stop() {
  movie.finishMovie(); 
  m.stop();
  super.stop();
}
static public void main(String args[]) {   PApplet.main(new String[] { "video_Re_c_orderCAM1" });}}