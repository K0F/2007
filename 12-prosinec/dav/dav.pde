import processing.opengl.*;

PImage[] man = new PImage[5];
String ext = ".png";

int num = 576;

Panacek[] p = new Panacek[num];

void setup(){

  size(720,p.length,OPENGL);
  
  for(int i = 0;i<man.length;i++){
    man[i] = loadImage("panacek/"+(i+1)+"s"+ext); 
    println("nacten sprite: "+"panacek/"+(i+1)+"s"+ext);
  }
  
  for(int i = 0;i<p.length;i++){
   p[i]=new Panacek(i); 
  }
  
  background(#555555);
  noStroke();
  
}

void draw(){
 
background(#555555);
//fill(#555555,25);
//rect(0,0,width,height);

    
  for(int i = 0;i<p.length;i++){
   p[i].run(); 
  } 
  
}

/*
int prespektiva(int which){
  int[] ys = new int[p.length];
  int[] wh = new int[p.length];
  
  for(int i = 0;i<p.length;i++){
    ys[i] = p[i].y;  
    wh[i] = i;    
  }
  
  sort(ys);
  
   for(int i = 0;i<p.length;i++){
     wh[i] 
   }
  return wh[which];
  }
*/
