
PImage img;
color[] cData;
int shift,posun,radek;
float r,g,b;
float speed = 5;
String name = "Hyla_japonica_001.jpg";
void setup(){
  size(200,200,P3D);
  background(0); 
  frame.setTitle("imageDeconstructor");
  img = loadImage(name);
  cData = img.pixels;
  println(name+" loaded, continuing.. \n"+"data buffer contains "+cData.length +" point references");
  println("read ok, starting proccess..");
}

void draw(){
  background(0);
  shift+=10;
  detector(cData[(shift+5)%cData.length]);
    thumb(((img.width*img.height)/(width*height))*2);

  for(int  x = 0;x<width;x+=1){

    stroke(cData[(x+shift)%cData.length]);
    line((x),height/2,x,height/2+3); 

  } 

  
}

void thumb(int _downScale){
  if(shift%img.width==0){radek+=1;}
  if(radek*_downScale>img.height){radek=0;}
  for(int  x = 5;x<img.width;x+=_downScale){
    for(int  y = 0;y<radek*_downScale;y+=_downScale){
      stroke(cData[y*img.width+x]);
      point((width-5-img.width/_downScale)+x/_downScale,5+y/_downScale);
    }
  } 

}

void detector(color _color){
  
  r= red(_color);
  g=green(_color);
  b=blue(_color);
 
  noStroke();
  fill(r,0,0);
  rect(5,5,5,5);
   fill(0,g,0);
  rect(15,5,5,5);
   fill(0,0,b);
  rect(25,5,5,5); 
  fill(_color);
  rect(55,5,5,5);
  
  noFill();
   stroke(95);
   
   //sipka
   line(35,7,50,7);
   
  line(5,12,5,height/2);
   
   line(65,7,(width-10)-(img.width/(((img.width*img.height)/(width*height))*2)),7);
  
  beginShape();
  vertex(15,12);
   vertex(7,15);
    vertex(7,height/2);
    endShape();
  
  
   beginShape();
  vertex(25,12);
   vertex(9,17);
    vertex(9,height/2);
    endShape();
  
  
  
}

