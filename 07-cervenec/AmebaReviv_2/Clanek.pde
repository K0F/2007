class Clanek{
  int pocet;
  int no;
  float X,Y;
  float x,y;
  private Ameba a;
  float theta;
  float speed = 50.0;
  float sousedDist1;
  float sousedDist2;

  Clanek(Ameba _a,int _kolik,int _no){
    //super(); 
    a=_a;
    no=_no; 
    pocet = _kolik;
    X=a.x;
    Y=a.x;
  }

  void run(){       
    compute();      
    drw();
  }

  void drw(){
    point (x,y); 

  }

  void compute(){
//----------------------------vtah k centru >>

    X+=(a.X()-X)/speed;
    Y+=(a.Y()-Y)/speed;

//--------------------------tvar >>

     theta = ((no+1)/(pocet+0.0f)/2f)*TWO_PI*2f;
    x+=((X+sin(theta)*(a.radius()))-(x))/speed;
    y+=((Y+cos(theta)*(a.radius()))-(y))/speed;

//--------------------------soudrznost >>

    if((no!=0)&&(no!=pocet-1)){
      sousedDist1=dist(a.cl[no-1].x,a.cl[no-1].y,x,y);
      sousedDist2=dist(a.cl[no+1].x,a.cl[no+1].y,x,y);
    }
    else if(no == 0){
      sousedDist1=dist(a.cl[pocet-1].x,a.cl[pocet-1].y,x,y);
      sousedDist2=dist(a.cl[no+1].x,a.cl[no+1].y,x,y);
    } 
    else if(no == pocet-1){
      sousedDist1=dist(a.cl[no-1].x,a.cl[no-1].y,x,y);
      sousedDist2=dist(a.cl[0].x,a.cl[0].y,x,y);

    }
    sousedDist1=constrain(sousedDist1,1,width*2)*(0.05*pocet);
    sousedDist2=constrain(sousedDist1,1,width*2)*(0.05*pocet);

    if((no!=0)&&(no!=pocet-1)){
      x+=(a.cl[no-1].x-x)/sousedDist1;
      y+=(a.cl[no-1].y-y)/sousedDist1;
      x+=(a.cl[no+1].x-x)/sousedDist2;
      y+=(a.cl[no+1].y-y)/sousedDist2;

    } 
    else if(no == 0){
      x+=(a.cl[pocet-1].x-x)/sousedDist1;
      y+=(a.cl[pocet-1].y-y)/sousedDist1;
      x+=(a.cl[no+1].x-x)/sousedDist2;
      y+=(a.cl[no+1].y-y)/sousedDist2;

    } 
    else if(no ==  pocet-1){
      x+=(a.cl[no-1].x-x)/sousedDist1;
      y+=(a.cl[no-1].y-y)/sousedDist1;
      x+=(a.cl[0].x-x)/sousedDist2;
      y+=(a.cl[0].y-y)/sousedDist2;

    }

    //-------------------------------------hranice>>

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
