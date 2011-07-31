float x,y;
void setup(){
 size(200,200);
 background(0);
  cursor(CROSS);
}
void draw(){
 x =mouseX;
  background(0);
  for(int i = 0;i<mouseX;i++){
    
  zmap(i+x,0,width,0,3);
  fill(255);
 rect(y,height/2,2,2);
  }
 noStroke();
 fill(255,50);
 rect(x,height/2,2,2);
 fill(255,2);
 rect(y,height/2,2,2);
 
  
  
}




