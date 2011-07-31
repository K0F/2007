
int  t= 0;

void setup(){
  size(240,320);
  frameRate(30);
  background(0); 


}

void draw(){
  fill(0,35);
  noStroke();
  rect(0,0,width,height);
  
  t++;
  t= t % height;
  stroke(255);
  line(0,t,width,t); 



}
