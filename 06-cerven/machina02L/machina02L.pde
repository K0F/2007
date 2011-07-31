 import processing.opengl.*;
 import net.fladdict.oscillator.*;

 
  float globSpeed = 2.5f;
  float globX = 50.0f;
 float globY = 10.0f;
 int q;
 String[] datos;

 
 Loader[] l = new Loader[4];
  PFont fonta;
  color[] c = { #B7F278 , #F1F1F1 };
  float[] x = {90f+globY,90f+globY,90f+globY,90f+globY};
  float[] y = {50f+globX,150f+globX,350f+globX,450+globX};
  float[] speeds = {23.77*globSpeed,0.0733*globSpeed,0.01133*globSpeed,0.001144*globSpeed}; 
 
 PImage HAG,topM;
  
  
 
 void setup(){
   size(720,576,OPENGL);
  frameRate(25);
   fonta  = loadFont ("ISOCPEUR-13.vlw") ;
    textFont(fonta);
   background(c[1]);
    
    HAG = loadImage("HAG.png");
   topM =  loadImage("topM.png");
   for(int i = 0;i<l.length;i++){
    l[i]=new Loader(x[i],y[i],speeds[i],i) ;
     
   }
   datos=loadStrings(sketchPath+"/machina02L.pde");
   
 }
 
 void draw(){
   //  background(c[1]);
      datos();
   fade(85); 
  
     
    
  
   
   
   for(int i = 0;i<l.length;i++){
    l[i].run();
     
   }
  fill(c[0],85);
  noStroke();
  rect(112,height/2+35,width,13);
  
   
    image(HAG,0,0);
   
  
   image(topM,0,0); 
 }
 
 void fade(int _kolik){
    noStroke();
    fill(c[1],_kolik);
    rect(0,0,width,height); 
   
 }
 
 void datos(){
   fill(0,85);
   
   q = 0;
   
   for(int i = 0 ; i<datos.length ; i++){
   q+=3;
   
   if(q+20>height){q=0;}
   text(datos[i],random(20)+10,20+(q));
   }

   
   
 }
 
 
 
 void mousePressed(){
   if(mouseButton==RIGHT){
  for(int i = 0;i<l.length;i++){
     l[i].plug(false);
  }
   }else{
     for(int i = 0;i<l.length;i++){
     l[i].plug(true);
  }
   }
 }
 
 void keyPressed(){
  if(keyCode==ENTER){
   save("screen.png");
  } 
   keyPressed=false;
 }
 
 
 


class Loader{
  float percent,x,y;
  float speed;
 int id;
  PImage bck,light,rotatko;
  float theta=0f;
  Oscillator osc;
   float[] val= new float [480];
   float[] valSmooth= new float [480];
    int cntr = 0;
 boolean plugged = true;
 
 
 Loader(float _x,float _y,float _speed,int _id){
   percent = 0.0f;
  bck = loadImage("bck.png");
  light = loadImage("light.png"); 
  rotatko = loadImage("rotatko.png");
  initialize(_x,_y,_speed,_id);
  
 } 
 
 void  initialize(float _x,float _y,float _speed,int _id){
    x = _x;
  y = _y;
 id=_id;
  speed=_speed;
  
 
  Oscillator[] osc_array = { new OscSin(random(5,107),random(2,140)), new OscCos(random(15,33),random(1,550)), new OscTriangle(random(1,30),random(1,21)), new OscWhiteNoise(random(1,20))};
  osc = new OscComposite( osc_array ); 
  println(id+"\tint()");
   
 }
  
 void run(){
   pushMatrix();
   
    percent+=(speed*(random(0.5f,1.5f))); 
     
  
   percent=percent%100;
   noStroke();
  
   translate(x,y);
   image(bck,0,0);
  
   image(light,0,0);
   translate(8,7);
   rotatko();
   oscilla();
    fill(c[0],155);
    noStroke();
    rect(0,1,map(percent,0.0f,100.0f,0.0f,479.0f),15);
   fill(0,200);
    text(((round(percent*10.0f))/10f)+" % loaded",5,13);   
   
   popMatrix();
   
 }
 
 void rotatko(){
   pushMatrix();
   translate(490,-40);
  pushMatrix();
  theta+=(osc.getValue()-theta)/100.0f;
 
 rotate((theta));
 translate(-7,-7);
 image(rotatko,0,0);
 
 popMatrix(); 
   popMatrix();
   
 }
 
 void oscilla(){
   cntr+=1;
     cntr=cntr%479;
     
     if(frameCount%int(random(120,150))==0){
       initialize(x,y,speed,id);
       //osc.addOscillator(new OscSin(random(1,20),random(1,500))); 
     }
     
     if(plugged){  
    osc.update();  //update wave
     val[cntr] = osc.getValue();  //get wave value
     }
     
     fill(255,180);
        
  
    stroke(c[0],85);
    strokeWeight(3f);
     rect(-10,30,510,-80); 
  
  
     strokeWeight(1f);
    stroke(0,82);
    for(int i = 0;i<480;i++){
      valSmooth[i]+=(val[i]- valSmooth[i])/50.0f;
     
     
     
      
      line(((-cntr+i)+479)%479,(valSmooth[i]/7.5f)-20,(((-cntr+i)+479)%479)+2f,(valSmooth[i]/13.0f)-20);
    }
    
      
   
   
   
 }
 
 boolean plug(boolean _plugged){
   plugged=_plugged;
    for(int i = 0;i<480;i++){
     val[i]=0;
     //valSmooth[i]=0; 
    }
   return _plugged;   
 }
  
  
  
}

