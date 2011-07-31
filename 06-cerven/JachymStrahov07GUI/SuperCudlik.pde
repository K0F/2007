class SuperCudlik{
   
  String name;
  float startX,startY;
  float x,y;
  int numZalozek;
  int id;
   boolean rozbaleno = false;
   
  int alph = 55;
  int superAlph = 255; 
  float target,targetTxtX,txtX;
  float speed = 10.0;
  int ktery=1,posledni;
  Zalozka[] zalozka = new Zalozka[5];
  
  SuperCudlik(String _name, float _x, float _y,int _id,int _numZalozek){
    name=_name;
    startX=_x;
    startY=_y;
    id=_id;
    x=startX;
    y=startY;
    numZalozek = _numZalozek;
    target=startY;
    targetTxtX = 0;
     for(int i = 0;i<zalozka.length;i++){
      zalozka[i] = new Zalozka(i,id,numZalozek);
    }
    
    reset();
  }
  
  
 
  void run(){
 
    viz();
    customize();    
  
  }
  
  void viz(){
    noStroke();
  superAlph = int(map(y-startY,300,0,10,255));
    fill(#272727);
    
    tint(0,alph);
    image(shade,x,y-23,width-40,10);
    noTint();
    
    rect(x,y-13,width-20-20,height);
    
    
     if(rozbaleno){
       alph=200;
    fill(#3399CC,alph);
   targetTxtX=15;
    }else{alph=55; fill(#CCCCCC,alph); targetTxtX = 0;}
    stroke(#FFFFFF,map(alph,0,255,0,55));    
   
   txtX += (targetTxtX-txtX)/speed*2;
  
  //pixelAccurate
      if(abs(txtX-targetTxtX)<2.0){txtX=ceil(txtX);}
      if(abs(target-y)<2.0) {y=ceil(y);} 
    
    textFont(font);
    text(name,x+5+txtX,y);
    line(x,y-13,width-20,y-13);
    noFill();
    
       if((abs(txtX-targetTxtX)<5.0)&&(txtX>5.0)){
         tint(255,map((5.0-abs(txtX-targetTxtX)),0.0,5.0,0.0,alph));
    image(sipkaActive,x+3,y-8) ;
    noTint();
   }
  }
  
  void customize(){
    tint(255,superAlph);
    switch(id){
      case 0:prvni(numZalozek);
      break; 
      case 1:druhy(numZalozek);
      break;
      case 2:treti(numZalozek);
      break;
      case 3:ctvrty(numZalozek);
      break; 
       case 4:paty(numZalozek);
      break;       
    }
    noTint();
    
  }
  
  void prvni(int _kk){ //autor
   
    pushMatrix();
    // line(map(mouseX,0,width,51+20,width-20-10),y+10,map(mouseX,0,width,51+20,width-20-10),y+10+280);
    translate(x+51,y+10);
  
    
   image(bio,0,0);
    rect(0,0,700,280);
    
     for(int i =0;i<_kk;i++){
    zalozka[i].run(i,x+51,y+10);
    }
     
    popMatrix();
    
  }
  
  void druhy(int _kk){ // strecha
    pushMatrix();
    translate(x+51,y+10);
    image(strecha[posledni],0,0);
   
    rect(0,0,700,280);
    
     for(int i =0;i<_kk;i++){
    zalozka[i].run(i,x+51,y+10);
    }
      
    
    popMatrix();
  }
  
  void treti(int _kk){ // tribuna
    pushMatrix();
    translate(x+51,y+10);
    image(tribuna[posledni],0,0);
    rect(0,0,700,280);
    
     for(int i =0;i<_kk;i++){
    zalozka[i].run(i,x+51,y+10);
    }
    
    popMatrix();
  } 
  
  void ctvrty(int _kk){ // rotopanoramatikon
    pushMatrix();
    translate(x+51,y+10);
      
    if ( rotonFrame != null ) {
      image( rotonFrame, 100,0,500,280);
  }
  
   textFont(sys);
   text((round(10*(map(rotonRot,0.0,2.0,-180,180)))/10.0)+" °",map(rotonRot,0.0,2.0,0.0,660.0)+5,8);
  line(map(rotonRot,0.0,2.0,0.0,660.0),0,map(rotonRot,0.0,2.0,0.0,660.0),10);
  
    if(rozbaleno){
                 
      rotonInput=map(constrain(mouseX,72.0,772.0), 72.0 , 772.0   , 0.0 , 2.0);
       rotonRot+=(rotonInput-rotonRot)/3.0;
      roton.jump(rotonRot);
        
      } 
        
    //image(situace[0],0,0);
    rect(0,0,700,280);
    
    for(int i =0;i<_kk;i++){
    zalozka[i].run(i,x+51,y+10);
    }
    
    popMatrix();
  }
  
  void paty(int _kk){ // show
    pushMatrix();
    translate(x+51,y+10);
      image(show[0],0,0);
    rect(0,0,700,280);
   
    for(int i =0;i<_kk;i++){
    zalozka[i].run(i,x+51,y+10);
    }
    
    popMatrix();
  } 
  
  void reset(){
   target=startY;
    ktery=posledni;
   posledni=0;
    if(id!=button.length-1){rozbaleno=false;}else{rozbaleno=true;} 
    zalozka[0].active=true;
    
  }
  
}
