
class BOID {
  float x;
  float y;
  float speedX=0.1,speedY=0.5;
  float[] neighborsDist = new float[num];
  float[] headings = new float[num]; 
  
  float direction;
  float vliv = 200.0;
  float speedLim;
  int ID;
  boolean meet;

  BOID(int id){
    x =random(width);
    y = random(height); 
    speedX = random(-1.0,1.0);
    speedY = random(-1.0,1.0);
    ID = id;
    vliv = random(15,60);
    speedLim = random(0.5,1.2);
  }

  void drawMe(){

    for(int i = 0;i<num;i++){
      headings[i] = atan(speedY/speedX);
      
      
      if(ID!=i){
        neighborsDist[i]=dist(boid[i].x,boid[i].y,this.x,this.y); 

        //---------------------------> if another boid close to me
        if(neighborsDist[i]<=vliv){
          float factor = neighborsDist[i]/(vliv+0.001);
         
         //---------------------------> proxiate my speed
         speedX += map((boid[i].speedX)*(factor),-1.0,1.0,-0.1,0.1);
         speedY +=  map((boid[i].speedY)*(factor),-1.0,1.0,-0.1,0.1);
         //---------------------------->create limit for speed in both directions
         if ((speedX>speedLim)||(speedX<-speedLim)){
         speedX *= 0.001;
         }
        if ((speedY>speedLim)||(speedY<-speedLim)){
         speedY *= 0.001;
         }
         //---------------------------> and randomize
         speedX += random(-0.04,0.04);
         speedY += random(-0.04,0.04);
         /*if(neighborsDist[i]<5){factor*=random(1.0);}
         if(x<boid[i].x){speedX -= factor/1000.0;}else if(x>boid[i].x){speedX += factor/1000.0;}
         if(y<boid[i].x){speedY -= factor/1000.0;}else if(y>boid[i].y){speedY += factor/1000.0;}
    */
    meet = true;  
      }
      }
    }//end For

    //-----------------------------------------------------> movements
    x += speedX;
    y += speedY;
    //-----------------------------------------------------> boundaries
    if (x > width){x=0;}else if(x<0){x=width;}
    if (y > height){y=0;}else if(y<0){y=height;}
    //-----------------------------------------------------> drawings
    pushMatrix();
    translate(x,y);
    if(headings[ID]>direction){direction += (headings[ID]-direction)/60.0;}else if(headings[ID]<direction){direction -=  (direction-headings[ID])/60.0;}
    rotate(direction);
    
    translate(-x,-y);
    
    if(!meet){
    
    noStroke();
    fill(0);
    }else{
    fill(255,16,16,150);
    noStroke();
    meet = false;
  }
    
    rectMode(CENTER);
    rect(x,y,3,3);
    
    popMatrix();

  }//end drawMe

}//end Class

