import processing.video.*;

import processing.opengl.*;

MovieMaker mm;
int cycle = 320;
int[] chain = new int[cycle];

char ch;
int begX = -7;
int x=begX,y=8;
int cnt = 0;
int fram = 0;

PFont font;

void setup(){
  size(320,240,OPENGL);
  font = loadFont("LucidaSans-9.vlw");
  textFont(font);
 
  frameRate(80);
for(int i = 0;i<chain.length;i++){
  chain[i] = (int)random(0,2);
} 
 
  mm = new MovieMaker(this, width, height, "output/"+cycle+".mov",25, MovieMaker.JPEG, MovieMaker.HIGH);
  
 
  
  background(#333333);
    fill(#FFCC00);
    noStroke();
}

void draw(){
  for(int i = 0;i<(width/8)*(height/8);i++){
  cnt++;
  cnt=cnt%chain.length;
  
  x+=8;
  int qe = chain[cnt];
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
  mm.addFrame();
  fram++;
  fill(#333333,15);
  rect(0,0,width,height);
  fill(#FFCC00);
  }
  }
  if(fram > 250){
      mm.finish();
      this.exit();
  }
  
}

void keyPressed(){
 if(key ==' '){
  mm.finish();
 } 
  
}
