import processing.video.*;

import processing.opengl.*;


Obj[] obj = new Obj[3800];

MovieMaker mm;


void setup(){
  size(720,576,OPENGL); 

  for(int i = 0;i<obj.length;i++){

    obj[i] = new Obj(random(width),random(height),1,i);
  }
  
  textFont(loadFont("04b24-8.vlw"));

mm = new MovieMaker(this, width, height, "drawing.mov",25, MovieMaker.JPEG, MovieMaker.HIGH);
  

  // smooth();
  background(0);
}

void draw(){
  fill(0,15);
  rect(0,0,width,height);

  for(int i = 0;i<obj.length;i++){
    obj[i].run();
  }
  
  mm.addFrame(); 

}

void keyPressed(){
 if(keyCode==ENTER){
  mm.finish();
  println("finish");
 } 
  
  
}



