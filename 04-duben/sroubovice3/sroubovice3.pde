import processing.opengl.*;


PImage a;
int num=35,k;
float[] shift = new float[num];

void setup(){
  size(400,300,OPENGL);
  background(255);
 
  a=loadImage("andel.png");

  
}

void draw(){
 background(255);
 stroke(255);
 noFill();
  for(int i =0;i<num;i++){
    shift[shift.length-1]=(mouseX-width/2)/3.0;
    shift[i]+=(shift[constrain(i+1,0,num-1)]-shift[i])/5.0;
   }
 
   fill(255);
   
   translate(120,0);
   beginShape(QUADS);
   texture(a);

for(int q=1;q<num;q++){
  noStroke();
  vertex(shift[(num-1)-q+1]+width/2.0,q*8,0, 0 ,map(q*8,0.0,height,0.0,a.height));
  vertex(shift[(num-1)-q+1]+30,q*8,0,a.width,map(q*8,0,height,0.0,a.height));
   vertex(shift[(num-1)-q]+30,q*8+8,0,a.width,map(q*8+8,0,height,0.0,a.height));
    vertex(shift[(num-1)-q]+width/2.0,q*8+8,0, 0 ,map(q*8+8,0.0,height,0.0,a.height));
  k =q;
 }


 
endShape(CLOSE);
}

