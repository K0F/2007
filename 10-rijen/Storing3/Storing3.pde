import processing.opengl.*;


Obj[] obj = new Obj[220];

void setup(){
  size(300,300,OPENGL); 

  for(int i = 0;i<obj.length;i++){

    obj[i] = new Obj(random(width),random(height),1,i);
  }

  // smooth();

}

void draw(){
  fill(0,85);
  rect(0,0,width,height);

  for(int i = 0;i<obj.length;i++){
    obj[i].run();
  }

  //last();
  //chosen(5,6,8,7);
}



