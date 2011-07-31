
PImage a;
int num=35,k;
float[] shift = new float[num];

void setup(){
  size(400,300,P3D);
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
   beginShape();
   texture(a);

for(int q=1;q<num;q++){
  stroke(0);
  vertex(shift[(num-1)-q]+width/2.0,q*8,0, 0 ,map(q*8,0.0,height,0.0,a.height));
  k =q;
 }

for(int i=k;i>0;i--){
  vertex(shift[(num-1)-i]+30,i*8,0,a.width,map(i*8,0,height,0.0,a.height));
  } 
 
endShape(CLOSE);
}

