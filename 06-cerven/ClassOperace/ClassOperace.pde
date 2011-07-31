import processing.opengl.*;
int num = 1000;
Bit[] b = new Bit[num];


void setup(){
  size(1280,1024,OPENGL);
  background(0);
  stroke(255);

  for(int i = 0;i<num;i++){
    b[i]=new Bit();
    b[i].run();
  } 

}

int cnt;
void draw(){
 // fade(15);
  for(int i = 0;i<num;i++){
    b[i].run();
  } 
  cnt++;
if(cnt%200==0){
 cnt=0;
recv(b); 
}
}

void fade(int _kolik){
  fill(0,_kolik);
  noStroke();
  rect(0,0,width,height);
}
  

void mousePressed(){
recv(b);   
  
}

void keyPressed(){
  if(keyCode==ENTER){
   keyCode=0;
    save("screen.png"); 
  }
  
  if(keyCode==DELETE){
   keyCode=0;
  background(0);
   for(int i = 0;i<num;i++){
  // b[i].cilR();
   }
  }
 
 
  
}


void recv(Bit[] _obj){
   for(int i = 0;i<num;i++){
    _obj[i].setXY(random(width),random(height));
   }
 


}

class Bit{
  float x,y;
  float X,Xf,Y,Yf; 
  
  float targetX,targetY;
  float speed = 30;
  
  Bit(){
    x=random(0.0,width);
    y=random(0.0,height);
    targetX=random(0.0,width);
    targetY =random(0.0,height);
    
    
       
  } 

  void run(){
   
    Xf = x;
    Yf = y;
    targetX+=((mouseX-targetX)/(speed*5))+random(-dist(mouseX,mouseY,targetX,targetY)/100.0,dist(mouseX,mouseY,targetX,targetY)/250.0);
    targetY+=((mouseY-targetY)/(speed*5))+random(-dist(mouseX,mouseY,targetX,targetY)/100.0,dist(mouseX,mouseY,targetX,targetY)/250.0);
    
    targetX+=((mouseX-targetX)/(speed*5))+random(-0.1,0.1);
    targetY+=((mouseY-targetY)/(speed*5))+random(-0.1,0.1);
    
    x+=(targetX-x)/speed;
    y+=(targetY-y)/speed;
    
   // 
    strokeWeight(1);
    stroke(255,2);
    line(x,y,x+1,y+1);
    line(x,y,Xf,Yf);
    
   /*
    stroke(255,3);
    line(targetX,targetY,x,y);
     //strokeWeight(10);
      stroke(255,0,0,50);
      noFill();
      ellipseMode(CENTER);
    ellipse(targetX,targetY,10,10);
    */
  }
  
  void setXY(float _x,float _y){
    X=_x;
    Y=_y;
    x=X;
    y=Y;
  }
  
  void cilR(){
  targetX=random(width);
  targetY=random(height);
  
   targetX= targetX%width;
   targetY= targetY%height;
}
}
