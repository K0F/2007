////////////////////////////////////////////////////////////////////////////////// Player Class

import JMyron.*;
import promidi.*;

//////////////////////////////////////////////////////////////////////////////////

class Player{
  JMyron m;
  
  MidiIO midiIO;
  MidiOut midiOut;
  promidi.Controller[] h = new promidi.Controller[50];
  
  int numX = 32;
  int numY = 24;
  
  Note[][] note = new Note[numX][numY];
  float ratX = width/(numX+2.0);  
  float ratY = height/(numY+2.0);
  
  int rozdil = 0;
  int mez = 25;
  int instr,bnk;


  int interval = 10;
  
  int channel;
  
  color output;
  
  int[] img = new int[numX*numY];
  int[] img2 = new int[numX*numY];
  boolean[][] net = new boolean[numX][numY]; 
  boolean[][] hraje = new boolean[numX][numY];
  int[][] counter = new int[numX][numY];
  
  boolean prew = true;
  boolean mute = true;

//////////////////////////////////////////////////////////////////////////////////
  
  Player(PApplet _parent,int _tol,int _itvl,int _instr,int _bnk,int _channel){
     ratX=ratX*1.01; //ratio obrazu
      println("/////////////////////////////////////");
     println("Translator cam->midi 1.1 by Krystof Pesek aka Kof\n3.12 2007\nNo copyright!");
     println("\n/////////////////////////////////////");
    println("Ratio : \n"+ratX+":"+ratY);
    for(int y = 0; y < numY;y+=1){
      for(int x = 0; x < numX;x+=1){  
        net[x][y] = false;  
       hraje[x][y] = false; 
        counter[x][y] = 0;
        note[x][y] = new Note((int)(map(x,0,numX,0,127)),120,(int)(map(y,0,numY,0,127)));
     }
    }  
    
  m = new JMyron();//obj
  m.start(numX,numY);//45,36);//320x240
  m.findGlobs(0);
  
  interval = _itvl*10;
  mez = _tol;
  
  midiIO = MidiIO.getInstance(_parent);  
  if(_channel==0){
  channel = getSynth(midiIO);
  }else{
   channel = _channel; 
   midiIO.printDevices();
  }
  
  midiOut = midiIO.getMidiOut(1,channel);
  
  //-----------------------> instrument sw synth 
 instr = _instr; bnk = _bnk;
 swSet(instr,bnk,0); //program,bank,effect  /11,0,0 /

  
  }
  
  //////////////////////////////////////////////////////////////////////////////////

  void draw(){
    
     img2 = m.image();     
     m.update();
     img = m.image();    
    
    for(int y = 0; y < numY;y+=1){
      for(int x = 0; x < numX;x+=1){ 
     // output =color(img[y*numX+x]);
        output =color(brightness(img[y*numX+x]));        
                
        if(net[x][y]){
           rozdil = (int)abs(brightness(output)-brightness(img2[y*numX+x])); 
            
            counter[x][y]++;
            
           if(rozdil >= mez){
             //println(x+":"+y+"   ht! - "+counter[x][y]);
             if(cp.mute){
             synth(x,y);
             }
             fill(255);
             rect(x*ratX,y*ratY,ratX,ratY);          
           }
           fill(255);
           text((int)(counter[x][y]/10),(int)(x*ratX+1),(int)(y*ratY+8));
           output =lerpColor(output,#FF0000,0.75);
        }//end if NET
        
          stroke(255,4);         
          fill(output,150);
          line(x*ratX,ratY,x*ratX,height-ratY);
          line(ratX,y*ratY,width-ratX,y*ratY);
          noStroke();
          
          if(prew){
          rect(x*ratX,y*ratY,ratX,ratY);        
          }
          
      }// end X      
    }//end Y    
    
    fill(255);
        text("| tol:"+mez+"| itvl:"+interval+"| x:"+numX+"| y:"+numY+"| ch:"+channel+"|",10,7);
  }//end void
  
  //////////////////////////////////////////////////////////////////////////////////
  
 void synth(int x,int y){
    
   if(counter[x][y]>interval){
    try{  
     try{ 
       try{
         
    midiOut.sendNote(note[x][y]);
    hraje[x][y] = true;
    counter[x][y] = 0;
    
       }catch(java.lang.NullPointerException w){
         println(w);
       }
     }catch(ArrayIndexOutOfBoundsException q){
      println(q); 
     }
    }catch(ConcurrentModificationException e){
     println(e); 
    }
    }    
    
 }

//////////////////////////////////////////////////////////////////////////////////

void click(){
 int X = (int)(mouseX/ratX);
 int Y = (int)(mouseY/ratY); 
 
 if((X>=1)&&(X<=numX-1)&&(Y>=1)&&(Y<=numY-1)){
 net[X][Y] = changeState(net[X][Y]);
 
 }
 
}

//////////////////////////////////////////////////////////////////////////////////

int getSynth(MidiIO mid){
  int result = 1;
  int num = mid.numberOfOutputDevices();
  String[] names = new String[num];
  for(int i = 0;i < num;i++){
   names[i] = mid.getOutputDeviceName(i); 
   if(names[i].equals("Microsoft GS Wavetable SW Synth")){
   result = i;
   }
  }
  println("/////////////////////////////////////");
  println("Devices: \n");
  println(names);
  println("\n\nAutoselect mode");
  println("\nSelected: "+result+" --> "+names[result]+"\n");
  
  return result;
}

//////////////////////////////////////////////////////////////////////////////////

void swSet(int _bank,int _prog,int _effect){
  int effect = _effect;
 int prog = _bank;
 int bank = _prog;
 
 h[0] = new promidi.Controller(0,121);
 h[1] = new promidi.Controller(32,bank);
 h[2] = new promidi.Controller(94,127);
ProgramChange program = new ProgramChange(prog);
//  println(program.getNumber());
control(h[0]) ;
control(h[1]) ;
midiOut.sendProgramChange(program);
 control(h[2]) ; 
  
}

//////////////////////////////////////////////////////////////////////////////////

void control(promidi.Controller x){
midiOut.sendController(x);
}

void muteIt(){
 h[30] = new promidi.Controller(123,1); 
  control(h[30]);
}

  
  
}//end class

//////////////////////////////////////////////////////////////////////////////////
