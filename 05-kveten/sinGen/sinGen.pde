
int num = 320;
float mod;
float[] cntr = new float[num];
int[] y = new int[num];
void setup(){
  size(320,240);
  background(0); 
  for(int x=0;x<num;x++){
    cntr[x]=x;
  }

}


void draw(){
  // background(0);
  fade(15);
  for(int x=0;x<num;x++){
    cntr[x]+=.1;
    mod=(sin(mouseY/10.0)+1)*height/2.0;
    y[x]=int(sin(cntr[x]/mod)*(dist(mouseX,0,x,0)/2.0));
  }





  for(int x=0;x<width;x++){
    set(x,y[x]+mouseY,color(255));  
  }

}

void fade(int _kolik){
  noStroke();
  fill(0,_kolik);
  rect(0,0,width,height);


}
