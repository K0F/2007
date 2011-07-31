//-----------------------  >

import processing.opengl.*;

//-----------------------  >
Neuron[] neuro = new Neuron[200];
float bordr = 80.0;
float radi = 7.0;
float bMin,bMax;
int cnt = 0;
int tickC = 0;
float radTarg = radi;
float oMin=50.0,oMax=0.0;

//-----------------------  >

void setup(){
  size(300,300,OPENGL); 

  bMax = width-bordr-radi/2;
  bMin = bordr+radi/2;
  
  for(int i = 0;i<neuro.length;i++){

    neuro[i] = new Neuron(this,random(bMin,bMax),random(bMin,bMax),1,bordr,radi,i);
  }
  
  textFont(loadFont("00Acrobatix-8.vlw"),8);

  background(0);

  // smooth();

}

//-----------------------  >

void draw(){

  fade(0,55);


  for(int i = 0;i<neuro.length;i++){
    neuro[i].run();    
    line(neuro[i].x,5,neuro[i].x,25);
    line(5,neuro[i].y,25,neuro[i].y);
  }


  int tickC = 0;
  
  for(int i = 0;i<neuro.length;i++){
    if(neuro[i].touch){
      tickC++;
      
    }
  }
  tickC=constrain(tickC,1,50);
  for(int i = 0;i<neuro.length;i++){
    radTarg += (map(tickC,0,50,50.0,5.5)-radTarg)/(neuro[i].speed);
    neuro[i].radius += (radTarg-neuro[i].radius)/20.0 ;
    neuro[i].radius=constrain(neuro[i].radius,5.5,200.0);
    if(neuro[i].radius>oMax){oMax=neuro[i].radius;}
    if(neuro[i].radius<oMin){oMin=neuro[i].radius;}
  }
  
  fill(0);
  rect(width-45,0,45,55);
  fill(#FFFFFF);
  text(round(neuro[0].radius*1000.0)/1000.0,width-35,10);
  fill(#00FF00);
  text(round(oMin*1000.0)/1000.0,width-35,20);
  fill(#FF0000);
  text(round(oMax*1000.0)/1000.0,width-35,30);
  noFill();
  //println(tickC);


  //last();
  //chosen(5,6,8,7);
}



