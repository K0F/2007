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
    
   /* 
    r= red(img[constrain(int(y)*m.width()+int(x),0,img.length-1)]);
     g= green(img[constrain(int(y)*m.width()+int(x),0,img.length-1)]);
     b= blue(img[constrain(int(y)*m.width()+int(x),0,img.length-1)]);
     */

    x=mouseX+id2;
    y=mouseY+id;
    noStroke();
    fill(av,165);
    //noFill();
    rect(map(id2,0,len,0,width),map(id,0,numero,0,height),width/(len-1),height/(numero-1));




  }
}
