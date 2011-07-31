/**
 * Generativni film ver. 311
 * Ovladac ke stativu src 15.8.07
 * Krystof Pesek
 */

import processing.opengl.*; //ne pro premio notebook

Communicator tripod; //hlavni comm
ServoY servo; //osa Y zrcadlo tvar "90s"
MotorX motor; // osa X rotace tvar "-125"
Infra infra; //debug
Camera cam; //fw interface + senzor

int y = 120,x=0;
int speed = 0;

void setup(){
  size(360/2,288/2,OPENGL); //360:288 dv ratio 1.25 //tv 320,240 1.333..
  frameRate(25); //pal
  cam = new Camera(width/4,height/4,30,5,this); //tresh speed
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
  
  println("Ready!");
  
  servo.send(120);
  motor.send(0);
}

void draw(){
  cam.viz(); 
  move();
  
  
  
  if (exit){
   motor.send(0);
  servo.send(120); 
   
  }
  
}

void move(){
  servo.send((int)map(cam.destinationY,0,height,90,180));
  if(cam.destinationX>width/2){
   motor.send(3); 
  }else{
   motor.send(2); 
  }
  motor.send(120);
  
}

void mousePressed(){
 servo.send((int)map(mouseY,0,height,120,180)); 
 println((int)map(mouseY,0,height,120,180));
 mousePressed=false;
}

void keyPressed(){
  if((keyCode == LEFT) || (keyCode==RIGHT)){
    tripod.send("x 1 ");
    enter();

  }

  switch(keyCode){
  case UP:
    y-=2;
    y=constrain(y,50,180);
    tripod.send("y "+y+" ");
    
    break;
  case DOWN:
    y+=2;
    y=constrain(y,50,180);
    tripod.send("y "+y+" ");
    
    break;
  case LEFT:    
    motor.send(2);
    
    break;
  case RIGHT:
    motor.send(3);
      
    break;
  case ENTER:
    if(speed == 1){
      speed = 0;
      tripod.send("x "+speed+" ");
      
    }
    else if(speed == 0){
      speed = 1;
      tripod.send("x "+speed+" ");
        
    }
    break;

  } 


}


void enter(){
  tripod.port.write(10);
  tripod.port.write(13);

}




