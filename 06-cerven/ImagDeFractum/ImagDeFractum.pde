import processing.opengl.*;

Holder[] h = new Holder[680];
PImage img[] = new PImage[680];
int x,y,_x,_y,cnt;
color[] cols = {#FFFFFF,#FFCC00};
void setup(){

  size(626,257,OPENGL);
  frameRate(20);
  for(int x = 1;x<img.length-1;x++){
    img[x]= loadImage("/results2/icon_"+x+".png");
  }


  
  for(int x = 0;x<width;x+=16){
    for(int y = 0;y<height;y+=16){
      _x=x/16;_y=y/16;
      h[_y*width/16+_x]=new Holder(x,y,y*width+x);
    }
  }
  background(0);

}

void draw(){
 // background(0);
  cnt++;
  
 for(int x = 0;x<width;x+=16){
    for(int y = 0;y<height;y+=16){
       h[(y/16)*width/16+(x/16)].init();
      h[(y/16)*width/16+(x/16)].run();
    }
  }
  
  if(frameCount%50==0){
   for(int x = 0;x<width;x+=16){
    for(int y = 0;y<height;y+=16){
      h[(y/16)*width/16+(x/16)].rerand();
    }
  } 
}

}

void mousePressed(){
 for(int x = 0;x<width;x+=16){
    for(int y = 0;y<height;y+=16){
      h[(y/16)*width/16+(x/16)].rerand();
    }
  } 
  
}

class Holder{
  
  float ktery;
  int r,g,b;
  int x,y;
  int id;
  float jump;

  Holder(int _x,int _y,int _id){
    x=_x;
    y=_y;
    r=int(random(200,255));
     g=int(random(200,255));
      b=int(random(200,255));
      jump=(random(0.0025,random(0.025,random(0.31,0.5))));
    id =_id;
    ktery=int(random(1,743));
   
  } 
  void run(){
    tint(lerpColor(cols[0],cols[1],map(ktery,0,img.length,0.0,1.0)),155);
    image(img[int(ktery)],x,y); 
    noTint();
  }
  
  void init(){
  ktery+=jump;
  if(int(ktery)<1){ktery=img.length-2;}else  if(int(ktery)>img.length-2){ktery=1;}
 
       
  }
  
  void rerand(){
      r=int(random(200,255));
     g=int(random(200,255));
      b=int(random(200,255));
      jump=(random(0.0025,random(0.025,random(0.31,0.5))));
       //ktery=int(random(1,743));
  }

}

