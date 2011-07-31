int num = 2505;
color[] c = {#1E3410,#233105,#EFF0CB,#2C0A08};
Pointer[] p = new Pointer[2550];
int rot;
void setup(){
  size(200,200,P3D);
  background(0);
  stroke(255,15);
  frame.setTitle("sin degenerator >> kof");
  frame.show();
  //smooth();
  for(int i = 0;i<p.length;i++){
    
    p[i] = new Pointer(i*(0.1111*i),c[i%c.length]); 
  }

}

void draw(){
  backGround(1);
  rot+=1;

  for(int i = 0;i<p.length;i++){
    stroke(255,25);
    p[i].run(); 
    
  }
  



}

void backGround(int _ridOff){
fill(0,_ridOff);
  rect(0,0,width,height);
}

