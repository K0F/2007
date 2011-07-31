import processing.opengl.*;
import processing.video.*;

MovieMaker mm;
Neuron[] neuro = new Neuron[420];
float bordr = 80.0;
float radi = 7.0;
 float bMin,bMax;
int cnt = 0;

void setup(){
  size(300,300,OPENGL); 
  
  mm = new MovieMaker(this, width, height, "drawing.mov",25, MovieMaker.JPEG, MovieMaker.HIGH);
  
  bMax = width-bordr-radi/2;
  bMin = bordr+radi/2;
  
  for(int i = 0;i<neuro.length;i++){

    neuro[i] = new Neuron(random(bMin,bMax),random(bMin,bMax),1,bordr,radi,i);
  }
  
  background(0);

  // smooth();

}

void draw(){
    cnt++;
    cnt=cnt%(height);
    if(cnt==0){mm.addFrame();background(0);}

  for(int i = 0;i<neuro.length;i++){
    neuro[i].run();
    float X = map(neuro[i].x,bMin,width-bMin+5,width/2,width);
    line(X,cnt+1,X,cnt);
  }

  //last();
  //chosen(5,6,8,7);
}

void keyPressed(){
 if(keyCode==ENTER){
  mm.finish();
  println("finish");
 } 
  
  
}



