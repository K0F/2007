import processing.serial.*;

class Communicator{
  Serial port;
  PApplet parent;
  int baud = 19200;
  int lastdata;

  Communicator(PApplet _parent,int _baud){
    parent=_parent;
    baud=_baud;
    
    println(Serial.list());
    port = new Serial(parent, Serial.list()[1],baud); //Serial.list().length-2

  }  
  
  public void send(String _what){
    port.write(_what);
   enter(); 
  }
  
  void enter(){
  port.write(10);
  port.write(13);

}
  
  

}
