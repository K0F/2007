import processing.opengl.*;

ST[] a;
int numO = 480000;
int cnt, cnt2;
void setup(){
  size (800, 600,OPENGL); 
  background(255);
  setFullScreen( false );               
    setResolution( 800, 600 );           
    createFullScreenKeyBindings();        
  a = new ST[numO+2];
  for (int x = 0;x<800;x++){
     for (int y = 0;y<600;y++){
    cnt +=1;
    a[y*width+x] = new ST(x,y);
  
  }
  }

}


void draw(){
  fill(0);
  fill(255,5);
  rect(0,0,width,height);



  noFill();
  stroke(0,55);
  for (int i = 0;i<10000;i++){
    
    a[i].drawMe(5);

  }


}
