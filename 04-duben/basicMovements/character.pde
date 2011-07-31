class CHARACTER {
  float x;
  float y;
  float speedX,speedY;


  float direction;

  CHARACTER(){
    x =random(width);
    y = height-10; 
    speedX=0;
    speedY=0;
  }


  void moveKey(){
    if(keyPressed){

      if(keyCode==LEFT){
        speedX-=1;
      }
      if(keyCode==RIGHT){
        speedX+=1;
      }
      if(keyCode==UP){
             
        if(charac.y+5==gr.y1){
          speedY-=8.5;
        }
      

      }
      if(keyCode==DOWN){
        ;
      }


    }
    
    //---------------------->skok
      if(charac.y+5<gr.y1){

          speedY+=0.6;
        }
     if(charac.y+5>gr.y1){
          y=gr.y1-5;
          speedY=0;
        }
        //---------------------------**
        
        
        
  } 

  void movePhy(){
    if(charac.y+5<gr.y1){
      speedY+=0.2; 

    }
    x+=speedX/10.0;
    y+=speedY/10.0;
    //------------------bounds
    speedX=constrain(speedX,-20.0,20.0);
    if(x>width-5){x=width-5;speedX*=-0.2;}
     if(x<5){x=5;speedX*=-0.2;}
   //---------------------------redardation
 
   

  }

  void drawMe(){
    rectMode(CENTER);
    fill(0);
    noStroke();
    rect((int)x,(int)y,5,10);

  }



}//end Class

