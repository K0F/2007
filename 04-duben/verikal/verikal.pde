import processing.opengl.*;



int w=200,h=200;
float[] c = new float[w*h+1];
float reactivity=100.0;
float[] X = new float[w*h+1];
float[] Y = new float[w*h+1];
float[] speedX = new float[w*h+1];
float[] speedY  = new float[w*h+1];


void setup(){
  size(w,h,OPENGL);
  background(0);
  noStroke();
  noSmooth();
  noFill();
}

void draw(){
   background(0);
  for(int x = 0;x<width;x+=2){
    for(int y = 0;y<width;y+=2){
      int ID = x+width*y;
      speedX[ID]=((sin(x+X[ID])*width)-mouseX);
      speedY[ID]=((sin(y+Y[ID])*height)-mouseY);
      X[ID]+=speedX[ID]/reactivity;
      Y[ID]+=speedY[ID]/reactivity;
      stroke(255);
      line(x+X[ID],y+Y[ID],1+x+X[ID],y+Y[ID]);

    }
  }


}
