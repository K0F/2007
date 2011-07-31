import processing.opengl.*;
import processing.video.*;

Neuron[] neuro = new Neuron[9500];
float bordr = 9.5;
float radi = 7.0;
float bMin,bMax;
int cnt = 0;

MovieMaker mm;

void setup(){
  size(720,576,OPENGL); 
  
  bMax = width-bordr-radi/2;
  bMin = bordr+radi/2;
  
  for(int i = 0;i<neuro.length;i++){

    neuro[i] = new Neuron(random(bMin,width-bMin),random(bMin,height-bMin),1,bordr,radi,i);
  }
  
  mm = new MovieMaker(this, width, height, "drawing.mov",25, MovieMaker.JPEG, MovieMaker.HIGH);
 
  
  background(0);

  // smooth();

}

void draw(){
  
  fade(0,100);
 // background(0);
  for(int i = 0;i<neuro.length;i++){
    neuro[i].run();
    /*
    line(neuro[i].x,5,neuro[i].x,25);
    line(5,neuro[i].y,25,neuro[i].y); */
  }
  
  mm.addFrame();

  //last();
  //chosen(5,6,8,7);
}

void keyPressed(){
 if(key==' '){
  save("screen.png");
 } 
  if(keyCode==ENTER){
    mm.finish();
    println("finish"); 
  } 
 
 keyPressed=false;
  
}



