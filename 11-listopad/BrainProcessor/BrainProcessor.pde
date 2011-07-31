import processing.opengl.*;


Neuron[] neuro = new Neuron[420];
float bordr = 80.0;
float radi = 7.0;
 float bMin,bMax;
int cnt = 0;

void setup(){
  size(300,300,OPENGL); 
  
  bMax = width-bordr-radi/2;
  bMin = bordr+radi/2;
  
  for(int i = 0;i<neuro.length;i++){

    neuro[i] = new Neuron(random(bMin,bMax),random(bMin,bMax),1,bordr,radi,i);
  }
  
  background(0);

  // smooth();

}

void draw(){
  
  fade(0,55);
  
  for(int i = 0;i<neuro.length;i++){
    neuro[i].run();
    
    line(neuro[i].x,5,neuro[i].x,25);
    line(5,neuro[i].y,25,neuro[i].y);
  }

  //last();
  //chosen(5,6,8,7);
}



