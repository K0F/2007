String[] sc;
int whichLine = 0;

void setup(){

  size(160,120);
  frameRate(25);
  background(0);
  
  sc = loadStrings("script.txt");
  
}

void draw(){
  
  if(frameCount>=readTime(sc[sc.length-1])){
   this.exit(); 
  }
  
  if(frameCount==readTime(sc[whichLine])){
    background(readVal(sc[whichLine]));
    whichLine+=1; 
    
  }
  
  
}

int readTime(String _tmp){
  String[] value = split(_tmp,",");
  int time = parseInt(value[0]);
  return time;
}

int readVal(String _tmp){
  String[] value = split(_tmp,",");
  int val = parseInt(value[1]);
  return val;
}
