import processing.video.*;

import processing.opengl.*;
MovieMaker mm;

Obj[] obj = new Obj[800];

void setup(){
  size(576,420,OPENGL); 
  
  for(int i = 0;i<obj.length;i++){

    obj[i] = new Obj(random(width),random(height),1,i);
  }
  
   mm = new MovieMaker(this, width, height, "drawing.mov",30, MovieMaker.JPEG, MovieMaker.HIGH);
  
  
  background(0);
 // smooth();

}

void draw(){
  fill(0,35);
  rect(0,0,width,height);

  for(int i = 0;i<obj.length;i++){
    obj[i].run();
  }
  
  mm.addFrame(); 

}

void mousePressed(){
   fullRest();
  
}

void fullRest(){
 for(int i = 0;i<obj.length;i++){

    obj[i].tx = random(width);
    obj[i].ty = random(height);
  } 
  
}

void keyPressed(){
 if(keyCode==ENTER){
  mm.finish();
  println("finish");
 } 
  
  
}

