/*SELF EXHIBER BY KOF***/
 PImage img;
int shift;
void setup(){
 img = loadImage("loadSelf.bmp");
 size(img.width,img.height); 
 frame.setTitle("codeExhiber");
}

void draw(){
 image(img,0,0);  
}
