import processing.net.*;
import java.net.InetAddress;

KofServer srv;
KofClient client;
InetAddress inet;
Socket socket;

PFont font;
String ipA;
String received;
String message;
boolean ipConfig = true;
String servIP,IP;

void setup(){
  size(200,400);
  background(0);
  font=loadFont("ArialUnicodeMS-10.vlw");
  servIP = "";
  IP="";

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
  fill(25,255,25);
  if(ipConfig){
    text("enter valid ip address: ",10,10);
    text(IP) ;

  }

  else{
    text("server on aderss: "+ipA+"\n"+"port: "+srv.port,10,10);
    text("sent: \n"+message,10,52,170,height); 
    text("received: \n"+received,10,94,170,height);
    
    //recv message
    try{
    if(socket.isConnected()){
      text("connected",width-60,height-10);
      if (client.available() > 0) { 
        received += ""+client.readString(); 
      } 
    }
    else{
      text("disconnected",width-70,height-10);
    }
    }catch(Exception r){
      String gg = ""+r;
      if((gg).equals("java.lang.NullPointerException")){gg="fuck!";}
     println(gg);
     try{
       socket.shutdownInput();
       socket.shutdownOutput();
     ipConfig=true;
    
     }catch(Exception clos){
      println(clos);
     } 
    }
    
  }
}

void keyPressed(){
  if(ipConfig){
    if(keyCode==ENTER){

      try{
        socket = new Socket(IP, 10002, inet, 10001);
        println(socket);
        client = new KofClient(this,socket);//IP,10002);
      }
      catch(Exception e){
        IP="try another!";
        ipConfig=true;
      }
      ipConfig=false;  
    }

    else if (keyCode==DELETE){
      servIP="";
      IP="";
    }
    else if (keyCode == BACKSPACE){
      IP=IP.substring(0, constrain(IP.length()-1,0,1000));   

    }
    else{  
      if(IP.equals("try another!")){
       IP=""; 
      }
      servIP = ""+key;

      IP+=servIP;

    }
  }
  else{

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


  }
  keyPressed=false;
}



class KofServer{
  Server server;
  PApplet parent;

  int port;

  KofServer(PApplet _parent, int _port){
    parent=_parent;
    port=_port;

    reConnect(); 
  }

  void reConnect(){
    try{
      server = new Server(parent, port); 
    }
    catch(Exception e){
      System.out.println("Error : "+e);
    }
  }

  void send(String _data)
  {
    server.write(_data);
  } 

}

class KofClient{
  Client client;
  Socket socket;
  PApplet parent;

  KofClient(PApplet applet,Socket _socket){
    parent=applet;
    socket=_socket;
    reConnect();   
  }

  void reConnect(){   
    try{
      client = new Client(parent,socket);
    }
    catch(Exception e){
      System.out.println("Error : "+e);
    }    
  }  

  void send(String _data)
  {
    client.write(_data);
  }

  String readString(){
    return client.readString();
  } 

  int available(){
    return client.available(); 
  }

}
