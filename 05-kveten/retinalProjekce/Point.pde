class Point{
  int x,y,data;
  Point(int _x,int _y){
    x=_x;
    y=_y;
  } 

  void run(int data,int _alpha,int _phase){
    stroke((data),(_alpha));
    render(_phase);
  }


  void render(int _phased){
   
    switch(_phased) {
  case 0: 
    line(x*2,y*2,x*2+1,y*2); 
    break;
  case 1: 
   line(x*2+1,y*2,x*2+2,y*2); 
    break;
   case 2: 
    line(x*2+1,y*2+1,x*2+2,y*2+1); 
    break;
  case 3: 
   line(x*2,y*2+1,x*2+1,y*2+1); 
    break;
    
}
   
//line(x*1,y*1,x*1+1,y*1); 
  }




}
