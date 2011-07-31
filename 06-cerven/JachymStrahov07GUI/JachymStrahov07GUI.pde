import processing.opengl.*;

import quicktime.*;
import quicktime.qd.*;
import quicktime.std.*;
import quicktime.app.view.*;
import quicktime.io.*;
import quicktime.std.movies.*;
import quicktime.std.movies.media.*;
import quicktime.std.movies.media.DataRef;
import quicktime.app.view.*;
import quicktime.util.*;
import java.lang.reflect.*;
import quicktime.app.audio.*;


PFont fontNadpis,font,sys;
PImage shade,shadeTimer;

SuperCudlik[] button = new SuperCudlik[5];

FasterMovie roton;
PImage rotonFrame;

int shift = 40;
int timer = 60;

public int[] checkSEC = new int[2];
PImage bio;
PImage[] strecha = new PImage[5];
PImage[] tribuna = new PImage[5];
PImage[] situace = new PImage[1];
PImage[] show = new PImage[1];
PImage topMask,anim,cursorG,sipkaActive,zalozkaSleep;

boolean navsteva,aktivni = true,fading = false;
boolean[] aktivniCheck = new boolean[2];
int pocetNavstev,noMove,waiting; 
float animAlpha = 0,animAlphaTarget = 0,rotonRot = 0,rotonInput;

void setup(){
 size(800,500,OPENGL);
 frameRate(30);
 background(#272727); 
  noSmooth();

  roton = new FasterMovie(this, "model/roto2.mov",false);
  roton.loop();
  roton.speed(0);

 cursorG = loadImage("cursor.gif");
 cursor(cursorG,1,1);
  
    //-----------------------* frame icon
  String path = sketchPath("data/icon.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------* frame title
  frame.setTitle("Jachym Pesek :: Strahov GUI ");
  //-----------------------*
  
sipkaActive= loadImage("sipkaActive.png");

 font = loadFont("TrebuchetMS-14.vlw");
  sys = loadFont("Uni0553-8.vlw");
 fontNadpis = loadFont("TrebuchetMS-48.vlw");
    
 
 shade = loadImage("shadeH.png");
 shadeTimer = loadImage("shadeTimer.png");
 bio = loadImage("bio/bio.png");
 zalozkaSleep = loadImage("zalozkaSleep.png");
  
 strecha[0]=loadImage("strecha/strecha1.png");
 strecha[1]=loadImage("strecha/strecha2.png");
 strecha[2]=loadImage("strecha/strecha3.png");
 strecha[3]=loadImage("strecha/strecha4.png");
 strecha[4]=loadImage("strecha/strecha5.png");
  
 tribuna[0]=loadImage("tribuna/tribuna1.png");
 tribuna[1]=loadImage("tribuna/tribuna2.png");
 tribuna[2]=loadImage("tribuna/tribuna3.png");
 tribuna[3]=loadImage("tribuna/tribuna4.png");
 tribuna[4]=loadImage("tribuna/tribuna5.png");
   
 show[0] = loadImage("show/show1.png");  
 
 button[0] = new SuperCudlik("autor",20,50+shift,0,0);
 button[1] = new SuperCudlik("støecha",20,70+shift,1,5);
 button[2] = new SuperCudlik("tribuny",20,90+shift,2,5);
 button[3] = new SuperCudlik("model",20,110+shift,3,0);
 button[4] = new SuperCudlik("show",20,130+shift,4,0);
 
 topMask = loadImage("topMask.png");
 anim = loadImage("anim.png");
 /*
 //movie
 roton = new FasterMovie(this, "model/roto2.mov", false);
 roton.loop();
 roton.speed(0);
 */
 println();
 
 
   checkSEC[0]=checkSEC[1]=(int) second();
}


void draw(){
  background(#272727); 
 // image(topMask,0,0);
  
  nadpis("Strahov");
  rozbaleni();
  
  for(int i =0;i<button.length;i++){
  button[i].run();
  }
  
  anima(width-40,5);
  nastevnost();
  
  image(topMask,0,0);
}






