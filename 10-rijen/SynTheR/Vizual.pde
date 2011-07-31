class Vizual{
  int[] x;
  int[] y;
  boolean[] b;
  int buff = 50;
  int cntr = 0;
  int id;
  int siz = 10;
  color c;

  Vizual(int _buff){
    buff = _buff;
    x = new int[buff];
    y = new int[buff];
    b = new boolean[buff];
    remove();
  }

  void add(int _x,int _y){
    x[cntr] = _x;
    y[cntr] = _y;
    b[cntr] = true;
    cntr+=1;
    if(cntr>=buff){
     remove(); 
    }
  }

  void remove(){
    cntr = 0;
    for(int i = 0;i < buff;i++){
      x[i] = -1;
      y[i] = -1; 
      b[cntr] = false;
    }

  }

  void viz(color _c,int opac){
    c=_c;
    noFill();
    stroke(c,opac);
    
    beginShape();
    for(int i = 0;i < buff; i++){
      if(b[i]){       
        line(x[i],y[i]-siz/2,x[i],y[i]+siz/2);
        line(x[i]-siz/2,y[i],x[i]+siz/2,y[i]);        
      } 
    }
    endShape();
    
  } 


}
