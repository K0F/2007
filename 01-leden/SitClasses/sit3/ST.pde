
class ST {
 float x;
 float y;
 int ID;
 ST(int id){
  x =random(width);
   y = random(height); 
  ID = id;
  }
  
  
  void drawMe(){
   int QID = int(dist(x,y,a[int(x)*25].x,a[int(y)*25].y));
   x +=(x-a[QID].x)/(mouseX+1f);
   y += (y-a[QID].y)/(mouseY+1f);
    if (x > width){x=random(width);}else if(x<0){x=random(width);}
     if (y > height){y=random(height);}else if(y<0){y =random(height);}
   
    rect(x,y,1,1);
    
  }
  
}
  
