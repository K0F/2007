import moviemaker.*;

MovieMaker movie;
boolean accept = true;


//stp>>

movie = new MovieMaker(this, width, height, "temp.mov",MovieMaker.JPEG,MovieMaker.HIGH,25) ;


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

