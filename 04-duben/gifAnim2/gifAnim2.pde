//PImage img = loadImage("http://weirdPlace.wz.cz/imgs/minimal2.gif");
PImage img = loadImage("http://weirdPlace.wz.cz/imgs/mm2.gif");
PImage r = loadImage("http://weirdPlace.wz.cz/imgs/red.png");
PFont font;
int[] ix = new int[500];
void setup(){
 size(img.width*5,img.height);
cursor(CROSS);
background(255); 
  font = loadFont("00Erratix-8.vlw");
  textFont(font,8);
}

void draw(){
  noStroke();
  fill(255,2);
 rect(0,0,width,height);
   
  
  for(int i = 1 ; i<width;i+=img.width){
   ix[i] = (ix[i]+1)%(width-(i*(img.width/width))); 

image(img,map(i+ix[i],(width-(i*(img.width/width))),0,-100,width+100),0); 
image(r, mouseX,mouseY, r.width,  r.height); 
  }
  fill(255,152,15);
 
  text("gif is back!",width-60,height-2);
}
