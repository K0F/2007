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
    bot[i] = new Bot(i,width/2,height/2,map(i,0,bot.length,2.001,4.001),map(i,0.0,bot.length,1.01,3.1));

  }
strokeWeight(4.1);
}

void draw(){
  fill(0,25);
  noStroke();
 rect(0,0,width,height);

  for(int i = 0;i<bot.length;i++){
    bot[i].draw();
    if(i!=0){
      if(i%3==0){stroke(#FFAA22,15);}else if(i%2==0){stroke(#AA0505,15);}else if(i%5==0){stroke(#FFCCFF,15);}else if(i%7==0){stroke(#FFFFFF,25);}
    
      line(bot[i].x+0.25,bot[i].y+0.25,bot[constrain(i-2,0,bot.length)].x+0.25,bot[constrain(i-2,0,bot.length)].y+0.25);
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
  
  Art[] art = new Art[1];
  
  Bot(int _id,float _x,float _y,float _mass,float _friction){
    startX=_x;
    startY=_y;
   reset(_id,_x,_y,_mass,_friction);
  
    art[0]=new Art(id,mass); 
   
  } 

  void draw(){
    if(id==0){
    compute((bot[bot.length-1].x+pmouseX+mouseX)/3.0,(bot[bot.length-1].y+pmouseY+mouseY)/3.0); 
    }else{
      compute((bot[id-1].x),(bot[id-1].y)); 
      
    }
    
      
    
    
   // line(x+0.25,y+0.25,lastX+0.25,lastY+0.25);
    lastX=x;
    lastY=y;
    art[0].draw();
  }

  void compute(float _tx,float _ty){
     distance = (dist(targetX,targetY,x,y)/mass)+0.1;
   distance=constrain(distance,1.01,width*10);
   
    targetX=(_tx);
    targetY=(_ty);
    
    accX+=(targetX-x)/distance;
    accY+=(targetY-y)/distance;
     
       
    x+=(accX-x)/((mass)+friction);
    y+=(accY-y)/((mass)+friction);

   
      
    

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

class Art {
  int parent; 
  float x,y,speed = 20.0,tx,ty,accX,accY,distance;
  boolean first = true;
  float theta,thetaT;
  float mass;
  Art(int _parent,float _speed){
    parent=_parent;
   speed=_speed*20;
   } 
  
  void draw(){
    if(first){
     init(); 
     first = false;
     
    }
    
    if(parent<bot.length-10){
    tx= bezierTangent(bot[constrain(parent,0,bot.length)].x,bot[constrain(parent+3,0,bot.length)].x,bot[constrain(parent+6,0,bot.length)].x,bot[constrain(parent+9,0,bot.length)].x,0.5);
    ty= bezierTangent(bot[constrain(parent,0,bot.length)].y,bot[constrain(parent+3,0,bot.length)].y,bot[constrain(parent+6,0,bot.length)].y,bot[constrain(parent+9,0,bot.length)].y,0.5);  
    thetaT=atan2(ty,tx);
    //thetaT+=PI*2;  
    theta=thetaT;//+=(thetaT-theta)/20.0;
    
    distance = (dist(bot[parent].x,bot[parent].y,x,y)/10.0)+1.1;
    
    accX+=(bot[parent].x-(cos(theta)*30 + x))/distance;
    accY+=(bot[parent].y-(sin(theta)*30 + y))/distance;
    
   x+=(accX-x)/speed; 
   y+=(accY-y)/speed;
   
  // thetaT=abs(atan2((bot[parent].y-y),(bot[parent].x-x)));
   stroke(#FFFFFF,map(distance,0.0,width/2.0,3.0,0.5));
   line(bot[parent].x, bot[parent].y, x,  y);
   }
   /*
   pushMatrix();
     translate(x,y);
     rotate((theta));
     pushMatrix();
     
     rectMode(CENTER);
   rect(x,y,50,5); 
   rectMode(CORNER);
   
   popMatrix();
   popMatrix();*/ 
  }
  
  void init(){
   x=bot[parent].x;
   y=bot[parent].y;
   accX=x;accY=y;
   theta=atan2(y,x);
  }
 
  
  
  
}

public void keyPressed(){
 if(keyCode==ENTER){
  save(sketchPath+"/screen.png");
 } 
  
}
