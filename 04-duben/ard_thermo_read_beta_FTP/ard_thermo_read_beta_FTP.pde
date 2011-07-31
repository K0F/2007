import processing.serial.*;
Serial port;       
// The serial port

String[] ind = new String[5];
int[] changeH = new int[2];
int[] changeD = new int[2];
int res = 40*2;
int thisByte = -1;  // Variable to hold keystoke values
int whichKey = -1;  // Incoming serial data
float q;
int jj = 0;
int qant,soucet;
float prum;
PFont fontA;        // Font for printing
float cnt =0;
float minval = 255,maxval=0;
int val[] = new int[res+1];
float[] liner = new float[2] ;
 String[] nula = new String[1];


void setup() {

  size(1000, 255);
  frameRate(25);
 
  nula[0] = str(0)+"\n"+str(0);
  
  //saveStrings(sketchPath+"/data/info.kof", nula);
  frame.setTitle("thermo ReaDer by kof");
  // Load and prep fonts to print to window
  setFullScreen( false );               // get fullscreen exclusive mode
    setResolution( 1024,768 );           // change resolution to 640, 480
    createFullScreenKeyBindings();       // let ctrl+f switch to window mode
      //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------* frame title
  //-----------------------*
  fontA = loadFont("04b24-24.vlw");
  textFont(fontA, 8);
cursor(CROSS);
  // List all the available serial ports:
  println(Serial.list());

  // I know that the first port in the serial list on my mac
  // is always my  Keyspan adaptor, so I open Serial.list()[0].
  // In Windows, this usually opens COM1.
  // Open whatever port is the one you're using.
  port = new Serial(this, Serial.list()[2], 9600);

  // send a capital A out the serial port:
 
   println("");
   println("READY TO GO!");

  port.write(65);
background(0);
}



boolean first = true;

void draw() {
  
  changeH[0] = (int)hour();
  changeD[0] = (int)day();
  
  float koef = (maxval-minval)/10.0;
  
  cnt=map(  ( ( (int)hour()*60  )+((int)minute())),0.0,1440.0,0,width);
  qant+=1;if(qant>res){qant=0;}
// if(cnt>=width){cnt=0;savePicture();background(0);}
  
  noStroke();
  val[qant] = thisByte;
liner[0] = prum;
soucet = 0;  
 
  int kk = 0;
  for (int i =0;i<res;i++){
  kk++;
    soucet += val[i]; 
 
  }
  
  
  prum = soucet/(kk+1.0f);
//println((prum*12.0));
  noSmooth();
  //----------------------------------- * hodina
  if((changeH[0] != changeH[1])&&(!first)) {stroke(255,20);fill(255,180);line(cnt,0,cnt,height);text(changeH[0],cnt+5,height-2);savePicture();}
  changeH[1] = (int)hour();
  
 //------------------------------------ * den
  if((changeD[0] != changeD[1])&&(!first)) {savePicture();background(0);saveStrings(sketchPath+"/data/info.kof", nula);}
  changeD[1] = (int)day();
  
  
  
  //----------------------------------- * render
  stroke(255,80);
  //println(liner[1]);
  point(cnt,map(liner[1],62.0,130.0,height-5.0,5.0));
  stroke(map(liner[0],62.0,130.0,0,255),35);
  line(cnt,0,cnt,10);
  liner[1]=prum;
  
  first=false;
  
  if (minval>=prum){minval = prum;}
  if (maxval<=prum){maxval = prum;}
  //println(liner[0]);
  
   
  while (port.available() > 0) {
    thisByte = int(port.read());
  }
}

void keyPressed() {
  if(keyCode==ENTER){
savePicture();  
keyCode=0;

  } else if(keyCode == DELETE){
    keyCode=0;
    background(0);
  } else if(keyCode == BACKSPACE){
     keyCode=0;
   loadTemp(); 
    
  }
    
    
 keyPressed = false ;
 

 
}

void savePicture(){
  ind=loadStrings(sketchPath+"/data/info.kof");
 int f = Integer.parseInt( ind[0] )+1;
 
  ind[0]= ""+f;
 ind[1]= ""+f;
  saveStrings(sketchPath+"/data/info.kof", ind);
   save(sketchPath+"/imgs/temp/"+f+".png");
 save(sketchPath+"/imgs/thermo_"+changeD[1]+"-"+(int)month()+"_"+(int)year()+".png");
   putFile("weirdplace.wz.cz","weirdplace.wz.cz","cigareta","imgs","thermostation","thermo_"+changeD[1]+"-"+(int)month()+"_"+(int)year()+".png","thermo_"+changeD[1]+"-"+(int)month()+"_"+(int)year()+".png"); 

}

void loadTemp(){
  ind=loadStrings(sketchPath+"/data/info.kof");
  if(Integer.parseInt( ind[0] )!=0){
 PImage zaloha = loadImage(sketchPath+"/imgs/temp/"+constrain(Integer.parseInt( ind[1] ),1,1024)+".png");
 image(zaloha,0,0);
  } 
  
}

