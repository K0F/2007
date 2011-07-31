import processing.net.*;
import processing.opengl.*;

Client client;
int[] field = new int[15];
int val;
InetAddress thisIp;



void setup(){
 size(320,320,OPENGL);  
 background(0);
 stroke(255);
 frameRate(25);
 
  try {
     thisIp =  InetAddress.getLocalHost();
     System.out.println("IP:"+thisIp.getHostAddress());
     }
    catch(Exception e) {
     e.printStackTrace();
     }
 
 
 client = new Client(this,, 80); 
  
 
 /**loop*/
 for(int i =0;i<field.length;i++){
  field[i] = f(i);
  field[i] = (int)map(field[i],0,100,0,width);
  }

  
}

void draw(){
   for(int i =0;i<field.length;i++){
  line(field[i],height/2+1,field[i],height/2);
  }
}


int f(int _f){
  
 _f=(int)sq(_f); 
 _f=(int)(_f/3.0f);
 _f*=(int)(2.0f);
 _f=(int)_f;
 
 return _f; 
}
/*
int readNet(){
  
  Client thisClient = server.available();
  // If the client is not null, and says something, display what it said
  if (thisClient !=null) {
    String whatClientSaid = thisClient.readString();
    if (whatClientSaid != null) {
      println(thisClient.ip() + "t" + whatClientSaid);
    } 
  }  
  
  return whatClientSaid;
  
}*/
