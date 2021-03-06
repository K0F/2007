/**stroing object on free space*/

class Obj{
  float x,y;
  float tx,ty;
  int id;
  float tol = 30;
  float radius = 20;
  float distance;
  float speed = 30;
  float koef;
  
  Obj(float _x,float _y,float _koef,int _id){
    id=_id;
    koef=_koef;
    tx=x=_x;
    ty=y=_y;
  }

  void run(){
    compute();
    drw(#FFCC00,#000000);
    border();
  }

  void reset(){
 
  }


  void compute(){
   //   radius+=0.01;
      
    for(int i = 0;i<obj.length;i++){
      distance = dist(x,y,obj[i].x,obj[i].y);
      distance = constrain(distance,1.1,sq(width));
      if((i!=id)&&(distance<tol)&&(distance>radius)) {
        tx += (obj[i].x-tx)/distance;
        ty += (obj[i].y-ty)/distance;  
      }
      if((i!=id)&&(distance<radius)){
        lin(i,id);
        drw(#CCFF00,0);
        tx -= (obj[i].x-x)/koef;
        ty -= (obj[i].y-y)/koef;
      }

    }

    x+=(tx-x)/speed;
    y+=(ty-y)/speed;
  } 

  void drw(color s, color f){
    stroke(s,25);
    noFill();
    ellipse(x,y,radius,radius) ;
  }
  
  void border(){
   if(x<radius/2){x=radius/2;}
  if(x>width-radius/2){x=width-radius/2;} 
    if(y<radius/2){y=radius/2;}
    if(y>height-radius/2){y=height-radius/2;}
  }
  
  void lin(int I,int II){
     stroke(#FFCC00,15);
    line(obj[I].x,obj[I].y,obj[II].x,obj[II].y);
    
  }


}
