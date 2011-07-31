PImage velky = new PImage();
PImage maly = new PImage();
PImage bulb = new PImage();

int x,y,cnt;

void setup(){
 size(100,100);
 velky = loadImage("input.png");
 bulb= loadImage("bulb.png");
  maly= createImage(16,16,RGB);
  
  background(0);
  
 
  

}

void draw(){
  background(0);
  cnt++;
// image(maly,(width/2)-(bulb.width/2),(height/2)-(bulb.height/2)); 
  copy(velky,x,y,16,16,(width/2)-(bulb.width/2),(height/2)-(bulb.height/2),16,16);
 image(bulb,(width/2)-(bulb.width/2),(height/2)-(bulb.height/2));
 
 loadPixels();
 for(int x = 0;x<maly.width;x++){
    for(int y = 0;y<maly.height;y++){
   maly.pixels[y*maly.width+x]=pixels[(y+(width/2)-(bulb.width/2))*width+(x+(height/2)-(bulb.height/2))];
 }
 }
 
 maly.save("results2/icon_"+cnt+".png");
  
  shift(); 
}



void shift(){
  x+=16;
  if(x>velky.width){
   x=0;
  y+=16; 
  } 
  
  if(y>velky.height){
   y=0; 
   noLoop();
  }
   
}
