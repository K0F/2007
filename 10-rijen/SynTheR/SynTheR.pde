import processing.opengl.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;
 
AudioOutput out;
SquareWave square;
LowPassSP lowpass;
 Vizual v;
 
void setup()
{
  size(320,180,OPENGL);
  // always start Minim first!
  Minim.start(this);
  
  frameRate(30);
 
  // get a stereo line out with a sample buffer of 512 samples
  out = Minim.getLineOut(Minim.STEREO, 1024);
  lowpass = new LowPassSP(10, 44100);
 out.addEffect(lowpass);
  
  v = new Vizual(50);
  
 // noSmooth();
}
 
void draw()
{
 background(0);
 v.viz(#FFCC00,120);
}

void mousePressed(){
  if(mouseButton == LEFT){
    square = new SquareWave((int)map(mouseY,0,height,300,2), 1, 44100); 
    out.addSignal(square); 
    lowpass = new LowPassSP((int)map(mouseX,0,width,5,22), 44100);
    
   //out.clearEffects();
   //out.addEffect(lowpass);
    
    v.add((int)mouseX,(int)mouseY);
  }else if(mouseButton == RIGHT){

   out.clearSignals(); 
   out.clearEffects();
   v.remove();
    
  }
  
}
 
void keyPressed()
{
  if ( key == 'm' )
  {
    if ( out.isMuted() ) 
    {
      out.unmute();
    }
    else 
    {
      out.mute();
    }
  }
}
 
void stop(){
  out.close();
  super.stop();
}
