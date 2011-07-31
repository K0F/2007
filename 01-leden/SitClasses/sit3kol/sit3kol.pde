import processing.opengl.*;

ST[] a;


void setup(){
  size (400, 400,OPENGL); 
  background(255);
  a = new ST[10002];
  for (int i = 0;i<10000;i++){
    a[i] = new ST(i);
  }

}


void draw(){
  fill(0);
  fill(255,5);
  rect(0,0,width,height);



  noFill();
  stroke(0,15);
  for (int i = 0;i<10000;i++){
    stroke(a[i].ID/100,15);
    a[i].drawMe(5);

  }


}
