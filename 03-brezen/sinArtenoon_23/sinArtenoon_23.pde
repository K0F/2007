import processing.opengl.*;

float cnt = 0,floater;

void setup(){
  size(300,300,OPENGL);
  frameRate(30); 
  background(0);
  //------------------------------------ >

  frame.setTitle("sinArtenoon");
  frame.show();
   //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);

}

void draw(){
  falloff(50);
  for(int i = 0;i<width;i++){
    cnt += 0.0001;
    floater = (mouseY/50.0)*(cos((i)/(mouseX/5.0))+1);
    float q = (sin(cnt+i)+1)*floater;

    ctverec((i+cnt*10)%width,-q*(5)+height/2,color(((q)+1)*255));
  }
}

void ctverec(float x, float y, color c){
  noStroke();
  fill(c);
  rect(x,y,1,1); 
}

void falloff(int intensity){
  noStroke();
  fill(0,intensity);
  rect(0,0,width,height); 
}
