import moviemaker.*;
import processing.opengl.*;
import JMyron.*;

int numero = (240),accept = 1;
int len = 120;

JMyron m;
Particle[][] par = new Particle[numero+1][len+1];
MovieMaker movie;

void setup() {

  size(320,240,OPENGL);
  background(0);
  frameRate(25);
  frame.setTitle("cas:o:Wasp");
  frame.show();
 //---------------------> video
  m = new JMyron();//obj
  m.start(320,240);//320x240
  m.findGlobs(0);
  movie = new MovieMaker(this, width, height, "movies/temp.mov",MovieMaker.JPEG,MovieMaker.HIGH,25) ;
  
   for(int i= 0;i<numero;i++){
     for(int q= 0;q<len;q++){
  par[i][q]= new Particle(i,q);
     }
}
}


void draw() {

 // falloff(5);
  m.update();
  int[] _img = m.image();
  
  for(int i= 0;i<numero;i++){
     for(int q= 0;q<len;q++){
  
 par[i][q].vidko(_img);
  }
  }
  
 if((par[2][0].x==par[2][0].speedX)&&(accept==1)){
  //Rec(); 
 }
}

//---------------------------> voids



void falloff(int e) {
  fill(0,e);
  rect(0,0,width,height);
}

void mousePressed() {
  m.settings();
}

void keyPressed(){
  if(accept==1){
 movie.finishMovie(); 
 // saveFrame("smooted-######.png");
  accept=0;
  }
}


void Rec(){
   loadPixels();
  print("added");
  movie.addFrame(pixels,width,height) ;
  updatePixels(); 
}


public void stop() {
  // movie.finishMovie(); 
  m.stop();
  super.stop();
}
