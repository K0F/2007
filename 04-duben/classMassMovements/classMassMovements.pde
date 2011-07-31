import processing.opengl.*;



Point[] pnt = new Point[400*400+1]; 
int hustota = 8;
void setup(){
  size(400,400,OPENGL);
 background(0);
 rectMode(CENTER);
 
 
 
   //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------* frame title
  frame.setTitle("MassMovement_16");
  //-----------------------*
  

 
  for(int ix = 0;ix<width;ix+=hustota){
    for(int iy = 0;iy<height;iy+=hustota){
         pnt[iy*width+ix] = new Point(ix,iy,iy*width+ix);
     
    }
  } 


}

void draw(){
 fadeOff(color(0),10);
   for(int ix = 0;ix<width;ix+=hustota){
    for(int iy = 0;iy<height;iy+=hustota){
 pnt[iy*width+ix].render(); 
    }
   }
  
}

void fadeOff(color c , int poc){
 noStroke();
fill(c,poc);

rect(width*0.5,height*0.5,width,height);
}

void keyPressed(){
  this.setup();
keyPressed=false;
}
  
  

class Point{
float x,y;
float distance,smer,speedX,speedY,speed;
int id;
float asm;


  Point(int XX,int YY,int ID){
   id=ID;
    x =  XX;
    y = YY;
   
  }





  void render(){
    
    control(mouseX,mouseY);
    
    

    }

void control(float xin, float yin) {
  float dx = xin - x;
  float dy = yin - y;
  float angle = atan2(dy, dx);
  
  speedX = (cos(angle) * this.distance);
  speedY = (sin(angle) * this.distance);
  x+=speedX;
  y+=speedY;
  move(x, y, angle);
}
void move(float xa, float ya, float a) {
 
  pushMatrix();
  translate(xa, ya);
   if(asm>PI){a+=-1.0;}
  asm+=a*0.01;
 
  rotate(asm);
  noStroke();
  fill(255,15);
  rect(-asm*10.0,0,-2,2);
  popMatrix();
}

  }
