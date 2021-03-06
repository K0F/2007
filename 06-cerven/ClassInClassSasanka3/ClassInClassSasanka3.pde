import processing.opengl.*;


Think[] thinks = new Think[15];
PFont font;

void setup(){
  size(800,600,OPENGL);
  background(255);
  cursor(CROSS);
  for(int i = 0 ;i<thinks.length;i++){
    thinks[i]=new Think(width/2,height/2,i);
  }
  font=loadFont("SwitzerlandLight_CE-12.vlw");
  textFont(font);
}

void draw(){
  fade(200);

  for(int i = 0 ;i<thinks.length;i++){
    strokeWeight(1);
    thinks[i].run();
    strokeWeight(5);
    stroke(255,0,0,55);
    line(thinks[i].x,thinks[i].y,thinks[constrain(i+1,0,thinks.length-1)].x,thinks[constrain(i+1,0,thinks.length-1)].y);
  }
}

void fade(int _kolik){
  noStroke();
  fill(0,_kolik);
  rect(0,0,width,height);

}

void mousePressed(){

  for(int i = 0 ;i<thinks.length;i++){
    thinks[i]=new Think(width/2,height/2,i);
  }

}

class Think{
  float x,y,x2,y2;
  int id;
  int speed = 50;
  float targetX,targetY;
  float sinPohyb;
  Piece[] pieces = new Piece[int(random(3,15))]; 


  Think(int _x, int _y,int _id){
    id =_id;
    x=_x;
    y=_y;

    for(int i = 0 ;i<pieces.length;i++){
      pieces[i]=new Piece(i);
    }

    speed= int(random(1.5,9.5));
    targetX=random(-50,50);
    targetY=random(-50,50);

  }

  void run(){
    x2=x;
    y2=y;

    x+=random(-0.5,0.5);
    y+=random(-0.5,0.5);
    if(id!=0){
      x+=(thinks[constrain(id-1,0,thinks.length-1)].x+targetX-x)/speed;
      y+=(thinks[constrain(id-1,0,thinks.length-1)].y+targetY-y)/speed;
      // targetX+=(thinks[constrain(id-1,0,thinks.length-1)].targetX/targetX)/(thinks[constrain(id-1,0,thinks.length-1)].targetX-targetX);
      //targetY+=(thinks[constrain(id-1,0,thinks.length-1)].targetY/targetY)/(thinks[constrain(id-1,0,thinks.length-1)].targetY-targetY);  
    }
    else{

      x+=(mouseX+targetX-x)/speed;
      y+=(mouseY+targetY-y)/speed;
      // y+=(mouseY+targetY-y)/speed;
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
  MiniPiece[] miniPieces = new MiniPiece[int(random(3,15))]; 

  Piece(int _id){
    id=_id;
    speed=random(1.01,3.2);
    targetX=random(-50,50);
    targetY=random(-50,50);
    x=width/2;
    y=height/2;

    for(int i = 0 ;i<miniPieces.length;i++){
      miniPieces[i]=new MiniPiece(i);
    }
  }

  void run(float _x,float _y){
    x2=x;
    y2=y;
    x+=random(-1.0,1.0);
    y+=random(-1.0,1.0);
    x+=(_x+targetX-x)/speed;
    y+=(_y+targetY-y)/speed;
    /*x=x%width;
     y=y%height;
     */
    stroke(255,50);
    line(x,y,x2,y2); 

    for(int i = 0 ;i<miniPieces.length;i++){
      miniPieces[i].run(x,y);
      line(miniPieces[i].x,miniPieces[i].y,x,y);
    }
  }


}

public class MiniPiece{
  float y,x;
  float speed;
  int id;
  float x2,y2,theta;
  float targetX,targetY;
  char[] pismeno = new char[4];
  End[] e = new End[int(random(1,5))]; 
  MiniPiece(int _id){
    id=_id;
    speed=random(3.01,5.2);
    targetX=random(-18,18);
    targetY=random(-18,18);
    x=width/2;
    y=height/2;
    for(int i = 0;i<3;i++){
      pismeno[i] = char(int(random(255)));

    }
    for(int i = 0 ;i<e.length;i++){
      e[i]=new End(i);
    }
  }

  void run(float _x,float _y){

    x2=x;
    y2=y;
    x+=random(-0.5,0.5);
    y+=random(-0.5,0.5);
    x+=(_x+targetX-x)/speed;
    y+=(_y+targetY-y)/speed;
    /*x=x%width;
     y=y%height;
     */
    stroke(255,50);
    fill(255,85);
    // text(pismeno[id/2],x+6,y+6);
    line(x,y,x2,y2);
    for(int i = 0 ;i<e.length;i++){
      e[i].run(x,y);
      line(e[i].x,e[i].y,x,y);
    }
  }


}

public class End{
  float y,x;
  float speed;
  int id;
  float x2,y2;
  float targetX,targetY;


  End(int _id){
    id=_id;
    speed=random(1.01,2.2);
    targetX=random(-10,10);
    targetY=random(-10,10);
    x=width/2;
    y=height/2;


  }

  void run(float _x,float _y){
    x2=x;
    y2=y;
    x+=random(-0.1,0.1);
    y+=random(-0.1,0.1);
    x+=(_x+targetX-x)/speed;
    y+=(_y+targetY-y)/speed;
    /*x=x%width;
     y=y%height;
     */
    stroke(255,50);
    line(x,y,x2,y2); 


  }


}
