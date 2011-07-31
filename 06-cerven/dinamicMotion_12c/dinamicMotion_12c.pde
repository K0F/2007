import processing.opengl.*;

Bot[] bot = new Bot[150];

void setup(){
  size(800,600,OPENGL);
 noSmooth();
  fill(0);
  rect(0,0,width,height);
   stroke(255,55);
  colorMode(RGB);
  mouseX=width/2;
  mouseY=height/2;
  for(int i = 0;i<bot.length;i++){
    bot[i] = new Bot(i,width/2,height/2,map(i,0,bot.length,1.1,8.1),map(i,0.0,bot.length,2.0,3.1));

  }

}

void draw(){
  fill(0,5);
 rect(0,0,width,height);
  for(int i = 0;i<bot.length;i++){
    bot[i].draw();
    if(i!=0){
      if(i%2==0){stroke(#CCFF00,85);}else{stroke(255,85);}
      line(bot[i].x+0.25,bot[i].y+0.25,bot[i-1].x+0.25,bot[i-1].y+0.25);
    }
  }


}

void mousePressed(){
  background(0);
   for(int i = 0;i<bot.length;i++){
    bot[i].reset(i,bot[i].startX,bot[i].startY,bot[i].mass,bot[i].friction);

  }
}



class Bot{
  float x,y;
  float distance;
  float lastX,lastY;
  float startX,startY;
  float targetX,targetY;
  float accX,accY;
  float mass = 100.0,friction= 3.0;
  int id;
  
  Bot(int _id,float _x,float _y,float _mass,float _friction){
    startX=_x;
    startY=_y;
   reset(_id,_x,_y,_mass,_friction);
  } 

  void draw(){
    if(id==0){
    compute(mouseX,mouseY); 
    }else{
      compute((bot[id-1].x),(bot[id-1].y)); 
      
    }
    
    line(x+0.25,y+0.25,lastX+0.25,lastY+0.25);
    lastX=x;
    lastY=y;
    
  }

  void compute(float _tx,float _ty){
     distance = (dist(targetX,targetY,x,y)/mass)+0.1;
   distance=constrain(distance,1.01,width*10);
   
    targetX=(_tx);
    targetY=(_ty);
    
    accX+=(targetX-x)/distance;
    accY+=(targetY-y)/distance;
     
       
    x+=(accX-x)/((mass));
    y+=(accY-y)/((mass));

   
      
    

  }
  
  void reset(int _id,float _x,float _y,float _mass,float _friction){
    id=_id;
     x=_x;
    y=_y;
    targetX=x;
    targetY=y;
    lastX=x;
    lastY=y;
    mass=_mass;
   friction=_friction;
    accX=targetX;
    accY=targetY;
    
    
  }


}
