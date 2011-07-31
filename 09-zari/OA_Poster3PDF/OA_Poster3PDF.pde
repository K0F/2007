import processing.pdf.*;
import processing.opengl.*;

float x,y;
float bright = 50.0;
PImage g;
boolean record = false;

void setup(){   
  g = loadImage("pAK022.png");//pAK022.png");
  println(g.width+" "+g.height);
  size(g.width,g.height);
  beginRecord(PDF, "everything.pdf");

  stroke(#FFCC00,155);
  noFill();
  smooth();
  strokeWeight(1);
}

void draw(){
   
  for(int Y = 0;Y<height;Y+=3){
    
    beginShape();
    
    for(int X = 0;X<width;X+=1){
     // int id = (int)map(Y*g.width+X,0,g.width*g.height+g.width,0,width*height+width);
     int id = Y*width+X;
      //stroke(color(g.pixels[id]),15);
    //  strokeWeight(map(brightness(color(g.pixels[id])),0,255,0,5.0));
      vertex(X,Y-(map(brightness(color(g.pixels[id])),0,255,0,bright)));

    } 
    endShape();
    
  } 
  
 

println("Finished.");
 endRecord();
    exit();

}


void fade(int kolik){
 noStroke();
   fill(0,kolik);
   rect(0,0,width,height);
  noFill();
  stroke(255,5); 
  
}
