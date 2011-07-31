
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
   int QID = int(random(1000));
   x +=abs(x-a[QID].x)/(mouseX+1f);
   y += abs(y-a[QID].x)/(mouseY+1f);
    if (x > width){x=0;}else if(x<0){x =0;}
     if (y > height){y=0;}else if(y<0){y =0;}
   
    rect(x,y,1,1);
    
  }
  
}
  
