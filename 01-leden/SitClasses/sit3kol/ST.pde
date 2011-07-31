
class ST {
 float x;
 float y;
 int ID;
 ST(int id){
  x =random(width);
   y =random(height); 
  ID = id;
  }
  
  
  void drawMe(int dimension){
   int QID = int(dist(x,y,a[int(mouseX)*24].x,a[int(mouseY)*25].y));
   float dis = 40000/dist(x,y,mouseX,mouseY);
   x +=(x-a[QID].x)/(dis+1f);
   y += (y-a[QID].y)/(dis+1f);
    if (x > width){x=random(width);}else if(x<0){x=random(width);}
     if (y > height){y=random(height);}else if(y<0){y =random(height);}
   
    rect(x,y,dimension,dimension);
    
  }
  
}
  
