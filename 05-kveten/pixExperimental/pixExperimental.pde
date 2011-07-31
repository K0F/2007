import processing.opengl.*;

color[] cols = {#00ff00,#ff0000,#0000ff};
color[] col = new color[200*200];
int cnt;
float sinat;

void setup(){
 size(200,200,P3D);
 frameRate(30);
 noStroke();
 loadPixels();
 for(int column = 1;column<height;column+=1){
  for(int i =0;i<width;i+=1){
    col[column*width+i] = color(cols[int(random(0,3))]);
    
  } 
 }
  updatePixels();
  
}
void draw(){
  cnt+=1;
for(int column = 1;column<height;column+=1){
 
  for(int i =0;i<width;i+=1){
 col[column*width+i]+=color(col[column*width+i])-color(dist((sin(cnt/100.0)+1.0)*(width/2.0),height/3.0,i,column)/(sin(cnt/100.0)+3.0))%255;
   pixels[column*width+(i)]=color(col[column*width+i]);
   
  } 
 }
}
