import processing.opengl.*;
import quicktime.*;
import quicktime.qd.*;
import quicktime.std.*;
import quicktime.app.view.*;
import quicktime.io.*;
import quicktime.std.movies.*;
import quicktime.std.movies.media.*;
import quicktime.std.movies.media.DataRef;
import quicktime.app.view.*;
import quicktime.util.*;
import java.lang.reflect.*;
import quicktime.app.audio.*;

Think[] thinks = new Think[4];
String[] datos;
String sub = "";
color[] cols = {#F1F1F1,#E9FCBF,#FFA09D}; 
PImage lexiGram;
PImage[] lex = new PImage[64]; 

PImage brain;
PImage[] brainAct = new PImage[5];

FasterMovie fm;
PImage mImage;

PFont font;
int symbol = 0;
void setup(){
 size(720,576,OPENGL);
 
  background(255);
  println(sketchPath);
  datos=loadStrings(sketchPath+"/machina01.pde");
  font = loadFont("ISOCPEUR-13.vlw");
  textFont(font);
  
    fm = new FasterMovie(this, sketchPath+"/data/temp5.mov", false);
    fm.loop();  
  
  //----------->imgs
  brain=loadImage("brain.png");
  for(int i = 0;i<5;i++){
  brainAct[i] = loadImage("brainAct"+(i+1)+".png");
  }
  
   lexiGram=loadImage("lexchimp.png");
   //lexiGram=loadImage("hieroglyphs.gif");//cool
   //lexiGram=loadImage("klein.gif.jpg");
   int y = 0;
 for(int x =0;x<lex.length;x++){
   if((x%8==0)&&(x!=0)){
    y++; 
   }
     
   lex[x]=createImage(30,30,RGB);
   lex[x].copy(lexiGram, (x*60)%lexiGram.width, y*60, 60, 60, 0, 0, 30, 30);
   print(x+" ");
 
 }
 
 for(int i = 0 ;i<thinks.length;i++){
    thinks[i]=new Think(width/2,height/2,i);
  }
  println("done!");
 stroke(0); 
 noFill();
}

void draw(){
  
 //println(mouseX+" \t"+mouseY);
  if(frameCount%(int)random(10,60)==0){
   symbol=(int)random(0,lex.length-1); 
  
  }
  
  
   for(int i = 0;i<=int(symbol/8);i++){
  image(lex[int((symbol)+(i+1.0f))%(lex.length-1)],width/2f+(i*32),height/2f-50);
   }
   
  fill(cols[0],45);
  rect(0,0,width,height);
  
  brainDraw(300,50,10f);   
  modelDraw();
  //movie();
  
   fill(0,85);
   
   int q = 0;
   
   for(int i = 0 ; i<datos.length ; i++){
   q+=13;
   
   if(q+20+(height/2)+random(height/2)>height*1.5){q=0;}
   text(datos[i],width/2+random(20)+10,height/2+20+(q));
   }
   if(frameCount%80==0){
     
     int wline = (int)random(0,datos.length-1);
     int which = (int)random(0,datos[wline].length()-1);
     try{
       if((wline!=0)&&(which!=0)){
     if(datos[wline].charAt(which)!=(char)-1){
       sub+=datos[wline].charAt(which);
  
     }
       }
     }catch(Exception e){
      System.out.println(e); 
     }
   }
   
   
   noStroke();
   fill(0);
    text(sub,355,200,250,250);
    fill(cols[2],85);
   rect(width/2,height/2+35,width/2,13);
   
   noFill();
}

 void brainDraw(float _x,float _y,float speed){
   image(brain,_x,_y);
  for(int i = 0;i<5;i++){
    tint(255,(sin(frameCount/(i+speed))+1)*255);
  image(brainAct[i],_x,_y);
  noTint();
  }
   }
   
   void modelDraw(){
     if(frameCount%120==0){
   for(int i = 0 ;i<thinks.length;i++){
    thinks[i]=new Think(mouseX,mouseY,i);
  }
     }
     for(int i = 0 ;i<thinks.length;i++){
    strokeWeight(1);
    thinks[i].run();
    strokeWeight(5);
    stroke(255,0,0,55);
    line(thinks[i].x,thinks[i].y,thinks[constrain(i+1,0,thinks.length-1)].x,thinks[constrain(i+1,0,thinks.length-1)].y);
  } 
     
       }
       
       
     void movie(){
       fm.jump(random(36));
  
    if ( mImage != null ) image( mImage, 10,10,mImage.width/2,mImage.height/2); 
       
     }
     
     void movieImageAvailable ( PImage _movieImage )
{
    mImage = _movieImage;   
}
 
   
   void fade(int _kolik){
  noStroke();
  fill(255,_kolik);
  rect(0,0,width,height);

}




