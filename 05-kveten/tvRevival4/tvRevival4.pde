import moviemaker.*;
import processing.opengl.*;
import JMyron.*;

int numero = (60),accept = 1;
int len = 60;

JMyron m;
Particle[][] par = new Particle[numero+1][len+1];
MovieMaker movie;

void setup() {

  size(320,240,OPENGL);
  background(0);
  frameRate(15);
  frame.setTitle("cas:o:Wasp");
  frame.show();
  //---------------------> video
  m = new JMyron();//obj
  m.start(320,240);//320x240
  m.findGlobs(0);
  movie = new MovieMaker(this, width, height, "movies/temp.mov",MovieMaker.JPEG,MovieMaker.BEST,12) ;

  for(int i= 0;i<numero;i++){
    for(int q= 0;q<len;q++){
      par[i][q]= new Particle(i,q);
    }
  }
}


void draw() {

  m.update();

  int[] _img = m.image();

  for(int i= 0;i<numero;i++){
    for(int q= 0;q<len;q++){
      par[i][q].vidko(_img);
    }
  }
  Rec();  
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
    accept=0;
  }
}


void Rec(){
  if(accept==1){
    loadPixels();
    movie.addFrame(pixels,width,height);
  }
}


public void stop() {
  movie.finishMovie(); 
  m.stop();
  super.stop();
}
