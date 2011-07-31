import processing.opengl.*;

PFont font;
int num=15;
float[] theta = new float[num];
int[] minn = new int[num];
color[] cols = {#9CCB5F,#41502F,#D7DECE,#D6CF8C,#AD9570,#F2BF6C,#88DBFA,#495D64,#636449,#C6C6B8,#B9B78B,#D2DEC7,#EAEAC0,#7C6F66,#4B5547};
void setup(){
  size(400,300,OPENGL);
  font= loadFont("Avalon-48.vlw");
  textFont(font,48/2);
  background(0);
  fill(255);
  
  //noSmooth();
  theta[0]=10;
   for(int i =0;i<num;i++){
     minn[i]=1;
   }
}

void draw(){
  background(0);
 stroke(255);
 noFill();
  
  for(int i =0;i<num;i++){
    pushMatrix();
    
    if((theta[i]>360.0)||(theta[i]<-360.0)){
      minn[i] *=-1; 
    }
     theta[i]+=((0.5*(theta[constrain(i-1,0,num-1)]+theta[constrain(i+1,0,num-1)])-theta[i]));
  theta[0]+=(width/2.0-mouseX)/10.0;
 translate(width/2.0,height-50);
  rotateY(radians(theta[i]));
  
 // fill(cols[i]);
  text("----->",-5,-i*12);
  //(50,-i*12,0);
 
 
  popMatrix();
  }
   
  beginShape();
  for(int i =0;i<num;i++){
    pushMatrix();
     translate(width/2.0,height-50);
     rotateY(radians(theta[i]));
    vertex(50,-i*12,0);
    popMatrix();
  }
endShape();
}
