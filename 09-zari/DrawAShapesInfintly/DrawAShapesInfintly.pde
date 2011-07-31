import processing.opengl.*;


Boid b[] = new Boid[500];

void setup(){
  size(400,400,OPENGL);
  background(0) ;

  for(int i = 0;i<b.length;i++){
    b[i] = new Boid(width/2,height/2,1.1,i);
  }

 
  cursor(CROSS);
  //smooth();
 stroke(255,2);

}

void draw(){
 /* fill(0,5);
  rect(-2,-2,width+4,height+4); */
 
  b[0].goTo(mouseX,mouseY);

  for(int i = 1;i<b.length;i++){
    stroke(lerpColor(#FFFFFF,#FFCC00,map(i,0,b.length,0.0,1.0)),2);
    line(b[i].x,b[i].y,b[i-1].x,b[i-1].y);
    b[i].goTo(b[i-1].x,b[i-1].y);
  }


}

void mousePressed(){
 background(0); 
  
}

void mouseDragged(){
 background(0); 
  
}

public class Boid{

  float x,y;
  float tx,ty;
  float speed = 20.0;
  int id;
  float acc = 1;

  Boid(){ 
    ; 
  }

  Boid(float _x,float _y,float _speed,int _id){
    x=_x;
    y=_y;
    id=_id;
    speed=_speed;
  }

  void goTo(float _x,float _y){
    tx+=(_x-tx)/speed; 
    ty+=(_y-ty)/speed; 

    acc=(constrain(dist(_x,_y,x,y),1.1,200.0)-acc);

    x+=(tx-x)/speed;
    y+=(ty-y)/speed;


  }
}

