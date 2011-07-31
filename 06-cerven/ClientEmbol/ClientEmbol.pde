import processing.net.*;

int val = 0;
KofClient srv;
PFont font;
String message;
boolean ipConfig = true;
String servIP,IP;
int hit;

void setup(){
  size(200,300);
  background(0);
  font=loadFont("ArialUnicodeMS-10.vlw");
  textFont(font);
  fill(255,200);
  servIP = "";
  IP="";


  message="";
}

void draw(){
  background(0);
  if(!ipConfig){
    srv.receive(); 

    text("server ip: "+srv.client.ip(),10,10);
    text("sent: "+message,10,20); 
    text("received: \n"+srv.received,10,64,170,height);
  }
  else{
    text("enter valid ip address: ",10,10);
    text(IP) ;


  }
}

void keyPressed(){
  if(!ipConfig){
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
  else{

    if(keyCode==ENTER){
     
        try{
          srv = new KofClient(this,IP,10002);
        }
        catch(Exception e){
          IP="error\n"+e;
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

      servIP = ""+key;

      IP+=servIP;

    }
  }
  keyPressed=false;

}

class KofClient{

  Client client;
  String received;
  int port;

  KofClient(PApplet applet,String _address, int _port){
    port=_port;
    received = "";
    client = new Client(applet, _address, 10002);

  }

  void send(String _data)
  {
    client.write(_data);
  } 

  void receive()
  {
    if (client.available() > 0) { 
      received += ""+client.readString(); 
    } 

  }

}
