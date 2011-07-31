
PImage img;
int ix;
void setup(){
  img = loadImage(sketchPath+"/data/kof.png");
 size((img.width*3)/2,img.height);

  background(255); 
  
  
}

void draw(){
 background((sin(ix)+1)*255);
  ix = (ix-1)%200;
image(img,ix+30,0); 
fill(0);
noStroke();
rect(ix+img.width+30,0,width*5,height);
  
  
}
