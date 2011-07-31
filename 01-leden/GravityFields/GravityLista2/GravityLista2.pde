import processing.opengl.*;
import traer.physics.*;
//import moviemaker.*;
//MovieMaker movie;

Particle mouse1,mouse2,mouse3,d;
ParticleSystem physics;
PFont font;

int first = 1;
int firstRun = 1;
int counter = 0;
float cntr,unique = 0.088;
float startX,startY,endX,endY,polomer,col;
float bx,by;
int accept = 1;
float[] bs = new float[3];
float[] bdifx = new float[3];
float[] bdify = new float[3];
float[] bdifxtah = new float[3];
float[] bdifytah = new float[3];
boolean freeze = false; 
float prumY,prumX; 

void setup()
{
  size( 400, 400, OPENGL );
  frameRate( 30 );
  smooth();
  ellipseMode( CENTER );
  strokeWeight(1);
  noStroke();
  cursor(CROSS);
  background(140,160,84);
  physics = new ParticleSystem(.1, .1);
  fill(35);
  mouse1 = physics.makeParticle();
  //movie = new MovieMaker(this, width, height, "temp.mov",0,0) ;

  
  mouse1.makeFixed();
 
   font = loadFont("CenturyGothic-Bold-24.vlw");
   textFont (font, 24);
}

void draw()
{
  
    
    //---------------------->fadeout
    fill(140,160,84,10);
    noStroke();
    rect(0,0,width,height);
 
    
    stroke(255);
    
    
    //----------------------------------------------------------------------->partikly
    for (int i = 1;i<1500;i++){
      if (first == 1) {
        Particle d = physics.makeParticle( 1.0, i/50.0+(width/2),i/50.0+(height/2), 1 );
        d.setVelocity( 0, 1, 0 );
        physics.makeAttraction( mouse1, d, 10000, 15);
        //physics.makeAttraction( mouse2, d, bs[1], 12);
        //physics.makeAttraction( mouse3, d, bs[2], 12);
        
        
      }  
      mouse1.moveTo(  mouseX, mouseY, 0 );
      d = physics.getParticle( i );
      col = (abs(d.velocity().x())+abs(d.velocity().y()))*100;
      
      //fill(255-((col*2.)),(col/2.),0.218*col,70);
      fill(0,20);
      noStroke();
      rect( d.position().x(), d.position().y(), 2, 2 );

      handleBoundaryCollisions( d );
      //FreezeX (d);
      //FreezeY (d);
    }

    first = 0;
    physics.tick(0.5);
    
    
   noStroke();
   cntr += unique;
   if(cntr>width+20){unique = unique*(-1);}else if(cntr<-20){unique = unique*(-1);}
   
  fill(140,160,84);
   text("figure::1 "+frameRate,width-240,height-6);
   fill(255);
   text("figure::1 "+frameRate,width-240,height-6);
  /*
  if(accept==1){loadPixels();
  
  movie.addFrame(pixels,width,height) ;
  updatePixels();
  } 
  */
  
  

  //rect(cntr,height-60,1,60);
}


void handlesBoundaryCollisions( Particle p )
{
  if ( p.position().x() < 0 || p.position().x() > width )
    p.setVelocity( -0.9*p.velocity().x(), p.velocity().y(), 0 );
  if ( p.position().y() < 0 || p.position().y() > height )
    p.setVelocity( p.velocity().x(), -0.9*p.velocity().y(), 0 );
  p.moveTo( constrain( p.position().x(), 0, width ), constrain( p.position().y(), 0, height ), 0 ); 
}

void handleBoundaryCollisions( Particle p )
{
  if ( dist(p.position().x(),p.position().y(),width/2,height/2) > 180 ){
    p.setVelocity( -0.9*p.velocity().x(), -0.9*p.velocity().y(), 0 );
  p.moveTo(width/2,height/2 ,0);
  }
  
   
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
      background(140,160,84);
      delay(20);
    }
  }
}
/*
void keyPressed(){
 movie.finishMovie(); 
  accept=0;
}
*/
