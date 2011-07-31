import processing.opengl.*;

Camera cam;

void setup(){
 //size(160,120,OPENGL); 
  size(120,96,OPENGL); 
  background(0);
    frameRate(25);
  cam = new Camera(width,height,2,35);//w,h,res,tresh

}

void draw(){
 cam.viz(); 
  
}

void keyPressed(){
 if(keyCode == ENTER){
  cam.sc.finish();
 } else{
  keyPressed = false; 
 }
  
}
