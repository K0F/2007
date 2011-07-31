
Bit[] b = new Bit[10];
Object k = new Object();
void setup(){
  size(200,200);
  background(0);
  stroke(255);

  for(int i = 0;i<10;i++){
    b[i]=new Bit();
    b[i].run();
  } 

}

int cnt;
void draw(){
cnt++;
  for(int i = 0;i<10;i++){
    b[i].run();
  } 
if(cnt%100==0){
 cnt=0;
setXYR(); 
}
}

void setXYR(){
 recv(b); 
  
}

void recv(Bit[] _obj){
   for(int i = 0;i<10;i++){
    _obj[i].setXY(random(width),random(height));
  } 
 


}

class Bit{
  float x,y,z;
  Bit(){
    x=random(width);
    y=random(height);
    z=random(width);

  } 

  void run(){
    init();
    stroke(255,10);
    point(x,y);
    
  }
  
  void setXY(float _x,float _y){
    x=_x;
    y=_y;
  }
  
  void init(){
  x+=random(-1.0,1.0);
  y+=random(-1.0,1.0);
  z+=random(-1.0,1.0);
  x=x%width;
  y=y%height;
}
}
