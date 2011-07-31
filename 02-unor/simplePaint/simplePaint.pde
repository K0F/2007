Image img;
 MouseWheelEventDemo wheel; 
 int sizeR = 5;
void setup(){

  size(300,300); 
  wheel = new MouseWheelEventDemo(); 
  //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------* frame title
  frame.setTitle("simple paint");
  //-----------------------*
background(25,45,12,8);
rectMode(CENTER);
fill(255,5);
noStroke();
}
void draw(){
 
  rect(mouseX,mouseY,sizeR,sizeR); 
  
  
  
}

void mousePressed(){
 background(25,45,12,8); 
}

public class MouseWheelEventDemo implements MouseWheelListener {
  public MouseWheelEventDemo() {
    addMouseWheelListener(this);
  }
  public void mouseWheelMoved(MouseWheelEvent e) {
    String message;
    int notches = e.getWheelRotation();
    if (notches < 0) {
  sizeR += 3; 
   
    }  
    else {
 sizeR -= 3; 
    }
    
  }
} 


