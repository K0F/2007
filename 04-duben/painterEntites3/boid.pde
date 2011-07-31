
class BOID {
  float x;
  float y;
  float speedX=0.1,speedY=0.5;
  float[] neighborsDist = new float[num];
  float[] headings = new float[num]; 
  float[] tep = new float[num];
  float direction;
  float vliv = 500.0;
  int ID;
  boolean meet;
  int reaktivita = 30;

  BOID(int id){
    x =random(width/2-50,width/2+50);
    y = random(height/2-50,height/2+50); 
    speedX = random(-1.0,1.0);
    speedY = random(-1.0,1.0);
    ID = id;
    vliv = 200;
  }

  void drawMe(){
 
  tep[ID] += 0.15;
    for(int i = 0;i<num;i++){
      headings[i] = atan2(speedY,speedX);
      direction = headings[i];
     
      if(ID!=i){
        
        neighborsDist[i]=dist(boid[i].x,boid[i].y,this.x,this.y);
        //tep[ID] += neighborsDist[i]/1000.0;
       color a = color(255);
       color b = color((cos(tep[ID]/100.0)+1)*255,0,0);
         //smooth();
       
       
         noFill();
        stroke(lerpColor(a,b, constrain(neighborsDist[i]/(width+50),0,1)   ),10);
       // rect(0,0,5,5);
        line(this.x+0.25,this.y+0.25,boid[i].x+0.25,boid[i].y+0.25);
        noStroke();
       
        //---------------------------> if another boid close to me
        if(neighborsDist[i]<=vliv){
          float factor = (neighborsDist[i]/(vliv+0.001))*reaktivita;
         speedX += boid[i].speedX/factor;
         speedY += boid[i].speedY/factor;
         
         
         
          speedX = constrain(speedX,-2.1-random(1.2),2.1+random(1.2));
         speedY = constrain(speedY,-2.1-random(1.2),2.1+random(1.2));
         
         
         speedX += random(-0.74,0.74);
         speedY += random(-0.74,0.74);
         
         //----------------------> attraction
         if (boid[i].x>x ){speedX+=random(0.1)+sin(tep[ID]);}else if(boid[i].x<x){speedX-=random(0.1)+sin(tep[ID]);}
         if (boid[i].y>y ){speedY+=random(0.1)+sin(tep[ID]);}else if(boid[i].y<y){speedY-=random(0.1)+sin(tep[ID]);}
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
    x += speedX/(2.0);
    y += speedY/(2.0);
    //-----------------------------------------------------> boundaries
    if (x > width){speedX*=-0.9;x-=1;}else if(x<0){speedX*=-0.9;x+=1;}
    if (y > height){speedY*=-0.9;y-=1;}else if(y<0){speedY*=-0.9;y+=1;}
    //-----------------------------------------------------> drawings
   /* pushMatrix();
    translate(x,y);
    rotate(direction);
    translate(-x,-y);
  
    if(!meet){
    
    noStroke();
    fill(25,255,25);
    }else{
    fill(0,150);
    noStroke();
    meet = false;
  }
    
    rectMode(CENTER);
    rect(x,y,2,2);
    popMatrix();
*/

  }//end drawMe

}//end Class

