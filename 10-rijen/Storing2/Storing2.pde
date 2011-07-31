import processing.opengl.*;


Obj[] obj = new Obj[100];

void setup(){
  size(400,400,OPENGL); 

  for(int i = 0;i<obj.length;i++){

    obj[i] = new Obj(random(width),random(height),1,500,i);
  }
  
 // smooth();

noFill();//(f,10);
}

void draw(){
  fill(0,15);
  rect(0,0,width,height);

  for(int i = 0;i<obj.length;i++){
    obj[i].run();
  }


}

void mousePressed(){
   fullRest();
  
}

void fullRest(){
 for(int i = 0;i<obj.length;i++){

    obj[i].tx = random(width);
    obj[i].ty = random(height);
  } 
  
}

