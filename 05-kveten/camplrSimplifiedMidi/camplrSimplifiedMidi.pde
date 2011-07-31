import JMyron.*;
import processing.opengl.*;
import controlP5.*;
import promidi.*;

JMyron m;
MidiIO midiIO;
MidiOut midiOut;
ControlP5 gui;
ControlWindow controlWindow;


PFont font;
int first = 1;
int a;
int cntr = 1;
int[] cnt = new int [50];
int[] playable = new int[50];

int[] img;
public int speed = 100;
int reset = 0;
float poc,rom,rom2,output,floater,addeD;
float[] nabeh = new float[100]; 
public int tolerance = 10;
public float size;
float center_X,center_Y;


void setup() 
{
  size(450,100,OPENGL);
  frameRate(25);


  //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------* frame title
  frame.setTitle("cam player :: krystof pesek");
  //-----------------------*
  frame.show();

  m = new JMyron();//obj
  m.start(45,36);//320x240
  m.findGlobs(0);

  rectMode(CENTER);
  //smooth();
  font = loadFont("Uni0553-8.vlw");
  textFont(font, 8);


  midiIO = MidiIO.getInstance(this);  
  midiIO.printDevices();
  midiOut = midiIO.getMidiOut(1,6);


  gui = new ControlP5(this);
  controlWindow = gui.addControlWindow("ovladac",100,100,330,180);
  controlWindow.setBackground(color(25));

  /*   |name|     |min|   |max||set||X|  |Y| |w|  |h| legend */

  controlP5.Controller toleranceC = gui.addSlider("tolerance",15.0    ,150.0 ,35.0  ,20  ,20 ,100 ,10);
  controlP5.Controller sizeC = gui.addSlider("size"     ,0.0001 ,6.0  ,1  ,20  ,65 ,100 ,10);
  controlP5.Controller rychlostC = gui.addSlider("speed"    ,-500   ,500  ,40 ,20  ,110,100 ,10);

  controlP5.Controller cexC = gui.addSlider("center_X" ,-100   ,100  ,0  ,150 ,20 ,150 ,10);
  controlP5.Controller ceyC = gui.addSlider("center_Y" ,-100   ,100  ,0  ,150 ,65 ,150 ,10);


  rychlostC.setWindow(controlWindow);
  toleranceC.setWindow(controlWindow);
  sizeC.setWindow(controlWindow);
  cexC.setWindow(controlWindow);
  ceyC.setWindow(controlWindow);


  //--------------------------------------------------->set
  gui.setColorBackground(color(5,5,5));
  gui.setColorForeground(color(255,50));
  gui.setColorValue(color(190));
  gui.setColorLabel(color(220));
  gui.setColorActive(color(29,44,100)); 



  for(int i =0;i<50;i++){
    playable[i]=0;
  }

}



void draw() 
{  
  background(0);
  /*
    fill(0,20);
    rect(width/2,height/2,width,height);
*/
    m.update();
     img = m.image();
   // preview();
    for (int x = 0;x<width;x+=(width)/45){
     

      stroke(0);
     
      fill(color(img[(m.height()/2)*m.width()+x/10]));
     
      output =brightness(img[(m.height()/2)*m.width()+x/10])/2;
      
      noStroke();
      
      if (output >= (nabeh[cntr]+tolerance) || (output+tolerance) <= nabeh[cntr]){
        rect(width-(x+4),(height/2)-28,4,4);

        sw(cntr);

      } 
      else {
        nabeh[cntr] = output;
      }

      nabeh[cntr]= output;
      cnt[cntr]++;
      fill(color(img[(m.height()/2)*m.width()+x/10]));
      
      stroke(0);
      rect(width-(x+4),height/2,6,50);
      line((width)-2.5,(height)+1,width,(height)+1);
      cntr += 1;
    

    
  }
  cntr=0;

}







void sw(int x){
  
  if(cnt[x]>3){
    playable[x]=1;
    cnt[x]=0;
  }
  if(playable[x]==1){
    Note note;
    note = new Note(constrain(100-(x+10)*2,0,127),constrain(128-((int)output/2),0,127),120);
    //println(100-(x+10)*2);
    midiOut.sendNote(note);
    playable[x]=0;
  }
}

void preview(){
 for (int x = 0;x<m.width();x+=1){
   for (int y = 0;y<m.height();y+=1){
    noStroke();
     fill(color(img[y*m.width()+x]));
     rect(x,y,1,1);
   }
 }
}




