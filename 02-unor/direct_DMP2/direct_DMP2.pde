import JMyron.*;
import processing.opengl.*;
//import moviemaker.*;
//import processing.video.*;
//MovieMaker movie;


PImage back;
JMyron input;
float cnt = 0,av,avr,avg,avb;
int x,y,cntr;
float frnum;
boolean runE = false,first =true;
String filename,AD,Length,extension;
void setup() {
  size(1280,1024,OPENGL);
  setFullScreen( true );               // get fullscreen exclusive mode
  setResolution( 1280,1024 );           // change resolution to 640, 480
  createFullScreenKeyBindings();       // let ctrl+f switch to window mode
  frameRate(25);
  
  this.frame.setTitle("DMP2");
  this.frame.show();
  
  
   
  background(255);
  filename = "mini";
//myMovie = new Movie(this, "//movies/"+filename+".mov",25);
  //frnum = myMovie.duration()*25;
  //myMovie.speed((frnum/1706.667));
  back = loadImage("kof.jpg");
  input = new JMyron();//obj
  input.start(12,9);//320x240
  input.findGlobs(0);
runE = true;
 noStroke();
}

  
void draw() {
 cntr +=frameRate/25.0;
  fill(255*(sin(cntr/10.0)+1),25,15);
  stroke(255*(cos(cntr/10.0)+1),25,15);
  rect(width-5,height-5,4,4);
  noStroke();
    input.update();
  int[] img = input.image();

   av =brightness(input.average(0,0,input.width(),input.height()));
   /* avr =hue(input.average(0,0,input.width(),input.height()));
    avg =saturation(input.average(0,0,input.width(),input.height()));
    avb =brightness(input.average(0,0,input.width(),input.height()));*/
   for(int x = 0;x<width;x+=input.width()){
     for(int y = 0;y<height;y+=input.height()){
     
    if(abs((brightness(back.pixels[y*back.width+x]))-(av))<0.5){
   //   if((abs((hue(back.pixels[y*back.width+x]))-(avr))<=8.0)&&(abs((saturation(back.pixels[y*back.width+x]))-(avg))<=8.0)&&(abs((brightness(back.pixels[y*back.width+x]))-(avb))<=8.0)){
   
    
    for(int yy=0;yy<input.height();yy+=1){ 
    for(int xx=0;xx<input.width();xx+=1){ 
   
    
    fill(brightness(img[yy*input.width()+xx]));
    rect(xx+x,yy+y,1,1);
    }
    }
    }
   }
   
   
  }
}
void keyPressed(){
if(key == ENTER){filename = filename.concat("_");
  AD = "";
  String lenght = AD+millis();
  filename = filename.concat(lenght);
  extension = ".png";
  filename = filename.concat(extension);
      saveFrame("structures/"+filename);}

}

