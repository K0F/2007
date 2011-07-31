import moviemaker.*;

MovieMaker movie;
boolean accept = true;
String pismeno = "";
char c;

void setup(){
 size(320,240); 
 background(0);
 frameRate(50);
 textFont(loadFont("Dialog.plain-96.vlw"));
 
 movie = new MovieMaker(this, width, height, "temp.mov",MovieMaker.JPEG,MovieMaker.HIGH,25) ;
  
  fill(255);
}

void draw(){
  c = parseChar((int)(frameCount/5.0)%400);
  
  background(0);
  text(c,width/2-25,height/2);
  
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
 if(accept){
  movie.finishMovie(); 
  accept=false;
 }
}
