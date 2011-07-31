import processing.opengl.*;
import JMyron.*;

JMyron input;
 
 PGraphics buff;
PImage a;
int num=85,k,cnts;
int W=320,H=240;

float[] shift = new float[num];

void setup(){
  size(600,400,OPENGL);
  background(0);
 input = new JMyron();//obj
  input.start(W,H);//320x240
  input.findGlobs(0);

buff = createGraphics(W,H,P3D);
a=createImage(W,H,RGB);
 //a=loadImage("andel.png");
getInput();
  a.updatePixels();
}

void draw(){
 // background(0);
 if(mousePressed){
   mousePressed=false;
 getInput();
    a.updatePixels();
 }
  
 cnts++;

 stroke(255);
 noFill();
  for(int i =0;i<num;i++){
    shift[shift.length-1]=(mouseX-width/2)/3.0;
    shift[i]+=(shift[constrain(i+1,0,num-1)]-shift[i])/5.0;
   }
 
   fill(255);
  
    /* loadPixels(); 
 for(int i=0; i < buff.pixels.length; i++) {
  a.pixels[i] = buff.pixels[i]; 
}
updatePixels();*/
   translate(width/2-W/2,height/2-H/2);
   beginShape(QUADS);

   texture(a);
int Xscale=W, Yscale = 2;
for(int q=1;q<num;q++){
  noStroke();
  vertex(shift[(num-1)-q+1],q*Yscale,0, 0 ,map(q*Yscale,0.0,H,0.0,a.height));
  vertex(shift[(num-1)-q+1]+Xscale,q*Yscale,0,a.width,map(q*Yscale,0,H,0.0,a.height));
   vertex(shift[(num-1)-q]+Xscale,q*Yscale+Yscale,0,a.width,map(q*Yscale+Yscale,0,H,0.0,a.height));
    vertex(shift[(num-1)-q],q*Yscale+Yscale,0, 0 ,map(q*Yscale+Yscale,0.0,H,0.0,a.height));

 }
endShape(CLOSE);
   
}


void getInput(){

 input.update();
/* a=createImage(48,36,RGB);
 input.hijack(48,36,a.pixels);
 image(a,0,0);*/
 int[] img = input.image();
 // print(img);

 float av;
 buff.beginDraw();
 for(int x=0;x<input.width();x+=1){ 
  for(int y=0;y<input.height();y+=1){ 
    
    
      av= 2*((int)brightness(img[y*input.width()+x]))-100;
    //  buff.background(255);
      buff.fill(constrain(av,0,255));
      buff.noStroke();
      buff.rect(x,y,1,1);
     
       }
      
  }
 buff.endDraw();

 // image(buff,0,0);

  loadPixels();
  a.pixels = buff.pixels; 
updatePixels();

}
