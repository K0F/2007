/*import fullscreen.*; 

FullScreen fs; 
*/
int[] skipper = new int[46];
float x=0,y=0;
float tarX,tarY;
int cnt;
int nextRound=1;
int shift = 0;

void setup(){
  size(1000,1000);
  background(0);
  frameRate(30);
   //fs = new FullScreen(this); 
   //fs.setResolution(1024,768);
 
  
  // enter fullscreen mode
  
  // let ctrl+f switch to window mode

  
  
  
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
 //frame.setAlwaysOnTop(true);
 
}

void draw(){
 
 stroke(255,10);
beginShape();
 vertex(x,y);
 x+=(tarX-x)/1.00001f;
 y+=(tarY-y)/1.00001f;
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
   shift+=PI*3.0f; 
  if(nextRound>skipper.length-1){
   nextRound=1;
 
  }
 } 
  tarX=(width/2)+map(cos(skipper[cnt]/(frameCount+1f)),-1.1f,1.1f,-width/2f,width/2f);
 tarY=(height/2)+map(sin(skipper[cnt]/(frameCount+1f)),-1.1f,1.1f,-height/2f,height/2f);
}

void keyPressed(){
 save("fibona.png"); 
  
}
