import processing.net.*;
import java.net.InetAddress;
InetAddress inet;

int val = 0;
KofServer srv;
PFont font;
String ipA;

void setup(){
  size(200,200);
  background(0);
  font=loadFont("ArialUnicodeMS-10.vlw");

  try {
    inet = InetAddress.getLocalHost();
    ipA = inet.getHostAddress().toString();
    println(inet);
  }  
  catch (Exception e) {
    e.printStackTrace();
    ipA = "unable to locate ip address!";
  } 

  textFont(font);
  fill(255,200);
  srv = new KofServer(this,10002);
}

void draw(){
  background(0);
  text(ipA,10,10);
  text("sent: "+key,10,20); 
  text("received: "+srv.received,10,height-10);

}

void keyReleased(){
  String what = ""+key;
  srv.send(what);


}

class KofServer{
  Server server;

  String received;
  int port;

  KofServer(PApplet applet, int _port){
    port=_port;
    received = "";
    try{
      server = new Server(applet, port); 

    }
    catch(Exception e){
      System.out.println("Error : "+e);
    } 
  }

  void send(String _data)
  {

    server.write(_data);
  } 

 /* void receive()
  {
    // Get the next available client

    // If the client is not null, and says something, display what it said
    if (server !=null) {
      String whatClientSaid = server.readString();
      if (whatClientSaid != null) {
        println(server.ip() + "\t" + whatClientSaid);
        received+=""+whatClientSaid;
      } 
    } 
  }*/

}
