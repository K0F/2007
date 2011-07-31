//import processing.opengl.*;


Communicator c;

//zprava doleva 0,1,2

int spinac[] = {0,0,0};
color cls[] = {#11FF11,#11ff11,#cccccc};
String[] funkce = {"dioda","dioda","magnet"};
PFont font;

void setup(){
  size(200,120);
  frameRate(30);
  c= new Communicator(this,19200); 
  fill(255);
  noStroke();
  rectMode(CENTER);
    
   font = loadFont("Verdana-9.vlw");
   textFont(font);
    
  frame.setAlwaysOnTop(true);
  frame.setTitle("ArduinoCommunicator01");
  
   //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  
  c.send(3); //all off

}

void draw(){

  background(0);  
  //pulser(1,mouseX/width);
 

  viz();

}

void mousePressed(){
  if(mouseButton==LEFT){
    c.send(2); 
    spinac[2] = change(spinac[2]);
  } 
  else if(mouseButton == CENTER){
    c.send(1); 
    spinac[1] = change(spinac[1]);
  } 
  else if(mouseButton == RIGHT){
    c.send(0); 
    spinac[0] = change(spinac[0]);
  }


}

void keyPressed(){
 if(keyCode==DELETE){
  c.send(3);
  this.exit();
 } else if(key == '1'){
  c.send(2);
   spinac[2] = change(spinac[2]);
 } 
 keyPressed=false;

}

void viz(){

  for(int i = 0;i<3;i++){

    if(spinac[i] == 1){
      fill(cls[i]);
      text(funkce[i],map(i,2,0,40,width-40)-8,25);
      rect(map(i,2,0,40,width-40),10,10,10);
    } 
  }


}

void pulser(int channel, float time){
 

   if(frameCount%(constrain((int)(time*30),1,10000))==0){
   
    c.send(channel); 
    spinac[channel] = change(spinac[channel]);
   
 }
 
  fill(cls[channel]);
  text(time +" s.",map(channel,2,0,40,width-40)-8,35);
}


int change(int _what){
  if(_what == 0){
    _what = 1; 
  } 
  else {
    _what = 0; 
  }
  return _what;
}
