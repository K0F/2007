import processing.opengl.*;
import promidi.*;

MidiIO midiIO;
MidiOut midiOut;
Controller[] h = new Controller[50];

int X,Y,cnt;


void setup(){
  size(128,128,OPENGL);
  background(0);
  smooth();
  cursor(CROSS);
  //get an instance of MidiIO
  midiIO = MidiIO.getInstance(this);
  
  //print a list with all available devices
  midiIO.printDevices();
  
  //open an midiout using the first device and the first channel
  midiOut = midiIO.getMidiOut(0,2);

 frame.setTitle("MIDIc");
 frame.show();
  noStroke();
}

void draw(){
  cnt++;
  background(0);
  noStroke();
  fill(255);
  rect(X,height-Y,2,2);
  
  h[3] = new Controller(3,constrain((int)(sin((cnt/10.0)+2)*127.0),0,127));
  control(h[3]) ;
  
}

  
 void mouseDragged(){
   X = constrain(mouseX,0,127);
 Y = constrain(height-mouseY,0,127);
  
 h[0] = new Controller(1,X);
  h[1] = new Controller(2,Y);
  
control(h[0]) ;
  control(h[1]) ;
 
   
   
 }
void mousePressed(){
 
 X = constrain(mouseX,0,127);
 Y = constrain(height-mouseY,0,127);
  
 h[0] = new Controller(1,X);
  h[1] = new Controller(2,Y);
  
control(h[0]) ;
  control(h[1]) ;
 
}

void control(Controller x){
midiOut.sendController(x);
}
  
