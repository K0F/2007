import processing.opengl.*;

float[] pri = new float[401]; 

void setup(){
  size(400,200,OPENGL);
  frameRate(50);
  background(255); 
  smooth();
  for(int r =1;r<200;r++){ 
    
    pri[r]=random(0.1,0.5);
  }

}
float[] k = new float[401];
float[] POSUN = new float[401];
float[] POSUNS = new float[401];
void draw(){
  fill(255,25);
  stroke(0,5);
  rect(1,1,width-2,height-2);
  
  for(int i = 0;i<height;i+=2){
    POSUN[i]+=pri[(int)k[i]]/100.0;
    POSUNS[i]=sin(POSUN[i])*50.0;
    k[i]=(k[i]+(sin(k[i+1]+pri[i])*2.0))%width;
    noStroke();
    fill(0);
    ellipse(k[i],POSUNS[i]+i+((sin(k[i]/(pri[i+1]*10))+1)*5.0),2,2);
  }
}

