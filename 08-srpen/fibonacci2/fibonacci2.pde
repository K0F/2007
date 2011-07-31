int[] skipper = new int[47];
float x=0,y=0;
float tarX,tarY;
int cnt;
int nextRound=1;
int shift = 0;

void setup(){
  size(400,400);
  background(0);
  frameRate(30);
  skipper[0]=0;
  skipper[1]=1;
  for(int i = 2;i<skipper.length;i++){    
 skipper[i] += skipper[i-1]+skipper[i-2]; 
  }
 tarX=(width/2)+map(cos(skipper[cnt]/1000.0),-1f,1f,-width/2f,width/2f);
 tarY=(height/2)+map(sin(skipper[cnt]/1000.0),-1f,1f,-height/2f,height/2f);
 x=tarX;
 y=tarY+1;
  smooth();
 // println(skipper);
 frame.setAlwaysOnTop(true);
}

void draw(){
 
 stroke(255,55);
beginShape();
 vertex(x,y);
 x+=(tarX-x)/20.0;
 y+=(tarY-y)/20.0;
 //println(x);
 if ((abs(x-tarX)<1)&&(abs(y-tarY)<1)){
  next(); 
 }
 
 //point(x,y);
  
vertex(x,y);  
  endShape();
}

void next(){
 
  cnt++;
 if((cnt%(skipper.length-1)==0)&&(cnt!=0)){
  nextRound+=1;
  cnt=1;
  if(nextRound>skipper.length){
   nextRound=1;
  shift+=100; 
  }
 } 
  tarX=(width/2)+map(cos(skipper[cnt]/(skipper[nextRound]+shift)),-1f,1f,-width/2f,width/2f);
 tarY=(height/2)+map(sin(skipper[cnt]/(skipper[nextRound]+shift)),-1f,1f,-height/2f,height/2f);
}
