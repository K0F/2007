import processing.opengl.*;


byte base[];
byte[] BITMAP_HEADER = new byte[55];
byte a,b,c,d;
int[] Pix;
int cntr, pixJump = 36;
PGraphics buff;
float zoom = 1;
float cntrr;
int koef,koefX;
void setup() 
{
  size(640, 480,OPENGL);
  colorMode(RGB);
  noFill();
  stroke(255);
  frameRate(25);
  frame.setTitle("pixJump 0.2");
  
  base = loadBytes("source2.bmp");
  
  //there is a bug!
  
 int W = (base[19]&0xff)&(base[20]&0xff)&(base[19]&0xff)&(base[19]&0xff);
  int H = int((base[23]&0xff)*256);
  int BIT = (base[29]+1&0x22);
  println("width: "+W+"   height: "+H+"    bitdepth: "+BIT);
  buff = createGraphics(width,height,P3D);
  koef =((base.length)/(buff.width*buff.height));
  koefX = int(sqrt(base.length)/buff.height);
 
  Pix = new int[width*height*50];
  println("view width: "+width+"   height: "+height);
  println("scale: 1/"+sqrt(koefX)*2);
  
  //---------------->loadDataFromFile
  for(int i=54; i<=base.length;i+=(((koef)/koefX)*(zoom*2))) {
      cntr+=1;
    Pix[cntr] = color(base[base.length-i]&0xff,base[base.length-i+1]&0xff,base[base.length-i+2]&0xff) ;
    }
  //--------------------->mkGraphics
  cntr = 0;
  buff.beginDraw();
  noStroke();
    for(int x = 0; x<buff.width;x+=1){
      for(int y = 0; y<buff.height;y+=1){
      fill((Pix[((y*(koefX/2))*buff.width+(buff.width-x))]));
     
      rect(x,y,1,1);
      
      
      }
    }
  buff.endDraw();
   for (int i = 0;i<=54;i++){
  BITMAP_HEADER[i] = base[i];
   // println(binary(BITMAP_HEADER[i]));
  }
}
//byte[] finRend = new byte[base.length];
void draw() 
{
  
    cntrr += 0.05;
   //image(buff,0,0,width,height);
  for(int x = 0; x<width;x+=constrain(mouseX/5,1,width/5)){
      for(int y = 0; y<height;y+=constrain(mouseX/5,1,width/5)){
      fill((Pix[((y*(koefX/2))*width+(width-x))]),(saturation(Pix[((y*(koefX/2))*width+(width-x))]))/5);
     
      rect(x,y,constrain(mouseX/5,1,width/5),constrain(mouseY/5,1,height/5));
      
      
      }
    }
    
}

void mousePressed(){
  loadPixels();
  buff.beginDraw();
  background(0);
  noStroke();
    for(int x = 0; x<width;x++){
      for(int y = 0; y<height;y++){
      buff.pixels[y*buff.width+x] = pixels[y*width+x];
      
      
      }
    }
  buff.endDraw();
  
  buff.save("sudden.png");
  updatePixels();
  
}

