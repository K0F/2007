import processing.opengl.*;


Frame f;
int x,y;
void setup(){
  size(400,400,OPENGL);
 f = new Frame(10,10);
  x = y = 0;
}

void draw(){
  background(255);
  f.drw(x,y);



}

void mousePressed(){
 x=mouseX;
 y=mouseY; 
  
}

void mouseDragged(){
 x=mouseX;
 y=mouseY; 
  
}

class Frame{
  int x, y;
  PImage testFram,krizek;

  Frame(int _x,int _y){
    x=_x;
    y=_y;
     testFram= loadImage("TestFrame.png"); 
  krizek = loadImage("krizek.png");
  }

  void drw(int _x,int _y){
    pushMatrix();
    translate(_x,_y);
    image(testFram,0,0);
    pushMatrix();
   translate(82,10); 
    image(krizek,0,0);
    popMatrix(); 
    popMatrix();
  }



}
