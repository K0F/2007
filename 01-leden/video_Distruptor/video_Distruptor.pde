import moviemaker.*;
import processing.video.*;
MovieMaker movie;
Movie myMovie;


float cnt = 0;
void setup() {
  size(320, 240,P3D);
  frameRate(15);
  movie = new MovieMaker(this, width, height, "staticalDSP.mov",MovieMaker.JPEG,MovieMaker.BEST,15) ;
  myMovie = new Movie(this, "statical.mov");
    myMovie.loop();
}

void draw() {
  tint(0,0,0,mouseY);
  image(myMovie, 0, 0);
  Rec(); 
  myMovie.read();
  myMovie.jump(random(myMovie.duration()));
}

void Rec(){
  loadPixels();
  movie.addFrame(pixels,width,height) ;
  updatePixels(); 
}

void keyPressed(){
 movie.finishMovie(); 
  
}



