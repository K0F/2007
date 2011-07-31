import processing.core.*;
import fullscreen.*;
import processing.opengl.*;


Boid b[] = new Boid[8500];
FullScreen fs;


void setup(){
  size(screen.width,screen.height,OPENGL);
  background(0) ;

  fs = new FullScreen(this);
  fs.setResolution(screen.width,screen.height);
  fs.allowKeys();
  fs.enter();

  for(int i = 0;i<b.length;i++){
    b[i] = new Boid(width/2,height/2,random(1.00050,1.100),1.0,i);
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
    stroke(lerpColor(#FFFFFF,color(map(dist(b[i].x,b[i].y,b[i-1].x,b[i-1].y),0.0,80.0,0.0,255.0),55,0),map(i,0,b.length,0.0,1.0)),random(random(0,1),random(1,5)));
    line(b[i].x,b[i].y,b[i-1].x,b[i-1].y);
    b[i].goTo(b[i-1].x,b[i-1].y);
  }


}

void mousePressed(){

   for(int i = 1;i<b.length;i++){
    
    b[i].tx=b[i].x=mouseX;
    b[i].ty=b[i].y=mouseY;
  
  }
   background(0); 
}

void keyPressed(){
 if(key == ' '){
  save("screen.png");
 } 
  
}

public class Boid{

  float x,y;
  float tx,ty;
  float speed = 20.0;
  int id;
  float acc = 1;
  float tras = 1.1;

  Boid(){ 
    ; 
  }

  Boid(float _x,float _y,float _speed,float _tras,int _id){
    x=_x;
    y=_y;
    id=_id;
    speed=_speed;
    tras=_tras;
  }

  void goTo(float _x,float _y){
    tx+=(_x-tx+random(-tras,tras))/speed; 
    ty+=(_y-ty+random(-tras,tras))/speed; 

    acc=(constrain(dist(_x,_y,x,y),1.1,200.0)-acc);

    x+=(tx-x)/speed;
    y+=(ty-y)/speed;


  }
}

