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
  for (int x = 0;x<800;x+=6){
    for (int y = 0;y<600;y+=6){

      a[y*width+x] = new ST(x,y);
      //println(y*width+x);
    }
  }

}


void draw(){
  fill(0);
  fill(255,5);
  rect(0,0,width,height);



  noFill();
  stroke(0,95);
  for (int x = 0;x<800;x+=6){
    for (int y = 0;y<600;y+=6){
      
      a[y*width+x].drawMe(int(dist(a[y*width+x].x,a[y*width+x].y,a[y*width+x].xx,a[y*width+x].yy)));

    }
  }


}
void mouseReleased(){
  for (int x = 0;x<800;x+=6){
    for (int y = 0;y<600;y+=6){
      
      a[y*width+x].reset();

    }
  }
}
