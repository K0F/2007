import processing.opengl.*;

Cervik[] r;
int colr;
void setup() 
{
  size(800, 600,OPENGL);
  
  frameRate(30);
   setFullScreen( false ); 
 
  setResolution( 800, 600 ) ;
 
 createFullScreenKeyBindings() ;
 
  r = new Cervik[3000];
  for(int i = 0; i < r.length; i++){
    if(i<r.length/2){colr = 255;}else{colr = 0;}
    r[i] = new Cervik(random(5,width-5),random(5,height-5),colr,i);
  }

}

void draw() { 
  noStroke();
  fill(120,15);
  rect(0,0,width,height);
  //if(deathend>0){h1.speedA();}
  for(int i = 0; i < r.length; i++){
    r[i].update();
  }
} 

void keyPressed(){
  for(int i = 0; i < r.length; i++){
    r[i].speedA();
  }
}
