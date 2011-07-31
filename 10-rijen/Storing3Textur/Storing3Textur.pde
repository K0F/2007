import processing.opengl.*;


Obj[] obj = new Obj[180];
PImage img;
 
int[] whose = {0,1,2,3};
  int[] posX = {0,1,1,0};
   int[] posY = {0,0,1,1};

void setup(){
  size(300,300,OPENGL); 
  
  img = loadImage("machinaVPleneru.png");
  
  textureMode(NORMALIZED);
  for(int i = 0;i<obj.length;i++){
    obj[i] = new Obj(random(width),random(height),1,i);
  }
  
  
  // smooth();
}



void draw(){
  fill(0,35);
  rect(0,0,width,height);

  for(int i = 0;i<obj.length;i++){
    obj[i].run();
  }

  //last();
  chosen(whose);
}



