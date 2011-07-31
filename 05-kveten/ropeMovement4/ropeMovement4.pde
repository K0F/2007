import processing.opengl.*;

int num = 2000;
Bone[] bone = new Bone[num+1];
float globalSpeed = 1.111,globalLight = 20;
void setup(){
  noSmooth();
  size(1024,768,OPENGL);
  setFullScreen( false );               // get fullscreen exclusive mode
  setResolution( 1024,768 );           // change resolution to 640, 480
   createFullScreenKeyBindings();
  cursor(CROSS);
  for(int i = 0;i<num;i++){
    bone[i]=new Bone(random(width),random(height),i);
  }
}

void draw(){
  fadeout(255);
  for(int i = 0;i<num-1;i++){
    bone[i].update();
  }

}


class Bone{
  float X,Y,theta,speed;
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
    speed = dist(bone[constrain(id-1,0,num-1)].X,bone[constrain(id-1,0,num-1)].Y,X,Y)/2.0;
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
      line(-50,0,-150,0);
      stroke(255,0.3*(abs(bone[constrain(id-1,0,num-1)].Y-Y)+abs(bone[constrain(id-1,0,num-1)].X-X))*globalLight);
      
      rect(0,speed*2,10,5*speed);
    
      rect(0,-speed*2,10,-5*speed);


      popMatrix();
      line(X,Y,bone[constrain(id-1,0,num-1)].X,bone[constrain(id-1,0,num-1)].Y);
    } 
  }
  
 
}

void fadeout(int _kolik){
 fill(0,_kolik);
  rect (0,0,width,height);
  
}
