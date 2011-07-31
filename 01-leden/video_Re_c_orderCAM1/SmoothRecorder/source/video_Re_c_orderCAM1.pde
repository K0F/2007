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
  movie = new MovieMaker(this, width, height, "movies/temp.mov",MovieMaker.JPEG,MovieMaker.HIGH,25) ;
//port = new Serial(this, Serial.list()[2], 9600);
  
    
  
}
float[] r = new float[415000];
float[] rm = new float[415000];

void draw() {
 /*ra= red(((m.average(0,0,width,height))));
  ga= green(((m.average(0,0,width,height))));
   ba= blue(((m.average(0,0,width,height))));
    touch1 = (ra+ga+ba/3.0);  
   if((abs(touch1-touch2)>10)&&(accept==1)){res = 1;}else{res = 3;}
    touch2 = (ra+ga+ba/3.0);*/
  vidko(1,25);
  
  //falloff(60);
  
 


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
      stroke((brightness(img[y*width+x])-50)*1.5,20);
     
      //rotate(radians(g/50.0));
     
      line(x,y,x+1,y);
     
     
 
  }
  }
  serialRec();
  
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
 // saveFrame("smooted-######.png");
  accept=0;
  }
}

public void stop() {
  movie.finishMovie(); 
  m.stop();
  super.stop();
}
