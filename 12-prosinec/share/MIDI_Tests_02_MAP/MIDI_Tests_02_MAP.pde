import promidi.*;

MidiIO midiIO;
MidiOut midiOut;
Controller instr,family,reset;

int cnt,symbol,posun,w = 200;
int[] holder = new int[w];
void setup(){
  size(w,127);
  frameRate(10);
  
  for (int i = 0; i < holder.length; i++) {
    holder[i]=-1;
  }
  
  midiIO = MidiIO.getInstance(this);  
  midiIO.printDevices();
  midiOut = midiIO.getMidiOut(1,3); ///MIDI PORT 2
  reset = new Controller(121,0);
  //family = new Controller(32,0);//7-vol,
  instr = new Controller(0,55);
  
  midiOut.sendController(reset);
    midiOut.sendController(instr);
  
  
   //-----------------------* frame icon
  String path = sketchPath("data/nota.k"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------* frame title
 frame.setTitle("MIDI pariture");
  //-----------------------*
  frame.show();
  
  
  background(0);

}



void draw(){
  background(0);
 for (int i = 0;i<holder.length;i++){
  noStroke();
  fill(255);
   rect(i,height-holder[i],1,1); 
 }
 play();
}

void keyPressed(){
 keyPressed=false;
 
  if((keyCode!=ENTER)&&(keyCode!=BACKSPACE)){
  symbol = constrain((int)key,97,122);
  println(symbol);
  holder[posun] = (int)map(symbol,97,122,0,height);
 sw((int)map(symbol,97,122,0,height),120,600) ;
  }
  
  
  
  
  
}

void play(){
 posun=(posun+1)%width;
 stroke(255);
 line(posun,0,posun,height);
  sw(holder[posun],120,600); 
  if(keyCode==ENTER){sav();keyCode=0;}
    if(keyCode==BACKSPACE){load();keyCode=0;}
}

void sw(int x,int y,int z){

  if (x!=-1){
  Note note;
  note = new Note(x,y,z);
  midiOut.sendNote(note);
  }
  
}

void mousePressed(){
  
  if(mouseButton==LEFT){
  mousePressed=false;
  posun=0;
  } else if(mouseButton==RIGHT){
    for (int i = 0; i < holder.length; i++) {
    holder[i]=-1;
  }
  }
  
}

void sav(){
    
  String noty[]=new String[holder.length];
  for (int i = 0; i < holder.length; i++) {
    noty[i]  =""+holder[i];
  }
  
  saveStrings("/data/partiture.kof",noty);
    
}

void load(){
   
  String noty[];  
  noty=loadStrings(sketchPath+"/data/partiture.kof");
    for (int i = 0; i < holder.length; i++) {
    holder[i]  =parseInt(noty[i]);
  }
  

}


