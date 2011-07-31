import processing.core.*;
import fullscreen.*;

import processing.opengl.*;

FullScreen fs;

color[] col = new color[3000];

void setup(){
 size(640,480,OPENGL) ;
  background(0);
  noStroke();
  frameRate(30);

  for(int i = 0; i<col.length;i++){
  col[i] =color(random(255),random(255),random(255));
  }
  
  fs = new FullScreen(this);
  fs.setResolution(width,height);
  fs.allowKeys();
  
}
int cnt = 0;

void draw(){
  
  cnt++;
  cnt=cnt%col.length;
  
  fill(col[cnt],45);
  rect(0,0,width,height);
  fill(255);
  rect(width/2-30,height/2-30,60,60);
  
}
