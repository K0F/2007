import processing.serial.*;
Serial port;       
// The serial port

String[] ind = new String[5];
int res = 20;
int thisByte = -1;  // Variable to hold keystoke values
int whichKey = -1;  // Incoming serial data
float q;
int qant,soucet;
float prum;
PFont fontA;        // Font for printing
float cnt =0;
float minval = 255,maxval=0;
int[] val = new int[1001];
float[] liner = new float[2] ;



void setup() {

  size(800, 255);
  frameRate(25);
  String[] nula = new String[1];
  nula[0] = str(0);
  saveStrings(sketchPath+"/data/info.kof", nula);
  frame.setTitle("diode ReaDer by kof");
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
  textFont(fontA, 24);
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





void draw() {
  float koef = (maxval-minval)/10.0;
  
  cnt+=0.1;
  qant+=1;if(qant>res){qant=0;}
 if(cnt>=width){cnt=0;savePicture();background(0);}
  
  noStroke();
  val[qant] = thisByte;
liner[0] = prum;
soucet = 0;  
  for (int i =0;i<res;i++){
  soucet += val[i]; 
  prum = soucet/(res+1.0f);
  }
//println((prum*12.0));
  noSmooth();
  stroke(255,25,25,80);
  line(cnt,map(liner[1],0.0,70.0,height-5,5),cnt+1,map(liner[0],0.0,70.0,height-5,5));
  stroke(map(liner[0],0.0,55,0,255),35);
  line(cnt,0,cnt,10);
  liner[1]=prum;
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
  }
 keyPressed = false ;
  cnt=0;
 background(0);
 
}

void savePicture(){
  ind=loadStrings(sketchPath+"/data/info.kof");
 int f = Integer.parseInt( ind[0] )+1;
 
  ind[0]= ""+f;
  saveStrings(sketchPath+"/data/info.kof", ind);
 save(sketchPath+"/imgs/light_"+(int)day()+"-"+(int)month()+"_"+(int)hour()+"h-"+(int)minute()+"min_"+f+".png");
  
}

