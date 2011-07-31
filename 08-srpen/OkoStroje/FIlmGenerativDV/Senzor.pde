class Senzor{
  int x,y;
  int id;
  PApplet parent;
  int mem;
  int tresh = 15;
  
  Senzor(int _x,int _y,int _tresh){
    x=_x;
    y=_y;
    tresh=_tresh;
    //id=_id;  
    //parent=_parent;
  }
  
  public boolean sudden(int _source){
    boolean b;
    
    if(abs(mem-_source)>=tresh){
      b = true;
    }else{
     b = false;      
    }
    
    mem=(_source);
    return b;
  }
  
  
}
