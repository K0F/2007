import processing.opengl.*;

Bot[] bot = new Bot[1500];

void setup(){
  size(800,600,OPENGL);
 noSmooth();
  fill(0);
  rect(0,0,width,height);
   stroke(255,25);
  colorMode(RGB);
  mouseX=width/2;
  mouseY=height/2;
  for(int i = 0;i<bot.length;i++){
    bot[i] = new Bot(i,width/2,height/2,3.0001+(i/1000.0),1.1);

  }

}

void draw(){
  fill(0,5);
 rect(0,0,width,height);
  for(int i = 0;i<bot.length;i++){
    bot[i].draw();

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
      compute(bot[id-1].x,bot[id-1].y); 
      
    }
    
    line(x,y,lastX,lastY);
    lastX=x;
    lastY=y;
    
  }

  void compute(float _tx,float _ty){
     distance = (dist(targetX,targetY,x,y)/mass)+0.1;
   distance=constrain(distance,1.0,width*2);
   
    targetX=(_tx);
    targetY=(_ty);
    
    accX+=(targetX-x)/distance;
    accY+=(targetY-y)/distance;
     
       
    x+=(accX-x)/((mass)*friction);
    y+=(accY-y)/((mass)*friction);

   
      
    

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
