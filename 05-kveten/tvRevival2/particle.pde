class Particle{
  float r,g,b;
  float av,yLim,speedY,speedX=1;
  int poss,id;
  float Y; 
  float x,y;
  
  Particle(int _id){
    id=_id;
    y=id;
  }



  void vidko(int[] img) {
 x=x%width;
  
    av = brightness(img[constrain(int(y)*m.width()+int(x),0,img.length-1)]);
    
    
    r= red(img[constrain(int(y)*m.width()+int(x),0,img.length-1)]);
     g= green(img[constrain(int(y)*m.width()+int(x),0,img.length-1)]);
     b= blue(img[constrain(int(y)*m.width()+int(x),0,img.length-1)]);
     

    x+=speedX;

    stroke(r,g,b);
    noFill();
    line((x),id,(x)-1,id);




  }
}
