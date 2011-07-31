
PImage a;
int shift;
void setup(){
  size(200,200);
  a= loadImage("kolecko.PNG");

}

void draw(){
 anim(mouseY,a);


}


void anim(float speed,PImage img){
  shift+=10;
  loadPixels();
  for(int i = 0;i<img.height;i++){
    for(int q = 0;q<img.width;q++){
      if(q<10){
        pixels[i*width+q]=img.pixels[i*80+(q+shift)%80];
      }
    }
  }
  updatePixels();  
  
}
