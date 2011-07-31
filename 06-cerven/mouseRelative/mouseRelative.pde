Point p = new Point();

 void setup(){
size(400,400);
background(255);

} 


void draw(){
 setMouseXY();
  //println(MouseInfo.getPointerInfo().getLocation()); 
  stroke(0);
  point(mouseX,mouseY);
  
}

 void setMouseXY()  
{
  if(mouseX>=0 && mouseX<width && mouseY>=0 && mouseY<height) return;
  Point mouse, winloc;
  mouse = MouseInfo.getPointerInfo().getLocation();
  winloc = frame.getLocation();
  if(!frame.isUndecorated()){
    winloc.x += 3;
    winloc.y += 29;
  }
  mouseX = mouse.x-winloc.x;
  mouseY = mouse.y-winloc.y;
} 
