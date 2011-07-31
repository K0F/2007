/*PixJump conception by kof 
*/
byte a[];
int[] aPixels;
int cntr;

void setup() 
{
  size(400, 250,P3D);
  aPixels = new int[width*height];
  noFill();
  stroke(255);
  frameRate(30);
  a = loadBytes("source.bmp");
  
}

void draw() 
{
    for(int i=0; i<width*height*3; i+=int((mouseY/10)+1)) {
   if((i%int(mouseX/(24)+1))==0){
     cntr+=1;
   }
    aPixels[constrain(i,0,width*height-1)] =color(a[i>>((mouseX/10)+1)&0xff]);
   
    //print(a[i]>>16&0xff );
  }
  cntr = 0;
    loadPixels();
    for (int i=0; i<width*height; i++) { 
      pixels[i] = aPixels[i]/10;  
   }
    updatePixels();
    
    
}





