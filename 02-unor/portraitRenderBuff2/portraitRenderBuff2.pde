import JMyron.*;
import processing.opengl.*;
//import moviemaker.*;
//import processing.video.*;
//MovieMaker movie;


PImage back, rendr;
PGraphics buff;
PFont font; 
JMyron input;
float cnt = 0,av,avr,avg,avb;
int x,y,cntr,hitCount,accept = 1;
float frnum,percentage;
boolean runE = false;
int cntW = 10,last=10;
String filename,AD = "",Length,extension;

 
void setup() {
   filename = AD+cntW;
   extension = ".jpg";
   filename = filename.concat(extension);
   
  back = loadImage(filename); 
  
  
  
 
  
  size(back.width/4,back.height/4,OPENGL);
 
  frameRate(25);
  font = loadFont("Uni0553-8.vlw");
  textFont(font,8);
   //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------* frame title
  
  
  
  
   
  background(0);
  
//myMovie = new Movie(this, "//movies/"+filename+".mov",25);
  //frnum = myMovie.duration()*25;
  //myMovie.speed((frnum/1706.667));
  
 
  buff = createGraphics(back.width,back.height,P3D);
  //rendr = createImage(buff.width,buff.height,RGB);
  input = new JMyron();//obj
  input.start(16,12);//320x240//360x288
  input.findGlobs(0);
runE = true;
 noStroke();
 buff.beginDraw();
 buff.background(0);

 buff.endDraw();
 this.frame.setTitle(" rendering "+cntW+"/"+last);
  this.frame.show();
}
int hit[][]= new int[2049][2049];
 
void draw() {
  
 //cntr +=frameRate/25.0;
  /*fill(255*(sin(cntr/10.0)+1),25,15);
  stroke(255*(cos(cntr/10.0)+1),25,15);
  rect(width-5,height-5,4,4);*/
  noStroke();
    input.update();
  int[] img = input.image();

   av =brightness(input.average(0,0,input.width(),input.height()));
   /* avr =hue(input.average(0,0,input.width(),input.height()));
    avg =saturation(input.average(0,0,input.width(),input.height()));
    avb =brightness(input.average(0,0,input.width(),input.height()));*/
    buff.beginDraw();
   for(int x = 0;x<back.width;x+=input.width()){
     for(int y = 0;y<back.height;y+=input.height()){
    
   if((abs((brightness(back.pixels[(y*back.width+x)]))-(av))<=1.0)&&(hit[x][y]<1)){
   //   if((abs((hue(back.pixels[y*back.width+x]))-(avr))<=8.0)&&(abs((saturation(back.pixels[y*back.width+x]))-(avg))<=8.0)&&(abs((brightness(back.pixels[y*back.width+x]))-(avb))<=8.0)){
   hit[x][y]=1;
     hitCount+=1;
     runE = true;
     percentage = (hitCount/((buff.width/input.width())*(buff.height/input.height())+0.1))*100;
     
    for(int yy=0;yy<input.height();yy+=1){ 
    for(int xx=0;xx<input.width();xx+=1){ 
   
   
    buff.stroke(brightness(img[yy*input.width()+xx]));
    buff.noFill();
    buff.point(xx+x,yy+y);
   
    }
    }
    }
   }
    
    buff.endDraw();
   
  }
  if(runE){
  image(buff, 0, 0,width,height);
 
  }runE = false;
  fill(255);
  rect(width-35,height-17,35,10);
  fill(255-(percentage*2.55),(percentage*2.55),18);
  text(int(percentage)+" %",width-30,height-10);
  
 if((percentage>95.0)||((keyPressed)&&(key==ENTER))){
   key = 0;
 fill(255);
 text("saving...",width-40,height-22);
 
   saver();
 } 
 for(int yy=0;yy<input.height();yy+=1){ 
    for(int xx=0;xx<input.width();xx+=1){ 
      noStroke();
      fill(brightness(img[yy*input.width()+xx]));
      rect((width-input.width())+xx,(height-input.height()-50)+yy,1,1);
    }
 }
  stroke(255-((av-128)*5));
  noFill();
  rect(width-input.width(),height-input.height()-50,input.width()-1,input.height());
  noStroke();
  fill(255-((av-128)*5));
  textAlign(RIGHT);
  text(hitCount, (width-2),(height-input.height()-42));
  textAlign(LEFT);
  
}


  
 void saver(){ 
 if (accept==1){
 AD = "";
 filename="";
 filename = AD+cntW+"_"+input.width();
 extension = ".png";
 filename = filename.concat(extension);
      buff.save("structures/"+filename);
     
  buff.beginDraw();
  buff.background(0);
  buff.endDraw();
  hitCount=0;
  percentage=0;
  for(int x = 0;x<buff.width;x+=input.width()){
    for(int y = 0;y<buff.height;y+=input.height()){
    hit[x][y]=0;
    }
  }
  if(cntW==last){
   this.exit(); 
  }
  cntW+=1;
 back = loadImage(cntW+".jpg");
  this.frame.setTitle(" rendering "+cntW+"/"+last);
  this.frame.show();
 }
  //background(0);
  }



void mouseReleased(){
 input.settings(); 
}

