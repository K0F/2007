import JMyron.*;
import processing.opengl.*;

JMyron input;
int x,y,cntr;
String filename,AD,Length,extension;


void setup() {
  size(1280,1024,OPENGL);
  setFullScreen( true );               // get fullscreen exclusive mode
  setResolution( 1280,1024 );           // change resolution to 640, 480
  createFullScreenKeyBindings();       // let ctrl+f switch to window mode
  frameRate(25);

  this.frame.setTitle("DMP3");
  this.frame.show();



  background(0);
  filename = "mini";
  
   input = new JMyron();//obj
  /*------------------***INSERT THE DIMM***/  input.start(8,6);  //320x240
  input.findGlobs(0);
  noStroke();
}


void draw() {
  cntr +=1;
  fill(255*(sin(cntr/3.0)+1),25,15);
  stroke(255*(cos(cntr/10.0)+1),25,15);
  rect(width-5,height-5,4,4);
  noStroke();
  input.update();
  int[] img = input.image();

 if(cntr>10){x+=input.width();cntr=0;}
 
 if(x>=width){y+=input.height();x=0;}
 if(y>=height){filename = filename.concat("_");
    AD = "";
    String lenght = AD+(millis()%1000);
    filename = filename.concat(lenght);
    extension = ".png";
    filename = filename.concat(extension);
    saveFrame("structures/"+filename);y=0;}

      //if(abs((brightness(back.pixels[y*back.width+x]))-(av))<5.0){
      
        for(int yy=0;yy<input.height();yy+=1){ 
          for(int xx=0;xx<input.width();xx+=1){ 


            fill((img[yy*input.width()+xx]),55);
            rect(xx+x,yy+y,1,1);
          }
        }
    


  
}


