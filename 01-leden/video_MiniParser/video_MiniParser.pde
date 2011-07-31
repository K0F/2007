import processing.opengl.*;
//import moviemaker.*;
import processing.video.*;
//MovieMaker movie;

Movie myMovie;
PImage back;

float cnt = 0;
int x,y;
float frnum;
boolean runE = false,first =true;
String filename,AD,Length,extension;
void setup() {
  size(1280,1024,OPENGL);
  setFullScreen( true );               // get fullscreen exclusive mode
  setResolution( 1280,1024 );           // change resolution to 640, 480
  createFullScreenKeyBindings();       // let ctrl+f switch to window mode
  frameRate(25);
  
  this.frame.setTitle("miniCharger");
  this.frame.show();
  
  
   
  background(255);
  filename = "mini";
myMovie = new Movie(this, "//movies/"+filename+".mov",25);
  frnum = myMovie.duration()*25;
  myMovie.speed((frnum/1706.667));
}

  
void draw() {
 
  if ((runE)&&(first)){
    
    myMovie.play();
    myMovie.jump(-2.0);
    first = false; 
   background(255); 
  }  
  else if ((runE)&&(!first)){

    if(x>screen.width){
      y+=24;
      x=0;
    }
    if(y>screen.height){
      /*x=0;
      y=0;*/
      filename = filename.concat("_");
  AD = "";
  Length = AD+(myMovie.duration()/60)+"_min";
  filename = filename.concat(Length);
  extension = ".png";
  filename = filename.concat(extension);
      saveFrame("structures/"+filename);
      delay(80);
      this.exit();
      
    }
    myMovie.read();


    
    image(myMovie, x, y);
    x +=32;

  }
}
void keyPressed(){
if(key == ENTER){ runE = true;}

}

