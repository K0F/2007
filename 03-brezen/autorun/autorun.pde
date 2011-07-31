
PImage img;
PFont font;

void setup(){
img = loadImage("mirek.jpg");
  size(img.width/4,img.height/4);
frame.setTitle("M.Pesek Architekt");
frame.show();
background(0);
image(img,0,0,img.width/4,img.height/4);
font = loadFont("04b24-8.vlw");
textFont(font,8);
text("(Click to enter)",width-58,height-2);

}

void draw(){
  ;  
}

void mousePressed(){
  mousePressed=false;
  link(sketchPath+"//index.html", "_new"); 
  this.exit();
}

