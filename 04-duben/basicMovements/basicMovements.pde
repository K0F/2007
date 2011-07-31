

CHARACTER charac;
GROUND gr;

int num = 40;

void setup(){
 size (400, 200); 
  background(255);
 
  charac = new CHARACTER();
  gr = new GROUND(0,height-5,width,height-5); 
     
  }


void draw(){
 falloff(50);
 
 
 gr.drawMe();
 
 charac.moveKey();
 charac.movePhy();
 charac.drawMe();
 
  
  
  
}

void falloff(int kolik){
 noStroke();
 rectMode(CORNER);
  fill(255,kolik);
  rect(0,0,width,height); 
}
