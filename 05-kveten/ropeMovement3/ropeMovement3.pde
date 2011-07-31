import processing.opengl.*;

int num = 1000;
Bone[] bone = new Bone[num+1];
float globalSpeed = 2.1,globalLight = 10;
void setup(){
  size(800,600,OPENGL);
  for(int i = 0;i<num;i++){
    bone[i]=new Bone(random(width),random(height),i);
  }
}

void draw(){
  fadeout(15);
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

    X += (bone[constrain(id-1,0,num-1)].X-X)/globalSpeed;
    Y += (bone[constrain(id-1,0,num-1)].Y-Y)/globalSpeed;
    bone[0].X=mouseX;
    bone[0].Y=mouseY;
  }

  void render(){
    noFill();
    if(id!=0){
      pushMatrix();
      
      translate(X,Y);
      theta=atan2(bone[constrain(id-1,0,num-1)].Y-Y,bone[constrain(id-1,0,num-1)].X-X);
      rotate(theta);
      stroke(255,(abs(bone[constrain(id-1,0,num-1)].Y-Y)+abs(bone[constrain(id-1,0,num-1)].X-X))*globalLight);
      line(-5,0,-50,0);
      stroke(255,0.3*(abs(bone[constrain(id-1,0,num-1)].Y-Y)+abs(bone[constrain(id-1,0,num-1)].X-X))*globalLight);
      rect(0,155,3,200);


      popMatrix();
      line(X,Y,bone[constrain(id-1,0,num-1)].X,bone[constrain(id-1,0,num-1)].Y);
    } 
  }
  
 
}

void fadeout(int _kolik){
 fill(0,_kolik);
  rect (0,0,width,height);
  
}
