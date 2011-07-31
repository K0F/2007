import processing.opengl.*;
String ver = ("0.1");

int count,accept = 1,cn = 0,shift;
int W = 350, H=215;
float cnt = 0.0;
float zoom = 2f;
PImage g;

int hold = 30;
float yLim = 4.0;
float av = 0;
//float touch1,touch2;
void setup() {

  size(W,H,OPENGL);
  background(0);
  g = loadImage("imgs/2.png");
}
float[] Y = new float[W*H];
float[] speedY = new float[W*H];

void draw() {
  falloff(25);
  noiser(zoom);
}

void falloff(int e) {
  fill(0,e);
  rect(0,0,width,height);
}

void noiser(float mm) {

  for(int y=0;y<height;y+=2){ 
    beginShape();
    for(int x=0;x<width;x+=2){
      // int id =(int)map(y,0,height,0,g.height)*(int)map(width,0,width,0,g.width)+(int)map(x,0,width,0,g.width);
      int id =((int)map(y+mouseY,y,height,0,g.height))*(int)map(width,0,width,0,g.width)+((int)map(x+mouseX,x,width,0,g.width));
      id =constrain(id,0,g.pixels.length-1);
      if(g.pixels[id]!=-1){ 
        av= brightness(g.pixels[id]);
        stroke(g.pixels[constrain(id,0,g.pixels.length)],av/2);

      }
      else{

        //int id = int(map(x,0,width,0,g.width)*map(g.width,0,width,0,g.width)+map(y,0,height,0,g.height));
        av = (random(255))/3.0;
        stroke(255,av/2);
      }
      noFill();
      //cnt+=0.00001;
      yLim=av/10;//(sin(cnt)+1)*20;
      speedY[y*width+x] = -((av)-128.0)/200.0;
      Y[y*width+x] += speedY[y*width+x];
      if(Y[y*width+x]>yLim){
        Y[y*width+x]=yLim;
        speedY[y*width+x]=speedY[y*width+x]*(-0.9);
      }
      else if(Y[y*width+x]<-yLim){
        Y[y*width+x]=-yLim;
        speedY[y*width+x]=speedY[y*width+x]*(-0.9);
      }
      //rotate(radians(g/50.0));
      //rect(x,y,4,4);
      vertex(map(x,0,width,5,width-2),map((y+(Y[y*width+x])),0,height,5,height-10));
    }
    endShape();
  }
}



void keyPressed(){
  saveFrame("frame-####.jpg"); 
  if(keyCode==UP){
    keyCode=0;
    zoom+=0.1;  
  }
  else if(keyCode==DOWN){
    keyCode=0;
    zoom-=0.1;  
  }
  

}

