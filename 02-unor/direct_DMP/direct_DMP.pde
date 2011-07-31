import JMyron.*;
import processing.opengl.*;
//import moviemaker.*;
//import processing.video.*;
//MovieMaker movie;


PImage back;
JMyron input;
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
//myMovie = new Movie(this, "//movies/"+filename+".mov",25);
  //frnum = myMovie.duration()*25;
  //myMovie.speed((frnum/1706.667));
  input = new JMyron();//obj
  input.start(32,24);//320x240
  input.findGlobs(0);

}

  
void draw() {
 
  if ((runE)&&(first)){
    
    
    first = false; 
   background(255); 
  }  
  else if ((runE)&&(!first)){
input.update();
  int[] img = input.image();

    if(x>screen.width){
      y+=24;
      x=0;
    }
    if(y>screen.height){
      x=0;
      y=0;
      filename = filename.concat("_");
  AD = "";
  String lenght = AD+millis();
  filename = filename.concat(lenght);
  extension = ".png";
  filename = filename.concat(extension);
      saveFrame("structures/"+filename);
      delay(80);
      this.exit();
      
    }
    //myMovie.read();
    for(int yy=0;yy<24;yy+=1){ 
    for(int xx=0;xx<32;xx+=1){ 
    noFill();
    stroke(brightness(img[yy*32+xx]));
    rect(xx+x,yy+y,1,1);
    }
    }
    x +=32;

  }
}
void keyPressed(){
if(key == ENTER){ runE = true;}

}

