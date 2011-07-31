import promidi.*;

class Sound{

  MidiIO midiIO;
  MidiOut midiOut;
  promidi.Controller[] cc = new promidi.Controller[5];
  
  int first = 1;
  int a;
  int cntr = 1;
  int[] cnt = new int [50];
  int[] playable = new int[50];
  float[] nabeh = new float[100]; 
  public int tolerance = 45;
  int w = 0;
  float poc,rom,rom2,output,floater,addeD;
  PApplet parent;


  Sound(PApplet _parent,int _tolerance,int _w,int in,int md){
    w=_w;
    parent=_parent;
    midiIO = MidiIO.getInstance(parent);  
    midiIO.printDevices();
    midiOut = midiIO.getMidiOut(1,1);

    tolerance = _tolerance;
    for(int i =0;i<50;i++){
      playable[i]=0;
    
      instrument(in,md);    

    }
   
    
    
  }
  
  void instrument(int instr , int mod){
   cc[1] = new Controller(0,1);
     cc[0] = new Controller(32,mod);
     midiOut.sendController(cc[0]);
     midiOut.sendController(cc[1]);
     midiOut.sendProgramChange( new ProgramChange(instr) ); 
    
  }
  
  void reset(){
   cc[1] = new Controller(0,123); 
    midiOut.sendController(cc[1]);
  }


  void sndAnalyze(int clr,int x){
    output = clr;

    if (output >= (nabeh[cntr]+tolerance) || (output+tolerance) <= nabeh[cntr]){
      rect(width-(x+4),(height/2)-28,4,4);

      sw(cntr);

    } 
    else {
      nabeh[cntr] = output;
    }

    nabeh[cntr]= output;
    cnt[cntr]++;

    nabeh[cntr]= output;
    cnt[cntr]++;
    fill(clr);
    stroke(0);
    rect(map(x,0,w,0,width),height/2,6,50);
    line((width)-2.5,(height)+1,width,(height)+1);
    cntr += 1;


  }

  void sw(int x){

    if(cnt[x]>5){
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




}
