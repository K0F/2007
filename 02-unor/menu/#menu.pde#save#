import processing.opengl.*;
import damkjer.ocd.*;



PImage img;
Camera camera1;
float X,Y,speedY,speedX;
void setup() {
  
  size(800, 600, OPENGL);
  frameRate(50);
  setFullScreen( true );               // get fullscreen exclusive mode
    setResolution( width, height);           // change resolution to 640, 480
    createFullScreenKeyBindings();       // let ctrl+f switch to window mode
  camera1 = new Camera(this, 100, -125, 150);
img = loadImage("ystone08.jpg");

strokeWeight(1);
noSmooth();
cursor(CROSS);

}

void draw() {

  
  noFill();
  background(0,25);
  //lights();
  /*ambientLight(128,25,15);
  //falloff(1,0,0);
  directionalLight(speedX*255,speedY*255,128*(speedX+speedY),0,0,-1);
  specular(2,2,2);*/
  camera1.feed();

  rotateY(PI/3);
   pushMatrix();
   rotateY(radians(90));
   translate(0,0,90);
   /*stroke(255);
   noStroke();*/ 
   image(img,-25,-25,50,50);
  popMatrix();
  //-------------------*
  stroke(255,50);
  strokeWeight(1);
  sphere(100);
  
  //----------------------*ovladani pohybu
  if(dist(width/2,height/2,mouseX,mouseY)>20){
  speedX =  map(mouseX, width/2,width,0.0,2.1);
  speedY = map(mouseY, height/2,height,0.0,2.1);
  } else {speedX *= .91;speedY*=.91;}
  X = speedX;
  Y = speedY;
  move();//+brzda

}

void move() {
  camera1.tumble(radians(X), radians(Y));
}


void mouseReleased(){
 img = loadImage("ystone08.jpg"); 
 img.mask(img);
}
