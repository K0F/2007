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
  
  Obj(float _x,float _y,float _koef,float _speed,int _id){
    id=_id;
    koef=_koef;
    speed=_speed;
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
      
      
    for(int i = 0;i<obj.length;i++){
      distance = dist(x,y,obj[i].x,obj[i].y);
      distance = constrain(distance,1.1,sq(width));
      if((i!=id)&&(distance<tol)&&(distance>radius)) {
        tx += (obj[i].x-tx)/distance;
        ty += (obj[i].y-ty)/distance;  
        radius+=1;
      }
      if((i!=id)&&(distance<radius)){
        lin(i,id);
        tx -= (obj[i].x-x)/koef;
        ty -= (obj[i].y-y)/koef;
        radius-=1;
      }

    }
    //  tol += ((radius*1.5)-tol)/100; //soo rapid
   /* tol += (radius-tol)/speed;
    tol+=0.09;*/ //divnost
    tol = radius+5;
    
    x+=(tx-x)/speed;
    y+=(ty-y)/speed;
  } 

  void drw(color s, color f){
    //lerpColor(s,#FFFFFF,map(distance,0,80,0.0,1.0)) coloring
    stroke(s,25);
    //noFill();//(f,10);
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
