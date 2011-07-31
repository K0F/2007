import processing.opengl.*;
import controlP5.*;
import promidi.*;
 

 
MidiIO midiIO;
MidiOut midiOut;
ControlP5 gui;
ControlWindow controlWindow;
promidi.Controller[] h = new promidi.Controller[50];


PImage bg,muted,unmuted;
PImage firstBG;
PFont font;
int first = 1;
int a;
int cntr = 1;
int[] cnt = new int [50];
int[] playable = new int[50];


public int speed = 100;
int reset = 0;
float poc,rom,rom2,output,floater,addeD;
float[] nabeh = new float[100]; 
public int tolerance = 14;
public float size;
float center_X,center_Y;
public boolean mute = false;

void setup() 
{
  size(400,400,OPENGL);
  frameRate(25);
  
  
  //-----------------------* frame icon
  String path = sketchPath("data/jpgplr.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------* frame title
  frame.setTitle("a/v player by krystof pesek");
  //-----------------------*
  frame.show();
  frame.setAlwaysOnTop(true);
  
  firstBG = loadImage("firstBG_BLACK.jpg");
  
  muted = loadImage("sound_mute.png");
  unmuted = loadImage("sound.png");
  
  rectMode(CENTER);
  //smooth();
  font = loadFont("Uni0553-8.vlw");
  textFont(font, 8);
  
 
  
  midiIO = MidiIO.getInstance(this);  
  int which = getSynth(midiIO);
  //midiIO.printDevices();
  

  
  midiOut = midiIO.getMidiOut(1,which);
  
 //-----------------------> instrument sw synth 
 
 swSet(23,0);
 

  
  gui = new ControlP5(this);
 /*
  controlWindow = gui.addControlWindow("ovladac",100,100,330,180);
  controlWindow.setBackground(color(25));
  
                                      
  
 controlP5.Controller toleranceC = gui.addSlider("tolerance",1.0    ,50.0 ,7  ,20  ,20 ,100 ,10);
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
    
   */
    
    for(int i =0;i<50;i++){
  playable[i]=0;
}
    
}


  
void draw() 
{  
  if (first == 1){
  image(firstBG,0,0);
  } else {
  pushMatrix();
  translate(width/2,height/2);
  fill(0,20);
  rect(0,0,width,height);
  popMatrix();
  
  pushMatrix();

  translate(width/2,height/2);
  
  rotate(radians(poc));
  scale((size),(size)); 
  noStroke();
  if(bg!=null) {
    first=0;  
    translate((center_X/size*5.0),(center_Y/size*5.0));
    image(bg,-bg.width/2,-bg.height/2);
   
  }
  poc += (speed)/100.0;
  rom = sin(poc);
  rom2 = cos(poc);
  popMatrix();
  //a = (a + 1)%(width+32);
  
  if(mute){
    image(muted,0,0);
  }else{
   image(unmuted,0,0); 
  }

  for (int x = 0;x<width;x+=(width)/40){
    //println((cntr+1)/4);
    stroke(0);
    fill(color(get(x+4,height/2)));
    //print(x+":"+ brightness(get(x,height/2))+" ");
    output =brightness(get(x+2,height/2))/2;
    //fill(255,output+8);
    noStroke();
    //println(cntr);
    if (output >= (nabeh[cntr]+tolerance) || (output+tolerance) <= nabeh[cntr]){
      rect(x+4,(height/2)-28,4,4);
     
      sw(cntr);
         
    } else {nabeh[cntr] = output;}
  
    nabeh[cntr]= output;
     cnt[cntr]++;
  fill(get(x+4,height/2),50);
    //fill(255,(output+8));
    stroke(0);
    rect(x+4,height/2,6,50);
    line((width)-2.5,(height)+1,width,(height)+1);
    cntr += 1;
  }

  cntr=0;
  }
}



void dropEvent(DropEvent theDropEvent) {
  if(theDropEvent.isFile()) {
    File myFile = theDropEvent.file();
    center_X=0;center_Y=0;tolerance=7;size=1;speed=40;
  }
  if(theDropEvent.isImage()) {
    
    bg = new PImage(theDropEvent.image());
   bg.mask(bg);
  first=0; 
  }
  println("a dropEvent "+theDropEvent);
}



void sw(int x){
  if(cnt[x]>3){playable[x]=1;cnt[x]=0;}
  if((playable[x]==1)&&(!mute)){
  Note note;
  note = new Note((x+10)*2,50,80);
  midiOut.sendNote(note);
  playable[x]=0;
}
}

int getSynth(MidiIO mid){
  int result = 1;
  int num = mid.numberOfOutputDevices ( );
  String[] names = new String[num];
  for(int i = 0;i < num;i++){
   names[i] = mid.getOutputDeviceName(i); 
   if(names[i].equals("Microsoft GS Wavetable SW Synth")){
   result = i;
   }
  }
  println("Devices: \n");
  println("");
  println(names);
  println("\nSelected: "+result+" --> "+names[result]+"\n");
  
  return result;
}

void mousePressed(){
 if((mouseY<=16)&&(mouseX<=16)){
  if(mute){
   mute = false; 
  }else{
    muteIt();
   mute = true; 
  }
 } 
}

void control(promidi.Controller x){
midiOut.sendController(x);
}

void swSet(int _bank,int _prog){
  
 int prog = _bank;
 int bank = _prog;
 
 h[0] = new promidi.Controller(0,121);
 h[1] = new promidi.Controller(32,bank);
 h[2] = new promidi.Controller(1,127);
ProgramChange program = new ProgramChange(prog);
  println(program.getNumber());
control(h[0]) ;
control(h[1]) ;
midiOut.sendProgramChange(program);
 control(h[2]) ; 
  
}

void muteIt(){
 h[30] = new promidi.Controller(123,1); 
  control(h[30]);
}

void unmuteIt(){
   h[30] = new promidi.Controller(1,127); 
  
}




