import processing.opengl.*;

Bot[] bot = new Bot[150];

void setup(){
  size(400,400,OPENGL);
 noSmooth();
  fill(0);
  rect(0,0,width,height);
   stroke(255,55);
  colorMode(RGB);
  for(int i = 0;i<bot.length;i++){
    bot[i] = new Bot(200,400,random(50.0,80.0));

  }

}

void draw(){
  fill(0,15);
 rect(0,0,width,height);
  for(int i = 0;i<bot.length;i++){
    bot[i].draw();

  }


}

void mousePressed(){
  background(0);
   for(int i = 0;i<bot.length;i++){
    bot[i].reset(bot[i].startX,bot[i].startY,bot[i].mass);

  }
}



class Bot{
  float x,y;
  float distance;
  float lastX,lastY;
  float startX,startY;
  float targetX,targetY;
  float accX,accY;
  float mass = 100.0,friction= 150.0;
  Bot(float _x,float _y,float _mass){
    startX=_x;
    startY=_y;
   reset(_x,_y,_mass);
  } 

  void draw(){
    compute(mouseX,mouseY); 
    line(x,y,lastX,lastY);
    lastX=x;
    lastY=y;
    
  }

  void compute(float _tx,float _ty){
     distance = (dist(targetX,targetY,x,y)/mass)+0.1;
   
   
    targetX=(_tx);
    targetY=(_ty);
    
    accX+=(targetX-x)/distance;
    accY+=(targetY-y)/distance;
     
       
    x+=(accX-x)/(mass);
    y+=(accY-y)/(mass);

   
      
    

  }
  
  void reset(float _x,float _y,float _mass){
     x=_x;
    y=_y;
    lastX=x;
    lastY=y;
    mass=_mass;
   
    accX=targetX;
    accY=targetY;
    
    
  }


}
