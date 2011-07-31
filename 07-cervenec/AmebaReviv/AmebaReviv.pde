
Ameba a;
int bounds = 10; 

void setup(){

  size(200,200);
  background(0); 
  a = new Ameba(width/2f,height/2f,60f,10);
  stroke(a.colors[0]);
  fill(a.colors[0],25);
  smooth();
}


void draw(){
  background(0);
  a.setPos(mouseX,mouseY);
  a.draw();

}

void mousePressed(){
  a.reset((int)mouseY); 
  a.R=mouseX;
}

void mouseDragged(){
  a.reset((int)mouseY); 
  a.R=mouseX;
}




