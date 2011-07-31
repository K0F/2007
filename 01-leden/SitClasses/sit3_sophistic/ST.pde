
class ST {
 float x;
 float y;
 int xx,yy;
 ST(int X,int Y){
  x =X;
   y =Y; 
xx = X;
yy = Y;
  }
  
  
  void drawMe(int dimension){
   int QID = int(dist(x,y,a[int(yy*width+xx)].x,a[int(yy*width+xx)].y));
   float dis = 40000/(dist(x,y,mouseX,mouseY)+1f);
   x +=(random(-(QID-PI)*5,(QID+PI)*5))/(dis+1f);
   y += (random(-(QID-PI)*5,(QID+PI)*5))/(dis+1f);
    if (x > xx+10){x=xx;}else if(x<xx-10){x=xx;}
     if (y > yy+10){y=yy;}else if(y<yy-10){y =yy;}
   
    rect(x,y,dimension,dimension);
    
  }
  
}
  
