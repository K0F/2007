//import processing.opengl.*;

Ameba[] a = new Ameba[2];
int bounds = 3; 

void setup(){

  size(200,200,P3D);
  background(0); 
  a[0] = new Ameba(width/2f,height/2f,40f,150,0);
  a[1] = new Ameba(40,40,40f,150,1);
  stroke(a[0].colors[0]);
  fill(a[0].colors[0],45);
  //smooth();
}


void draw(){
  background(0);
  a[0].setPos(mouseX,mouseY);
  a[0].draw();
  a[1].draw();

}

void mousePressed(){
  a[0].reset((int)mouseY); 
  a[0].R=mouseX;
}

void mouseDragged(){
  a[0].reset((int)mouseY); 
  a[0].R=mouseX;
}




