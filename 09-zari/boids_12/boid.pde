
class BOID {
  float x;
  float y;
  float speedX=0.1,speedY=0.5;
  float[] neighborsDist = new float[num];
  float[] headings = new float[num]; 
  
  float direction;
  float vliv = 300.0;
  int ID;
  boolean meet;
  int reaktivita = 5000;

  BOID(int id){
    x =random(width);
    y = random(height); 
    speedX = random(-1.0,1.0);
    speedY = random(-1.0,1.0);
    ID = id;
    vliv = 25;
  }

  void drawMe(){

    for(int i = 0;i<num;i++){
      headings[i] = atan(speedY/speedX);
      direction = headings[ID];
      
      if(ID!=i){
        neighborsDist[i]=dist(boid[i].x,boid[i].y,this.x,this.y); 

        //---------------------------> if another boid close to me
        if(neighborsDist[i]<=vliv){
          float factor = (neighborsDist[i]/(vliv+0.001))*reaktivita;
         speedX += boid[i].speedX/factor;
         speedY += boid[i].speedY/factor;
         
         
         
          speedX = constrain(speedX,-1.1-random(1.2),1.1+random(1.2));
         speedY = constrain(speedY,-1.1-random(1.2),1.1+random(1.2));
         
         
         speedX += random(-0.04,0.04);
         speedY += random(-0.04,0.04);
         
         //----------------------> attraction
         if (boid[i].x>x ){speedX+=random(0.1);}else if(boid[i].x<x){speedX-=random(0.1);}
         if (boid[i].y>y ){speedY+=random(0.1);}else if(boid[i].y<y){speedY-=random(0.1);}
         //----------------------> detraction
         if (boid[i].x>x ){speedX-=random(0.1);}else if(boid[i].x<x){speedX+=random(0.1);}
         if (boid[i].y>y ){speedY-=random(0.1);}else if(boid[i].y<y){speedY+=random(0.1);}
       
         /*
         //---------------------------> proxiate my speed
         speedX += ((boid[i].speedX)*(factor*0.0007));
         speedY += ((boid[i].speedY)*(factor*0.0007));
         
         
        
         //---------------------------> and randomize
         
         
         if(x<boid[i].x){speedX += factor/5000.0;}else if(x>boid[i].x){speedX -= factor/5000.0;}
         if(y<boid[i].x){speedY += factor/5000.0;}else if(y>boid[i].y){speedY -= factor/5000.0;}
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
    rotate(direction);
    translate(-x,-y);
  
    if(!meet){
    
    noStroke();
    fill(#FFCC00,50);
    }else{
    fill(255,5);
    noStroke();
    meet = false;
  }
    
    
    rect(x,y,1.4,1.4);
    popMatrix();

  }//end drawMe

}//end Class

