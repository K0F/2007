
import moviemaker.*;

//import processing.serial.*;
//------------->libs
import processing.opengl.*;
import JMyron.*;

String ver = ("0.3");

JMyron m;
//Serial port;
MovieMaker movie;
PFont font;
int recv;
int count,accept = 1,cn = 0;
float ra,ga,ba;
float[] aa = new float[1001];
float[] ca = new float[1001];
int hold = 30;
float touch1,touch2;
int res = 3;
Image img;
void setup() {
  
  size(320,240,OPENGL);
  frameRate(15);
  

   //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------* frame title
  frame.setTitle("videoRecorder");
  //-----------------------*
  



  
  background(0);
  //---------------------> video
  m = new JMyron();//obj
  m.start(320,240);//320x240
  m.findGlobs(0);
  //smooth();
  font = loadFont("04b21-8.vlw"); //Uni0553-8.vlw
  textFont(font, 8);
  movie = new MovieMaker(this, width, height, "temp.mov",MovieMaker.JPEG,MovieMaker.HIGH,15) ;
//port = new Serial(this, Serial.list()[2], 9600);
  
  
  
}


void draw() {
 ra= red(((m.average(0,0,width,height))));
  ga= green(((m.average(0,0,width,height))));
   ba= blue(((m.average(0,0,width,height))));
    touch1 = (ra+ga+ba/3.0);  
   if((abs(touch1-touch2)>10)&&(accept==1)){res = 1;}else{res = 3;}
    touch2 = (ra+ga+ba/3.0);
  vidko(res);
  
  //falloff(60);
  
 


}

void falloff(int e) {
  fill(0,e);
  rect(0,0,width,height);
}



void vidko(int resolution) {

  m.update();
  int[] img = m.image();
  
  
   
  float r,g,b;
  for(int y=0;y<height;y+=resolution){ 
    for(int x=0;x<width;x+=resolution){ 
      float av = (red(img[y*width+x])+green(img[y*width+x])+blue(img[y*width+x]))/3.0;
      r= red(img[y*width+x]);
      g= green(img[y*width+x]);
      b= blue(img[y*width+x]);
      //fill(red(img[y*width+x]),green(img[y*width+x]),blue(img[y*width+x]));
      fill(r,g,b);
      noStroke();
     
      //rotate(radians(g/50.0));
      rect(x,y,resolution,resolution);
      

 
  }
  }
  if (resolution == 1){serialRec();}
  
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
 if(accept==1){
  movie.finishMovie(); 
  accept=0;
 }
}

public void stop() {
  movie.finishMovie(); 
  m.stop();
  super.stop();
}
