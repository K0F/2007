class Particle{
  float r,g,b;
  float av,yLim,speedY,speedX=1;
  int poss,id;
  float Y; 
  float x=1,y;
  
  Particle(int _id){
    id=_id;
    y=id;
  }



  void vidko(int[] img) {
  if(x<0){x=0;}
  if(y<0){y=0;}
  if(y>height){y=height;}
  x=x%width;

  /*  
  y=y%height;*/
  
  
    av = brightness(img[constrain(int(y)*width+int(x),0,img.length-1)]);
    
    
    r= red(img[constrain(int(y)*width+int(x),0,img.length-1)]);
     g= green(img[constrain(int(y)*width+int(x),0,img.length-1)]);
     b= blue(img[constrain(int(y)*width+int(x),0,img.length-1)]);
     

    

    yLim=av/5;
    speedY = ((av)-128.0)/400.0;
   
   
    y += speedY;
    if(Y>id){
      speedY-=abs(id-speedY)*(0.1);
    }
    else if(Y<id){
      speedY+=abs(id-speedY)*(0.1);
    }
    
   
    x+=speedX;

    stroke(r,g,b);
    noFill();
    line((x),y,(x),y-1);




  }
}
