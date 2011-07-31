import promidi.*;

class SndGen{
  int cnt = 0;
  boolean palyable = false;
  MidiIO midiIO;
  MidiOut midiOut;

  SndGen(int channel,PApplet _parent){
    //---------------->inti midi
    midiIO = MidiIO.getInstance(_parent);  
    midiIO.printDevices();
    midiOut = midiIO.getMidiOut(1,channel);    
  }

  void run(int cnt){
    sw(cnt); 
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





}
