class Attr {
  float X,Y,nz,xf,yf,oz;
  color myc;
  Attr(){
    xf =random(-5.0,5.0);
    yf =random(-5.0,5.0);
   
  }
  void update(){
    X = sin(a[0]*yf)-cos(a[1]*xf);
    Y = sin(a[2]*xf)-cos(a[3]*yf);
   
    
    noFill();
   pushMatrix();
   translate(X*width*keep+width/2.0, Y*height*keep+height/2.0);
  rotate((atan2(Y,X)));
  stroke(255,10);
    rect(0.25,0.25,0.2,0.2);
   popMatrix();
    xf=X;
    yf=Y;
    
  }
  
}
