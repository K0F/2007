    
  class Ameba{
  
 
  private Clanek[] cl; 
  float x = width/2;;
  float y =  height/2;
  float sX,sY;
  float R =  50.0f;
  int pocetClanku = 18;
   int last = 0;

  color[] colors = {#FFCC00};
 
    Ameba(float _x, float _y,float _R,int _pocetClanku){
     x=_x;
     y=_y;
     R=_R;
     reset(_pocetClanku);

    }
    
    void draw(){
     stroke(colors[0],88);
     point (x, y);
      runInstances();      
    }
    
    void runInstances(){
      beginShape();
      for(int i = 0; i<pocetClanku;i++){
      cl[i].run();
          
     // line(cl[i].x,cl[i].y,cl[last].x,cl[last].y);
      vertex(cl[i].x,cl[i].y);
      last = i;
      } 
      endShape(CLOSE);
      
    }
    
    void reset(int _pocet){
          
      pocetClanku =constrain(_pocet,1,10000);
            
       cl = new Clanek[pocetClanku];
      
      for(int i = 0; i<cl.length;i++){
      cl[i]=new Clanek(this,cl.length,i);
      }
      
      
    }
    
    void setPos(float _x,float _y){
     x=_x;
    y=_y; 
    }
    
    float radius(){
     return R;      
    }
    
    float X(){
     return x; 
    }
    
    float Y(){
      return y;
    }
    
   
    
   


  }
 
  
 
 
