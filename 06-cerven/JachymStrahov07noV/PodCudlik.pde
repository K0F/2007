class Zalozka{
 PImage im = loadImage("zalozka.png");
 PImage shade=loadImage("shadeV.png");
 int ID,shift,parent;
 boolean active = false;
 int alph = 105,instN;
  
 Zalozka(int _ID,int _parent,int _instN){
   ID =_ID;
   parent = _parent;
   instN = _instN; 
   if(ID==0){
    active=true; 
   }
   
 } 
 
 void run(int _num,float _x,float _y){
  
   shift=_num*(im.height+1);
    //rect(0,0,15,47+shift);
    
  if(button[parent].rozbaleno){
    if((mouseX-_x>-15)&&(mouseX-_x<0)&&(mouseY-_y>0+shift)&&(mouseY-_y<46+shift)){
      fill(255);
      text(button[parent].name+" / "+(ID+1),mouseX-_x+15,mouseY-_y);
     button[parent].ktery=ID;
      if((mousePressed)&&(button[parent].ktery!=button[parent].posledni)){
        
        button[parent].posledni=button[parent].ktery;
        active = true;
        println(button[parent].name+" >> "+(ID));
        
        mousePressed=false;
      }// zalozka pressed 
    
  }// zalozka over
 
 }//parent rozbalen
      
   for(int i = 0 ; i<instN;i++){
    if(i!=button[parent].posledni){
     button[parent].zalozka[i].active=false;
    }
   }
   
   pushMatrix();
   translate(-15,-1+shift);
   
  
   
  // tint(255,alph);
   
   fill(#CCCCCC,alph); 
    
     if(active){
   fill(#3399CC,alph+50);
   image(shade,7,0,8,46);
   tint(255,150);
   image(sipkaActive,3,30);
   noTint();
   tint(#3399CC,alph);
   }else{noTint();}  
   
    
    
   
   image(im,0,0);
   noTint();  
    
   textFont(font);
   switch (_num){
    case 0:text("1",5,16);
   break; 
    case 1:text("2",5,16);
   break; 
    case 2:text("3",5,16);
   break; 
    case 3:text("4",5,16);
   break; 
    case 4:text("5",5,16);
   break; 
     
   }
   
  
  popMatrix();
 } 
  
}
