import processing.net.*;
import java.net.InetAddress;
InetAddress inet;

int val = 0;
KofServer srv;
Client client;
PFont font;
String ipA;
String received;
String message;
void setup(){
  size(200,400);
  background(0);
  font=loadFont("ArialUnicodeMS-10.vlw");
  client = new Client(this, "192.168.0.1", 10002);
  try {
    inet = InetAddress.getLocalHost();
    ipA = inet.getHostAddress();//.toString();
    println(inet);
  }  
  catch (Exception e) {
    e.printStackTrace();
    ipA = "unable to locate ip address!";
  } 
  received = "";
  message="";
  textFont(font);
  fill(255,200);
  srv = new KofServer(this,10002);
}

void draw(){
  background(0);
  text("server on aderss: "+ipA+"\n"+"port: "+srv.port,10,10);
  text("sent: \n"+message,10,52); 
  text("received: \n "+received,10,94,170,height);



    if (client.available() > 0) { 
      received += ""+client.readString(); 
    } 

 

 /* Client thisClient = srv.server.available();
  // If the client is not null, and says something, display what it said
  if (thisClient !=null) {
    String whatClientSaid = thisClient.readString();
    if (whatClientSaid != null) {
      //println(thisClient.ip() + "\t" + whatClientSaid);
      received+=""+whatClientSaid;
      if(received.length()%20==0){
        received+="\n";
      }
    } 
  } 
*/
}

void keyPressed(){
  if(keyCode==ENTER){
    srv.send(message+"\n\r");
    message="";  
  }
  else if (keyCode==DELETE){
    message="";
  }
  else if (keyCode == BACKSPACE){
   message=message.substring(0, constrain(message.length()-1,0,1000));   
  }
  else{  

    message += ""+key;
   // if (message.length()%20==0){message+="\n";}
  }
keyPressed=false;

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
