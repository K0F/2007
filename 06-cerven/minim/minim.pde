import processing.opengl.*;

import ddf.minim.*;

AudioFileIn in;

void setup()
{
  size(512, 200,OPENGL);
  
  Minim.start(this);
  // load a file, default sample buffer size is 1024
  in = Minim.loadFile("Backdrifts.mp3");
  // in = Minim.loadFile("HubDisconnected.wav");
  in.loop();
   in.printControls();
  
}

void draw()
{
  background(0);
  stroke(255);
 
  for(int i = 0; i < width-1; i++)
  {
    line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
  }
}


void mousePressed(){
  in.cue(int(map(mouseX,0,width,0,in.length())) ); in.loop();
}

void stop()
{
  // always stop Minim so that any lines you may have open can be closed properly
  Minim.stop();
  super.stop();
}
