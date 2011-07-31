class Panacek{
  int x,y,sx,sy;
  float smoothY,smoothX;
  float posun = 0.3;
 int speed = 1;
   
  int faze; 
  int ktera = faze;
  
  color col;
  
  int id;

  Panacek(int _id){
    
    id=_id;
    
    faze = (int)random(4);
    faze = faze%(man.length-1);
    ktera = faze;
    
    speed=constrain((int)(2.5/posun),1,10000);
    
    //col = color(random(200,255),random(200,255),random(200,255));    
    smoothX=sx=x=(int)(random(-man[0].width/2.0f,width-man[0].width/2.0f));
    smoothY=sy=y=id-height-man[0].height;//(id-((int)map(id,0,p.length-1,man[0].height,height)));
    
  }

  void run(){
    compute();
    chuze(); 
  }


  void compute(){
    smoothY+=posun;
    
    y=(int)smoothY;
    
   // smoothX+=random(-0.1,0.1);
    
    //x=(int)smoothX;
    
    if(y>height+id+man[0].height){
      smoothY=y=sy;
      smoothX=sx=x=(int)(random(-man[0].width/2.0f,width-man[0].width/2.0f));
    }
    
  }

    
  void chuze(){
    if(frameCount%speed==0){
    ktera++;
    }
    ktera = ktera%(man.length-1);
   
    if(col!=0){
    tint(col);
    image(man[ktera],x,y);
    noTint();
    }else{
       image(man[ktera],x,y);
    }
    
    
  }
  
  void stat(){
    
    
  }





}
