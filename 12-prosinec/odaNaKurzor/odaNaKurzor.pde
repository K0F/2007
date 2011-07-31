import processing.opengl.*;

Kur k;//ran
B b;
float theta = PI;

void setup(){
  size(screen.width,screen.height,OPENGL);

  k = new Kur();
  b = new B(80,12,50,#FFCC00);
  //smooth();
  noCursor();  
  rectMode(CENTER);
  noStroke();
}

void draw(){
  /* fill(0,25);
   rect(0,0,width,height);*/
  background(0);
  
  b.net();
  k.rotat();

}


class B{
   int dens;
  float r;
  color c;
  int bordr;
  
  B(int _dens,float _r,int _bordr,color _c){
     dens = _dens;
   r = _r;
   c = _c;
 bordr = _bordr;
    
  }
  
void net(){
 

  
  for(int y = bordr;y<height-bordr;y+=dens){
    for(int x = bordr;x<width-bordr;x+=dens){

      if(over(x,y)){ 
        fill(c,150);
      }else{
        fill(c,50); 
      }
        rect(x,y,r,r);

    }

  }
 
} 




boolean over(int x, int y){
  boolean answer = false;
  
  if((mouseX>x-r/2.0)&&(mouseX<x+r/2.0)&&(mouseY>y-r/2.0)&&(mouseY<y+r/2.0)){
    answer = true;    
  }else{
    answer = false;
  }
  
  return answer;

}
}



class Kur{
  PImage kurzor;
  int cnt;

  Kur(){
    kurzor=loadImage("arrow_l.png");
  }

  void steady(){
    pushMatrix();
    translate(mouseX,mouseY);
    image(kurzor,0,0,kurzor.width/1.5,kurzor.height/1.5);
    popMatrix();

  }

  void rotat(){
    pushMatrix();
    translate(mouseX,mouseY);
    //theta += 0.2*(atan2( mouseY-pmouseY , mouseX-pmouseX )-theta);    
    rotate(cnt++/10.0);
    rotate(theta);
    image(kurzor,0,0,kurzor.width/1.5,kurzor.height/1.5);
    popMatrix();

  }


}
