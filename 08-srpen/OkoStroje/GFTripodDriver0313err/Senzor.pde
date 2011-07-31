class Senzor{
  int x,y;
  int id;
  int mem;
  int tresh = 15;
  int lval = 0;
  boolean hit = false;
  

  Senzor(int _x,int _y,int _id,int _tresh){
    x=_x;
    y=_y;
    tresh=_tresh;
    id=_id;  
    
  }

  public boolean sudden(int _source){
    boolean b;

    if(abs(mem-_source)>=tresh){
      b = true;
      hit = true;
    }
    else{
      b = false;
      hit = false;     
    }

    mem=(_source);
    return b;
  }

  public int last(){
    return lval;  
  }




}
