//"thermo_"+(int)day()+"-"+(int)month()+"_"+(int)year()+".png"

PImage img;
PFont font;
int numero = 1;
void setup(){
  size(333,159);
  frameRate(40);
  customizeCursor("/imgs/thermoCrsr.gif");
  imgar("/imgs/"+numero+".png");
  font = loadFont("Uni0553-8.vlw");
  textFont(font);

}

void draw(){

  
image(img,map(mouseX,0,width,0,(-img.width)+width),map(mouseY,0,height,0,(-img.height)+height));
  stroke(255);
  line(mouseX-2,15,mouseX-2,height);
  line(15,mouseY-2,width,mouseY-2);
  text("w"+int(map(mouseX,0,width,0,100))+"%    "+"h"+int(map(height-mouseY,0,height,0,100))+"%    ",mouseX+5,mouseY+10);

}



void mouseReleased(){

  this.setup() ;

}


void imgar(String path) {

  Toolkit toolkit = getToolkit();
  Image ia;


  byte[] q = loadBytes(path);
  ia = getToolkit().createImage(q);


  if (ia != null) {

    try {

      img = loadImageSync(ia);

    }
    
    catch(Exception exc) {
      System.err.println("Unable to create an image..");
    
  }

  }

}

