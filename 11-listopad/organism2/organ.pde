class Organism{
  float x,y,tx,ty;
  float speed;
  float vel;
  PImage img;
  int id,which;
  float theta;
  float distance;

  Organism(int _id,float _speed,int cs){
    id=_id;

    x=tx=random(width);
    y=ty=random(height);
    speed=_speed;
    img = bank[cs];
    vel=img.width/2.0;
  }

  void run(){

    compute();

    pushMatrix();
    translate(x,y);
    rotate(theta-HALF_PI);
    tint(255,15);
    image(img,0-vel/2.0,0-vel/2.0,vel,vel);
    popMatrix();
  }

  void compute(){

    for(int i =0;i<num;i++){
      which = constrain(id-1,0,num);
      if((i==which)&&(id!=0)){

        tx+=(o[which].tx-tx)/speed;
        ty+=(o[which].ty-ty)/speed;      
      }//end if 
      else if(id==0){
        tx+=(random(width)-tx)/speed;
        ty+=(random(height)-ty)/speed;
      }
    }//end for

    x+=(tx-x)/speed;
    y+=(ty-y)/speed;

    theta = atan2(ty-y,tx-x);

  }//end void


}
