
/*  offscreen renderer using buffer to create an image
*   then saves image, useing this method will allow zou to save bigger
*   images than your graphics card can hold at one time
*   created by kof, regards processing
*/

PGraphics buff;
int pix[];
int W = 800;
int H = 600;
int scaleR = 3;
void setup(){
 buff = createGraphics(W,H,P3D);
 size(buff.width/scaleR,buff.height/scaleR,P3D);
  //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------* frame title
  frame.setTitle(" bufferWorks");
  //-----------------------*
 buff.beginDraw();
 buff.background(255);
 buff.noFill();
 for(int x = 0; x<buff.width;x++){
   for(int y = 0; y<buff.width;y++){
  buff.stroke(random(y*buff.width+x));
  buff.point(x,y);
   }
 }
 buff.endDraw();
 buff.save("image.png");
 pix = new int[buff.width*buff.height];
 buff.loadPixels();
 for(int i = 0;i<buff.width*buff.height;i+=scaleR){
  pix[i/scaleR] = buff.pixels[i];
 }
 buff.updatePixels();
 println("done!");
 
}


void draw(){
 
 
 loadPixels();
 for(int x = 0;x<width;x++){
   for(int y = 0;y<height;y++){
  pixels[y*width+x] = pix[(y*width+x)];
   }
 }
 
  updatePixels();
  
}
