class SuperCudlik{
  
  String name;
  float startX,startY;
  float x,y;
  float modY = 300;
  int numPodCudliku;
  int id;
  boolean rozbaleno = false;
 
  
  SuperCudlik(String _name, float _x, float _y,int _id){
    name=_name;
    startX=_x;
    startY=_y;
    id=_id;
    x=startX;
    y=startY;
       
  }
  
  void run(){
    rozbaleni();
  
    viz();    
      
  }
  
  void viz(){
    stroke(#CCCCCC,55);    
    fill(#CCCCCC);
    textFont(font);
    text(name,x,y);
    line(x,y-13,width-20,y-13);
  }
  
  void rozbaleni(){
     rozbaleno=false;
   while((abs(mouseY-y+5)<14)&&(!rozbaleno)){
      rozbaleno=true;
     
    }
   
  /*  if ((abs(mouseY-y+5)<14)&&(rozbaleno)){
    rozbaleno=false; 
     
  }*/
 
   posun();
  

   
  }
  
  void posun(){
     int ktera=10;
  for(int i = 0;i<5;i++){
   if(button[i].rozbaleno){
   ktera = i;
   }
   
   if(ktera < id){
    y=startY+modY; 
   } else  if(ktera > id){
  y=startY;
}
  }
  
  
  }  
  
  
 
}
