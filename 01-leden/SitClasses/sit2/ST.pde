
class ST {
 float x;
 float y;
 
 ST(){
  x =random(width);
   y = random(height); 
  
  }
  
  
 
    
  
  void drawMe(int h,int roz,int shift1,int shift2){
   
   x +=h/100.0;
  
    if (x > width){x=0;}else if(x<0){x =0;}
      fill(0);
      noStroke();
   for(int q = 0 ;q<400;q+=constrain(roz,1,width)){
     float XX = (x+q)%(width+20);
    rect(XX+(width/roz),0+shift1,(width/80)%roz,shift2);
     }
   }
  
  
}
  
