import processing.opengl.*;

PFont font;
int num=35;
float[] theta = new float[num];
int[] minn = new int[num];
int[] kolik = new int[num];
color[] cols = {#20C927,#C92F20};
void setup(){
  size(800,600,OPENGL);
  font= loadFont("Avalon-48.vlw");
  textFont(font,48/3);
  background(0);
  fill(255);
  
  //noSmooth();
  theta[theta.length-1]=0;
   for(int i =0;i<num;i++){
     minn[i]=1;
   }
}

void draw(){
  background(0,15);

 stroke(255);
 noFill();
  
  for(int i =0;i<num;i++){
    pushMatrix();
    
   /* if((theta[i]>360.0)||(theta[i]<-360.0)){
      minn[i] *=-1; 
    }*/
   
   
    theta[theta.length-1]=(mouseX-width/2)/3.0;
    theta[i]+=(theta[constrain(i+1,0,num-1)]-theta[i])/5.0;
  
 translate(width/2.0,height);
  rotateY(radians(theta[i]));
  float rozdilF = map((theta[constrain(i+1,0,num-1)]-theta[i])/10.0,-12,12,0.0,1.0);
 fill(lerpColor(cols[0],cols[1],rozdilF));
  for(int x=0;x<4;x++){
  pushMatrix();
  rotateY(radians(theta[i]+x*90));   
  String v = 34-int(i)+" : "+(x+1);
    text("  <           "+v,abs((rozdilF-0.5)*150.0),-i*15-50,+((rozdilF-0.5)*50.0));
  popMatrix();
  }
  //(50,-i*12,0);
 
 
  popMatrix();
  }
   /*
  beginShape();
  for(int i =0;i<num;i++){
    pushMatrix();
     translate(width/2.0,height);
     rotateY(radians(theta[i]));
    vertex(50,-i*12,0);
    popMatrix();
  }
endShape();*/
}

void mousePressed(){
 mousePressed=false;
for(int i =0;i<num;i++){
     theta[i]=0;
     kolik[i]=0;
   } 
  
}
