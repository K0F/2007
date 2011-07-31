import netscape.javascript.*;

import processing.opengl.*;

import mkv.MyGUI.*;
MyGUI gui;
MyGUIButton b,a;
MyGUIStyle style1;

int cntr;
PImage icon,bck;
PFont font;

void setup(){
  size (600,400);
  frameRate(25);
  background(0);
  icon = loadImage("kofApp.gif");
  bck = loadImage("bck.bmp");
  cursor(CROSS);



  font = loadFont("Uni0553-8.vlw");
  textFont(font,8);

  gui = new MyGUI(this);
  color r = color(255,255,200);
 //-------------------------------------------------
  style1 = new MyGUIStyle(this,r);
  style1.setFont(font,8);
  style1.setTransparency(55);
  style1.buttonText = 255;

  MyGUICheckBox chb = new MyGUICheckBox(this, width-40, 16, 10, 10);
  chb.setStyle(style1);
  chb.setActionCommand("chck");

  MyGUITextInput txt  = new MyGUITextInput(this,width/2,height-16,width-10,16);
  txt.setStyle(style1);
  txt.setActionCommand("text");
  
  a = new MyGUIButton(this,50,28,"raiser",45,8);
  a.setStyle(style1);
  
  b = new MyGUIButton(this,50,16,"killer",45,8);
  b.setStyle(style1);
  
  b.setID(1);
  b.setActionCommand("butt");
  
gui.add(b);
gui.add(a);
gui.add(txt);
gui.add(chb);

}

void draw(){
  fill(0);
  noStroke();
  background(0);
  image(bck,width-179,0);



b_down(true);


}
void b_down(boolean listen){
  if(b.checkForHit()){
   rectMode(CORNER);
   fill(255,120);
  
  text("click for details",mouseX+60,mouseY);
    
    
  }
  
  
 if(b.checkForHit()&&mousePressed&&listen){

  cntr++;
  b.setLabel("loading ...");
  println("hit");
  fill(255);
  noStroke();
  rectMode(CENTER);
  rect(80,80,15,15); 
  fill(25);
  text(cntr,80,80);
  this.link(sketchPath+"/applet/buttonTest.jar");
  b.setLabel("loading ...");
  mousePressed=false;
 }
}


