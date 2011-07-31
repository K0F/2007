import JMyron.*;
import promidi.*;

class Player{
  JMyron m;
  
  
  
  int numX = 32;
  int numY = 24;
  
  MidiIO midiIO;
  MidiOut[] midiOut = new MidiOut[numY];
  promidi.Controller[] h = new promidi.Controller[50];
  
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
  
  Player(PApplet _parent,int _tol,int _itvl,int _instr,int _bnk){
     ratX=ratX*1.01; //ratio obrazu
    println(ratX+":"+ratY);
    for(int y = 0; y < numY;y+=1){
      for(int x = 0; x < numX;x+=1){  
        net[x][y] = false;  
       hraje[x][y] = false; 
        counter[x][y] = 0;
     }
    }  
    
  m = new JMyron();//obj
  m.start(numX,numY);//45,36);//320x240
  m.findGlobs(0);
  
  interval = _itvl*10;
  mez = _tol;
  
  instr = _instr; bnk = _bnk;
  midiIO = MidiIO.getInstance(_parent);  
  channel = getSynth(midiIO);
  //midiIO.printDevices();
  for(int i = 1;i<numY;i++){
  midiOut[i] = midiIO.getMidiOut(i,channel);
  swSet(i,bnk,0,i); //program,bank,effect  /11,0,0 /
  }
  //-----------------------> instrument sw synth 
 


  
  }

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
             synth(x,y);
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
        text("| tol:"+mez+"| itvl:"+interval+"| x:"+numX+"| y:"+numY+"| ch:"+channel,10,7);
  }//end void
  
 void synth(int x,int y){
    
   if(counter[x][y]>interval){
    
    Note note;
    note = new Note((int)(map(x,0,numX,0,127)),120,120);
    midiOut[y].sendNote(note);
    hraje[x][y] = true;
    counter[x][y] = 0;
    }    
    
 }

void click(){
 int X = (int)(mouseX/ratX);
 int Y = (int)(mouseY/ratY); 
 
 if((X>=1)&&(X<=numX-1)&&(Y>=1)&&(Y<=numY-1)){
 net[X][Y] = changeState(net[X][Y]);
 
 }
 
}

boolean changeState(boolean _w){
  boolean w = true;
  if (_w) w=false;
  return w;
}

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
  println("Devices: \n");
  println("");
  println(names);
  println("\nSelected: "+result+" --> "+names[result]+"\n");
  
  return result;
}

void swSet(int _bank,int _prog,int _effect,int which){
  int effect = _effect;
 int prog = _bank;
 int bank = _prog;
 
 h[0] = new promidi.Controller(0,121);
 h[1] = new promidi.Controller(32,bank);
 h[2] = new promidi.Controller(94,127);
ProgramChange program = new ProgramChange(prog);
//  println(program.getNumber());
control(h[0],which) ;
control(h[1],which) ;
midiOut[which].sendProgramChange(program);
 control(h[2],which) ; 
  
}

void control(promidi.Controller x,int which){
midiOut[which].sendController(x);
}

  
  
}//end class
