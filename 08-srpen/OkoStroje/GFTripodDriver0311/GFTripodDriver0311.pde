/**
 * Generativni film ver. 3
 * Ovladac ke stativu 15.8.2007
 * Krystof Pesek
 */

import processing.opengl.*;

Communicator tripod; //hlavni comm
ServoY servo; //osa Y zrcadlo tvar "90s"
MotorX motor; // osa X rotace tvar "-125"
Infra infra; //debug
Camera cam; //fw interface + senzor

void setup(){
  size(360/2,288/2,OPENGL); //360:288 dv ratio 1.25 //tv 320,240 1.333..
  frameRate(25); //pal
  cam = new Camera(width/4,height/4,45);
  tripod = new Communicator(this,19200);
  motor = new MotorX(this);
  servo = new ServoY();
  infra = new Infra();

  background(0);  

  //----------------------- frame icon >
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //----------------------- frame title >
  frame.setTitle("GenFilmTripod 3");
  
  //--------------- refresh serva >
  servo.send("d");
  delay(5);
  servo.send("a");
  
}

void draw(){
  cam.viz(); 

  /*
  if(cam.s1.hit){
   motor.turn(cam.s1.last());
   }
   */
   
    


}

void mousePressed(){
  
  int message =(int)map(mouseY,0,height,0,255);
 servo.send(message);
   
  
}

