
class BOID {
  float x;
  float y;
  float speedX=0.1,speedY=0.5;
  float[] neighborsDist = new float[num];
  float[] headings = new float[num]; 
  
  float direction;
  float vliv;
  int ID;
  boolean meet;
  int reaktivita = 500,neighborNum;
   int vlivMax = 60;
  BOID(int id){
    x =random(width);
    y = random(height); 
    speedX = random(-1.0,1.0);
    speedY = random(-1.0,1.0);
    ID = id;
   
    vliv = random(15,vlivMax);
  }

  void drawMe(){

    for(int i = 0;i<num;i++){
      headings[i] = atan(speedY/speedX);
      direction = headings[ID];
      
      if(ID!=i){
        neighborNum+=1;
        neighborsDist[i]=dist(boid[i].x,boid[i].y,this.x,this.y); 

        //---------------------------> if another boid close to me
        if(neighborsDist[i]<=vliv){
          float factor = (neighborsDist[i]/(vliv+0.001))*reaktivita;
        /* speedX += boid[i].speedX/factor;
         speedY += boid[i].speedY/factor;
          */      
         
         speedX = constrain(speedX,-1.1-random(1.2),1.1+random(1.2));
         speedY = constrain(speedY,-1.1-random(1.2),1.1+random(1.2));
         
         
         speedX += random(-0.04,0.04);
         speedY += random(-0.04,0.04);
         
         //----------------------> attraction
         if (boid[i].x>x ){speedX+=(random(0.02)*boid[i].vliv)/vlivMax;}else if(boid[i].x<x){speedX-=(random(0.02)*boid[i].vliv)/vlivMax;}
         if (boid[i].y>y ){speedY+=(random(0.02)*boid[i].vliv)/vlivMax;}else if(boid[i].y<y){speedY-=(random(0.02)*boid[i].vliv)/vlivMax;}
         
         
         //----------------------> detraction
         if (boid[i].x>x ){speedX-=random(0.01);}else if(boid[i].x<x){speedX+=random(0.01);}
         if (boid[i].y>y ){speedY-=random(0.01);}else if(boid[i].y<y){speedY+=random(0.01);}
         
         if (neighborNum>60){
           if (boid[i].x>x ){speedX-=random(0.02);}else if(boid[i].x<x){speedX+=random(0.02);}
         if (boid[i].y>y ){speedY-=random(0.02);}else if(boid[i].y<y){speedY+=random(0.02);}
           
         }
    stroke(255,5);
    noFill();
    ellipse(x,y,neighborsDist[i]*2,neighborsDist[i]*2)   ;
        
    meet = true;  
      }
      }
    }//end For
    neighborNum=0;

    //-----------------------------------------------------> movements
    x += speedX;
    y += speedY;
    //-----------------------------------------------------> boundaries
    if (x > width){x=0;}else if(x<0){x=width;}
    if (y > height){y=0;}else if(y<0){y=height;}
    //-----------------------------------------------------> drawings
    /*pushMatrix();
    translate(x,y);
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
    rect(x,y,10,2);
    popMatrix();
    */
  }//end drawMe

}//end Class

