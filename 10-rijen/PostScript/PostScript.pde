// Draws to Processing and Postscript simultaneously
// by replacing calls to fill(), line() etc. by
// custom functions that carry out operations in both.


import SimplePostscript.*;


SimplePostscript ps;
float x,y,px,py;

void setup() {
  size(600,400);
  background(255);
  frameRate(5); // Run slow...
  ps=new SimplePostscript(this);
  ps.open("abstract01.ps", 0,0, width,height);
  ps.isOpen=true;
  x=0;
  y=0;
  smooth();
}

void draw() {
  px=x;
  py=y;
  x=random(width);
  y=random(height);
  doStroke(255,0,0);
  doLine(px,py, x,y);

  noStroke();
  doFill(0,200,255);
  doEllipse(px,py, 10,10);
}

void doStroke(float r,float g,float b) {
  stroke(r,g,b);
  if(ps.isOpen) ps.setrgb((int)r,(int)g,(int)b);
}

void doFill(float r,float g,float b) {
  fill(r,g,b);
  if(ps.isOpen) ps.setrgb((int)r,(int)g,(int)b);
}

void doLine(float x1,float y1,float x2,float y2) {
  line(x1,y1,x2,y2);
  if(ps.isOpen) {
    ps.moveto(x1,height-y1);
    ps.lineto(x2,height-y2);
    ps.stroke();
  }
}

void doEllipse(float x,float y,float xrad,float yrad) {
  ellipse(x,y, xrad,yrad);
  if(ps.isOpen) {
    ps.circle(x,height-y,xrad/2);
    ps.fill();
  }
}

void keyPressed() {
  if(!online && key=='s') {
// Print black border around canvas
    ps.setrgb(0,0,0);
    ps.moveto(0,0);
    ps.lineto(width,0);
    ps.lineto(width,height);
    ps.lineto(0,height);
    ps.lineto(0,0);
    ps.strokeclosepath();

// Close file and set ps.isOpen to false
    ps.close();
    ps.isOpen=false;
  }
}
