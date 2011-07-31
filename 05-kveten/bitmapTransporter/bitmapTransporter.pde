
PImage img;
color[] cData;
int shift,posun,poosun;

void setup(){
  size(200,200,P3D);
  background(0); 
  img = loadImage("gouvernr.jpg");
  cData = img.pixels;

}

void draw(){
  shift+=img.width;
 
  for(int  x = 0;x<img.width;x++){
    stroke(cData[(x+shift)%cData.length],5);
    line(map(x,0,img.width,0,width),0,map(x,0,img.width,0,width),height); 
  } 

  thumb();
}

void thumb(){
  for(int  x = 0;x<img.width;x+=10){
    for(int  y = 0;y<img.height;y+=10){
      stroke(cData[y*img.width+x]);
      point(x/10,y/10);
    }
  } 
  
}

