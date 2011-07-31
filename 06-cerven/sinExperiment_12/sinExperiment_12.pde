
int s;
float[] x = new float[201];
float[] y = new float[201];
void setup(){
 size(200,200); 
  background(0);
  frame.setTitle("sinExperiments by kof");
  stroke(255);
  noFill();
 for(int i = 0;i<height;i++){
  x[i]=width/2;
 y[i]=i; 
 }

}

void draw(){
 background(0);
  s++;
  beginShape();
  for(int i = 0;i<height;i++){
    y[i]=i;
     
    x[i]=dist(mouseX,mouseY,x[i],y[i]);
    x[i]+=(mouseX-(sin(s/(x[i]*10))+1)*width)/(PI*width);
    
curveVertex(x[i],y[i]); 
  }
  endShape();
}

