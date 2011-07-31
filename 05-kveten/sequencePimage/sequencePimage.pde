 PImage dd;
PImage a;
int shift;
void setup(){
  size(200,200);
  frameRate(25);
  a= loadImage("panel2.png");
background(255);
}

void draw(){
background(45);
  anim(103,10,height/2,a);

//image(dd,10,10);
}


void anim(int frame,int X,int Y,PImage img){
 
  dd=createImage(frame,img.height,RGB);
  shift+=frame;
  loadPixels();
  for(int i = 0;i<img.height;i++){
    for(int q = 0;q<img.width;q++){
      if(q<frame){
        if(color(img.pixels[i*img.width+(q+shift)%img.width])!=-1){
        pixels[(i+Y)*width+(q+X)]=img.pixels[i*img.width+(q+shift)%img.width];
     
        
        }
      }
    }
  }
  updatePixels();  
  
}
