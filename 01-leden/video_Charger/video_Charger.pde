import processing.opengl.*;

//import moviemaker.*;
import processing.video.*;
//MovieMaker movie;
Movie myMovie;


float cnt = 0;
int x,y;
void setup() {
  size(1280, 1024,OPENGL);
  frameRate(15);
  //movie = new MovieMaker(this, width, height, "distrupted4.mov",MovieMaker.JPEG,MovieMaker.HIGH,15) ;
  myMovie = new Movie(this, "distrupted2.mov",15);
    myMovie.loop();
    background(0);
    
}

void draw() {
    x +=25;
    if(x>width){y+=25;x=0;}
    if(y>height){x=0;y=0;saveFrame("strucrue-######.jpg");}
    myMovie.read();
    
  pushMatrix();
  scale(0.1,0.1);
  
  image(myMovie, x*13, y*10);
  
  popMatrix();
  //Rec(); 
  
   
}

/*void Rec(){
  loadPixels();
  movie.addFrame(pixels,width,height) ;
  updatePixels(); 
}

void keyPressed(){
 movie.finishMovie(); 
  
}*/



