// -----------------------  >
import processing.opengl.*;
import processing.video.*;
///////////////////////////////////////
boolean sysShow = true;
///////////////////////////////////////
int maniak = 125;
float speeD = 200.0;
//////////////////////////////////////
// -----------------------  >
int num = 200;
Neuron[] neuro = new Neuron[num];
Waver[] w = new Waver[num];
color[] farby = new color[num];
float bordr = 80.0;
float radi = 7.0;
float bMin,bMax;
int cnt = 0;
int tickC = 0;
float radTarg = radi;
float oMin=50.0,oMax=0.0;
float avgX=100.0,avgY=100.0;
float avgX2=100.0,avgY2=100.0;
int mem = 100;
float[] XX = new float[mem];
float[] YY = new float[mem];
float XXX,YYY;

MovieMaker mm;
PImage img,tmp;

//-----------------------  >

void setup(){
  size(300,300,OPENGL); 

  bMax = width-bordr-radi/2;
  bMin = bordr+radi/2;
  
  img= loadImage("komo.png");
  tmp = img;
  tmp.filter(INVERT);
  img.mask(tmp);
  
  frame.setTitle("neuroSys :: krystof pesek 07");
  
  
  
   //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  
  /*
  for(int i = 0;i<neuro.length;i++){
    neuro[i] = new Neuron(this,random(bMin,bMax),random(bMin,bMax),1,bordr,radi,i);
    farby[i] = color(lerpColor(#FFFFFF,#FFCC00,random(0.0f,1.0f)));//random(25,255),random(25,255),random(25,255));
}*/
colGen();
  
    for(int i = 0;i<w.length;i++){
   w[i] = new Waver(i,map(i,0,w.length,5,height-5.0)); 
  }
 
 mm = new MovieMaker(this, width, height, "out/drawing2.mov",25, MovieMaker.JPEG, MovieMaker.HIGH);
  
  textFont(loadFont("00Acrobatix-8.vlw"),8);
 // background(0);
   //smooth();
}

//-----------------------  >

void draw(){
  
  
  
  cnt++;
  cnt=cnt%mem;
 // fade(0,35);
 
  for(int i =0 ; i < 13;i++){
   // stroke(255);
    //ellipse(neuro[i].x,neuro[i].y,neuro[i].radius,neuro[i].radius);
    //ellipse(x,y,radius,radius) ;  
    tint(farby[i]);
    image(img,map(neuro[i].x,bMin,bMax,-img.width,0.0f),map(neuro[i].y,bMin,bMax,-img.height+height,0.0f));
  }
  
  if(frameCount%maniak==0){
   //colGen2(); 
   colGen(); 
 //  saveFrame("barvo/barevno_####.png");
  }
  
  pushMatrix();
    /////////////////////////////////////////////////////////////////// push
  
  noFill();
 // translate(width-XXX-40,height-YYY-40);
  
  for(int i = 0;i<neuro.length;i++){
    neuro[i].run();    
    if(sysShow){
    line(neuro[i].x,5,neuro[i].x,25);
    line(5,neuro[i].y,25,neuro[i].y);
    }
  }
  
  int tickC = 0;
    
    for(int i = 0;i<neuro.length;i++){
    if(neuro[i].touch){
      tickC++;
      avgX+=(neuro[i].x-avgX)/3.0;
      avgY+=(neuro[i].y-avgY)/3.0;   
       avgX2+=(avgX-avgX2)/300.0;
      avgY2+=(avgY-avgY2)/300.0;      
    }
  } 
  
  tickC=constrain(tickC,1,50);
  for(int i = 0;i<neuro.length;i++){        
    radTarg += (map(tickC,0,50,50.0,5.5)-radTarg)/(neuro[i].speed);
    neuro[i].radius += (radTarg-neuro[i].radius)/20.0 ;
    neuro[i].radius=constrain(neuro[i].radius,5.5,200.0);
    if(neuro[i].radius>oMax){oMax=neuro[i].radius;}
    if(neuro[i].radius<oMin){oMin=neuro[i].radius;}
  }
  
  if(sysShow){
  fill(0);
  noStroke();
 // rect(width-45,0,45,55);
  fill(#FF8800);
  text(round(neuro[0].radius*1000.0)/1000.0,width-35,10);
  fill(#555555);
  text(round(oMin*1000.0)/1000.0,width-35,20);
  fill(#FFFFFF);
  text(round(oMax*1000.0)/1000.0,width-35,30);
  noFill();
  }
  
  XX[cnt]=map(avgX,bMin,bMax,bMax,width);
  YY[cnt]=map(avgY,bMin,bMax,bMax,height);
  XXX=map(avgX2,bMin,bMax,bMax,width);
  YYY=map(avgY2,bMin,bMax,bMax,width);


  if(sysShow){
  beginShape();
  for(int i = 1;i<mem;i++){
    if((XX[i]!=0)&&(YY[i]!=0)){
   stroke(0,20);
   // fill(255,map(abs(sin((i-cnt/2.0)/(mem+0.001))),-1.0,1.0,50,0)) ;
    vertex(XX[i],YY[i]);
    } 
  }
  
  endShape();
  stroke(0,100);
  line(XXX,bMax,XXX,height);
  line(bMax,YYY,width,YYY);
    
     for(int i = 0;i<w.length;i++){
   w[i].move(avgX);
  }  
  }
  
  popMatrix();
  
   //mm.addFrame();
   /////////////////////////////////////////////////////////////////// pop
}
  
 



