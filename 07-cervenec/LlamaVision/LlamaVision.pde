/**
*Llama cudo vision
*
*
*/


Cudo[] c = new Cudo[200];

void setup(){
 size(200,200); 
  background(0);
  for(int i = 0;i<c.length;i++){
   c[i] = new Cudo(100,100,random(-0.1,0.1),random(-1.1,1.1)); 
  }
}

void draw(){
  for(int i = 0;i<c.length;i++){
   c[i].run(); 
  }
  
  
}

void mousePressed(){
  background(0);
  for(int i = 0;i<c.length;i++){
   c[i] = new Cudo(100,100,random(-0.1,0.1),random(-1.1,1.1)); 
  } 
  
}



class Cudo{
  float sX,sY;
  float x,y;
  float time;
  float koef;
  float step;
  
  Cudo(float _x,float _y,float _step, float _koef){
    prepare(_x,_y,_step,_koef);
  }  

  void prepare(float _x,float _y,float _step,float _koef){
    sX=_x;
    sY=_y;
    x=sX;
    y=sY;
    koef=_koef;
    step=_step;
  }

  void run(){
    time += step; 
    koef += time/100.0;

    x+=cos(time)*koef;
    y+=sin(time)*koef;
    
    stroke(#CCCCCC,20);
    
    point(x,y);


  }


}
