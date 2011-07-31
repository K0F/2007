
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
void setup() {

  size(32,24,OPENGL);
  frameRate(25);
  background(0);
  this.frame.setTitle("miniREC");
   this.frame.show();
  
  //---------------------> video
  m = new JMyron();//obj
  m.start(32,24);//320x240
  m.findGlobs(0);
  //smooth();
  font = loadFont("04b21-8.vlw"); //Uni0553-8.vlw
  textFont(font, 8);
  movie = new MovieMaker(this, width, height, "miniParser/movies/mini.mov",MovieMaker.JPEG,MovieMaker.BEST,25) ;

}

int  zavadec = 0;
int  vyvadec = 0;
void draw() {
  
  if(zavadec<=20){
    blankIn();
    serialRec();
  }else if((vyvadec<=20)&&(accept==0)){
    blankOut();
    serialRec();
   
  }
  else {
    
    vidko(1);
  }
  
}



void blankIn(){
 
    zavadec += 1;
     background(0);
    fill(255);
     if(zavadec == 1){text("START",(width/2)-14,height/2);}else{
    text(21-zavadec,(width/2)-6,height/2);
     }
}

void blankOut(){
  
    vyvadec += 1;
     background(0);
    fill(255);
    char www = char(vyvadec+100);
    text(www,(width/2),height/2);
    if(vyvadec == 20){text("END",(width/2)-8,height/2);}
  if (vyvadec>20) {movie.finishMovie();} 
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
  if ((resolution == 1)&&(accept==1)){
    serialRec();
  }
  fill(255);

  if(accept == 0){
    text("RCD",(width/2)-8,height/2);
    this.frame.setTitle("miniREC - finished");
    this.frame.show();
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
  
  accept=0;
}

public void stop() {
  movie.finishMovie(); 
  m.stop();
  super.stop();
}
