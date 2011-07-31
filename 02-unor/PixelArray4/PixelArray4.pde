import processing.opengl.*;


byte base[];
int[] Pix;
int cntr, pixJump = 36;
PGraphics buff;
float zoom = 1;
int koef,koefX;
void setup() 
{
  size(640, 480,OPENGL);
  colorMode(RGB);
  noFill();
  stroke(255);
  frameRate(25);
  base = loadBytes("source2.bmp");
  frame.setTitle("pixJump 0.2");
  buff = createGraphics(width,height,P3D);
  Pix = new int[width*height*50];
  koef =((base.length)/(width*height));
  koefX = int(sqrt(base.length)/height);
  println((base.length)+" / "+(width*height)+" = "+koefX);
  
  //---------------->loadDataFromFile
  for(int i=32; i<=base.length;i+=((koef)/koefX)*(zoom*2)) {
      cntr+=1;
    Pix[cntr] = color(base[base.length-i+2]&0xff,base[base.length-i+1]&0xff,base[base.length-i]&0xff) ;
    }
  //--------------------->mkGraphics
  cntr = 0;
  buff.beginDraw();
  noStroke();
    for(int x = 0; x<width;x+=1){
      for(int y = 0; y<height;y+=1){
      fill((Pix[((y*(koefX/2))*width+(width-x))]));
     
      rect(x,y,1,1);
      
      
      }
    }
  buff.endDraw();
}

void draw() 
{
    fill(0,15);
    rect(0,0,width,height);
   image(buff,0,0);
  
    
}

void mouseDragged(){
for(int i=32; i<=base.length;i+=((koef)/koefX)*zoom) {
 
     cntr+=1;
   
  
    Pix[cntr] = (base[base.length-i]&0xff) ;
  
   }
}


