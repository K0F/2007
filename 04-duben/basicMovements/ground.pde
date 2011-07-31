class GROUND {
  float x1,x2,y1,y2;
  
  GROUND(float oneX,float oneY,float twoX,float twoY){
    x1 =oneX;
    y1 =oneY;
    x2 = twoX;
    y2 = twoY;
    
    
  }
  
  
  

  void drawMe(){
    
    stroke(0);
    line(x1,y1,x2,y2);

  }



}//end Class

