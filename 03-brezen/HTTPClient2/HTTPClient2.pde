import processing.opengl.*;

import processing.net.*;

Client client;
String newLine = "\n";
String s = "";
String orez = newLine;
PFont font;
int posun = 0,count = 1;
int[] cut;
color c=color(255);
boolean posunout = false,nlnow = false;
void setup()
{
  size(400, 300);
  noStroke();
  frameRate(50);
  font = loadFont("04b24-8.vlw");
  textFont(font);
  String address = "www.famu.cz";
  // Open a TCP socket to the host:
  client = new Client(this, address, 80);

  // Print the IP address of the host:
  println(client.ip());

  // Send the HTTP GET request:
  client.write("GET /index.html HTTP/1.1\n");
  client.write("HOST: "+address+"\n\n");
  background(0);
  textMode(SCREEN);
}

void draw()
{
  background(0);
  // Print the results of the GET:
  if (client.available() > 0) {
    int inByte = client.read();
    
     
    //if((s.indexOf(newLine)!=-1)&&(orez.indexOf(newLine)!=cut[count])){count++;cut[count] = orez.indexOf(newLine); orez = s.substring(cut[count]);println("cut");}
    if(s.length()>3){orez = s.substring(count-3,count-1);}
    count++;
    if(orez.equals(newLine)==true){println("cut");}
    s  = s.concat((char)inByte+"");
    
    //if(char(inByte)=='<'){c = color(255,255,0);}else if(char(inByte)=='>'){c = color(255);}
  }

  fill(c);
  
  text(s,5,20-posun/*,width-10,height*10*/);
  fill(0);
  rect(0,0,width,15);
  fill(255);
  text("IP address: "+client.ip()+" kof HTTP reader",5,8);

}

void mousePressed(){
  mousePressed = false;
  this.setup();
}

