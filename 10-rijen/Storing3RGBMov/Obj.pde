/**stroing object on free space*/
//-------------------------->
class Obj{
  float x,y;
  float tx,ty;
  int id;
  float tol = 30;
  float radius = 20;
  float distance;
  float speed = 40;
  float koef;
  color[] rgb = {#FF0000,#00FF00,#0000FF};
  color base = color(0);
  
  //--------------------------> konstruktor
  Obj(float _x,float _y,float _koef,float _radius,color _base,int _id){
    id=_id;
    koef=_koef;
    radius = _radius;
    tx=x=_x;
    ty=y=_y;
    base=_base;
  }
//--------------------------> hlavni smycka!
  void run(){
    compute();
    drw(base,35);
    border();
  }
//-------------------------->
  void reset(){
  ;
  }
//-------------------------->
  void compute(){
   //   radius+=0.01;
    for(int i = 0;i<obj.length;i++){
      distance = dist(x,y,obj[i].x,obj[i].y);
      distance = constrain(distance,1.1,sq(width));
      if((i!=id)&&(distance<tol)&&(distance>radius)) {
        tx += (obj[i].x-tx)/(distance*map(radius,0,50,5,1));
        ty += (obj[i].y-ty)/(distance*map(radius,0,50,5,1));  
      }
      if((i!=id)&&(distance<radius)){
        lin(i,id);
        drw(#000000,15);
        tx -= (obj[i].x-x)/koef;
        ty -= (obj[i].y-y)/koef;
      }
    }
    x+=(tx-x)/speed;
    y+=(ty-y)/speed;
  } 
  
  void drw(color s, int f){
    if((id==obj.length-1)||(id==obj.length-2)||(id==obj.length-3)){
   
      int idnt = (id-obj.length+3);     
      
      switch(idnt){
      case 2:
      stroke(rgb[0],f);
      fill(rgb[0],85);
      text("red",x,y);
      break;
      case 1:
      stroke(rgb[1],f);
      fill(rgb[1],85);
      text("green",x,y);
      break;
      case 0:
      stroke(rgb[2],f);
      fill(rgb[2],85);
      text("blue",x,y);
      break;
      }
      
    }else{
    stroke(s,f);
    }
    
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
    strokeWeight(radius/2.0);
    stroke(#000000,5);
    line(obj[I].x,obj[I].y,obj[II].x,obj[II].y);        
    strokeWeight(1);
    stroke(#FFFFFF,50);
    noFill();
    line(obj[I].x,obj[I].y,obj[II].x,obj[II].y);    
  }
}

