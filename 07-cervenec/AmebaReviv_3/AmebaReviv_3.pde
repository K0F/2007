import processing.opengl.*;

Ameba[] a = new Ameba[2];
int bounds = 3; 

void setup(){

  size(400,400,OPENGL);
  background(0); 
  a[0] = new Ameba(width/2f,height/2f,40f,150,0);
  a[1] = new Ameba(width/2f,height/2f,40f,150,1);
  stroke(a[0].colors[0],180);
  fill(a[0].colors[0],95);
  cursor(CROSS);
  print(CROSS);
  
  //smooth();
}


void draw(){
  fade(0,35);
  a[0].setPos(mouseX,mouseY);
  a[0].draw();
  a[1].draw();

}

void fade(color _c,int _kolik){
 fill(_c,_kolik);
  rect(0,0,width,height); 
}

void mousePressed(){
  a[0].reset((int)mouseY); 
  a[0].R=mouseX;
}

void mouseDragged(){
  a[0].reset((int)mouseY); 
  a[0].R=mouseX;
}




