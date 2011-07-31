import processing.opengl.*;
import traer.physics.*;

Particle mouse1,mouse2,mouse3,d;
ParticleSystem physics;

PFont font;

int first = 1;
int firstRun = 1;
int counter = 0;
float startX,startY,endX,endY,polomer;
float bx,by;
float[] bs = new float[3];
float[] bdifx = new float[3];
float[] bdify = new float[3];
float[] bdifxtah = new float[3];
float[] bdifytah = new float[3];
int[] killed = new int[2001];
boolean freeze = false; 
float prumY,prumX; 

void setup()
{
  size( 800, 600, OPENGL );
  frameRate( 30 );
  smooth();
  ellipseMode( CENTER );
  strokeWeight(1);
  noStroke();
  cursor(CROSS);
  background(0);
  font = loadFont("Uni0553-16.vlw");
  textFont(font , 16);
  physics = new ParticleSystem(0, 0.001);
  fill(35);
  mouse1 = physics.makeParticle();
  mouse2 = physics.makeParticle();
  mouse3 = physics.makeParticle();
  mouse1.makeFixed();
  mouse2.makeFixed();
  mouse3.makeFixed();
}

void draw()
{
  if (firstRun == 1 || firstRun == 2 || firstRun == 3) {
    fill(0,25);
    noStroke();
    rect(0,0,width,height);
    noFill();
    stroke(255,5);
    for (int i = 0;i<3;i++){      
      ellipse(bdifx[i], bdify[i], bs[i]*2, bs[i]*2);
    }
  } 
  else {
    //---------------------->fadeout
    fill(0,100);
    noStroke();
    rect(0,0,width,height);
    mouse1.moveTo( (width/2)-32, height/2, 0 );
    mouse2.moveTo(width/2, height/2, 0 );
    mouse3.moveTo((width/2)+32, height/2, 0 );
    //----------------------------------------------------------------------->partikly
    for (int i = 3;i<500;i++){
      if (first == 1) {
        Particle d = physics.makeParticle( 1.0, i*.8,height-1, 0 );
        d.setVelocity( 0, 1, 0 );
        physics.makeAttraction( mouse1, d, bs[0], 8);
        physics.makeAttraction( mouse2, d, bs[1], 8);
        physics.makeAttraction( mouse3, d, bs[2], 8);
        background(0);
      } 
     
     
      fill(255,125,20,75);
      noStroke();
       
       d = physics.getParticle( i );
      if ((abs(mouse1.position().x() - d.position().x())<1)&&(abs(mouse1.position().y() - d.position().y())<1)){
       killed[i]=1;
       fill(255,5);
       text("#",mouse1.position().x(),mouse1.position().y());
          }
           if ((abs(mouse2.position().x() - d.position().x())<1)&&(abs(mouse3.position().y() - d.position().y())<1)){
       killed[i]=1;
        fill(255,5);
       text("0",mouse2.position().x(),mouse2.position().y());
          }
           if ((abs(mouse3.position().x() - d.position().x())<1)&&(abs(mouse3.position().y() - d.position().y())<1)){
       killed[i]=1;
        fill(255,5);
       text("7",mouse3.position().x(),mouse3.position().y());
          }
          
      if(killed[i]==0){
      text(char(int(i+25)), d.position().x(), d.position().y());
      }
      handleBoundaryCollisions( d );
      //FreezeX (d);
      //FreezeY (d);
    /* for(int X = 0;X<width;X+=2){
      for(int Y = 0;Y<width;Y+=2){
      if((abs(d.position().x() - X)<1)&&(abs(d.position().y() - Y)<1)){
        
        fill(255,i,i,20);
        rect(X,Y,1,1);
        //text(char(i+25),X,Y);
      }
      }*/
    }
    //}
  
    first = 0;
    physics.tick(1);
    stroke(255,1);
    for (int i = 0;i<3;i++){

      noFill();
      ellipse(bdifx[i], bdify[i], bs[i], bs[i]);
    }
    prumX = (bdifx[0]+bdifx[0]+bdifx[0])/3;
    prumY = (bdifx[0]+bdifx[0]+bdifx[0])/3;
  }
}


void handleBoundaryCollisions( Particle p )
{
  if ( p.position().x() < 0 || p.position().x() > width )
    p.setVelocity( -0.9*p.velocity().x(), p.velocity().y(), 0 );
  if ( p.position().y() < 0 || p.position().y() > height )
    p.setVelocity( p.velocity().x(), -0.9*p.velocity().y(), 0 );
  p.moveTo( constrain( p.position().x(), 0, width ), constrain( p.position().y(), 0, height ), 0 ); 
}

void FreezeX (Particle q){
  q.setVelocity(0,q.velocity().y(),0); 
}

void FreezeY (Particle q){
  if (abs(q.velocity().y()) <= 0.1) {
    q.setVelocity(0,(q.velocity().y())/10,0);
  } 
  if (q.position().y() <= height/4) {
    delay(60000000);
  }

}



void mousePressed() {
  if (firstRun == 1 || firstRun == 2 || firstRun == 3){
    bdifx[counter] = mouseX; 
    bdify[counter] = mouseY; 
  }
}

void mouseDragged() {
  if (firstRun == 1 || firstRun == 2 || firstRun == 3){
    bdifxtah[counter] = mouseX;
    bdifytah[counter] = mouseY;
    bs[counter] = dist(bdifx[counter],bdify[counter],bdifxtah[counter],bdifytah[counter]);



  }
}

void mouseReleased() {
  if (firstRun == 1 || firstRun == 2 || firstRun == 3){
    bs[counter] = dist(bdifx[counter],bdify[counter],bdifxtah[counter],bdifytah[counter]); 
    firstRun += 1;
    counter += 1;
    if (firstRun == 4) {
      firstRun = 0;
      delay(20);
    }
  }
}
void keyPressed() {
  if (keyCode == DELETE) {

    int first = 1;
    int firstRun = 1;
    int counter = 0;
    float startX,startY,endX,endY,polomer;
    float bx,by;
        boolean freeze = false;
    setup(); 
  }

}
