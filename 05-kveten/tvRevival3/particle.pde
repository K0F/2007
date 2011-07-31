class Particle{
  float r,g,b;
  float av,yLim,speedY,speedX=1;
  int poss,id,id2;
  float Y; 
  float x,y;
  
  Particle(int _id,int _id2){
    id=_id;
    id2=_id2;
    y=id;
x=id2;  
}



  void vidko(int[] img) {
   x=(x)%width;
  
    av = brightness(img[constrain(int(y)*m.width()+int(x),0,img.length-1)]);
    
    
    r= red(img[constrain(int(y)*m.width()+int(x),0,img.length-1)]);
     g= green(img[constrain(int(y)*m.width()+int(x),0,img.length-1)]);
     b= blue(img[constrain(int(y)*m.width()+int(x),0,img.length-1)]);
     

    x+=speedX;

    stroke(r,g,b,(sin(map(id2,0.0,len,-0.5,0.5)))*255.0);
    noFill();
    line((x),id,(x)-1,id);




  }
}
