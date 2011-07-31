class Castice{
  float x,y;
  float tx,ty;
  float speed;
  int id;
  float distance = 1;
  float okruh = 50;
  float lastx,lasty;
  
  Castice(float _x,float _y,float _speed,int _id){
    x=_x;
    y=_y;
    id=_id;
    speed=_speed;
    lastx=tx=x;
    lasty=ty=y;

  }

  void compu(){

    for(int i = 0;i < num;i++){   
      distance = dist(x,y,cs[i].x,cs[i].y); 
      if((id!=i)&&(distance<okruh)&&(distance>okruh/20.0f)){
        tx+=(cs[i].x-x)/(distance);
        ty+=(cs[i].y-y)/(distance); 
      }
      
      if((id!=i)&&(distance<okruh/2.0f)){
        tx-=(cs[i].x-x)/(distance);
        ty-=(cs[i].y-y)/(distance);
      }
     

    }

    y += (ty-y)/speed;
    x += (tx-x)/speed;

    bounds2();

    viz();   
    
    lastx=x;
    lasty=y;

  }

  void bounds1(){
    if(x<0){
      x=width;
    }
    if(y<0){
      y=height;
    }
    if(x>width){
      x=0;
    }
    if(y>height){
      y=0;
    } 

  }
  
  void bounds2(){
    if(x<0){
      x=0;
    }
    if(y<0){
      y=0;
    }
    if(x>width){
      x=width;
    }
    if(y>height){
      y=height;
    } 

  } 
    
    
    
  

  void viz(){
    
    stroke(255,45);
    line(x,y,lastx,lasty);
    
  }


}
