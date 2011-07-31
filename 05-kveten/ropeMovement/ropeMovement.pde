import processing.opengl.*;

int num = 100;
Bone[] bone = new Bone[num+1];

void setup(){
  size(300,300,OPENGL);
  for(int i = 0;i<num;i++){
  bone[i]=new Bone(random(width),random(height),i);
  }
}

void draw(){
  background(0);
  for(int i = 0;i<num-1;i++){
  bone[i].update();
  }
  
}


class Bone{
  float X,Y,theta;
  int id;
  
  Bone(float _x, float _y,int _id){
    X=_x;
    Y=_y;
    id=_id;
    
   }
  
  void update(){
  position();
  if(id>5){
  render();  
  }
  }
  
  void position(){
    
   X += (bone[constrain(id-1,0,num-1)].X-X)/2.0;
   Y += (bone[constrain(id-1,0,num-1)].Y-Y)/2.0;
      bone[0].X=mouseX;
      bone[0].Y=mouseY;
  }
 
 void render(){
   if(id!=0){
   pushMatrix();
  stroke(255,(abs(bone[constrain(id-1,0,num-1)].Y-Y)+abs(bone[constrain(id-1,0,num-1)].X-X))*100.0);
  translate(X,Y);
  theta=atan2(bone[constrain(id-1,0,num-1)].Y-Y,bone[constrain(id-1,0,num-1)].X-X);
  rotate(theta);
  line(-5,0,5,0);
    line(0,-50,0,50);
  
   
  popMatrix();
  line(X,Y,bone[constrain(id-1,0,num-1)].X,bone[constrain(id-1,0,num-1)].Y);
 } 
 }
}
