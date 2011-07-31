import processing.opengl.*;

char ch;
int begX = -7;
int x=begX,y=8;

PFont font;

void setup(){
  size(200,800,OPENGL);
  font = loadFont("LucidaSans-9.vlw");
  textFont(font);
  
  background(#333333);
    fill(#FFCC00);
    noStroke();
}

void draw(){
  x+=8;
  int qe = (int)random(0,2);
  if(qe==0){
     fill(#000000,65);
      rect(x-1,y-8,7,8);
    ch = '0';
  }else{
   ch = 'X';
   fill(#FFFFFF,65);
  rect(x-1,y-8,7,8);
  }
  text(ch,x,y);
  
  if(x>=width){
   y+=8; 
   x=begX;
  }
  
  if(y>=height){
   x=begX;
  y=8; 
  
  fill(#333333,15);
  rect(0,0,width,height);
  fill(#FFCC00);
  }
  
}
