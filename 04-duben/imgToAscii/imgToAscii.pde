class Something{
  Something(){

  } 


}

PImage img;
PFont font;
String[] s;
int res = 3;

void setup(){
  img = loadImage("test.png");
  size(img.width*res,img.height*res);
  s = new String[img.width*img.height];
  font = loadFont("Verdana-9.vlw");
  textFont(font);
  for(int i = 0 ; i<img.width*img.height;i++){
    s[i] = (""); 

  }
  println("debug 1");
 background(0);
  for(int x = 0; x<img.width;x+=res){
    for(int y = 0; y<img.height;y+=res){
      s[x+img.width*y] = ""+(char)saturation(img.pixels[x+img.width*y]);
      fill(brightness(img.pixels[x+img.width*y]));
      text(s[x+img.width*y],x*res,y*res);
    }
  }
 
  println("debug 2");
  String[] fin = new String[img.height/res+height];
  int cntme = 0;
  
  for(int y = 0; y<img.width;y+=res){
    cntme+=1;
    for(int x = 0; x<img.height;x+=res){
      if(s[y+img.width*x]!=null){
      fin[cntme]+= " "+(char)saturation(img.pixels[y+img.width*x]);
      }
    }
  }
  println("debug 3");
saveStrings("test.txt",fin);
 println("debug 4");
  


  }
