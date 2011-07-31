import processing.serial.*;

Serial myPort;  // The serial port

void setup() {
  size(200,200);
  frameRate(30);
  // List all the available serial ports
  println(Serial.list());

  // I know that the first port in the serial list on my mac
  // is always my  Keyspan adaptor, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[2], 115200);
}
byte[] inBuffer;
void draw() {
  // Expand array size to the number of bytes you expect
  inBuffer = new byte[3];

  while (myPort.available() > 0) {
    inBuffer = myPort.readBytes();

    //myPort.readBytes(inBuffer);
    if (inBuffer != null) {
      int r = int(inBuffer[0]);
      int g = int(inBuffer[1]);
      int b = int(inBuffer[2]);

      fill(((r-48.0)*50.0),((g-48.0)*50.0),((b-48.0)*50.0),55);
      rect(0,0,width,height);
      //println("red :: "+redd+"  green :: "+greenn+"  blue :: "+bluee);
    }  

  }

}
