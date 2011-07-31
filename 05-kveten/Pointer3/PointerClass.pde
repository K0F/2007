class Pointer{
  float modifier=0.02;
  float X;
  float Y;
  float one;
  float capture[] = new float[2];
   color c ;

  Pointer(float _one,color _color){
    one = _one;
    c = _color;
  }

  void run(){
    capture[1]=capture[1]+X;
    modifier=0.00001/sqrt((abs(capture[0]-capture[1])+0.000001));
    one+=modifier;
    one=one%75;
    
    stroke(c,25);
    X =sin(one)*(one)/*(sin(X/map(mouseX+(cos(one/10.0)*2.0),0.0,width,1.0,75.0))*10)*/+width/2.0;
    Y=cos(one)*(one)*sin(one)*2.0+height/2.0;
    point(X,Y); 
  // one-=(p[int(constrain(one,0,p.length-1))].one);
    capture[0]=capture[0]+X;

  }




}
