import processing.opengl.*;

Amoeba[] am = new Amoeba[10];


void setup(){
  size(400,400,OPENGL);
  background(0);
  frameRate(30);
  smooth();

  for(int i = 0;i<am.length;i++){
    am[i]= new Amoeba(random(width),random(height),i);
  }

}

void draw(){

  background(0);
  beginShape();

  for(int i = 0;i<am.length;i++){
    am[i].run(); 
    vertex(am[i].x,am[i].y);

  }
  endShape(CLOSE);

  if(frameCount%25==0){
    for(int i = 0;i<am.length;i++){
      am[i].rerand(); 


    }
  }
}

void mouseReleased(){
  for(int i = 0;i<am.length;i++){
    am[i].rerand();
  } 

}

class Amoeba{
  float radius,targetR;
  float x, x2;
  float y, y2;
  int noSeg = 4,id;
  float speed = 40.0;
  float errX,errY;

  Amoeba(float _x,float _y,int _id){
    id =_id;
    x=_x;
    y=_y;

    rerand();
  }

  void run(){
    move();
  }

  void move(){

    radius += (targetR-radius)/speed;

    stroke(255);
    noFill();

    x+=(mouseX+errX-x)/speed;
    y+=(mouseY+errY-y)/speed;

    for(int i = 0;i<am.length;i++){
      if(i!=id){
        if(((am[i].radius/2)+radius)>dist(am[i].x,am[i].y,x,y)){
          x+=(y-am[i].x)/constrain((dist(am[i].x,am[i].y,x,y)*speed*0.00133*radius),speed+1,speed*10.5); 
          y+=(y-am[i].y)/constrain((dist(am[i].x,am[i].y,x,y)*speed*0.00133*radius),speed+1,speed*10.5); 
        }

      }      

    }


    line(x,y,x2,y2);

    ellipse(x,y,radius,radius);

    x2=x;
    y2=y;
  }

  void rerand(){
    errX =random(-80,80);
    errY =random(-80,80);
    speed=random(5,20);
    targetR=random(10,60);

  }





}
