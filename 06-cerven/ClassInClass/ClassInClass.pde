import processing.opengl.*;


Think[] thinks = new Think[20];
PFont font;

void setup(){
  size(800,600,OPENGL);
  background(255);
   for(int i = 0 ;i<thinks.length;i++){
   thinks[i]=new Think(100,100,i);
   }
   font=loadFont("SwitzerlandLight_CE-12.vlw");
   textFont(font);
}

void draw(){
  background(0);
  
    for(int i = 0 ;i<thinks.length;i++){
   strokeWeight(1);
      thinks[i].run();
  strokeWeight(5);
  stroke(255,0,0,55);
  line(thinks[i].x,thinks[i].y,thinks[constrain(i+1,0,thinks.length-1)].x,thinks[constrain(i+1,0,thinks.length-1)].y);
    }
}



class Think{
  float x,y,x2,y2;
  int id;
  int speed = 50;
   float targetX,targetY;
   float sinPohyb;
  Piece[] pieces = new Piece[(int)random(2,8)]; 


  Think(int _x, int _y,int _id){
    id =_id;
    x=_x;
    y=_y;

    for(int i = 0 ;i<pieces.length;i++){
      pieces[i]=new Piece(i);
    }
    
    speed= int(random(5,10));
    targetX=random(-50,50);
    targetY=random(-50,50);
   
  }

  void run(){
    x2=x;y2=y;
      x+=random(-0.5,0.5);
     y+=random(-0.5,0.5);
     if(id!=0){
    x+=(thinks[constrain(id-1,0,thinks.length-1)].x+targetX-x)/speed;y+=(thinks[constrain(id-1,0,thinks.length-1)].y+targetY-y)/speed;
     }else{
      x+=(mouseX+targetX-x)/speed;y+=(mouseY+targetY-y)/speed;
     }
     line(x2,y2,x,y);
   
   
    for(int i = 0 ;i<pieces.length;i++){
      pieces[i].run(x,y);
      line(pieces[i].x,pieces[i].y,x,y);
    }

  }


}


public class Piece{
  float y,x;
  float speed;
  int id;
  float x2,y2;
  float targetX,targetY;
  MiniPiece[] miniPieces = new MiniPiece[(int)random(2,8)]; 
  float theta;
 float cntr;
  
   Piece(int _id){
    id=_id;
    speed=random(10.01,20.2);
    targetX=random(-80,80);
    targetY=random(-80,80);
    
    for(int i = 0 ;i<miniPieces.length;i++){
      cntr = random(0.0,10.0);
      miniPieces[i]=new MiniPiece(i,cntr);
    }
     cntr = cntr + 0.33;
  }

  void run(float _x,float _y){
    
     cntr+=0.03;
    
    x2=x;
    y2=y;
    x+=random(-1.0,1.0);
     y+=random(-1.0,1.0);
    x+=(_x+targetX-x)/speed;
    y+=(_y+targetY-y)/speed;
    /*x=x%width;
     y=y%height;
    */
   
     stroke(255,(sin(cntr)+1)*88);
    fill(255,(sin(cntr)+1)*88);
    
    theta += (atan2(y2,x2)-atan2(y,x));
    pushMatrix();
    translate(x,y);
    rotate(theta);
    translate(-x,-y);
     for(int i = 0 ;i<miniPieces.length;i++){
      miniPieces[i].run(x,y);
      line(miniPieces[i].x,miniPieces[i].y,x,y);
    }
    popMatrix();
  }


}

public class MiniPiece{
  float y,x;
  float speed;
  int id;
  float x2,y2;
  float targetX,targetY;
  char[] pismeno = new char[4];
  float cntr;
  
  
   MiniPiece(int _id,float _cntr){
    id=_id;
    cntr=_cntr;
    speed=random(3.01,4.2);
    targetX=random(-20,20);
    targetY=random(-20,20);
    
     for(int i = 0;i<3;i++){
   pismeno[i] = char(int(random(255)));
    
    }
  }

  void run(float _x,float _y){
    
    
    cntr+=0.03;
    
    cntr=cntr%100;
    
    x2=x;
    y2=y;
    x+=random(-1.5,1.5);
     y+=random(-1.5,1.5);
    x+=(_x+targetX-x)/speed;
    y+=(_y+targetY-y)/speed;
    /*x=x%width;
     y=y%height;
    */
    stroke(255,(sin(cntr)+1)*88);
    fill(255,(sin(cntr)+1)*88);
   text(pismeno[id/2],x+6,y+6);
    line(x,y,x2,y2); 
  }


}
