import processing.opengl.*;


byte base[];
int[] Pix;
int cntr, pixJump = 36;
PGraphics buff;
void setup() 
{
  size(320, 240,OPENGL);
  colorMode(RGB);
  noFill();
  stroke(255);
  frameRate(25);
  base = loadBytes("source2.bmp");
  frame.setTitle("pixJump 0.2");
  buff = createGraphics(width,height,P3D);
  Pix = new int[width*height*50];
  for(int i=32; i<=base.length-1;i+=(base.length)/(width*height)) {
 
     cntr+=1;
   
  
    Pix[cntr] =((base[base.length-i]&0xff)) ;
  
   }
}

void draw() 
{
    fill(0,15);
    rect(0,0,width,height);
 
  cntr = 0;
 
    for(int x = 0; x<width;x+=1){
      for(int y = 0; y<height;y+=1){
      fill((Pix[((y)*width+(width-x))]));
      noStroke();
      rect(x,y,2,2);
      
      
      }
      
    }
    
}





