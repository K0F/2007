LSYS ls;

void setup(){
  size(200,200); 
  background(0);
  ls = new LSYS();
  stroke(255);
}

void draw(){
  ls.run();
}

class LSYS{
  float x = width/2,y=height/2,x2,y2;
  float seg = 3.0f;

  int[] sequence = {  
    0,1,0,0,1,0,1,1,1,0,0
  };

  float angle = radians(30.0f);
  int cnt;
  float len = 3.0;

  LSYS(){
   ;
  }

  void run(){
    compute(); 
    
  }

  void compute(){
    cnt++;
    cnt=cnt%(sequence.length-1);

    if(sequence[cnt]==0){
      R();  
    }
    else{
      L(); 
    }
  }

  void L(){
    translate(x,y);
    rotate(angle);
    line(0,-len,0,0);
    translate(0,-len);
    y-=len;
  }

  void R(){
    translate(x,y);   
    rotate(-angle);
    line(0,-len,0,0);
    translate(0,-len);
    y-=len;    
  }

}
