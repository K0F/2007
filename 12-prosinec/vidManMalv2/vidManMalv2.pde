import processing.opengl.*;

import imageadjuster.*;
import processing.video.*;

Movie m;
MovieMaker mm;
PImage q;
PGraphics p;
PFont font;



int num = 80;
float[] step = new float[num];
float[] x = new float[num];
float[] y = new float[num];
float[] x2 = new float[num];
float[] y2 = new float[num];

float dur,jumper;
color c[] = {#AAAA00,#FFFFFF};
void setup(){
  size(176,144); //176x144 mobil
  frameRate(5);
  background(0);  
   mm = new MovieMaker(this, width, height, "out/mafla.mov",10, MovieMaker.JPEG, MovieMaker.HIGH);
 
  m=new Movie(this, "malva3.mov");
  m.loop();
  dur = m.duration();
  println("movie loaded!");
  println("dur.:"+dur);
  noSmooth();
  
 

  
  p=createGraphics(width,height,P3D);
  
  
  font = (loadFont("00Erratix-8.vlw"));
  textFont(font);
 // p.smooth();
 
  rand();     
  jumper = random(18.1,dur);
     
}

void draw(){
  

// m.mask(m);
 /*
 tint(lerpColor(c[0],c[1],norm(jumper,0,dur))  , 200);
  image(m, map(jumper,0,dur,-1,1), 0,width,height);
   filter(BLUR);
   */
   // adj2();
  // filter(BLUR,0.1);
/*  
   fill(lerpColor(c[0],c[1],norm(jumper,0,dur)),55);
  text(round(jumper*100)/100.00f,random(width),random(height));
  */
 
  
  
  
//   jumper = random(10.1,dur);
  tint(lerpColor(c[0],c[1],norm(jumper,0,dur))  , 200);
  image(m, map(jumper,0,dur,-1,1), 0,width,height);
  
  noTint();
 
  render();
  image(p,0,0);
  
  mm.addFrame();
}

void keyPressed(){
  if(keyCode==ENTER){
   mm.finish();
  println("fin!"); 
  }


}

void movieEvent(Movie m) {
  if(m.available()){
    m.read();
  }
}

void rand(){
  
  for(int i = 0;i<num;i++){
    step[i]=1.1*(sqrt(i));
    x[i]=random(width);
    y[i]=random(height);
    x2[i]=random(width);
    y2[i]=random(height);
  }
  
}

void render(){
 
 //p = createGraphics(width,height,P3D);
 p.loadPixels();
 for(int i = 0;i<p.pixels.length;i++){
 p.pixels[i] = color(0,0);
 }
 p.updatePixels();
 //p.textFont(font);
// p.smooth();
  p.beginDraw();   
 int cyc = 15;
  for(int i = 0;i<num;i++){    
    x[i]+=random(-step[i],step[i]);
    y[i]+=random(-step[i],step[i]);
    x2[i]+=random(-step[i],step[i]);
    y2[i]+=random(-step[i],step[i]);
    if(i<num-cyc){
     p.stroke(0); 
     p.noFill();
     p.ellipse(x[i],y[i],1000/(i+1.0f),1000/(i+1.0f));
     //p.line(x[i],y[i],x2[i],y2[i]);
    }
    if(i%cyc==0){p.filter(BLUR);}
   
  }
  p.endDraw(); 
  
}


void adj2(){
ImageAdjuster adjust = new ImageAdjuster(this);
// 1) brightness
adjust.brightness(0.05f);
// 3) contrast
adjust.contrast(1.5f);
// finally, apply this silly transform
//adjust.apply(g);
}
