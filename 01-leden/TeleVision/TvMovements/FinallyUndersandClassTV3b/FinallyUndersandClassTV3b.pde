import JMyron.*;

import processing.opengl.*;
JMyron m;
HLine[] r;
float colr,colg,colb;
int arr = 4;
void setup() 
{
  size(800, 600,OPENGL);

  frameRate(25);
  setFullScreen( false ); 

  setResolution( 800, 600 ); 

  createFullScreenKeyBindings(); 

  //---------------------> video
  m = new JMyron();//obj
  m.start(320,240);//352x288 logitech camera
  m.findGlobs(0);
  cursor(CROSS);

  r = new HLine[320*240];
  for(int x = 0; x < m.width(); x+=arr){
    for(int y = 0; y < m.height(); y+=arr){

      r[y*m.width()+x] = new HLine((x*2)+80,(y*2)+50,(x*2)+80,(y*2)+50,255,x*m.width()+x);

    }
  }
  background(0);
}

void draw() { 
  noStroke();
  fill(0,25);
  rect(0,0,width,height);
  m.update();
  int[] img = m.image();
  for(int x = 0; x < m.width(); x+=arr){

    for(int y = 0; y < m.height(); y+=arr){
      colr = (red(img[y*m.width()+x]));
      colg = (green(img[y*m.width()+x]));
      colb = (blue(img[y*m.width()+x]));
      //if(deathend>0){h1.speedA();}

      r[y*m.width()+x].kof(colr,colg,colb);
    }

  }

} 

void mouseReleased(){
  
  for(int x = 0; x < m.width(); x+=arr){

    for(int y = 0; y < m.height(); y+=arr){
 r[y*m.width()+x].reset();
  
  }
  }
}
    

