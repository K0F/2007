int first =1;
class HLine { 
  float xpos, ypos, speedx,col,speedy,iq,xdef,ydef;
 int deathendx,deathendy; 
  HLine (float x,float y,float defx,float defy,float c,int id) {  
    ypos = y; 
    xpos = x;
    col = c;
    iq = id;
    xdef = defx;
    ydef = defy;
    
    
  } 
  
  void kof(float r,float g,float b){
   
   float R = r;
   float G = g;
   float B = b;
  
   constrain(ypos,ydef-5.0,ydef+5.0); 
   
   
     speedx = (R-127.0)/400.0;
   xpos += speedx;
   
     speedy = (B-127.0)/400.0;
   ypos+= speedy;
   xpos=constrain(xpos,xdef-40.0,xdef+40.0);
   ypos=constrain(ypos,ydef-40.0,ydef+40.0);
   noFill();
   stroke(R,G,B,75);
    //line(xpos,ypos,abs(speedx)*width*2,abs(speedy)*height*2);
    ellipse(xpos,ypos,R/10,G/10);
    
    //rect(xdef, ydef, 4, 4);
   if(xpos>width){xpos=width; speedx=speedx*(-0.8);}else if(xpos<0){xpos=0; speedx=speedx*(-0.8);}
  if(ypos>height){ypos=height; speedy=speedy*(-0.8);}else if(ypos<0){ypos=0; speedy=speedy*(-0.8);}
  }
  
}
