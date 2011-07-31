import processing.core.*;
import fullscreen.*;

import processing.opengl.*;

String[] sc;
int whichLine = 0;
float fade = 0.0f,pos = 0.0f;;
PImage frm;
int frmCnt = 0,frmLastRun =0;
FasterMovie mov;
fullscreen.FullScreen fs;
void setup(){

  size(320,240,OPENGL);
  frameRate(25);
  background(0);
   
  
  sc = loadStrings("script.txt");
  
  mov=new FasterMovie(this, "input/holubi.mov", false);
  mov.loop();
  mov.speed(0);
  
  
   fs = new fullscreen.FullScreen(this); 
   fs.setResolution(320,240);
    fs.allowKeys();
}

void draw(){
  frmCnt=frameCount-frmLastRun;
  
   fade+=(pos-fade)/3.0; //fadeItOutToSmooth
   mov.jump(fade); //setPositionOfMovie
  if ( frm != null ) image( frm, 0,0,width,height); //showMeThatCrap
  
  
  
  if(frmCnt>=readTime(sc[sc.length-1])){
   frmLastRun+=frmCnt; 
   whichLine=0;
  }
  
  if(frmCnt==readTime(sc[whichLine])){
    pos=map(readVal(sc[whichLine]),0.0,255.0,0.0,8.0f); //rescale input 0..255 : 0..mov.length
    whichLine+=1; //setNextLineOFAScriptToRead
    
  }
  
  
}

int readTime(String _tmp){
  String[] value = split(_tmp,",");
  int time = parseInt(value[0]);
  return time;
}

int readVal(String _tmp){
  String[] value = split(_tmp,",");
  int val = parseInt(value[1]);
  return val;
}

void movieImageAvailable ( PImage _movieImage )
{
  frm = _movieImage;  
}

