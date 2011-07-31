import processing.opengl.*;
int theta;
PImage img,bck;
void setup(){
  img = loadImage("andel.png");
  bck= loadImage("andelbck.png");
 size (bck.width/2,bck.height/2,OPENGL);

 background(0);

  
  noStroke();
  
}

void draw(){
  background(255);
theta++;

  image(bck,0,0,width,height);
 
pushMatrix();
 translate(width/2.0,0);
// rotateY(radians(mouseX/2.0));
 beginShape();
 

texture(img);


 translate(-width/2.0,0,50);
vertex(0,0,0.0,0,0);
vertex(width/2.0,0,0,img.width/2.0,0);
vertex(width,0,0.0,img.width,0);
vertex(width,height/2.0,0,img.width,img.height/2.0);
vertex(width,height,0,img.width,img.height);
vertex(width/2,height,0,img.width/2,img.height);
vertex(0,height,0,img.height);
vertex(0,height/2.0,sin(theta/40.0)*10.0,0,img.height/2.0);

endShape(CLOSE); 
  popMatrix();
  
}

