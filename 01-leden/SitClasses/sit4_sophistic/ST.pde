
class ST {
 float x;
 float y;
 int xx,yy;
 int QID;
 ST(int X,int Y){
  x =X;
   y =Y; 
xx = X;
yy = Y;
  }
  
  
  void drawMe(int dimension){
   QID = int(dist(x,y,a[int(yy*width+xx)].x,a[int(yy*width+xx)].y));
   float dis = 400000/(dist(x,y,mouseX,mouseY)+1f);
   x +=(random(random(-(QID-PI)*100.0,(QID+PI)*100.0),random(-(QID-PI)*100.0,(QID+PI)*100.0)))/(dis+1f);
   y +=(random(random(-(QID-PI)*100.0,(QID+PI)*100.0),random(-(QID-PI)*100.0,(QID+PI)*100.0)))/(dis+1f);
    if (x > xx+15){x=xx;}else if(x<xx-15){x=xx;}
     if (y > yy+15){y=yy;}else if(y<yy-15){y =yy;}
   
    rect(x,y,dimension,dimension);
    
  }
  void reset(){
   x=xx;
  y=yy; 
  }
  
}
  
