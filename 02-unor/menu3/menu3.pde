import processing.opengl.*;
import damkjer.ocd.*;



PImage img;
Camera camera1;
int[] someValues ={
  100, 150, 180, 120 ,135 ,189 ,200};
float X,Y,speedY,speedX,rotX,rotY;
void setup() {

  size(800, 600, OPENGL);
  frameRate(25);
  setFullScreen( false );               // get fullscreen exclusive mode
  setResolution( width, height);           // change resolution to 640, 480
  createFullScreenKeyBindings();       // let ctrl+f switch to window mode
  camera1 = new Camera(this, 100, -125, 150);

  img=loadImage("wrks.bmp");

  img.mask(loadImage("wrksM.bmp"));

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
  //-------------------*
  stroke(255,50);
  strokeWeight(1);
  //sphere(100);
  rotX += map(mouseX,width/2,width,0,0.01);
  rotY += map(mouseY,height/2,height,0,0.05);
  rotX = constrain(rotX,-1,1);
  rotY = constrain(rotY,-20,20);

  for(int i = 1;i<=5;i++){
    translate(0,0,i*2+rotY);  
    rotateZ(i+rotX);

    image(img,(-img.width/2),(-img.height/2));

  }
  popMatrix();
  //----------------------*ovladani pohybu
  if(dist(width/2,height/2,mouseX,mouseY)>20){
    speedX =  map(mouseX, width/2,width,0.0,2.1);
    speedY = map(mouseY, height/2,height,0.0,2.1);
  } 
  else {
    speedX *= .91;
    speedY*=.91;
  }
  X = speedX;
  Y = speedY;
  move();//+brzda

}

void move() {

  camera1.tumble(radians(X/2.0), radians(Y/4.0));
}

void mouseReleased(){

  img=loadImage("wrks.bmp");

  img.mask(loadImage("wrksM.bmp"));
}

void keyPressed(){
  if(key==ENTER){


    saveFrame("this-####.png");
    key=0; 
  }
}
