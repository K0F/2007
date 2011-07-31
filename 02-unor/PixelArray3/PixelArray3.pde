byte base[];
int[] Pix;
int cntr, pixJump = 12;
PGraphics buff;
void setup() 
{
  size(320, 240,P3D);
  
  noFill();
  stroke(255);
  frameRate(30);
  base = loadBytes("source.bmp");
  frame.setTitle("pixJump 0.2");
  buff = createGraphics(width,height,P3D);
  Pix = new int[width*height*50];
}

void draw() 
{
    for(int i=32; i<=base.length-1; i+=pixJump) {
 
     cntr+=1;
   
  
    Pix[(base.length/pixJump)-cntr] =((base[i]>>16&0xff)+(base[i]>>8&0xff)+(base[i]&0xff)) ;
  
   }
 
  cntr = 0;
    for(int x = 0; x<width;x++){
      for(int y = 0; y<height;y++){
      stroke(brightness(Pix[(y*width+x)]));
      noFill();
      point(x,y);
      
      
      }
      
    }
    
}





