import processing.opengl.*;
import processing.video.*;

Movie myMovie;

void setup() 
{
  size(200, 200,OPENGL);
  background(0);
  frameRate(25);
  // Load and play the video in a loop
  myMovie = new Movie(this, "czip.mov");
  myMovie.frameRate(15);
  myMovie.loop();
  movieEvent(myMovie);
}

void movieEvent(Movie myMovie) {
  myMovie.read();
}


void draw() 
{
 
  image(myMovie, 0,0);
}
