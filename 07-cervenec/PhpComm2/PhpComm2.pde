/**
*This applet is capable to <br>
*read a file-structure on the<br>
*server side<br>
*Program getting info trought simple<br>
*php script<br><br>
*
*The result is user-friendly publishing<br>
*files and a whole projects on your websides<br><br>
*
*<b>:: By Kof</b>
*/


PFont font;
Mirror mirror;
void setup(){
  size(600,300);
  frameRate(25);
  
  background(0);
  if(!online){
   frame.setTitle("miniGuide"); 
  }
  font = loadFont("ArialMT-9.vlw");
  textFont(font);
  noStroke();
    
  mirror = new Mirror(this,"http://kof.homelinux.com/","askdir.php","structure");
  
}

void draw(){
  fill(0,180);
  stroke(128);
  rect(0,1,width-1,height-2);
  noStroke();
  mirror.viz(); 
  
}




