import processing.opengl.*;

import moviemaker.*;

int num = 5070;

MovieMaker movie;

Castice[] cs = new Castice[num];

boolean accept = true;

void setup(){
 // size(screen.width,screen.height,OPENGL); 
  size(1024,768);
  background(0);
  for(int i = 0;i<num;i++){
    cs[i] = new Castice(random(width),random(height),220.0f,i);  
  }
 
 movie = new MovieMaker(this, width, height, "temp.mov",MovieMaker.JPEG,MovieMaker.HIGH,25) ;

println("ready!");
}

void draw(){
  noStroke();
  fill(0,25);
  rect(0,0,width,height);

  for(int i = 0;i<num;i++){
    cs[i].compu();
  } 

  Rec();

}

void Rec(){
if(accept){
   loadPixels();
  
  movie.addFrame(pixels,width,height) ;
  updatePixels();
} 
}

void keyPressed(){
  if(key==' '){
 if(accept){
  movie.finishMovie(); 
  accept=false;
 }
  }
  if (key==ENTER){
   save("screen.png"); 
    
  }
}






