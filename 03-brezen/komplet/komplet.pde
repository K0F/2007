import mkv.MyGUI.*;
MyGUI gui;
MyGUIButton b,a,gravityB,holoubekB,woodyB,invaderB,jpgplrB,pixJumperB,Sensible3_14B,contactMe;
MyGUIStyle fresh,used;
MyGUIActionEvent e;
int cntr;
PImage icon,gravity,holoubek,woody,invader,jpgplr,bck,pixJumper,sensible,woodyI;
PFont font;
boolean once =true;

void setup(){
  size (600,400);
  frameRate(25);
  background(0);
 
  //-----------------------* frame title
  frame.setTitle("#07 :: krystof pesek");
  //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------*
  
  frame.show();
 
  textMode(SCREEN);
  icon = loadImage("kofApp.gif"); 
  invader = loadImage("invader.gif");
  gravity = loadImage("gravity.gif"); 
  woody = loadImage("wave.gif");
  holoubek = loadImage("atos.gif");
  jpgplr = loadImage("jpgplr.gif");
  pixJumper = loadImage("pixJumper.gif");
  sensible = loadImage("sensible.gif");
  //------------------ imgs
  woodyI = loadImage("wave.bmp");
  bck = loadImage("bck.bmp");
  cursor(CROSS);



  font = loadFont("Uni0553-8.vlw");
  textFont(font,8);

  gui = new MyGUI(this);
  color r = color(255);
  
  e = new MyGUIActionEvent(contactMe,"but");
  
  //-------------------------------------------------
  fresh = new MyGUIStyle(this,r);
  fresh.setFont(font,8);
  fresh.setTransparency(55);
  fresh.buttonText = 255;
  fresh.buttonHighlight = color(255,80); 
  fresh.buttonFace = 0;
  fresh.buttonShadow = 0;
  fresh.background = 0;
  
  used = new MyGUIStyle(this,r);
  used.setFont(font,8);
  used.setTransparency(55);
  used.buttonText = color(255,100);
  used.buttonHighlight = color(255,60); 
  used.buttonFace = 0;
  used.buttonShadow = color(255,25);
  used.background = 0;


  /* MyGUITextInput txt  = new MyGUITextInput(this,width/2,height-16,width-10,16);
   txt.setStyle(fresh);
   txt.setActionCommand("text");
   */
  gravityB = new MyGUIButton(this,50,50,gravity);
  gravityB.setStyle(fresh);


  invaderB = new MyGUIButton(this,50,70,invader);
  invaderB.setStyle(fresh);

  holoubekB = new MyGUIButton(this,50,90,holoubek);
  holoubekB.setStyle(fresh);

  woodyB = new MyGUIButton(this,50,110,woody);
  woodyB.setStyle(fresh);

  jpgplrB = new MyGUIButton(this,50,130,jpgplr);
  jpgplrB.setStyle(fresh);
  
   pixJumperB = new MyGUIButton(this,50,150,pixJumper);
  pixJumperB.setStyle(fresh);
  
   Sensible3_14B = new MyGUIButton(this,50,170,sensible);
  Sensible3_14B.setStyle(fresh);


  contactMe = new MyGUIButton(this,60,height-16,"kof@seznam.cz");

  contactMe.setStyle(fresh);
  contactMe.setActionCommand("but");

  gui.add(gravityB);
  gui.add(holoubekB);
  gui.add(woodyB);
  gui.add(invaderB);
  gui.add(jpgplrB);
  gui.add(pixJumperB);
  gui.add(contactMe);
  gui.add(Sensible3_14B);

  //gui.add(txt);

  //noLoop();
  textAlign(CENTER);
  textMode(MODEL);
  this.addNotify();
}


void draw(){


  fill(0);
  noStroke();
  background(0);
  image(bck,width-179,0);



  down(woodyB,woodyT,"wave");
  down(gravityB,gravityT,"gravity");
  down(holoubekB,holoubekT,"atos");
  down(invaderB,invaderT,"invaders");
  down(jpgplrB,jpgplrT,"jpgplr");
  down(pixJumperB,pixJumperT,"pixJumper");
  down(Sensible3_14B,Sensible3_14T,"sensible");
  
  /*if(gui.actionPerformed().equals("but")){
   println("contact"); 
  }*/
  while(frame.getState() == 1){
   //frame.removeNotify();
    this.goToSleep(100);
  once=true;
  }
 
  
  if((frame.getState() == 0)&&(once)){
      //-----------------------* frame title
  frame.setTitle("#07 :: krystof pesek");
  //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------*
  
  frame.show();
  once = false;
  } 
}



