import processing.opengl.*;
import damkjer.ocd.*;



PImage img;
Camera camera1;
float X,Y,speedY,speedX;
void setup() {
  
  size(800, 600, OPENGL);
  frameRate(25);
  setFullScreen( false );               // get fullscreen exclusive mode
    setResolution( width, height);           // change resolution to 640, 480
    createFullScreenKeyBindings();       // let ctrl+f switch to window mode
  camera1 = new Camera(this, 100, -125, 150);
 
 img=loadImage("test2.bmp");

img.mask(img);

strokeWeight(1);
//noSmooth();
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
  
   
  popMatrix();
  //-------------------*
  stroke(255,50);
  strokeWeight(1);
  //sphere(100);
  for(int i = 1;i<=5;i++){
    translate(0,0,i*2);  
    rotateZ(i);
    image(img,(-img.width/2),(-img.height/2));
    
  }
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
  
  img=loadImage("test2.bmp");

img.mask(img);
}

void keyPressed(){
  if(key==ENTER){
  
  
  saveFrame("this-####.png");
  key=0; 
  }
}
