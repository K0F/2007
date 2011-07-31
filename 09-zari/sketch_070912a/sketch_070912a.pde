
int x,y;
void setup(){
  
  size(176,220);
  background(0);
  
  
  
}

void draw(){
  x++;
  if(x%width==0){
    x=0;
   y++; 
if(y%height==0){
save("screen.png");
noLoop();
}  
}
  
  stroke(sin(x/10.0f)*255-cos(y/PI)*255+random(50));
  point(x,y);
  
  
}
