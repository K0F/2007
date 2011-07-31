import processing.opengl.*;


Obj[] obj = new Obj[180];

void setup(){
  size(300,300,OPENGL); 

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

  last();

}



