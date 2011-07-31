import pqrcode.*;

Decoder decoder;
PImage img;
int[] rgb = new int[3];

void setup(){
  img=loadImage("qrcode.png");
  size(img.width,img.height);
  
  for(int i =0;i<rgb.length;i++){
    
   rgb[i]=0; 
  }
  
 decoder = new Decoder(this); 
  decoder.decodeImage(img);
}
void draw(){
 //image(img,0,0,width,height);
 background(rgb[0],rgb[1],rgb[2]); 
  
  
}



void decoderEvent(Decoder decoder){
 String statusMsg = decoder.getDecodedString();
 try{
 rgb = parseInt(split(statusMsg,","));
  println(statusMsg); 
 }catch(Exception e){
  println("fail decoding error: "+e); 
 }

  
  
  
}
