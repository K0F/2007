import processing.serial.*;

class Communicator{
  Serial port;
  PApplet parent;
  int baud = 9600;
  int lastdata;

  Communicator(PApplet _parent,int _baud){
    parent=_parent;
    baud=_baud;

    port = new Serial(parent, Serial.list()[Serial.list().length-1],baud);

  }  

  void send(int _what){

    port.write(_what); 
    lastdata=_what;
  }

  void send(String _what){
    port.write(_what); 
  }


  void send(byte _what){
    port.write(_what); 
  }


}
