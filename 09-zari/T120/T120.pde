import processing.opengl.*;

int cnt=0;

void setup(){
  int x=screen.width;
  int y=100;
 size(x,y,OPENGL); 
 frame.setTitle("T 1:20 ");
 noStroke();
}


void draw(){
  cnt++;
  cnt=cnt%width;
  fill(random(255),0,0,random(25));
  rect(0,0,width-cnt,height);
  fill(0,random(255),0,random(25));
  rect(0,33,width-cnt,66);
  fill(0,0,random(255),random(25));
  rect(0,66,width-cnt,34);
}
