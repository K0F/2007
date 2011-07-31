import processing.opengl.*;
import JMyron.*;

JMyron input;

byte base[];


byte[] BITMAP_HEADER = new byte[55];

int[] Pix;
int cntra, pixJump = 36;
PGraphics buff;
float zoom = 1;
float cntrr;
float cnt = 0,av,avr,avg,avb;
float frnum,percentage;
int koef,koefX;
int x,y,cntr,hitCount,accept = 1;

boolean runE = false;

int W = 1280*2;//(base[19]&0xff)&(base[20]&0xff)&(base[19]&0xff)&(base[19]&0xff);
  int H = 960*2;//int((base[23]&0xff)*256);
  int hit[][]= new int[W][H];
void setup() 
{
  size(320, 240,OPENGL);
  colorMode(RGB);
  noFill();
  stroke(255);
  frameRate(25);
  frame.setTitle("pixJump 0.2");

  base = loadBytes("source3.bmp");
  input = new JMyron();//obj
  input.start(32,24);//320x240//360x288
  input.findGlobs(0);

  //there is a bug!

  
  int BIT = (base[29]+1&0x22);

  println("width: "+W+"   height: "+H+"    bitdepth: "+BIT);
  buff = createGraphics(W,H,P3D);
  koef =((base.length)/(width*height));
  koefX = int(sqrt(base.length)/height);

  Pix = new int[width*height*50];
  println("view width: "+width+"   height: "+height);
  println("scale: 1/"+sqrt(koefX)*2);

  //---------------->loadDataFromFile
  for(int i=54; i<=base.length;i+=(((koef)/koefX)*(zoom*2))) {
    cntra+=1;
    Pix[cntra] = color(base[base.length-i]&0xff,base[base.length-i+1]&0xff,base[base.length-i+2]&0xff) ;
  }
  //--------------------->mkGraphics
  cntra = 0;

  for (int i = 0;i<=54;i++){
    BITMAP_HEADER[i] = base[i];
    // println(binary(BITMAP_HEADER[i]));
    background(0);
    buff.beginDraw();
    buff.background(0);
    buff.endDraw();
  }
  println("done!");
  println();
}
//byte[] finRend = new byte[base.length];
void draw() 
{
  input.update();
  int[] img = input.image();

  av =brightness(input.average(0,0,input.width(),input.height()));
  /* avr =hue(input.average(0,0,input.width(),input.height()));
   avg =saturation(input.average(0,0,input.width(),input.height()));
   avb =brightness(input.average(0,0,input.width(),input.height()));*/


  buff.beginDraw();

  for(int x = 0;x<W;x+=input.width()){
    for(int y = 0;y<H;y+=input.height()){
    
      if((abs((brightness(Pix[((koefX)*(y/input.height()))*width+(width-((x/input.width()))*(koefX/4))]))-(av))<=1.0)&&(hit[x/input.width()][y/input.height()]<1)){
      
        hit[x/input.width()][y/input.height()]=1;
        hitCount+=1;
        runE = true;
        percentage = (hitCount/((buff.width/input.width())*(buff.height/input.height())+0.1))*100;

        for(int yy=0;yy<input.height();yy+=1){ 
          for(int xx=0;xx<input.width();xx+=1){ 


            buff.stroke(brightness(img[yy*input.width()+xx]));
            buff.noFill();
            buff.point(xx+x,yy+y);

          }
        }//xx+yy

      }//if

    } 
  }//x+y


    buff.endDraw();
    
     for(int y=0;y<height;y+=1){ 
          for(int x=0;x<width;x+=1){ 
          if(hit[x][y]==1){
            fill(255,3);
            noStroke();
            rect(x*((W/input.width())/(width/input.width())),y*((H/input.height())/(width/input.height())),width/input.width(),height/input.height());
          }
          }
     }
}  
/*
    cntrr += 0.05;
 //image(buff,0,0,width,height);
 for(int x = 0; x<width;x+=constrain(mouseX/5,1,width/5)){
 for(int y = 0; y<height;y+=constrain(mouseX/5,1,width/5)){
 fill((Pix[((y*(koefX/2))*width+(width-x))]),(saturation(Pix[((y*(koefX/2))*width+(width-x))]))/5);
 
 rect(x,y,constrain(mouseX/5,1,width/5),constrain(mouseY/5,1,height/5));
 
 
 }
 }
 */


void mousePressed(){
  loadPixels();  
  buff.save("sudden.png");
  updatePixels();
  println("saved!");
}

void keyPressed(){
 if(key == 's'){
  key=0;
 input.settings();
 } 
  
}

