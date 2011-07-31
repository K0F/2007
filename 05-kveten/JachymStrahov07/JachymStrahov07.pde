import processing.opengl.*;

PFont fontNadpis,font;
SuperCudlik[] button = new SuperCudlik[5];
int shift = 40;


void setup(){
 size(800,500,OPENGL);
 background(#272727); 
 font = loadFont("Bahamas_CE-14.vlw");
 fontNadpis = loadFont("Bahamas_CE-48.vlw");
     
 button[0] = new SuperCudlik("Autor",20,50+shift,0);
 button[1] = new SuperCudlik("Støecha",20,70+shift,1);
 button[2] = new SuperCudlik("Tribuny",20,90+shift,2);
 button[3] = new SuperCudlik("Situace",20,110+shift,3);
 button[4] = new SuperCudlik("A",20,130+shift,4);
  
  
}

void draw(){
  background(#272727); 
  
  nadpis("Strahov");
  
  for(int i =0;i<5;i++){
  button[i].run();
  }
  
  
}

void nadpis(String _nadpis){
 textFont(fontNadpis);
 fill(#CCCCCC);
 text(_nadpis,15,45); 
    
}




