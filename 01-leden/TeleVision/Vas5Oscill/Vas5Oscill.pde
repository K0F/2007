/*  little experiment ala Vasulka's ocillators from 70's
 *  get better results by lowering your brightness - simple click on the screen
 *  ..its all about calibration
 *  based on JMyron lib, thx!
 *  enjoy! Kof
 */

//import moviemaker.*;

//import processing.serial.*;
//------------->libs
import processing.opengl.*;
import JMyron.*;

String ver = ("0.1");

JMyron m;
//Serial port;
//MovieMaker movie;
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

  size(640,480,OPENGL);
  background(0);
  frameRate(25);
   setFullScreen( false );               
   setResolution( 640, 480 );           
   createFullScreenKeyBindings();       
  //---------------------> video
  m = new JMyron();//obj
  m.start(320,240);//320x240
  m.findGlobs(0);
  //smooth();
  font = loadFont("04b21-8.vlw"); //Uni0553-8.vlw
  textFont(font, 8);
  //movie = new MovieMaker(this, width, height, "tmp.mov",MovieMaker.JPEG,MovieMaker.BEST,25) ;
  //movie = new MovieMaker(this, width, height, "temp.mov",0,0) ;
  //port = new Serial(this, Serial.list()[2], 9600);
}


void draw() {
  /*recv = port.read()-48;
   if ((recv > 0)) {
   //println("received messeage");
   serialRec(); 
   }*/

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
 
  for(int y=0;y<m.height();y+=2){ 
  
    beginShape();
    for(int x=0;x<m.width();x+=2){ 
      float av = (red(img[y*m.width()+x])+green(img[y*m.width()+x])+blue(img[y*m.width()+x]))/3.0;
      r= red(img[y*m.width()+x]);
      g= green(img[y*m.width()+x]);
      b= blue(img[y*m.width()+x]);
      //fill(red(img[y*m.width()+x]),green(img[y*m.width()+x]),blue(img[y*m.width()+x]));
      stroke(255,255-((Y[y*m.width()+x]+28)*5),255-((Y[y*m.width()+x]+28)*5),100-((Y[y*m.width()+x]+28)*3));
      noFill();
      //cnt+=0.00001;
      yLim=15;//(sin(cnt)+1)*20;
      speedY[y*m.width()+x] = -(((av)-128.0)/20.0);
      
      
      if(Y[y*m.width()+x]>(yLim)){
        Y[y*m.width()+x]=yLim;
        //speedY[y*m.width()+x]=speedY[y*m.width()+x]*(0.2);
      }
      else if(Y[y*m.width()+x]<(-yLim)){
        Y[y*m.width()+x]=(-yLim);
        //speedY[y*m.width()+x]=speedY[y*m.width()+x]*(0.2);
      }
      Y[y*m.width()+x] += speedY[y*m.width()+x];
      //rotate(radians(g/50.0));
      //rect(x,y,4,4);
      vertex(x*2,(y+(Y[y*m.width()+x]))*2);
    }
    endShape();
  }

  //hlavicka();
  /*ra= red(((m.average(0,0,width,height))));
  ga= green(((m.average(0,0,width,height))));
  ba= blue(((m.average(0,0,width,height))));
  // touch1 = (ra+ga+ba/3.0);  
  //if((abs(touch1-touch2)>5)&&(accept==1)){serialRec();}
  //touch2 = (ra+ga+ba/3.0);
*/
}
void hlavicka() {
  fill(45);
  noStroke();
  rect(0, height-14, width, height);
  //ellipse((width/2)-6,width-6,6,6);
  fill(255);
  text("xOSCILLER"+"::"+ver, width-80, height-4);
  text("KRYSTOF PESEK", 5, height-4);
  text("FPS x "+floor(frameRate),120,height-4);
  if(accept == 0){
    text("r MOVIE FINISHED" , 3, 10);
  }
}

void keyPressed() {
  if (key == 's'){
  m.settings();
  }
}


/*void serialRec(){
 count +=1;
 fill(255);
 text("r REC" , 3, 10);
 
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
