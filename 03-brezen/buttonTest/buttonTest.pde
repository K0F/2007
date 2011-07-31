import mkv.MyGUI.*;
MyGUI gui;
MyGUIButton b;
MyGUIStyle style1;

int cntr;
PImage icon;
PFont font;

void setup(){
  size (400,400);
  frameRate(30);
  background(0);
  icon = loadImage("kofApp.gif");



  font = loadFont("Uni0553-8.vlw");
  textFont(font,8);

  gui = new MyGUI(this);
  color r = color(155,25,25);
 //-------------------------------------------------
  style1 = new MyGUIStyle(this,r);
  style1.setFont(font,8);
  style1.setTransparency(55);
  style1.buttonText = 255;

  MyGUITextInput txt  = new MyGUITextInput(this,width/2,height-16,width-10,16);
  txt.setStyle(style1);
  b = new MyGUIButton(this,50,16,"killer",45,8);
  b.setID(1);
  b.setStyle(style1);

  
gui.add(b);
gui.add(txt);

}

void draw(){
  noStroke();
  fill(0,15);
rect(0,0,width,height);

b_down(true);


}
void b_down(boolean listen){
 while(b.checkForHit()&&mousePressed&&listen){

  cntr++;
  b.setLabel("killer "+cntr);
  println("hit");
  fill(255);
  noStroke();
  rectMode(CENTER);
  rect(80,80,15,15); 
  fill(25);
  text(cntr,80,80);
  
 
  mousePressed=false;
 }
}
