
C c;

void setup(){
  size(200,200);
  c = new C(); 
  background(0);
  stroke(255);
}

void draw(){
  c.p();
}

class C{
  float x,y;
  float x2,y2;
  float uhel = 90.0f;
  int[] row = {
    0,1,1,0,1,1,0,0  };
  int cnt;

  C(){
    x=random(width);
    y=random(height);
  }

  void L(){
    pushMatrix();
    translate(-x,-y);
    
    rotate(radians(-uhel));
    translate(0,-5); 
    translate(x,y);
    point(x,y);
    popMatrix();
    translate(0,-5);
  }

  void R(){
    pushMatrix();
    translate(-x,-y);
    rotate(radians(uhel));
    translate(0,-5); 
    translate(x,y);
    point(x,y);
 popMatrix();

  }

  void p(){
    cnt ++;
    cnt=cnt%(row.length-1);
    x2=x;
    y2=y;

    if(row[cnt]==0){
      R();
      
    }
    else{
      L();
      point(x,y);

    } 

  }


}
