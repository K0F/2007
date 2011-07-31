import processing.opengl.*;

color[] cols = {#3C5530,#B8CBAF,#FFF040};
color[] col = new color[200*200];
int cnt;
void setup(){
 size(200,200,OPENGL);
 frameRate(30);
 noStroke();
 for(int column = 1;column<height;column+=3){
  for(int i =0;i<width;i+=3){
    col[column*width+i] = cols[int(random(0,3))];
    
  } 
 }
  
  
}
void draw(){
  cnt+=3;
for(int column = 1;column<height;column+=3){
  for(int i =0;i<width;i+=3){
    fill(col[column*width+(i)]);
   rect((i+cnt)%width,column,3,3);
  } 
 }
}
