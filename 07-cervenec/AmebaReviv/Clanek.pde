class Clanek{
  int pocet;
  int no;
  float X,Y;
  float x,y;
  private Ameba a;
  float theta;
  float speed = 10.0;

  Clanek(Ameba _a,int _kolik,int _no){
    //super(); 
    a=_a;
    no=_no; 
    pocet = _kolik;
    X=a.X();
    Y=a.Y();
  }

  void run(){       
    compute();      

  }

  void drw(){
    point (x,y); 

  }

  void compute(){
    X+=(a.X()-X)/speed;
    Y+=(a.Y()-Y)/speed;





    theta = ((no+1)/(pocet+0.0f)/2f)*TWO_PI*2.00f;



    x+=((X+sin(theta)*(a.radius()))-(x))/speed;
    y+=((Y+cos(theta)*(a.radius()))-(y))/speed;


    //----------------boundaries>>
    if(x>width-bounds){
      x=width-bounds;
    }
    if(y>height-bounds){
      y=height-bounds;
    }
    if(x<bounds){
      x=bounds;
    }
    if(y<bounds){
      y=bounds;
    }

    drw();
  }



}
