import seltar.unzipit.*;

UnZipIt banka;
PImage[] img=new PImage[999];
String sign;
int clck;
color back;

void setup(){
  size (10*16,10*16); 
  banka =new UnZipIt(sketchPath+"/lib/icons.zip",this);
  print("Loading data  ");
  for(int i = 1 ; i<999;i++){
    if(i%100==0){
      print(".");
    }
    img[i-1] = banka.loadImage("icon/icon ("+i+").png");
  }
  sign = banka.loadString("sign.txt");
  frame.setTitle(sign);
  print("\n");
  print("Zip loaded, ok!\n");
  back = color(#FFCC00);
}

void draw(){
  falloff(back,55);
  if(frameCount%10==0){
    update();
  }

 for(int i = 0;i<10;i++){
      image(img[((clck)+i)%(img.length-1)],(i*16)%width,height/2);
 }
  
  /*
  for(int x = 0;x<10;x++){
    for(int y = 0;y<10;y++){
      image(img[(y*16+x+clck)%(img.length-1)],x*16,y*16);
   }
  } */

}

void mouseReleased(){
  update(); 

}

void update(){
  clck++; 

}

void falloff(color _col,int _kolik){
  color col = _col;
  fill(col,_kolik);
  noStroke();
  rect(0,0,width,height);
  
}

