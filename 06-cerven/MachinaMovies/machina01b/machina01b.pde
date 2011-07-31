import processing.opengl.*;
import moviemaker.*;
MovieMaker movie;
boolean accept = true;
Think[] thinks = new Think[5];
String[] datos;
String sub = "";
color[] cols = { #F1F1F1 , #E9FCBF , #B7F278 }; 
PImage lexiGram;
PImage[] lex = new PImage[64]; 

PImage brain;
PImage[] brainAct = new PImage[5];
PImage topM;
PImage bckM; 

//FasterMovie fm;
PImage mImage;

PFont font;
int symbol = 0;
 float err=0;


void setup(){
 size(720,576,OPENGL);
 frameRate(25);
  background(255);
  println(sketchPath);
  frame.setTitle("machina001");
  datos=loadStrings(sketchPath+"/machina01b.pde");
  font = loadFont("ISOCPEUR-13.vlw");
  textFont(font);
  movie = new MovieMaker(this, width, height, "temp2.mov",MovieMaker.JPEG,MovieMaker.HIGH,25) ;
  /*  fm = new FasterMovie(this, sketchPath+"/data/temp5.mov", false);
    fm.loop();*/  
  
  //----------->imgs
  brain=loadImage("brain.png");
  for(int i = 0;i<5;i++){
  brainAct[i] = loadImage("brainAct"+(i+1)+".png");
  }
   topM = loadImage("topM.png");
    bckM = loadImage("bckM.png");
   lexiGram=loadImage("lexchimp.png");
  // lexiGram=loadImage("hieroglyphs.gif");
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
    thinks[i]=new Think(width/4,height/2+height/4,i);
  }
  println("done!");
 stroke(0); 
 noFill();
}

void draw(){
  //----------------------- pre >>
  image(bckM,0,0);
  
  fade(45);
  
   
  //  println(mouseX+" \t"+mouseY);
  
  //----------------lexigram>>
  if(frameCount%(int)random(10,60)==0){
   symbol=(int)random(0,lex.length-1); 
  
  }  
  
   for(int i = 0;i<=int(symbol/8);i++){
  image(lex[int((symbol)+(i+1.0f))%(lex.length-1)],width/2f+(i*32),height/2f-50);
   }
   
 //-----------------run>>
  
//  movie(31f,56f,128);
  brainDraw(40,50,3f);   
  modelDraw();
  
  
  
  //-------------------datos>>
   fill(0,85);
   
   int q = 0;
   
   for(int i = 0 ; i<datos.length ; i++){
   q+=12;
   
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
    text(sub,20,height/2+35+10);
    if(sub.length()>280){sub="";}
    fill(cols[2],85);
   rect(0,height/2+35,width,13);
   
   noFill();
   
   
   //-------------------------post shadow >>
   image(topM,0,0); 
   Rec();
}




//-------------------voids >> 

 void brainDraw(float _x,float _y,float speed){
   image(brain,_x,_y);
  for(int i = 0;i<5;i++){
    tint(255,(sin(frameCount/(i+speed))+1)*85);
  image(brainAct[i],_x,_y);
  noTint();
  }
   }
   
   void modelDraw(){
     if(frameCount%120==0){
   for(int i = 0 ;i<thinks.length;i++){
    thinks[i]=new Think(globX,globY,i);
  }
     }
     for(int i = 0 ;i<thinks.length;i++){
    strokeWeight(1f);
    thinks[i].run(width/4,(height/2)+(height/4));
    strokeWeight(5f);
    stroke(cols[2],155);
    line(thinks[i].x,thinks[i].y,thinks[constrain(i+1,0,thinks.length-1)].x,thinks[constrain(i+1,0,thinks.length-1)].y);
  } 
  
  
  fill(255,25);
  stroke(cols[2],55);
  strokeWeight(3f);
  rect(35,height/2+45,300,200);
     
       }
       
  
   void fade(int _kolik){
  noStroke();
  fill(cols[0],_kolik);
  rect(0,0,width,height);

}

void keyPressed(){
   if(keyCode==ENTER){
    save("screen.png");
    
   } 
  
  keyPressed=false;
}

void Rec(){
if(accept){
   loadPixels();
  
  movie.addFrame(pixels,width,height) ;
  updatePixels();
} 

if(frameCount>=3000){
  movie.finishMovie(); 
  accept=false;
}
}




