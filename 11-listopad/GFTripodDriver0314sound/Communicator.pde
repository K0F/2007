import processing.serial.*;

class Communicator{
  Serial port;
  PApplet parent;
  int baud = 57600;
  int lastdata;

  Communicator(PApplet _parent,int _baud){
    parent=_parent;
    baud=_baud;
    println(port.list());
    port = new Serial(parent, Serial.list()[Serial.list().length-1],baud);

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
