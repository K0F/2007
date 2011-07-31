
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
   int QID = int(dist(x,y,a[int(mouseX)*(numO/width)].x,a[int(mouseY)*(numO/height)].y));
   float dis = 40000/(dist(x,y,mouseX,mouseY)+1f);
   x +=(x-a[QID].x)/(dis+1f);
   y += (y-a[QID].y)/(dis+1f);
    if (x > width){x=xx;}else if(x<0){x=xx;}
     if (y > height){y=yy;}else if(y<0){y =yy;}
   
    rect(x,y,dimension,dimension);
    
  }
  
}
  
