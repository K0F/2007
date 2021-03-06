import JMyron.*;

import processing.opengl.*;

/**
 * This sketch demonstrates how to implement your own AudioSignal for Minim. See KofSynth.pde for the implementation.
 */

import ddf.minim.*;
import ddf.minim.signals.*;

JMyron m;
//////// camera res ////////
int numX = 320;
int numY = 240;
float koef = 0.25;
//////////////////////////////
int[] img;


AudioOutput out;
KofSynth sam;

void setup()
{
  size(1024, 200,OPENGL);
  
  frameRate(25);
  noFill();
  
  reset();
  
  out.addSignal(sam);
  stroke(#FFCC22,55);
}

void draw()
{
  background(0);
  

  // draw the waveforms
  for(int i = 0; i < out.left.size()-1; i++)
  {
    line(map(i,0,out.left.size(),0,width), 50 + out.left.get(i)*50, map(i,0,out.left.size(),0,width)+1, 50 + out.left.get(i+1)*50);
    line(map(i,0,out.left.size(),0,width), 150 + out.right.get(i)*50, map(i,0,out.left.size(),0,width)+1, 150 + out.right.get(i+1)*50);
  }
}

void mousePressed(){
 reset();
mousePressed = false; 
}

void reset(){
      
 numX = (int)(koef*numX);
  numY = (int)(koef*numY);

  Minim.start(this);
  out = Minim.getLineOut(Minim.STEREO, numX*numY);
  sam = new KofSynth();
  

  img = new int[numX*numY];

  // adds the signal to the output

  m = new JMyron();//obj
  m.start(numX,numY);//45,36);//320x240
  m.findGlobs(0);      
  
}

void stop()
{
  out.close();
  super.stop();
}
