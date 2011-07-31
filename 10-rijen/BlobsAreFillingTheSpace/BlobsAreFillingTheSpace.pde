import processing.opengl.*;

//space computing by Kof
int quanto = 25;
Blob[] b = new Blob[quanto];


void setup(){
  size(screen.width,screen.height,OPENGL);
  background(0);


  for(int i = 0;i<quanto;i++){
    b[i]=new Blob(i,50);
  }

  stroke(#FFFFFF,5);
  fill(255,6);

  // smooth();

}

void draw(){

  //background(0);

  fill(0,10);
  rect(0,0,width,height);


  for(int i = 0;i<quanto;i++){
    b[i].run();
  }
  
  if(frameCount%70==0){
   resetCelek(); 
  }

}


void mousePressed(){
  resetCelek();
}

void resetCelek(){
  for(int i = 0;i<quanto;i++){

    b[i].reset();

  } 
  
}

