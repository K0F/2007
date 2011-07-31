/**
 * Generativni film ver. 311
 * Ovladac ke stativu src 15.8.07
 * Krystof Pesek
 */

//import processing.opengl.*; //ne pro premio notebook

Communicator tripod; //hlavni comm
ServoY servo; //osa Y zrcadlo tvar "90s"
MotorX motor; // osa X rotace tvar "-125"
Infra infra; //debug
Camera cam; //fw interface + senzor

int y = 120,x=0;
int speed = 0;

void setup(){
  size(360/2,288/2,P3D); //360:288 dv ratio 1.25 //tv 320,240 1.333..
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
  tripod.send("y "+y+" ");
  enter();
  tripod.send("x "+speed+" ");
  enter();
}

void draw(){
  cam.viz(); 

  
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
    enter();
    break;
  case DOWN:
    y+=2;
    y=constrain(y,50,180);
    tripod.send("y "+y+" ");
    enter();
    break;
  case LEFT:    
    tripod.send("x 2 ");
    enter();
    break;
  case RIGHT:
    tripod.send("x 3 ");
    enter();   
    break;
  case ENTER:
    if(speed == 1){
      speed = 0;
      tripod.send("x "+speed+" ");
      enter();
    }
    else if(speed == 0){
      speed = 1;
      tripod.send("x "+speed+" ");
      enter();  
    }
    break;

  } 


}

void keyReleased(){
 motor.send(0); 
  
}


void enter(){
  tripod.send(10);
  tripod.send(13);

}


