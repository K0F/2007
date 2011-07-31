    
  class Ameba{
  
 
  private Clanek[] cl; 
  float x = width/2;;
  float y =  height/2;
   float R =  50.0f;
  int pocetClanku = 18;
  int last = 0;
  int id;
 float distance;
 
  color[] colors = {#FFCC00};
 
    Ameba(float _x, float _y,float _R,int _pocetClanku,int _id){
     x=_x;
     y=_y;
     R=_R;
     id= _id;
     reset(_pocetClanku);

    }
    
    void draw(){
     stroke(colors[0],88);
     point (x, y);
     runInstances();
    collisionDetect();     
    }
    
    void runInstances(){
    //fill(colors[0],88);
      beginShape();
      for(int i = 0; i<pocetClanku;i++){
      cl[i].run();
                 
     // line(cl[i].x,cl[i].y,cl[last].x,cl[last].y);
      vertex(cl[i].x,cl[i].y);
     
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
    
    void collisionDetect(){
      for(int i = 0;i<a.length;i++){
       if(i!=id){distance = dist(x,y,a[i].x,a[i].y);
        
      
      
      if(distance<=((R+a[i].R))){
      collision(i);
      
      }
       }
    }
      
    }
    
    void collision(int _idC){
     for(int i = 0;i<cl.length;i++){
       for(int q = 0;q<a[_idC].cl.length;q++){
      if((abs(cl[i].x-a[_idC].cl[q].x)<10f)&&(abs(cl[i].y-a[_idC].cl[q].y)<10f)){
       cl[i].x+=(cl[i].x-a[_idC].cl[q].x)/(0.5*cl[0].speed);
       cl[i].y+=(cl[i].y-a[_idC].cl[q].y)/(0.5*cl[0].speed);
      } 
       
      }
     }
      
      
      
    }
    
   
    
   


  }
 
  
 
 
