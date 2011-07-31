import processing.opengl.*;

Camera cam;

void setup(){
 size(160,120,OPENGL); 
  background(0);
    frameRate(25);
  cam = new Camera(160,120,1,35);//w,h,res,tresh

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
