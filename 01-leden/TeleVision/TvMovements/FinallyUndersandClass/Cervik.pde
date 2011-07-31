public class Cervik { 
  float xpos, ypos, speedx,col,speedy,iq;
 
  public Cervik (float x,float y,float c,int id) {  
    ypos = y; 
    xpos = x;
    col = c;
    iq = id;
  } 
  public void update() { 
    //---------------------------->> X
    xpos += speedx;
    if(this.xpos>r[int(random(3000))].xpos){this.speedx-=(.01);}else if(this.xpos<r[int(random(3000))].xpos){this.speedx+=(.01);}
    if(xpos<0){xpos=0;speedx=speedx*(-1);}else if(xpos>width){xpos=width;speedx=speedx*(-1);}
    //---------------------------->> Y
    ypos += speedy; 
    if(this.ypos>r[int(random(3000))].ypos){this.speedy-=(0.01);}else if(this.ypos<r[int(random(3000))].ypos){this.speedy+=(0.01);}
    if(this.ypos<0){ypos=0;speedy=speedy*(-1);}else if(ypos>height){ypos=height;speedy=speedy*(-1);}
    //---------------------------->> React
    noStroke();
    fill(col,abs(speedx-speedy)+70);
    rect(xpos, ypos, 2, 2);
  
  
  } 
  
  void speedA(){
    xpos= random(0,width);
    ypos= random(0,height);
    speedx = 0;//random(-10.0,10.0);
    speedy = 0;//random(-10.0,10.0);
  }
  public void kof(){
   xpos += speedx;
   ypos += speedy;
   
   if (col>0){
   speedx = random(-1.0,1.1);
   speedy = random(-1.0,1.1);
   }else{
   speedx = random(-1.1,1.0);
   speedy = random(-1.1,1.0);
   }
   noStroke();
   fill(col);
    rect(xpos, ypos, 2, 2);
   if(xpos>width){xpos=width; speedx=speedx*(-0.8);}else if(xpos<0){xpos=0; speedx=speedx*(-0.8);}
  if(ypos>height){ypos=height; speedy=speedy*(-0.8);}else if(ypos<0){ypos=0; speedy=speedy*(-0.8);}
  }
  
}
