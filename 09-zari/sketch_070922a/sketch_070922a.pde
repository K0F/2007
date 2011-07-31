import processing.opengl.*;
float x,y;

void setup(){
  size(screen.width,100);
  background(0);
}

void draw(){
  y+=random(-height/30.33,height/30.33);
  y=y%height;
  x++;
  x=x%width;
  if(x==width){
   background(0); 
   y=height/2.1;
  }
  fill(255);
  noStroke();
  rect(x,y,2,2);
  
  
}
