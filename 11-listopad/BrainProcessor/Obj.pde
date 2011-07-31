/**stroing neuroect on free space*/

class Neuron{
  float x,y;
  float tx,ty;
  int id;
  float tol = 30;
  float radius = 7;
  float distance;
  float speed = 40;
  float koef;
  float koefDet = 30;
  float border = 80.0f;
  
  
  Neuron(float _x,float _y,float _koef,float _br,float _radius,int _id){
    id=_id;
    koef=_koef;
    tx=x=_x;
    ty=y=_y;
    border=_br;
    radius = _radius;
  }

  void run(){
       
    if(id==0){fade(0,55);}
    compute();
    drw(#FFCC00,#000000);
    border(80.0);
    
    
  }

  void reset(){
 
  }


  void compute(){
   //   radius+=0.01;
      
    for(int i = 0;i<neuro.length;i++){
      distance = dist(x,y,neuro[i].x,neuro[i].y);
      distance = constrain(distance,1.1,sq(width));
      if((i!=id)&&(distance<tol)&&(distance>radius)) {
        tx += (neuro[i].x-tx)/(distance*koefDet);
        ty += (neuro[i].y-ty)/(distance*koefDet);  
      }
      if((i!=id)&&(distance<radius)){
        lin(i,id);
        drw(#FFFFFF,0);
        tx -= (neuro[i].x-x)/koef;
        ty -= (neuro[i].y-y)/koef;
      }

    }

    x+=(tx-x)/speed;
    y+=(ty-y)/speed;
  } 

  void drw(color s, color f){
    if(id==33){
      stroke(#FFFFFF,45);
    }else{
    stroke(s,25);
    }
    noFill();
    ellipse(x,y,radius,radius) ;
  }
  
  void border(float kolik){
   if(x<kolik+radius/2){x=kolik+radius/2;}
  if(x>width-kolik-radius/2){x=width-kolik-radius/2;} 
    if(y<kolik+radius/2){y=kolik+radius/2;}
    if(y>height-kolik-radius/2){y=height-kolik-radius/2;}
  }
  
  void lin(int I,int II){
     stroke(#FFFFFF,85);
    line(neuro[I].x,neuro[I].y,neuro[II].x,neuro[II].y);
     stroke(#FFFFFF,25);
     line(x,25,x,35);
    line(25,y,35,y);
    pushMatrix();
    translate(-bMin,-bMin);
    scale(0.75);
    line(x,y,x+1,y);
    popMatrix();
  }


}
